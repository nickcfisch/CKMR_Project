//Stock Catch at age assessment with the inclusion of CKMR data
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
  //    4. Expected Catch and Catch at Age and index
  //    5. CKMR Data
  //    6. Objective Functions
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

  DATA_VECTOR(Mat);                 //Maturity at age vector 
  DATA_VECTOR(Laa);                 //Length at age vector
  DATA_VECTOR(Waa);                 //Weight at age vector

//CKMR data
  DATA_IVECTOR(born_year_old); 
  DATA_IVECTOR(age_diff);
  DATA_VECTOR(n_ckmr);
  DATA_VECTOR(k_ckmr_hsp); 
  DATA_IVECTOR(born_year_young); 
  DATA_VECTOR(k_ckmr_pop); 
  DATA_IVECTOR(samp_year_old); 
 //Year of first born, age difference, number of replicates, number of successes for HSP, year of second born (or juves birth), number of successes for POP, and sampling year of older indv

  //II. PARAMETER DECLARATION
  //---------------------------------------------------------------------------------------------
  PARAMETER(log_M);          //M scalar for Lorenzen M
  PARAMETER(log_q);          //Fishery Catchability for index
  
  PARAMETER_VECTOR(log_recruit_devs_init); //Log scale recruitment deviations for initial abundance
  PARAMETER_VECTOR(log_recruit_devs);      //Log scale recruitment deviations
  PARAMETER(steepness);                    //Steepness for recruitment
  PARAMETER(log_R0);                       //Unfished recruitment
  PARAMETER(log_sigma_rec);                //Log sd for recruitment

  PARAMETER(log_sd_catch);           //Log sd for catch
  PARAMETER(log_sd_index);           //Log sd for index

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
  Type sd_catch=exp(log_sd_catch);           //sigma for fishery catch
  Type sd_index=exp(log_sd_index);               //cv for fishery CPUE

  vector<Type> fishery_sel(ages.size());                   //Fishery selectivity (fage,lage)

  vector<Type> Maa(ages.size());                      //Natural mortality vector
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
       
  //Likelihood components
  Type L1;
  Type L2;
  Type L3;
  Type L4;

  int i; 
  int j; 
  int k;
  
  //CKMR objects
  matrix<Type> HSP_prob_aa(n_ckmr.size(),ages.size());
  vector<Type> HSP_prob(n_ckmr.size());
  matrix<Type> surv_prob(n_ckmr.size(),ages.size());
  vector<Type> POP_prob(n_ckmr.size());
  
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
  for(j=0;j<=lage;j++){
   fishery_sel(j)=1/(1+exp(-log(19)*(Laa(j)-exp(Sel_logis_midpt))/exp(Sel_logis_k)));   //Logistic Selectivity, stock synthesis version
  }
  
//////////////////////
//MORTALITY
//////////////////////
 //Lorenzen M or Constant M
  for(j=0;j<=lage;j++){
//   Maa(j)=NatMort*pow((Lt(j)/(Linf*0.75)),-1);
   Maa(j)=NatMort;
 }

  for(i=0;i<=years.size()-1;i++){
   for(j=0;j<=lage;j++){
    F(i,j) = fishery_sel(j)*exp(log_fint(i)); //setting year and age specific fishing mortality as the product of selectivity and year specific fishing intensity
	Z(i,j) = Maa(j) + F(i,j);                 //Total instantaneous mortality
    S(i,j) = exp(-1.0*Z(i,j));                //Annual survival
    A(i,j)=1.0-S(i,j);                        //Annual mortality
   }
  }
 
//////////////////////
//POPULATION
//////////////////////
  //Unfished Spawning biomass calcs
  lxo(0)=1.0;
  for(j=fage+1;j<=lage;j++){
   lxo(j)=lxo(j-1)*exp(-1*Maa(j-1));   //cumulative survival
  }
  lxo(lage)=lxo(lage)/(1-exp(-1*Maa(lage)));
  N0_age=R0*lxo;
  SSB0=(N0_age*Mat*Waa).sum();   //Numbers at age * Fecundity

  //Filling in log_rec_devs
  for(i=0;i<=years.size()-1;i++){
   log_rec_devs(i)=log_recruit_devs(i);
  }
  log_rec_devs(lyear)=Type(0);
  
  //Abundance at age in the first year
  for(j=fage+1;j<=lage;j++){
//   N(fyear-1,j)=R0*lxo(j);          //set abundance in the fist year f
   N(fyear-1,j)=R0*exp(log_recruit_devs_init(fabs(j-(lage)))-0.5*pow(sd_rec,2))*lxo(j);          //set abundance in the fist year f
  }
