//Stock Catch at age assessment with the inclusion of CKMR data, and Ageing Error
//created by Nicholas Fisch to be used in simulation study

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
  DATA_IVECTOR(coded_born_year_old);        //The coded born year of the coded older indv
  DATA_VECTOR(n_ckmr);                      //number of replicates for obs with similar covariates
  DATA_VECTOR(k_ckmr_hsporggp);             //number of HSPs or GGps found
  DATA_IVECTOR(coded_born_year_young);      //Coded born year of the coded younger indv
  DATA_VECTOR(k_ckmr_pop);                  //number of POPs found
  DATA_IVECTOR(samp_year_coded_old);        //sample year of the coded older indv

  DATA_IVECTOR(coded_age_one);              //Coded age of the coded younger indv
  DATA_IVECTOR(coded_age_two);              //Coded age of the coded older indv
  
  DATA_IVECTOR(coded_one_min);              //These min and max ages are to avoid looping through all possible true ages in the AE integration. Simplifying by only looping through true ages that have a probability>0.001 of being coded the coded age
  DATA_IVECTOR(coded_one_max); 
  DATA_IVECTOR(coded_two_min); 
  DATA_IVECTOR(coded_two_max); 

  DATA_INTEGER(Lamda_Harvest);    //Whether to use data sources or not
  DATA_INTEGER(Lamda_Comp);    
  DATA_INTEGER(Lamda_Index);    
  DATA_INTEGER(Lamda_CKMR);    

  DATA_MATRIX(AE_mat);              //Ageing Error Matrix (given true age i, what is the probability that you will be coded age j)
  
  DATA_SCALAR(pi_nu);               //False negative retention probability

  //II. PARAMETER DECLARATION
  //---------------------------------------------------------------------------------------------
  PARAMETER(log_M);          //Natural mortality
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
  matrix<Type> Nbar(years.size(),ages.size());	           //Nbar, used for fishery index (mean of abundance in a year)

  matrix<Type> pred_caa(years.size(),ages.size());           //Predicted fishery catch at age
  matrix<Type> pred_fishery_comp(years.size(),ages.size());  //Predicted age composition from the fishery catch
  matrix<Type> pred_fishery_comp_wAE(years.size(),ages.size()); //Predicted age composition from the fishery catch, with ageing error applied
  vector<Type> pred_harv(years.size());                      //Predicted Harvest weight (kg), (fyear,lyear) 

  vector<Type> pred_index(years.size());                    //Predicted index, (fyear,lyear)
  
  vector<Type> log_rec_devs(years.size()+ages.size());    //rec devs vector that adds in the current year, (fage,lyear+lage)

  vector<Type> spbiomass(years.size()+1);                  //Spawning biomass, (fyear,lyear+1)
  vector<Type> N0_age(ages.size());                        //Unfished numbers at, (fage,lage)
  vector<Type> lxo(ages.size());                           //Unfished numbers at age, (fage,lage)
  Type SSB0;                                               //Unfished spawning biomass
       
  //Likelihood components
  Type L1;
  Type L2;
  Type L3;
  Type L4;

//Declaring integers for later calculations
  Type P_obs_xz=0;
  int age_diff=0;
  int born_year_old=0; 
  int born_year_young=0; 
  int theo_samp_year_old=0;

  int i; 
  int j; 
  int k;
  int x;
  int z;
  
  //CKMR objects
  matrix<Type> HSP_prob_aa(n_ckmr.size(),ages.size());
  HSP_prob_aa.setZero();
  vector<Type> HSP_prob(n_ckmr.size());
  HSP_prob.setZero();
  matrix<Type> surv_prob(n_ckmr.size(),ages.size());
  surv_prob.setZero();
  vector<Type> POP_prob(n_ckmr.size());
  POP_prob.setZero();
  matrix<Type> GGP_prob_aa(n_ckmr.size(),ages.size());
  GGP_prob_aa.setZero();
  vector<Type> GGP_prob(n_ckmr.size());
  GGP_prob.setZero();
    	
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
  fishery_sel=1/(1+exp(-log(19)*(Laa-exp(Sel_logis_midpt))/exp(Sel_logis_k)));   //Logistic Selectivity, stock synthesis version
  
