//Stock Catch at age assessment
//created by Nicholas Fisch to be used in simulation study, CKMR data to be added later

//Dec 2022

#include <TMB.hpp>

//this namespace is used for printing during iterations using CppAD::PrintFor
 namespace CppAD {
  void PrintFor(const char* before, const double& var) {  }
}

template<class Type>
Type objective_function<Type>::operator() ()
{

  //TABLE OF CONTENTS
  //I. DATA INPUTS
  //II. PARAMETER DECLARATION
  //III. SETTING INTITAL VALUES FOR DATA AND BACK TRASFORMING PARAMETERS ("Pre-function" section)
  //IV. FUNCTIONS AND CALCULATIONS
  //    1. Selectivity
  //    2. Mortality
  //    3. Population
  //    4. Expected Catch and Catch at Age
  //    5. Expected index
  //    7. Objective Functions
  //V. REPORT SECTION

  //I. DATA INPUTS
  //---------------------------------------------------------------------------------------------
  DATA_INTEGER(fyear); //First year
  DATA_INTEGER(lyear); //Last year
  DATA_INTEGER(fage); //First age
  DATA_INTEGER(lage); //Last age

  DATA_VECTOR(years); //Vector of years
  DATA_VECTOR(ages); //Vector of ages

  DATA_VECTOR(obs_harv);              //Observed harvest
  DATA_VECTOR(obs_index);             //Observed index
  DATA_MATRIX(obs_fishery_comp);      //Observed fishery Composition
  DATA_VECTOR(SS_fishery);            //Sample size for fishery compositions

  DATA_VECTOR(Mat);             //Fecundity at age vector 
  DATA_VECTOR(Wtage);                 //Weight at age vector, we'll say proportional to fecundity

  //II. PARAMETER DECLARATION
  //---------------------------------------------------------------------------------------------
  PARAMETER(log_M);          //M scalar for Lorenzen M
  PARAMETER(log_q);          //Fishery Catchability
  
  PARAMETER_VECTOR(log_recruit_devs); //Log scale recruitment deviations
  PARAMETER(steepness);               //Steepness for recruitment
  PARAMETER(log_R0);                  //Unfished recruitment
  PARAMETER(log_sigma_rec);           //Log sd for recruitment

  PARAMETER(log_cv_fishery);         //Log cv for fishery catch
  PARAMETER(log_cv_index);           //Log cv for index

  PARAMETER(Sel_logis_k);         //logistic selectivity slope parameter 
  PARAMETER(Sel_logis_midpt);     //logistic selectivity midpoint parameter
    
  PARAMETER_VECTOR(log_fint);       //Log scale fishing intensities (fully selected fishing mortalities)
  //---------------------------------------------------------------------------------------------

//DERIVED QUANTITIES
 
//back-transform log-scale params
  Type NatMort=exp(log_M);
  Type q=exp(log_q);
  Type R0=exp(log_R0);
  Type sd_rec=exp(log_sigma_rec);                //sigma for recruit deviations
  Type cv_fishery=exp(log_cv_fishery);           //sigma for fishery catch
  Type cv_index=exp(log_cv_index);               //cv for fishery CPUE

  vector<Type> fishery_sel(ages.size());                   //Fishery selectivity (fage,lage)

  matrix<Type> M(years.size(),ages.size());                //Instantaneous natural mortality matrix
  matrix<Type> Sel(years.size(),ages.size());              //Selectivity
  matrix<Type> F(years.size(),ages.size());                //Instantaneous fishing mortality matrix
  matrix<Type> Z(years.size(),ages.size());                //Total mortality matrix
  matrix<Type> S(years.size(),ages.size());                //Annual survival matrix
  matrix<Type> A(years.size(),ages.size());                //Annual mortality matrix

  matrix<Type> N(years.size()+1,ages.size());	           //Predicted abundance at age, +1 is to incorporate final catch 
  matrix<Type> Nbar(years.size(),ages.size());	           //Nbar

  matrix<Type> pred_caa(years.size(),ages.size());           //Predicted fishery catch at age
  matrix<Type> pred_fishery_comp(years.size(),ages.size());  //Predicted age composition from the fishery catch
  vector<Type> pred_harv(years.size());                      //Predicted Harvest weight (kg), (fyear,lyear) 
  matrix<Type> pred_harv_aa(years.size(),ages.size());
  vector<Type> pred_totcatch_fishery(years.size());         //Predicted Fishery total catch, used as denominator to get age composition, (fyear,lyear)
  vector<Type> Biomass(years.size());                       //Biomass 
  matrix<Type> Biomass_aa(years.size(),ages.size());
  vector<Type> U(years.size());                             //Exploitation rate 

  vector<Type> pred_index(years.size());                    //Predicted index, (fyear,lyear)
  matrix<Type> pred_index_aa(years.size(),ages.size());
  
  vector<Type> log_rec_devs(years.size()+ages.size());    //rec devs vector that adds in the current year, (fage,lyear+lage)

  vector<Type> spbiomass(years.size()+1);                  //Spawning biomass, (fyear,lyear+1)
  vector<Type> Depletion(years.size()+1);                  //Depletion, (fyear,lyear+1)
  matrix<Type> spbiomass_aa(years.size()+1,ages.size());   //Spawning biomass, (fyear,lyear+1)
  vector<Type> N0_age(ages.size());                        //Unfished numbers at, (fage,lage)
  vector<Type> lxo(ages.size());                           //Unfished numbers at age, (fage,lage)
  Type SSB0;                                               //Unfished spawning biomass
    
  //Growth params for Lorenzen M
  Type Linf=500;       //L-Infinity (cm)
  Type K=0.25;         //Brody Growth Coefficient
  Type tnot= -0.5;     //T-not
  vector<Type> Lt(ages.size());
   
  //Likelihood components
  Type L1;
  Type L2;
  Type L3;
  Type L4;
  Type L5;

  int i; 
  int j; 
  
  Type NLL = 0;
  Type NPRAND = 0;
  Type JNLL = 0;
  
//////////////////////////////////////
///////////////////////////
//Actual Model
///////////////////////////
/////////////////////////////////////

///////////////////////////
//FISHERY SELECTIVITY
///////////////////////////
 
  for(j=0;j<=ages.size()-1;j++){
   fishery_sel(j)=1/(1+exp(-Sel_logis_k*((int(j)+1)-Sel_logis_midpt)));   //Logistic Selectivity, j+1 is bc the loop is from 0:14 but ages are from 1:15
  }
  fishery_sel=fishery_sel/max(fishery_sel);
  
//////////////////////
//MORTALITY
//////////////////////
 //First getting size at age for Lorenzen M
  for(j=0;j<=ages.size()-1;j++){
   Lt(j)=Linf*(1-exp(-K*((int(j)+1)-tnot)));       //j+1 is bc the loop is from 0:14 but ages are from 1:15
  }

  for(i=0;i<=years.size()-1;i++){
   for(j=0;j<=ages.size()-1;j++){
    F(i,j) = fishery_sel(j)*exp(log_fint(i)); //setting year and age specific fishing mortality as the product of selectivity and year specific fishing intensity
	Z(i,j) = NatMort + F(i,j);                 //Total instantaneous mortality
    S(i,j) = exp(-1.0*Z(i,j));                //Annual survival
    A(i,j)=1.0-S(i,j);                        //Annual mortality
   }
  }
 
//////////////////////
//POPULATION
//////////////////////
  //Unfished Spawning biomass calcs
  lxo(0)=1.0;
  for(j=fage;j<=lage-1;j++){
   lxo(j)=lxo(j-1)*exp(-1*NatMort);   //cumulative survival
  }
  lxo(lage-1)=lxo(lage-1)/(1-exp(-1*NatMort));
  N0_age=R0*lxo;
  SSB0=(N0_age*Mat*Wtage).sum();   //Numbers at age * Fecundity

  //Filling in log_rec_devs
  for(i=0;i<=years.size()-1;i++){
   log_rec_devs(i)=log_recruit_devs(i);
  }
  log_rec_devs(lyear)=0;
  
  //Abundance at age in the first year
  for(j=fage;j<=ages.size()-1;j++){
   N(fyear-1,j)=R0*lxo(j);                                    //set abundance in the fist year f
  }
  N(fyear-1,0)=R0*exp(log_rec_devs(0));     //Filling in initial year recruitment
//  N(fyear-1,0)=R0*exp(log_rec_devs(0)-0.5*pow(sd_rec,2));     //Filling in initial year recruitment
  
  //Spawning Biomass in the first year
  for(j=0;j<=ages.size()-1;j++){
   spbiomass_aa(fyear-1,j)=N(fyear-1,j)*Mat(j)*Wtage(j);  // Getting spawning biomass for the first year (acounting for rec dev, unlike SSB0_FLA)
  }
  spbiomass(fyear-1)=spbiomass_aa.row(fyear-1).sum();
  
//Population loop
  for(i=fyear;i<=years.size();i++){  //TMB starts at zero so this is 81 years (or 41), starting at i+1
   N(i,0)=((4.*steepness*R0*spbiomass(i-1))/(SSB0*(1.-steepness)+spbiomass(i-1)*(5.*steepness-1.)))*exp(log_rec_devs(i));  //Recruitment, if at age 1
//   N(i,0)=((4.*steepness*R0*spbiomass(i-1))/(SSB0*(1.-steepness)+spbiomass(i-1)*(5.*steepness-1.)))*exp(log_rec_devs(i)-0.5*pow(sd_rec,2));  //Recruitment, if at age 1
    for(j=fage;j<=lage-1;j++){
      N(i,j)=N(i-1,j-1)*S(i-1,j-1);
    }
   N(i,lage-1)+=N(i-1,lage-1)*S(i-1,lage-1);   //Plus group
  for(j=0;j<=ages.size()-1;j++){
   spbiomass_aa(i,j)=N(i,j)*Mat(j)*Wtage(j);  // Getting spawning biomass for the first year (acounting for rec dev, unlike SSB0_FLA)
  }
   spbiomass(i)=spbiomass_aa.row(i).sum();
//   N(i,0)=((4.*steepness*R0*spbiomass(i))/(SSB0*(1.-steepness)+spbiomass(i)*(5.*steepness-1.)))*exp(log_rec_devs(i));  //Recruitment if at age 0
 }
 
////////////////
//CATCH
////////////////

  for(i=0;i<=years.size()-1;i++){  //TMB starts at zero so this is 81 years (or 41), starting at i+1
   for(j=0;j<=lage-1;j++){  
    pred_caa(i,j)=F(i,j)/Z(i,j)*A(i,j)*N(i,j); //Baranov catch equation for predicting catch at age
   }
  }

  for(i=0;i<=lyear-1;i++){
   pred_totcatch_fishery(i)=pred_caa.row(i).sum();                        //total predicted catch by year
   pred_fishery_comp.row(i)=pred_caa.row(i)/(pred_totcatch_fishery(i)+0.0001);  //calculating predicted catch age composition
   for(j=0;j<=lage-1;j++){  
    pred_harv_aa(i,j)=pred_caa(i,j)*Wtage(j);                              //Predicted total harvest at age weight each year
    Biomass_aa(i,j)=N(i,j)*Wtage(j);
    Nbar(i,j)=(N(i,j)*((1.0-exp(-1.0*Z(i,j)))))*(1.0/Z(i,j));
    pred_index_aa(i,j)=q*(N(i,j)*Wtage(j))*fishery_sel(j);
   }
   pred_harv(i)=pred_harv_aa.row(i).sum();                              //Predicted total harvest weight each year
   Biomass(i)=Biomass_aa.row(i).sum();                                    //Biomass each year
   U(i)=pred_harv(i)/Biomass(i);                                          //Exploitation rate
   Depletion(i)=spbiomass(i)/SSB0;
   pred_index(i)=pred_index_aa.row(i).sum();
  }
    
  Depletion(lyear)=spbiomass(lyear)/SSB0;

/////////////////////////
//Objective function
/////////////////////////

//LIKELIHOODS
  //Catch Likelihood
  // Normal by CV
  for(i=0;i<=lyear-1;i++){
//   L1 += log(cv_fishery*pred_harv(i))+0.5*pow((obs_harv(i)-pred_harv(i))/(cv_fishery*pred_harv(i)),2);   //Normal likelihood using CV
   L1 -= dnorm(obs_harv(i),pred_harv(i),cv_fishery*pred_harv(i),true);
  } 
  
//Multinomial
  for(i=0;i<=lyear-1;i++){
    for(j=0;j<=lage-1;j++){
     L2 += -1*(SS_fishery(i)*(obs_fishery_comp(i,j)*log(pred_fishery_comp(i,j))));     //Likelihood for age composition of fishery catch
    }
//	vector<Type> x=obs_fishery_comp.row(i);
//    vector<Type> p=pred_fishery_comp.row(i); 
//	L2 -= dmultinom(x,p,true);
  }

//Fishery Index
//Normal by CV
  for(i=0;i<=lyear-1;i++){
//   L3 += log(cv_index*pred_index(i))+0.5*pow((obs_index(i)-pred_index(i))/(cv_index*pred_index(i)),2); //Likelihood for Fishery CPUE
   L3 -= dnorm(obs_index(i),pred_index(i),cv_index*pred_index(i),true);
  }

  //Recruitment deviations
   NPRAND -= sum(dnorm(log_recruit_devs,0,sd_rec,true)); //Recruitment deviations
   //Alternative way to do it in a loop
//  for(i=0;i<=lyear+lage-1;i++){
//   NPRAND += log(sd_rec*pow(2*3.14159265359,0.5))+0.5*pow(log_recruit_devs(i)/sd_rec,2); //Recruitment deviations
//  }

  NLL=L1+L2+L3;
  JNLL=NPRAND+NLL;

/////////////////////////
//Report
////////////////////////////

  REPORT(M);
  REPORT(q);
  REPORT(R0);
  REPORT(sd_rec);
  REPORT(cv_fishery);
  REPORT(cv_index);
  REPORT(log_recruit_devs);

  REPORT(Depletion);
  ADREPORT(Depletion);
  REPORT(fishery_sel);
  ADREPORT(fishery_sel);
  REPORT(N0_age);
  ADREPORT(N0_age);
  REPORT(Lt);
  REPORT(lxo);
  REPORT(F);
  ADREPORT(F);
  REPORT(M);
  ADREPORT(M);
  REPORT(Z);
  ADREPORT(Z);
  REPORT(A);
  REPORT(N);
  ADREPORT(N);
  REPORT(U);
  ADREPORT(U);
  REPORT(spbiomass);
  ADREPORT(spbiomass);
  REPORT(obs_harv);
  REPORT(pred_harv);
  REPORT(pred_caa);
  REPORT(pred_index);
  REPORT(obs_index);
  REPORT(pred_fishery_comp);
  REPORT(obs_fishery_comp);

  REPORT(L1);
  REPORT(L2);
  REPORT(L3);
  REPORT(L4);
  REPORT(L5);
  REPORT(NLL);
  REPORT(NPRAND);

  return JNLL;

}