//  N(fyear-1,fage)=R0*exp(log_rec_devs(0));     //Filling in initial year recruitment
  N(fyear-1,fage)=R0*exp(log_rec_devs(0)-0.5*pow(sd_rec,2));     //Filling in initial year recruitment
  
  //Spawning Biomass in the first year
  for(j=fage;j<=lage;j++){
   spbiomass_aa(fyear-1,j)=N(fyear-1,j)*Mat(j)*Waa(j);  // Getting spawning biomass for the first year (acounting for rec dev, unlike SSB0_FLA)
  }
  spbiomass(fyear-1)=spbiomass_aa.row(fyear-1).sum();
  
//Population loop
  for(i=fyear;i<=years.size();i++){  //TMB starts at zero so this is 81 years (or 41), starting at i+1
    for(j=fage+1;j<=lage;j++){
      N(i,j)=N(i-1,j-1)*S(i-1,j-1);
    }
   N(i,lage)+=N(i-1,lage)*S(i-1,lage);   //Plus group
  for(j=fage;j<=lage;j++){
   spbiomass_aa(i,j)=N(i,j)*Mat(j)*Waa(j);  // Getting spawning biomass for the first year (acounting for rec dev, unlike SSB0_FLA)
  }
   spbiomass(i)=spbiomass_aa.row(i).sum();
//   N(i,fage)=((4.*steepness*R0*spbiomass(i))/(SSB0*(1.-steepness)+spbiomass(i)*(5.*steepness-1.)))*exp(log_rec_devs(i));  //Recruitment if at age 0
   N(i,fage)=((4.*steepness*R0*spbiomass(i))/(SSB0*(1.-steepness)+spbiomass(i)*(5.*steepness-1.)))*exp(log_rec_devs(i)-0.5*pow(sd_rec,2));  //Recruitment, if at age 1
  }
 
////////////////
//CATCH
////////////////

  for(i=0;i<=years.size()-1;i++){  //TMB starts at zero
   for(j=fage;j<=lage;j++){  
    pred_caa(i,j)=F(i,j)/Z(i,j)*A(i,j)*N(i,j); //Baranov catch equation for predicting catch at age
   }
  }

  for(i=0;i<=lyear-1;i++){
   pred_totcatch_fishery(i)=pred_caa.row(i).sum();                        //total predicted catch by year
   pred_fishery_comp.row(i)=pred_caa.row(i)/(pred_totcatch_fishery(i)+0.0001);  //calculating predicted catch age composition
   for(j=fage;j<=lage;j++){  
    pred_harv_aa(i,j)=pred_caa(i,j)*Waa(j);                              //Predicted total harvest at age weight each year
    Biomass_aa(i,j)=N(i,j)*Waa(j);
    Nbar(i,j)=(N(i,j)*((1.0-exp(-1.0*Z(i,j)))))*(1.0/Z(i,j));
    pred_index_aa(i,j)=q*Nbar(i,j)*Waa(j)*fishery_sel(j);
   }
   pred_harv(i)=pred_harv_aa.row(i).sum();                              //Predicted total harvest weight each year
   Biomass(i)=Biomass_aa.row(i).sum();                                    //Biomass each year
   U(i)=pred_harv(i)/Biomass(i);                                          //Exploitation rate
   Depletion(i)=spbiomass(i)/SSB0;
   pred_index(i)=pred_index_aa.row(i).sum();
  }
    
  Depletion(lyear)=spbiomass(lyear)/SSB0;

///////////////////////////////////////////
//Close kin calculations
///////////////////////////////////////////
  L4=Type(0);  