//////////////////////
//MORTALITY
//////////////////////
  Maa.fill(NatMort);
  
  /* For some reason this one is the most efficient
  for(i=0;i<=years.size()-1;i++){
   for(j=0;j<=lage;j++){
    F(i,j) = fishery_sel(j)*exp(log_fint(i)); //setting year and age specific fishing mortality as the product of selectivity and year specific fishing intensity
	Z(i,j) = Maa(j) + F(i,j);                 //Total instantaneous mortality
    S(i,j) = exp(-1.0*Z(i,j));                //Annual survival
    A(i,j) = 1.0 - S(i,j);                        //Annual mortality
   }
  }
  */

  /*
  for(i=0;i<=years.size()-1;i++){
   F.row(i) = fishery_sel*exp(log_fint(i)); //setting year and age specific fishing mortality as the product of selectivity and year specific fishing intensity
   Z.row(i) = Maa + vector<Type>(F.row(i));                 //Total instantaneous mortality
   S.row(i) = exp(-vector<Type>(Z.row(i)));                //Annual survival
   A.row(i) = Type(1)-vector<Type>(S.row(i));                        //Annual mortality
  }
  */
//  /*
   for(j=0;j<=lage;j++){
    F.col(j) = fishery_sel(j)*exp(log_fint); //setting year and age specific fishing mortality as the product of selectivity and year specific fishing intensity
	Z.col(j) = Maa(j) + vector<Type>(F.col(j));                 //Total instantaneous mortality
    S.col(j) = exp(-vector<Type>(Z.col(j)));                //Annual survival
    A.col(j) = Type(1)-vector<Type>(S.col(j));                        //Annual mortality
   }
//   */
 
//////////////////////
//POPULATION
//////////////////////
  //Unfished Spawning biomass calcs
  //cumulative survival
  lxo(0)=1.0;
  lxo.segment(fage+1,lage)=lxo.segment(0,lage)*exp(-Maa.segment(0,lage));
  lxo(lage)=lxo(lage)/(1-exp(-Maa(lage)));
  N0_age=R0*lxo;
  SSB0=(N0_age*Mat*Waa).sum();   //Numbers at age * Fecundity

  //Filling in log_rec_devs
  log_rec_devs.segment(0,years.size())=log_recruit_devs;
  log_rec_devs(lyear)=Type(0);
  
  //Abundance at age in the first year
  for(j=fage+1;j<=lage;j++){
   N(fyear-1,j)=R0*exp(log_recruit_devs_init(abs(j-(lage)))-0.5*pow(sd_rec,2))*lxo(j);          //set abundance in the fist year f, with bias correction
  }
  N(fyear-1,fage)=R0*exp(log_rec_devs(0)-0.5*pow(sd_rec,2));     //Filling in initial year recruitment, with bias correction
  
  //Spawning Biomass in the first year
  spbiomass(fyear-1)=(vector<Type>(N.row(fyear-1))*Mat*Waa).sum();

//Population loop
  for(i=fyear;i<=years.size();i++){  //TMB starts at zero so this is 81 years (or 41), starting at i+1
    for(j=fage+1;j<=lage;j++){
      N(i,j)=N(i-1,j-1)*S(i-1,j-1);
    }
   N(i,lage)+=N(i-1,lage)*S(i-1,lage);   //Plus group

  spbiomass(i)=(vector<Type>(N.row(i))*Mat*Waa).sum();
  
   N(i,fage)=((4.*steepness*R0*spbiomass(i))/(SSB0*(1.-steepness)+spbiomass(i)*(5.*steepness-1.)))*exp(log_rec_devs(i)-0.5*pow(sd_rec,2));  //Recruitment with bias correction
  }
 