// - 1s are for TMB indexing which starts at zero
  for(i=0;i<=n_ckmr.size()-1;i++){        

  //Specifying dimensions of the vector of matrices
   matrix<Type> surv_prob_aa(age_diff(i),lage+age_diff(i));
 
/////////////////////////////////////
//HSP Calcs
/////////////////////////////////////  
  //This fills in the survival in the year of first born, Don't know how to fill in a segment of a matrix
   for(j=0;j<=lage;j++){ 
    if(born_year_old(i)>0){
     surv_prob_aa(0,j) = S(born_year_old(i)-1,j);
	}
	if(born_year_old(i)<1){
     surv_prob_aa(0,j) = exp(-1*Maa(j));
	}
   }
   
   for(j=0;j<=age_diff(i)-1-1;j++){  // j is age of the potential parent at the year of the first born, which needs to be integrated over
    for(k=0;k<=lage+age_diff(i)-2;k++){
//Assume that spawning happens at the very start of the year 
// So parent has to survive year of the birth, year after the birth,.. up to age difference
    if(k<=lage){
     if(born_year_old(i)>0){
      surv_prob_aa(j+1,k+1)= surv_prob_aa(j,k) * S(born_year_old(i)+j,k);
	 }
	 if(born_year_old(i)<1){
      surv_prob_aa(j+1,k+1)= surv_prob_aa(j,k) * exp(-1*Maa(k));
	 }
 	}
	
	if(k>lage){
     if(born_year_old(i)>0){
      surv_prob_aa(j+1,k+1)= surv_prob_aa(j,k) * S(born_year_old(i)+j,lage);
	 }
     if(born_year_old(i)<1){
      surv_prob_aa(j+1,k+1)= surv_prob_aa(j,k) * exp(-1*Maa(lage));
     }
	}
   } 
  }
   surv_prob.row(i) = surv_prob_aa.block(age_diff(i)-1,age_diff(i)-1,1,lage+1); //getting subset of matrix, starting at (x1,y1), and taking 1 row of lage+1 columns  
  
//CKMR_data(i,1) is the year of second born, and CKMR_data(i,2) is the age difference
   for(j=0;j<=lage;j++){  
    if((j+age_diff(i))<=lage){          //If we are not in the plus group
     if(born_year_old(i)>0){                //if we're not in unfished years
      HSP_prob_aa(i,j) = ( (N(born_year_old(i)-1,j)*Mat(j)*Waa(j)) / spbiomass(born_year_old(i)-1) ) * surv_prob(i,j)  * (4 * Mat(int(j)+age_diff(i))*Waa(int(j)+age_diff(i)) / spbiomass(born_year_old(i)+age_diff(i)-1));
	 }
	 if(born_year_old(i)<1){                //if we are in unfished years
	  if(born_year_old(i)+age_diff(i)>0){   //if second born is not in unfished years
       HSP_prob_aa(i,j) = ( (N0_age(j)*Mat(j)*Waa(j)) / SSB0 ) * surv_prob(i,j)  * (4 * Mat(int(j)+age_diff(i))*Waa(int(j)+age_diff(i)) / spbiomass(born_year_old(i)+age_diff(i)-1));
	  }
	  if(born_year_old(i)+age_diff(i)<1){   //if second born is in unfished years
       HSP_prob_aa(i,j) = ( (N0_age(j)*Mat(j)*Waa(j)) / SSB0 ) * surv_prob(i,j)  * (4 * Mat(int(j)+age_diff(i))*Waa(int(j)+age_diff(i)) / SSB0);
 	  }}
    }
	
    if((j+age_diff(i))>lage){            //If we are in the plus group
     if(born_year_old(i)>0){                //if we're not in unfished years
      HSP_prob_aa(i,j) = ( (N(born_year_old(i)-1,j)*Mat(j)*Waa(j)) / spbiomass(born_year_old(i)-1) ) * surv_prob(i,j)  * (4 * Mat(lage)*Waa(lage) / spbiomass(born_year_old(i)+age_diff(i)-1));	
	 }
	 if(born_year_old(i)<1){                //if we are in unfished years
	  if(born_year_old(i)+age_diff(i)>0){   //if second born is not in unfished years
       HSP_prob_aa(i,j) = ( (N0_age(j)*Mat(j)*Waa(j)) / SSB0 ) * surv_prob(i,j)  * (4 * Mat(lage)*Waa(lage) / spbiomass(born_year_old(i)+age_diff(i)-1));	
	  }
  	  if(born_year_old(i)+age_diff(i)<1){   //if second born is in unfished years
       HSP_prob_aa(i,j) = ( (N0_age(j)*Mat(j)*Waa(j)) / SSB0 ) * surv_prob(i,j)  * (4 * Mat(lage)*Waa(lage) / SSB0);	
	 }}
    }
   }
   HSP_prob(i) = HSP_prob_aa.row(i).sum();

/////////////////////////
//POP calcs
/////////////////////////

    // A potential parent has to have been sampled after or on the year of youngs birth, because sampling is lethal 
    if(samp_year_old(i) >= born_year_young(i)){
  //So the exp reproductive output of the parent in the year of offsprings birth / total reprod output that year
     if(born_year_young(i)>0){
	  POP_prob(i) = 4*(Mat(age_diff(i)-1)*Waa(age_diff(i)-1) / spbiomass(born_year_young(i)-1));
	 }    
	 if(born_year_young(i)<1){
	  POP_prob(i) = 4*(Mat(age_diff(i)-1)*Waa(age_diff(i)-1) / SSB0);
	 }
   }	 
   // A potential parent has to have been sampled after or on the year of youngs birth, because sampling is lethal 
   if(samp_year_old(i) < born_year_young(i)){
	POP_prob(i) = Type(0);
   }
   
//////////////////////////////////////////// 
//Multinomial Likelihood for CKMR calcs
////////////////////////////////////////////  
	  
   //if potential parent was sampled after or on the year of youngs birth, because sampling is lethal  	  
   if(samp_year_old(i) >= born_year_young(i)){
    L4 += -1*(n_ckmr(i)*((n_ckmr(i)-(k_ckmr_hsp(i)+k_ckmr_pop(i)))/n_ckmr(i))*log(1-(HSP_prob(i)+POP_prob(i)))); //Prob of no match
    L4 += -1*(n_ckmr(i)*((k_ckmr_hsp(i)/n_ckmr(i))*log(HSP_prob(i))));    //Prob of HSP
    L4 += -1*(n_ckmr(i)*((k_ckmr_pop(i)/n_ckmr(i))*log(POP_prob(i))));    //Prob of POP
     //Alternative = Sample size * sum ( Prob of no match + Prob of HSP + Prob of POP ) 
//    L4 += -1*( n_ckmr(i) * ( ((n_ckmr(i)-(k_ckmr_hsp(i)+k_ckmr_pop(i)))/n_ckmr(i))*log(1-(HSP_prob(i)+POP_prob(i))) + (k_ckmr_hsp(i)/n_ckmr(i))*log(HSP_prob(i)) + (k_ckmr_pop(i)/n_ckmr(i))*log(POP_prob(i))) ); 
   }
   //if not, then collapses to binomial for only HSP calcs
   if(samp_year_old(i) < born_year_young(i)){
    L4 += -1*log(dbinom(k_ckmr_hsp(i),n_ckmr(i),HSP_prob(i))); 
   }
   
  }

/////////////////////////
//Objective function
/////////////////////////
  Type pi=3.141593;

//LIKELIHOODS
  L1=Type(0);
  //Catch Likelihood
  // Lognormal by SD
  for(i=0;i<=lyear-1;i++){  
   L1 += log(obs_harv(i))+0.5*log(2*pi)+log_sd_catch+pow(log(obs_harv(i))-log(pred_harv(i)),2)/(2*pow(sd_catch,2));
  } 

//Multinomial
  L2=Type(0);
  for(i=0;i<=lyear-1;i++){
   for(j=fage;j<=lage;j++){
    L2 += -1*(SS_fishery(i)*(obs_fishery_comp(i,j)*log(pred_fishery_comp(i,j))));     //Likelihood for age composition of fishery catch
   }
  }

//Fishery Index
//Lognormal by SD
  L3=Type(0);
  for(i=0;i<=lyear-1;i++){
   L3 += log(obs_index(i))+0.5*log(2*pi)+log_sd_index+pow(log(obs_index(i))-log(pred_index(i)),2)/(2*pow(sd_index,2));
  }
  
  //Recruitment deviations
   NPRAND = -1*(sum(dnorm(log_recruit_devs,0,sd_rec,true)) + sum(dnorm(log_recruit_devs_init,0,sd_rec,true))); //Recruitment deviations

  NLL=L1+L2+L3+L4;
  JNLL=NPRAND+NLL;

/////////////////////////
//Report
////////////////////////////

  REPORT(Maa);
  REPORT(log_M);
  REPORT(q);
  REPORT(R0);
  REPORT(sd_rec);
  REPORT(sd_catch);
  REPORT(sd_index);
  REPORT(log_recruit_devs);

  REPORT(surv_prob);
  REPORT(HSP_prob_aa);
  REPORT(HSP_prob);

  REPORT(Depletion);
  ADREPORT(Depletion);
  REPORT(fishery_sel);
//  ADREPORT(fishery_sel);
  REPORT(N0_age);
//  ADREPORT(N0_age);
  REPORT(Laa);
  REPORT(lxo);
  REPORT(F);
//  ADREPORT(F);
  REPORT(M);
//  ADREPORT(M);
//  REPORT(Z);
//  ADREPORT(Z);
//  REPORT(A);
  REPORT(N);
//  ADREPORT(N);
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
  REPORT(NLL);
  REPORT(NPRAND);

  return JNLL;

}