////////////////
//CATCH
////////////////

  pred_caa=F.array()/Z.array()*A.array()*N.block(0,fage,years.size(),lage+1).array();
  Nbar=N.block(0,fage,years.size(),lage+1).array()*((1.0-exp(-1.0*Z.array())))*(1.0/Z.array());
  
  for(i=0;i<=years.size()-1;i++){  //TMB starts at zero   
   pred_harv(i)=(vector<Type>(pred_caa.row(i))*Waa).sum();
   pred_index(i)=q*(vector<Type>(Nbar.row(i))*Waa*fishery_sel).sum();
//   pred_index(i)=(vector<Type>(Nbar.row(i))*Waa*fishery_sel).sum();
   pred_fishery_comp.row(i)=pred_caa.row(i)/(pred_caa.row(i).sum());  //calculating predicted catch age composition
  }
  
   pred_fishery_comp_wAE=pred_fishery_comp*AE_mat;

///////////////////////////////////////////
//Close kin calculations
///////////////////////////////////////////
  L4=Type(0);  
// - 1s are for TMB indexing which starts at zero
  for(i=0;i<=n_ckmr.size()-1;i++){   
    
//  coded_born_year_young(i)+coded_age_one(i) is the sample year of coded younger, -1 is needed for TMB year indexing	
   for(x=coded_one_min(i);x<=coded_one_max(i);x++){  //Loops through possible ages for ageing error. x is the possible age of the coded younger individual   
	for(z=coded_two_min(i);z<=coded_two_max(i);z++){  //^   z is possible age of the coded older individual

  //For ageing error, need the probability that the younger was coded the age it was from the AE mat, multiplied by the true fishery composition in the years that the indv was sampled 
  //and divided by the fishery comp with AE in that year as a normalizing constant.
  //AND of same for the older,
  P_obs_xz = (pred_fishery_comp(coded_born_year_young(i)+coded_age_one(i)-1,x)*AE_mat(x,coded_age_one(i)))/pred_fishery_comp_wAE(coded_born_year_young(i)+coded_age_one(i)-1,coded_age_one(i)) * (pred_fishery_comp(samp_year_coded_old(i)-1,z)*AE_mat(z,coded_age_two(i)))/pred_fishery_comp_wAE(samp_year_coded_old(i)-1,coded_age_two(i));

//now need new variables (age_diff, born_year_young, etc) for true age of coded younger x, and coded older z. 

// (coded_born_year_young(i)+coded_age_one(i)-x) born year of younger individual, given true age
// (samp_year_coded_old(i)-z)                    born year of older individual, given true age
  if( (samp_year_coded_old(i)-z) <= (coded_born_year_young(i)+coded_age_one(i)-x) ){  //if born year of the theoretical older invidual is less than the born year of the theoretical younger borns birth
   age_diff = (coded_born_year_young(i)+coded_age_one(i)-x) - (samp_year_coded_old(i)-z); //Difference in the born years of the true-aged indv (not the age difference)
   born_year_old = samp_year_coded_old(i)-z; 
   born_year_young = born_year_old+age_diff; //and the born year of the theoretical younger indv is the born year of the theoretical older indv + the age difference
   theo_samp_year_old = samp_year_coded_old(i);  //the sample year of the older individual for the lower calculations is the sample year of the coded older indv 
  }
  if( (samp_year_coded_old(i)-z) > (coded_born_year_young(i)+coded_age_one(i)-x) ){  //ok now what if your coded ages are super wrong the the coded younger is actually older than the coded older... (born year of older is greater)
   age_diff = (samp_year_coded_old(i)-z) - (coded_born_year_young(i)+coded_age_one(i)-x); //Difference in the born years of the true-aged indv (not the age difference)
   born_year_young = samp_year_coded_old(i)-z; //sample_year_old is now the sample year of the younger, so the born year of the younger is sample year of younger - z (which is now age of younger)
   born_year_old = born_year_young-age_diff; //then the born year of the theoretical older invidual is the born year of younger - the age difference
   //the sample year of the older individual for the lower calculations in this case is the sample year of the younger from the data, or the born year of the coded younger indv(now coded older) + the coded age of younger 
   theo_samp_year_old = coded_born_year_young(i)+coded_age_one(i);  
  }
  
   if(age_diff > 0){ //Hypothetical difference in born years has to be greater than zero
  
  //Specifying dimensions of the vector of matrices
   matrix<Type> surv_prob_aa(age_diff,lage+age_diff);
   surv_prob_aa.setZero();
   surv_prob.row(i).setZero();
   HSP_prob_aa.row(i).setZero();
   GGP_prob_aa.row(i).setZero();
   
   //Much of what is commented out below has to do with unfished calcs (when you are backdating to unfished territory), and is commented out to make the model run faster
   
/////////////////////////////////////
//HSP Calcs
/////////////////////////////////////  
  //This fills in the survival in the year of first born, Don't know how to fill in a segment of a matrix
//    if(born_year_old>0){
     surv_prob_aa.block(0,fage,1,lage+1) = S.row(born_year_old-1);
//	}
//	if(born_year_old<1){
//     surv_prob_aa.block(0,fage,1,lage+1) = exp(-1*Maa.array());
//	}
   
   if(age_diff>1){
    for(k=0;k<=lage+age_diff-2;k++){ 
//Assume that spawning happens at the very start of the year 
// So parent has to survive year of the birth, year after the birth,.. up to age difference
    if(k<lage){
//     if(born_year_old>0){
      surv_prob_aa.block(1,k+1,age_diff-1,1) = surv_prob_aa.block(0,k,age_diff-1,1).array() * S.block(born_year_old,k+1,age_diff-1,1).array(); 
//	 }
//	 if(born_year_old<1){
//      surv_prob_aa.block(1,k+1,age_diff-1,1) = surv_prob_aa.block(0,k,age_diff-1,1) * exp(-1*Maa(k+1));
//	 }
 	}
	
	if(k>=lage){
//     if(born_year_old>0){
      surv_prob_aa.block(1,k+1,age_diff-1,1) = surv_prob_aa.block(0,k,age_diff-1,1).array() * S.block(born_year_old,lage,age_diff-1,1).array();
//	 }
//     if(born_year_old<1){
//      surv_prob_aa.block(1,k+1,age_diff-1,1) = surv_prob_aa.block(0,k,age_diff-1,1) * exp(-1*Maa(lage));
//     }
	}
   } 
  }
   surv_prob.row(i) = surv_prob_aa.block(age_diff-1,age_diff-1,1,lage+1); //getting subset of matrix, starting at (x1,y1), and taking 1 row of lage+1 columns  
  
//HSP and GGP Unseen parent loop
   for(j=1;j<=lage;j++){  // We can assume the age of the hypothetical parent for HSP or GGP was not 0 in the birth year of older sibling or zero in birth year of grandchild, so we start this integration at age 1  
    if((j+age_diff)<=lage){          //If we are not in the plus group
//     if(born_year_old>0){                //if we're not in unfished years
      HSP_prob_aa(i,j) = ( (N(born_year_old-1,j)*Mat(j)*Waa(j)) / spbiomass(born_year_old-1) ) * surv_prob(i,j)  * (4 * Mat(int(j)+age_diff)*Waa(int(j)+age_diff) / spbiomass(born_year_old+age_diff-1));
//	 }
/*	 if(born_year_old<1){                //if we are in unfished years
	  if(born_year_old+age_diff>0){   //if second born is not in unfished years
       HSP_prob_aa(i,j) = ( (N0_age(j)*Mat(j)*Waa(j)) / SSB0 ) * surv_prob(i,j)  * (4 * Mat(int(j)+age_diff)*Waa(int(j)+age_diff) / spbiomass(born_year_old+age_diff-1));
	  }
	  if(born_year_old+age_diff<1){   //if second born is in unfished years
       HSP_prob_aa(i,j) = ( (N0_age(j)*Mat(j)*Waa(j)) / SSB0 ) * surv_prob(i,j)  * (4 * Mat(int(j)+age_diff)*Waa(int(j)+age_diff) / SSB0);
 	  }}
*/    }
	
    if((j+age_diff)>lage){            //If we are in the plus group
//     if(born_year_old>0){                //if we're not in unfished years
      HSP_prob_aa(i,j) = ( (N(born_year_old-1,j)*Mat(j)*Waa(j)) / spbiomass(born_year_old-1) ) * surv_prob(i,j)  * (4 * Mat(lage)*Waa(lage) / spbiomass(born_year_old+age_diff-1));	
//	 }
/*	 if(born_year_old<1){                //if we are in unfished years
	  if(born_year_old+age_diff>0){   //if second born is not in unfished years
       HSP_prob_aa(i,j) = ( (N0_age(j)*Mat(j)*Waa(j)) / SSB0 ) * surv_prob(i,j)  * (4 * Mat(lage)*Waa(lage) / spbiomass(born_year_old+age_diff-1));	
	  }
  	  if(born_year_old+age_diff<1){   //if second born is in unfished years
       HSP_prob_aa(i,j) = ( (N0_age(j)*Mat(j)*Waa(j)) / SSB0 ) * surv_prob(i,j)  * (4 * Mat(lage)*Waa(lage) / SSB0);	
	 }}
*/    }
   
   	/////////////////////////////////////////////////////////
	//Doing GGP calcs within this loop to try and save time
	/////////////////////////////////////////////////////////

   //sample year of older must be greater than birth year of the parent 
   if(theo_samp_year_old > (born_year_young-j)){
    //age of grandparent at year of parents birth must be positive , and if we're not in plus group
    if((((born_year_young-j)-(born_year_young-age_diff)) > fage) &  (((born_year_young-j)-(born_year_young-age_diff)) < (lage+1))){ 
    //if not in unfished territory
//     if(((born_year_young-1-j) > -1) & ((born_year_young-1) > -1)){
      GGP_prob_aa(i,j) = N(born_year_young-1,j) * (Mat(j)*Waa(j))/spbiomass(born_year_young-1) * ((Mat((born_year_young-j)-(born_year_young-age_diff)) * Waa((born_year_young-j)-(born_year_young-age_diff))) / (0.5*spbiomass(born_year_young-1-j)));  	  
//     } //if in unfished
/*     if(((born_year_young-1-j) < 0) & ((born_year_young-1) > -1)){
      GGP_prob_aa(i,j) = N(born_year_young-1,j) * (Mat(j)*Waa(j))/spbiomass(born_year_young-1) * ((Mat((born_year_young-j)-(born_year_young-age_diff)) * Waa((born_year_young-j)-(born_year_young-age_diff))) / (0.5*SSB0));  	  
	 } //if both in unfished
     if(((born_year_young-1-j) < 0) & ((born_year_young-1) < 0)){
      GGP_prob_aa(i,j) = N0_age(j) * (Mat(j)*Waa(j))/SSB0 * ((Mat((born_year_young-j)-(born_year_young-age_diff)) * Waa((born_year_young-j)-(born_year_young-age_diff))) / (0.5*SSB0));  	  
	 } 
*/    }
	//Instead if we're in plus group
    if(((born_year_young-j)-(born_year_young-age_diff)) > lage){ 
//     if(((born_year_young-1-j) > -1) & ((born_year_young-1) > -1)){
      GGP_prob_aa(i,j) = N(born_year_young-1,j) * (Mat(j)*Waa(j))/spbiomass(born_year_young-1) * ((Mat(lage) * Waa(lage)) / (0.5*spbiomass(born_year_young-1-j)));  	  
//	 } //if in unfished
/*     if(((born_year_young-1-j) < 0) & ((born_year_young-1) > -1)){
      GGP_prob_aa(i,j) = N(born_year_young-1,j) * (Mat(j)*Waa(j))/spbiomass(born_year_young-1) * ((Mat(lage) * Waa(lage)) / (0.5*SSB0));  	  
	 } //if both in unfished
     if(((born_year_young-1-j) < 0) & ((born_year_young-1) < 0)){
      GGP_prob_aa(i,j) = N0_age(j) * (Mat(j)*Waa(j))/SSB0 * ((Mat(lage) * Waa(lage)) / (0.5*SSB0));  	  
	 }
*/	}
   }
/////Instead if the sample year of older is the birth year of the parent, multiply by 0.5 for timing 
   if(theo_samp_year_old == (born_year_young-j)){
    //age of grandparent at year of parents birth must be positive , and if we're not in plus group
    if((((born_year_young-j)-(born_year_young-age_diff)) > fage) &  (((born_year_young-j)-(born_year_young-age_diff)) < (lage+1))){ 
    //if not in unfished territory
//     if(((born_year_young-1-j) > -1) & ((born_year_young-1) > -1)){
      GGP_prob_aa(i,j) = Type(0.5) * N(born_year_young-1,j) * (Mat(j)*Waa(j))/spbiomass(born_year_young-1) * ((Mat((born_year_young-j)-(born_year_young-age_diff)) * Waa((born_year_young-j)-(born_year_young-age_diff))) / (0.5*spbiomass(born_year_young-1-j)));  	  
//     } //if in unfished
/*     if(((born_year_young-1-j) < 0) & ((born_year_young-1) > -1)){
      GGP_prob_aa(i,j) = Type(0.5) * N(born_year_young-1,j) * (Mat(j)*Waa(j))/spbiomass(born_year_young-1) * ((Mat((born_year_young-j)-(born_year_young-age_diff)) * Waa((born_year_young-j)-(born_year_young-age_diff))) / (0.5*SSB0));  	  
	 } //if both in unfished
     if(((born_year_young-1-j) < 0) & ((born_year_young-1) < 0)){
      GGP_prob_aa(i,j) = Type(0.5) * N0_age(j) * (Mat(j)*Waa(j))/SSB0 * ((Mat((born_year_young-j)-(born_year_young-age_diff)) * Waa((born_year_young-j)-(born_year_young-age_diff))) / (0.5*SSB0));  	  
	 } 
*/    }
   //Instead if we're in plus group
   if(((born_year_young-j)-(born_year_young-age_diff)) > lage){ 
//    if(((born_year_young-1-j) > -1) & ((born_year_young-1) > -1)){
     GGP_prob_aa(i,j) = Type(0.5) * N(born_year_young-1,j) * (Mat(j)*Waa(j))/spbiomass(born_year_young-1) * ((Mat(lage) * Waa(lage)) / (0.5*spbiomass(born_year_young-1-j)));  	  
//	} //if in unfished
/*    if(((born_year_young-1-j) < 0) & ((born_year_young-1) > -1)){
     GGP_prob_aa(i,j) = Type(0.5) * N(born_year_young-1,j) * (Mat(j)*Waa(j))/spbiomass(born_year_young-1) * ((Mat(lage) * Waa(lage)) / (0.5*SSB0));  	  
	} //if both in unfished
    if(((born_year_young-1-j) < 0) & ((born_year_young-1) < 0)){
     GGP_prob_aa(i,j) = Type(0.5) * N0_age(j) * (Mat(j)*Waa(j))/SSB0 * ((Mat(lage) * Waa(lage)) / (0.5*SSB0));  	  
	}
*/   }
    }
   } //Closing HSP and GGP loop
   
   HSP_prob(i) += P_obs_xz*HSP_prob_aa.row(i).sum();
   //Multiplying by two for the probability of MGGP or PGGP (^ previous calcs were for MGGP or equally PGGP)
   GGP_prob(i) += P_obs_xz*Type(2)*GGP_prob_aa.row(i).sum();

/////////////////////////
//POP calcs
/////////////////////////
     
    //If a potential parent is sampled after the year of youngs birth, because sampling is lethal
    if(theo_samp_year_old > born_year_young){
  //So the expected reproductive output of the parent in the year of offsprings birth / total reprod output that year
     if(age_diff <= lage){
//      if(born_year_young > 0){
 	   POP_prob(i) += P_obs_xz * 2*(Mat(age_diff)*Waa(age_diff) / spbiomass(born_year_young-1));
// 	  }    
//	  if(born_year_young < 1){
//	   POP_prob(i) += P_obs_xz * 2*(Mat(age_diff)*Waa(age_diff) / SSB0);
//	  }
	 }
	 if(age_diff > lage){
//      if(born_year_young > 0){
 	   POP_prob(i) += P_obs_xz * 2*(Mat(lage)*Waa(lage) / spbiomass(born_year_young-1));
// 	  }    
//	  if(born_year_young < 1){
//	   POP_prob(i) += P_obs_xz * 2*(Mat(lage)*Waa(lage) / SSB0);
//	  }
	 }
   }	 
   //If your sample year is the same as the birth year of younger, we say due to timing, multiply the probability by 50% (given continuous fishing)
   if(theo_samp_year_old == born_year_young){ 
     if(age_diff <= lage){
//      if(born_year_young > 0){
 	   POP_prob(i) += Type(0.5) * P_obs_xz * 2*(Mat(age_diff)*Waa(age_diff) / spbiomass(born_year_young-1));
// 	  }    
//	  if(born_year_young < 1){
//	   POP_prob(i) += Type(0.5) * P_obs_xz * 2*(Mat(age_diff)*Waa(age_diff) / SSB0);
//	  }
	 }
	 if(age_diff > lage){
//      if(born_year_young > 0){
 	   POP_prob(i) += Type(0.5) * P_obs_xz * 2*(Mat(lage)*Waa(lage) / spbiomass(born_year_young-1));
// 	  }    
//	  if(born_year_young < 1){
//	   POP_prob(i) += Type(0.5) * P_obs_xz * 2*(Mat(lage)*Waa(lage) / SSB0);
//	  }
	 }
   }
   
   }}}  //closing ageing error loops, and if loops
   
//////////////////////////////////////////// 
//Multinomial Likelihood for CKMR calcs
////////////////////////////////////////////  

     L4 -= (n_ckmr(i)*((n_ckmr(i)-(k_ckmr_hsporggp(i)+k_ckmr_pop(i)))/n_ckmr(i))*log(1-((HSP_prob(i)+GGP_prob(i))*pi_nu+POP_prob(i)))); //Prob of no match
     L4 -= (n_ckmr(i)*((k_ckmr_hsporggp(i)/n_ckmr(i))*log((HSP_prob(i)+GGP_prob(i)+Type(1e-100))*pi_nu)));    //Prob of HSP or GPP
     L4 -= (n_ckmr(i)*((k_ckmr_pop(i)/n_ckmr(i))*log(POP_prob(i)+Type(1e-100))));    //Prob of POP, the small constant is required for the log because you are integrating over ageing error (and don't know ages for sure)
      //Alternative = Sample size * sum ( Prob of no match + Prob of HSP + Prob of POP ) 
//     L4 -= (n_ckmr(i)*(((n_ckmr(i)-(k_ckmr_hsporggp(i)+k_ckmr_pop(i)))/n_ckmr(i))*log(1-((HSP_prob(i)+GGP_prob(i))*pi_nu+POP_prob(i))) + (k_ckmr_hsporggp(i)/n_ckmr(i))*log((HSP_prob(i)+GGP_prob(i))*pi_nu) + (k_ckmr_pop(i)/n_ckmr(i))*log(POP_prob(i)))); 

//Other alternatives to writing it
  /*
    //Potential parent has to be sampled after or on the year of youngs birth, because sampling is lethal 	  
    if(samp_year_coded_old(i) >= (coded_born_year_young(i)+coded_age_one(i)-coded_one_max(i))){
//    if((samp_year_coded_old(i) >= (coded_born_year_young(i)+coded_age_one(i)-coded_one_max(i))) | (coded_born_year_young(i)+coded_age_one(i) >= (coded_born_year_old(i)+coded_age_two(i)-coded_two_max(i))) ){
     L4 -= (n_ckmr(i)*((n_ckmr(i)-(k_ckmr_hsporggp(i)+k_ckmr_pop(i)))/n_ckmr(i))*log(1-((HSP_prob(i)+GGP_prob(i))*pi_nu+POP_prob(i)))); //Prob of no match
     L4 -= (n_ckmr(i)*((k_ckmr_hsporggp(i)/n_ckmr(i))*log((HSP_prob(i)+GGP_prob(i)+Type(1e-20))*pi_nu)));    //Prob of HSP or GPP
     L4 -= (n_ckmr(i)*((k_ckmr_pop(i)/n_ckmr(i))*log(POP_prob(i)+Type(1e-20))));    //Prob of POP
    }
    //if not, then collapses to binomial for only HSP calcs 
    if(samp_year_coded_old(i) < (coded_born_year_young(i)+coded_age_one(i)-coded_one_max(i))){
//or if ages are way wrong and the sample year of the younger (actually older) is before the max born year of the coded older (actually younger)	
//    if((samp_year_coded_old(i) < (coded_born_year_young(i)+coded_age_one(i)-coded_one_max(i))) | (coded_born_year_young(i)+coded_age_one(i) < (coded_born_year_old(i)+coded_age_two(i)-coded_two_max(i))) ){
     L4 -= log(dbinom(k_ckmr_hsporggp(i),n_ckmr(i),(HSP_prob(i)+GGP_prob(i)+Type(1e-20))*pi_nu)); 
   }
  */
  }

////////////////////////////////////
//LIKELIHOODS other than CKMR
////////////////////////////////////
  L1 = -sum(dnorm(log(obs_harv),log(pred_harv),sd_catch,true));

//Multinomial age compositions
  L2=Type(0);
  for(i=0;i<=lyear-1;i++){
   if(SS_fishery(i)>0){   //Only run calcs if there is comp data
     L2 -= (SS_fishery(i)*(vector<Type>(obs_fishery_comp.row(i))*log(vector<Type>(pred_fishery_comp_wAE.row(i))))).sum();     //Likelihood for age composition of fishery catch
   }
  }
  
//Fishery Index
//Lognormal by SD
  L3 = -sum(dnorm(log(obs_index),log(pred_index),sd_index,true));
//  L3 = -sum(dnorm(log(vector<Type>(obs_index/obs_index.mean())),log(vector<Type>(pred_index/pred_index.mean())),sd_index,true));
  
  //Recruitment deviations
  NPRAND = -1*(sum(dnorm(log_recruit_devs,0,sd_rec,true)) + sum(dnorm(log_recruit_devs_init,0,sd_rec,true))); //Recruitment deviations

  NLL = (Lamda_Harvest*L1) + (Lamda_Comp*L2) + (Lamda_Index*L3) + (Lamda_CKMR*L4);
  JNLL=NPRAND+NLL;

/////////////////////////
//Report
/////////////////////////

//  REPORT(Maa);
//  REPORT(log_M);
//  REPORT(q);
//  REPORT(R0);
//  REPORT(sd_rec);
//  REPORT(sd_catch);
//  REPORT(sd_index);
//  REPORT(log_recruit_devs);

//  REPORT(surv_prob);
//  REPORT(HSP_prob_aa);
  REPORT(HSP_prob);
  REPORT(POP_prob);
  REPORT(GGP_prob);

//  REPORT(fishery_sel);
//  REPORT(N0_age);
//  REPORT(Laa);
//  REPORT(lxo);
//  REPORT(F);
//  REPORT(M);
//  REPORT(N);
  REPORT(spbiomass);
  ADREPORT(spbiomass);
//  REPORT(obs_harv);
//  REPORT(pred_harv);
//  REPORT(pred_caa);
//  REPORT(pred_index);
//  REPORT(obs_index);
  REPORT(pred_fishery_comp);
  REPORT(pred_fishery_comp_wAE);
  REPORT(obs_fishery_comp);

  REPORT(L1);
  REPORT(L2);
  REPORT(L3);
  REPORT(L4);
//  ADREPORT(L4);
  REPORT(NLL);
  REPORT(NPRAND);

  return JNLL;

}


