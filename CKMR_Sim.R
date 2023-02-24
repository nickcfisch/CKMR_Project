#####################################################
#Population Simulations for each Life-history type
#####################################################

#wd<-"C:/Users/nfisch/Documents/GitHub/CKMR_Project"
#wd<-"C:/Users/nicholas.fisch/Documents/GitHub/CKMR_Project/"

#Still need to save population output
SimPop<-function(seed=1,
                 fage=0,
                 lage=15,
                 fyear=1,
                 lyear=100,
                 Linf=25,
                 a3=0.5,
                 L1=10,
                 BK=0.4,
                 Weight_scaling=1.7e-5,
                 Weight_allometry=2.9,
                 Mref=0.4,
                 Mat_50=15.9,
                 Mat_slope=-0.9,
                 Sel_50=15.9,
                 Sel_slope=3.3,
                 R0=exp(16),
                 h=0.59,
                 sd_rec=0.73,
                 const_F=FALSE,
                 fint=0.25,
                 fhigh=0.25,
                 flow=0.25,
                 stochastic=TRUE){      

set.seed(seed)

#Length at age
Lmin<-0
b<-(L1-Lmin)/a3
Laa<-Lmin+b*0
Laa<-NA
Laa[1]<-Lmin+b*0
Laa[2:lage]<-Linf+(L1-Linf)*exp(-BK*((1:(lage-1))-a3))
Laa[lage+1]<-Linf
Laa[1]<-uniroot(f=function(x) x+(x-Linf)*(exp(-BK)-1)-Laa[2], interval=c(0.01,100))$root

#Weight at age
Waa<-Weight_scaling*Laa^Weight_allometry

#Natural mortality at age
#Maa<-Mref*(Laa/(Linf*0.75))^-1
Maa<-rep(Mref,length(fage:lage))    #Constant M

#Maturity
Mat<-1/(1+exp(Mat_slope*(Laa-Mat_50)))

#Fishery Selectivity 
Sel<-1/(1+exp(-log(19)*(Laa-Sel_50)/Sel_slope))

#Fishing intensity, starts in year 25
k_int<-0.15
mid_int<-20
F_int<-NA
if (const_F==TRUE){
 F_int[fyear:lyear]<-fint
} else if (const_F==FALSE){
  F_int[fyear:25]<-0
  F_int[26:85]<-fhigh/length(26:85)*(1:length(26:85))
  F_int[86:lyear]<-F_int[85]+(flow-fhigh)/length(86:lyear)*(1:length(86:lyear))
}

#Now Pop Stuff
lxo<-c(1,cumprod(exp(-Maa[1:lage])))   #survivorship
lxo[lage+1]<-lxo[lage+1]/(1-exp(-Maa[lage+1]))   #plus group survivorship
N0aa<-R0*lxo
SSB0<-sum(N0aa*Mat*Waa)  #Unfished SSB calc

#Population Simulation
Faa<-Zaa<-matrix(NA, nrow=lyear, ncol=lage+1)
Naa<-matrix(NA, nrow=lyear+1, ncol=lage+1)
Naa[1,]<-N0aa
SSB<-sum(Naa[1,]*Mat*Waa)
lrecdevs<-0
for(i in fyear:lyear){
  Faa[i,]<-F_int[i]*Sel
  Zaa[i,]<-Maa+Faa[i,]
  for(j in 1:lage){
    Naa[i+1,j+1]<-Naa[i,j]*exp(-Zaa[i,j])
  }
  Naa[i+1,lage+1]<-Naa[i+1,lage+1]+Naa[i,lage+1]*exp(-Zaa[i,lage+1]) #plus group
  
  SSB[i+1] <- sum(Naa[i+1,]*Mat*Waa, na.rm=TRUE)
  if (stochastic==TRUE){
   lrecdevs[i+1]<-rnorm(n=1,mean=0, sd=sd_rec)
   Naa[i+1,1] <- (4*h*R0*SSB[i+1])/(SSB0*(1-h)+SSB[i+1]*(5*h-1))*exp(lrecdevs[i+1]-0.5*sd_rec^2)
#   Naa[i+1,1] <- rlnorm(n=1,meanlog=log((4*h*R0*SSB[i+1])/(SSB0*(1-h)+SSB[i+1]*(5*h-1))), sdlog=sd_rec)
  } else {
   Naa[i+1,1] <- (4*h*R0*SSB[i+1])/(SSB0*(1-h)+SSB[i+1]*(5*h-1))
  }
}

Caa<-Faa/Zaa*Naa[1:lyear,]*(1-exp(-Zaa))

return(list(fage=fage,lage=lage,seed=seed,fyear=fyear,lyear=lyear,Linf=Linf,a3=a3,L1=L1,BK=BK,Weight_scaling=Weight_scaling,Weight_allometry=Weight_allometry,Mref=Mref,
            Mat_50=Mat_50,Mat_slope=Mat_slope,Sel_50=Sel_50,Sel_slope=Sel_slope,R0=R0,h=h,sd_rec=sd_rec,fint=fint,fhigh=fhigh,flow=flow,stochastic=stochastic,
            lrecdevs=lrecdevs,
            Laa=Laa,
            Waa=Waa,
            Mat=Mat,
            F_int=F_int,
            lxo=lxo,
            Naa=Naa,
            Caa=Caa,
            SSB=SSB,
            SSB0=SSB0,
            N0aa=N0aa,
            Maa=Maa,
            Sel=Sel,
            Faa=Faa,
            Zaa=Zaa))
}

Get_Data<-function(OM=NA,              #Operating model from which to model
                   dat_seed=1,
                   fyear_dat=26,
                   lyear_dat=100,
                   sd_catch=0.05,
                   N_Comp=100,
                   q_index=0.0001,
                   sd_index=0.25,
                   prop_ckmr=1,
                   fyear_ckmr=76,
                   lyear_ckmr=100){

  set.seed(dat_seed)
  #Getting Data
  Obs_Catch<-Obs_Index<-NA
  Obs_Catch_Comp<-matrix(NA,nrow=length(fyear_dat:lyear_dat),ncol=length(OM$fage:OM$lage))
  for (d in fyear_dat:lyear_dat){
    Obs_Catch[d-(fyear_dat-1)]<-rlnorm(1, meanlog=log(sum(OM$Caa[d,]*OM$Waa)), sdlog=sd_catch)
    Obs_Catch_Comp[d-(fyear_dat-1),]<-rmultinom(n=1,size=N_Comp, prob=OM$Caa[d,])
    Obs_Index[d-(fyear_dat-1)]<-rlnorm(1, meanlog=log(sum(OM$Naa[d,]*((1-exp(-OM$Zaa[d,]))/OM$Zaa[d,])*OM$Sel*OM$Waa)*q_index), sdlog=sd_index)
  }

  ##################################
  #Simulator for both HSP and POP
  ##################################
  library(microbenchmark)
  library(TMB)
  library(tmbstan)
  library(purrr)
  
  #Simulating the data
  ages <- OM$fage:OM$lage          #a vector of the ages at which individuals are sampled
  n_ckmr<-round(N_Comp*prop_ckmr)
  # The age composition samples
  age_samples<-matrix(NA, nrow=length(fyear_ckmr:lyear_ckmr),ncol=N_Comp)
  for(i in 1:length(fyear_ckmr:lyear_ckmr)){
    if (prop_ckmr==1){
    age_samples[i,] <- rep(ages,times=Obs_Catch_Comp[fyear_ckmr-fyear_dat+i,])
    }else if (prop_ckmr!=1){
    age_samples[i,] <- sample(ages, size = n_ckmr, replace = FALSE, prob = Obs_Catch_Comp[fyear_ckmr-fyear_dat+i,])
    }
  }  
  
  samples <- data.frame(samp_year = rep(fyear_ckmr:lyear_ckmr, each=N_Comp), age = c(t(age_samples)))
  samples <- cbind.data.frame(samples, born_year = samples$samp_year - samples$age)    #From the age and sampling year, calculate the year it was born in.
  #The total reproductive output at the time it was born
  Tot_reprod <- rep(NA, length(samples$born_year))
  Tot_reprod[which(samples$born_year>0)] <- OM$SSB[samples$born_year[which(samples$born_year>0)]]
  Tot_reprod[which(samples$born_year<1)] <- OM$SSB0
  samples <- cbind.data.frame(samples, Tot_reprod = Tot_reprod)                         #The total reproductive output at the time it was born
  
  #now we form all the possible pairs of those samples
  #New way to do it that is more efficient
  pairs_hsp<-do.call(cbind.data.frame,Map(expand.grid,samples,samples))
  colnames(pairs_hsp)<-c("samp_year.old","samp_year","age.old","age","born_year.old","born_year","Tot_reprod.old","Tot_reprod") #naming the columns 
  pairs_hsp <- pairs_hsp[c(pairs_hsp$born_year.old < pairs_hsp$born_year),]   
  pairs_hsp <- pairs_hsp[,c("samp_year","age","born_year","Tot_reprod","samp_year.old","age.old","born_year.old","Tot_reprod.old")] #just reordering the columns
  pairs_hsp <- cbind.data.frame(pairs_hsp, age_diff = pairs_hsp$born_year-pairs_hsp$born_year.old) 
  
  #Rewrote using binomial, because you can't have too many samples it gets too complex. 
  collapsed_pairs_hsp<-aggregate(rep(1,nrow(pairs_hsp)),by=list(pairs_hsp$born_year,pairs_hsp$age_diff), FUN=sum)
  colnames(collapsed_pairs_hsp)<-c("born_year", "age_diff","times")
  
  #Now for loop through the samples
  surv_prob<-matrix(NA, nrow=nrow(collapsed_pairs_hsp), ncol=(OM$lage+1))
  HSP_calcs<-matrix(NA, nrow=nrow(collapsed_pairs_hsp), ncol=(OM$lage+1))
  lxf<-list()
  for (i in 1:nrow(collapsed_pairs_hsp)){
    #Probability you were alive in the year of the first born and survived to the year of the second born
    lxf[[i]]<-matrix(NA,nrow=collapsed_pairs_hsp$age_diff[i],ncol=(OM$lage+1)+collapsed_pairs_hsp$age_diff[i]-1)
    if(collapsed_pairs_hsp$born_year[i]-collapsed_pairs_hsp$age_diff[i]>0){
      lxf[[i]][1,1:(OM$lage+1)]<-exp(-(OM$Maa+OM$Faa[collapsed_pairs_hsp$born_year[i]-collapsed_pairs_hsp$age_diff[i],]))
    } else if (collapsed_pairs_hsp$born_year[i]-collapsed_pairs_hsp$age_diff[i]<1){ #to account for unfished years
      lxf[[i]][1,1:(OM$lage+1)]<-exp(-OM$Maa)
    }
    
    if(collapsed_pairs_hsp$age_diff[i]>1){
      for (y in 1:(collapsed_pairs_hsp$age_diff[i]-1)){        #Loop through the years the parent has to survive (1st year has 1 for survival)
        for (j in 1:((OM$lage+1)+collapsed_pairs_hsp$age_diff[i]-2)){   #Loop through mature ages in the year of the first born
          if(j<(OM$lage+1)+1){ #if we are not in plus group
            if(collapsed_pairs_hsp$born_year[i]-collapsed_pairs_hsp$age_diff[i]>0){
              lxf[[i]][y+1,j+1] <- lxf[[i]][y,j]*exp(-(OM$Maa[j]+OM$Faa[collapsed_pairs_hsp$born_year[i]-collapsed_pairs_hsp$age_diff[i]+y,j]))  #(y-1) is to account for the year in pop model
            } else if (collapsed_pairs_hsp$born_year[i]-collapsed_pairs_hsp$age_diff[i]<1){ #to account for unfished years
              lxf[[i]][y+1,j+1] <- lxf[[i]][y,j]*exp(-OM$Maa[j])    
            }} else if (j>(OM$lage+1)){
              if(collapsed_pairs_hsp$born_year[i]-collapsed_pairs_hsp$age_diff[i]>0){
                lxf[[i]][y+1,j+1] <- lxf[[i]][y,j]*exp(-(OM$Maa[OM$lage+1]+OM$Faa[collapsed_pairs_hsp$born_year[i]-collapsed_pairs_hsp$age_diff[i]+y,(OM$lage+1)]))  #collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i] is to get the birth year of first born
              } else if (collapsed_pairs_hsp$born_year[i]-collapsed_pairs_hsp$age_diff[i]<1){ #to account for unfished years
                lxf[[i]][y+1,j+1] <- lxf[[i]][y,j]*exp(-OM$Maa[OM$lage+1])    
              }
            }
        } 
      }
    }
    #Probability you survived to the year of the second born (surviving the year of first born and all the way through the year before the second born)
    #From the age of the parent at the time of the first born
    surv_prob[i,]<-lxf[[i]][collapsed_pairs_hsp$age_diff[i],collapsed_pairs_hsp$age_diff[i]:((OM$lage+1)+collapsed_pairs_hsp$age_diff[i]-1)]
    
    #Ok so now it is the number (fecundity) that could have given birth to the first born / total reproductive output  * survival to second born * (fecundity of age at second born / total reproductive output at time of second born)
    for(j in 1:(OM$lage+1)){
      if ((j+collapsed_pairs_hsp$age_diff[i])<=(OM$lage+1)){ #If we are not in the plus group
        
        if(collapsed_pairs_hsp$born_year[i]-collapsed_pairs_hsp$age_diff[i]>0){ # if we're not in unfished years
          HSP_calcs[i,j] <-  ( (OM$Naa[collapsed_pairs_hsp$born_year[i]-collapsed_pairs_hsp$age_diff[i],j]*OM$Mat[j]*OM$Waa[j]) / OM$SSB[collapsed_pairs_hsp$born_year[i]-collapsed_pairs_hsp$age_diff[i]] ) * surv_prob[i,j]  * (4 * OM$Mat[j+collapsed_pairs_hsp$age_diff[i]]*OM$Waa[j+collapsed_pairs_hsp$age_diff[i]] / OM$SSB[collapsed_pairs_hsp$born_year[i]])  #4 is for MHSP + FHSP
        } else if (collapsed_pairs_hsp$born_year[i]-collapsed_pairs_hsp$age_diff[i]<1){ #if we are in unfished years
          if(collapsed_pairs_hsp$born_year[i]>0){ #if second born is not in unfished years
            HSP_calcs[i,j] <-  ( (OM$N0aa[j]*OM$Mat[j]*OM$Waa[j]) / OM$SSB0 ) * surv_prob[i,j]  * (4 * OM$Mat[j+collapsed_pairs_hsp$age_diff[i]]*OM$Waa[j+collapsed_pairs_hsp$age_diff[i]] / OM$SSB[collapsed_pairs_hsp$born_year[i]])  #4 is for MHSP + FHSP
          } else if (collapsed_pairs_hsp$born_year[i]<1){ #if second born is in unfished years
            HSP_calcs[i,j] <-  ( (OM$N0aa[j]*OM$Mat[j]*OM$Waa[j]) / OM$SSB0 ) * surv_prob[i,j]  * (4 * OM$Mat[j+collapsed_pairs_hsp$age_diff[i]]*OM$Waa[j+collapsed_pairs_hsp$age_diff[i]] / OM$SSB0)  #4 is for MHSP + FHSP
          }}
        
      } else if (j+collapsed_pairs_hsp$age_diff[i]>(OM$lage+1)){ #Now if we are in plus group
        if(collapsed_pairs_hsp$born_year[i]-collapsed_pairs_hsp$age_diff[i]>0){ #if we're not in unfished years
          HSP_calcs[i,j] <-  ( (OM$Naa[collapsed_pairs_hsp$born_year[i]-collapsed_pairs_hsp$age_diff[i],j]*OM$Mat[j]*OM$Waa[j]) / OM$SSB[collapsed_pairs_hsp$born_year[i]-collapsed_pairs_hsp$age_diff[i]] ) * surv_prob[i,j]  * (4 * OM$Mat[(OM$lage+1)]*OM$Waa[(OM$lage+1)] / OM$SSB[collapsed_pairs_hsp$born_year[i]])  #4 is for MHSP + FHSP
        } else if (collapsed_pairs_hsp$born_year[i]-collapsed_pairs_hsp$age_diff[i]<1){ #if we are in unfished years
          if(collapsed_pairs_hsp$born_year[i]>0){ #if second born is not in unfished years
            HSP_calcs[i,j] <-  ( (OM$N0aa[j]*OM$Mat[j]*OM$Waa[j]) / OM$SSB0 ) * surv_prob[i,j]  * (4 * OM$Mat[(OM$lage+1)]*OM$Waa[(OM$lage+1)] / OM$SSB[collapsed_pairs_hsp$born_year[i]])  #4 is for MHSP + FHSP
          } else if (collapsed_pairs_hsp$born_year[i]<1){ #if second born is in unfished years
            HSP_calcs[i,j] <-  ( (OM$N0aa[j]*OM$Mat[j]*OM$Waa[j]) / OM$SSB0 ) * surv_prob[i,j]  * (4 * OM$Mat[(OM$lage+1)]*OM$Waa[(OM$lage+1)] / OM$SSB0)  #4 is for MHSP + FHSP
          }}
      }
    }
  }
  #Then we sum over all the ages to get the HSP probability for that given data pair
  collapsed_pairs_hsp$HSP_prob <- rowSums(HSP_calcs)
  
  # here we simulate whether each pair is an HSP or not by simulating
  # a binomial with n as the number of reps of covariates
  collapsed_pairs_hsp$n_HSP <- rbinom(nrow(collapsed_pairs_hsp), size=collapsed_pairs_hsp$times, p = collapsed_pairs_hsp$HSP_prob)
  
  collapsed_pairs_hsp$n_UP<-collapsed_pairs_hsp$times-collapsed_pairs_hsp$n_HSP #Getting the number of non pairs
  collapsed_pairs_hsp<-collapsed_pairs_hsp[order(collapsed_pairs_hsp$born_year,collapsed_pairs_hsp$age_diff),] #ordering the counts by year born and then the age difference
  
  sim_vals_hsp <- list(samples = samples, pairs = pairs_hsp, pair_counts = collapsed_pairs_hsp, pair_data = collapsed_pairs_hsp[,c("born_year", "age_diff", "n_UP", "n_HSP","times")]) #pair_data is Without HSP_prob, because the dataset we get won't know this
  
  #Now POP calcs
  
  #Form all the possible pairs of those samples
  pairs_pop<-do.call(cbind.data.frame,Map(expand.grid,samples,samples))
  colnames(pairs_pop)<-c("samp_year.old","samp_year.young","age.old","age.young","born_year.old","born_year.young","Tot_reprod.old","Tot_reprod.young") #naming the columns 
  #Ok so now in this case we want to remove all pairs where a potential adult is not two years older than the potential kin
  pairs_pop <- pairs_pop[c(c(pairs_pop$born_year.old < pairs_pop$born_year.young)),]   # A potential parent has to have been born before a potential young
  pairs_pop <- pairs_pop[c(pairs_pop$samp_year.old >= pairs_pop$born_year.young),]   # A potential parent has to have been sampled after or on the year of youngs birth, because sampling is lethal  
  pairs_pop <- pairs_pop[,c("samp_year.young","age.young","born_year.young","Tot_reprod.young","samp_year.old","age.old","born_year.old","Tot_reprod.old")] #just reordering the columns
  pairs_pop <- cbind.data.frame(pairs_pop, age_diff = pairs_pop$born_year.young-pairs_pop$born_year.old) 
  
  #Rewrote using binomial, because you can't have too many samples it gets too complex. 
  collapsed_pairs_pop<-aggregate(rep(1,nrow(pairs_pop)),by=list(pairs_pop$born_year.young,pairs_pop$age_diff), FUN=sum)
  colnames(collapsed_pairs_pop)<-c("born_year.young", "age_diff","times")
  
  #Now for loop through the samples
  collapsed_pairs_pop$prob_POP<-NA
  for (i in 1:nrow(collapsed_pairs_pop)){
    #Ok so the fecundity based on the age of the potential parent / (0.5 * the total reproductive output of the population at the time of juves birth )
    #Then we multiply by two to account for POP by Dad or Mom
    if(collapsed_pairs_pop$born_year.young[i]>0){  #if not in unfished territory
      collapsed_pairs_pop$prob_POP[i]<- 4*(OM$Mat[collapsed_pairs_pop$age_diff[i]]*OM$Waa[collapsed_pairs_pop$age_diff[i]] / sum( OM$Naa[collapsed_pairs_pop$born_year.young[i],]*OM$Mat*OM$Waa ))
    } else if(collapsed_pairs_pop$born_year.young[i]<1){
      collapsed_pairs_pop$prob_POP[i]<- 4*(OM$Mat[collapsed_pairs_pop$age_diff[i]]*OM$Waa[collapsed_pairs_pop$age_diff[i]] / sum( OM$N0aa*OM$Mat*OM$Waa ))
    }
  }#Don't need to consider plus group calcs bc max age diff will be 25
  
  collapsed_pairs_pop$n_POP <- rbinom(nrow(collapsed_pairs_pop), size=collapsed_pairs_pop$times, p = collapsed_pairs_pop$prob_POP)
  
  collapsed_pairs_pop$n_nonPOP<-collapsed_pairs_pop$times-collapsed_pairs_pop$n_POP #Getting the number of non pairs
  collapsed_pairs_pop<-collapsed_pairs_pop[order(collapsed_pairs_pop$born_year.young,collapsed_pairs_pop$age_diff),] #ordering the counts by year born and then the age difference
  
  sim_vals_pop <- list(samples = samples, pairs = pairs_pop, pair_counts = collapsed_pairs_pop, pair_data = collapsed_pairs_pop[,c("born_year.young","age_diff","n_nonPOP","n_POP","times")]) 
  
  return(list(OM=OM,dat_seed=dat_seed,sd_catch=sd_catch,N_Comp=N_Comp,q_index=q_index,sd_index=sd_index,fyear_dat=fyear_dat,lyear_dat=lyear_dat,prop_ckmr=prop_ckmr,fyear_ckmr=fyear_ckmr,lyear_ckmr=lyear_ckmr,
              Obs_Catch=Obs_Catch,
              Obs_Catch_Comp=Obs_Catch_Comp,
              Obs_Index=Obs_Index,
              #CKMR HSP data
              born_year_old_hsp=sim_vals_hsp$pair_data$born_year-sim_vals_hsp$pair_data$age_diff, 
              age_diff_hsp=sim_vals_hsp$pair_data$age_diff,
              n_ckmr_hsp=sim_vals_hsp$pair_data$times,
              k_ckmr_hsp=sim_vals_hsp$pair_data$n_HSP,
              #CKMR POP
              born_year_young_pop=sim_vals_pop$pair_data$born_year.young, 
              age_diff_pop=sim_vals_pop$pair_data$age_diff,
              n_ckmr_pop=sim_vals_pop$pair_data$times,
              k_ckmr_pop=sim_vals_pop$pair_data$n_POP))
}


#Fhigh is F that equals 0.85 MSY, as is flow

#Sardine, 0.425 is fmsy, fhigh is 0.7875, flow is 0.2037
#MSY 122577.8 (*0.85 = 104191.1)
Nsim<-100
Sardine_runs<-list()
for (s in 1:Nsim){
 Sardine_runs[[s]]<-SimPop(seed=s,fage=0,lage=15,fyear=1,lyear=100,
   Linf=25,
   a3=0.5,
   L1=10,
   BK=0.4,
   Weight_scaling=1.7e-5,
   Weight_allometry=2.9,
   Mref=0.4,
   Mat_50=15.9,
   Mat_slope=-0.9,
   Sel_50=15.9,
   Sel_slope=3.3,
   R0=exp(16),
   h=0.59,
   sd_rec=0.73,
   const_F=FALSE,
   fint=0.25,
   fhigh=0.7875, 
   flow=0.2037,
   stochastic=TRUE)
}

#For Flatfish, fmsy is 0.27, MSY is 5240.563 (*0.85= 4454.479), and fhigh which reaches 0.85*MSY is 0.5425, flow is 0.1259
Flatfish_runs<-list()
for (s in 1:Nsim){
 Flatfish_runs[[s]]<-SimPop(seed=s,
   fage=0,
   lage=25,
   fyear=1,
   lyear=100,
   Linf=47.4,
   a3=0.5,
   L1=12.7,
   BK=0.35,
   Weight_scaling=1e-5,
   Weight_allometry=3,
   Mref=0.2,
   Mat_50=28.9,
   Mat_slope=-0.42,
   Sel_50=28.9,
   Sel_slope=7,
   R0=exp(10.5),
   h=0.76,
   sd_rec=0.7,
   const_F=FALSE,
   fint=0.25,
   fhigh=0.5425, 
   flow=0.1259, 
   stochastic=TRUE)
}

#For Cod, fmsy is 0.12, MSY is 160865265 (*0.85=136735475), f that reaches 0.85*MSY is 0.20284, flow is 0.06232
Cod_runs<-list()
for (s in 1:Nsim){
 Cod_runs[[s]]<-SimPop(seed=s,
   fage=0,
   lage=25,
   fyear=1,
   lyear=100,
   Linf=132,
   a3=0.5,
   L1=20,
   BK=0.2,
   Weight_scaling=6.8e-6,
   Weight_allometry=3.1,
   Mref=0.2,
   Mat_50=38.2,
   Mat_slope=-0.27,
   Sel_50=38.2,
   Sel_slope=10.6,
   R0=exp(18.7),
   h=0.65,
   sd_rec=0.4,
   const_F=FALSE,
   fint=0.25,
   fhigh=0.20284, 
   flow=0.06232, 
   stochastic=TRUE)
}

#save(Cod_runs, file=paste0(wd,"/Cod_Base.RData"))
#save(Flatfish_runs, file=paste0(wd,"/Flatfish_Base.RData"))
#save(Sardine_runs, file=paste0(wd,"/Sardine_Base.RData"))

par(mfrow=c(1,3))
plot(1:101,Cod_runs[[1]]$SSB/Cod_runs[[1]]$SSB0, ylim=c(0,2), las=1, xlab="Year", ylab="SSB/SSB0", main="Cod")
Cod_Depl<-matrix(NA, nrow=Nsim,ncol=101)
Cod_Depl[1,]<-Cod_runs[[1]]$SSB/Cod_runs[[1]]$SSB0
for(s in 2:Nsim){
  Cod_Depl[s,]<-Cod_runs[[s]]$SSB/Cod_runs[[s]]$SSB0
  points(1:101,Cod_runs[[s]]$SSB/Cod_runs[[s]]$SSB0)
}
plot(1:101,Flatfish_runs[[1]]$SSB/Flatfish_runs[[1]]$SSB0, ylim=c(0,2), las=1, xlab="Year", ylab="SSB/SSB0", main="Flatfish")
Flatfish_Depl<-matrix(NA, nrow=Nsim,ncol=101)
Flatfish_Depl[1,]<-Flatfish_runs[[1]]$SSB/Flatfish_runs[[1]]$SSB0
for(s in 2:Nsim){
  Flatfish_Depl[s,]<-Flatfish_runs[[s]]$SSB/Flatfish_runs[[s]]$SSB0
  points(1:101,Flatfish_runs[[s]]$SSB/Flatfish_runs[[s]]$SSB0)
}
plot(1:101,Sardine_runs[[1]]$SSB/Sardine_runs[[1]]$SSB0, ylim=c(0,2), las=1, xlab="Year", ylab="SSB/SSB0", main="Sardine")
Sardine_Depl<-matrix(NA, nrow=Nsim,ncol=101)
Sardine_Depl[1,]<-Sardine_runs[[1]]$SSB/Sardine_runs[[1]]$SSB0
for(s in 2:Nsim){
  Sardine_Depl[s,]<-Sardine_runs[[s]]$SSB/Sardine_runs[[s]]$SSB0
  points(1:101,Sardine_runs[[s]]$SSB/Sardine_runs[[s]]$SSB0)
}

#Ok looking at some CIs of the intervals
library(coda)
par(mfrow=c(1,3))
plot(1:101,HPDinterval(as.mcmc(Cod_Depl), prob=0.95)[,1], type="l", lty=2, ylim=c(0,1.6), las=1, xlab="Year", ylab="SSB/SSB0", main="Cod")
lines(1:101,apply(Cod_Depl,2,median),lty=1)
lines(1:101,HPDinterval(as.mcmc(Cod_Depl), prob=0.95)[,2],lty=2)
lines(1:101,HPDinterval(as.mcmc(Cod_Depl), prob=0.75)[,1],lty=3)
lines(1:101,HPDinterval(as.mcmc(Cod_Depl), prob=0.75)[,2],lty=3)

plot(1:101,HPDinterval(as.mcmc(Flatfish_Depl), prob=0.95)[,1], type="l", lty=2, ylim=c(0,1.6), las=1, xlab="Year", ylab="SSB/SSB0", main="Flatfish")
lines(1:101,apply(Flatfish_Depl,2,median),lty=1)
lines(1:101,HPDinterval(as.mcmc(Flatfish_Depl), prob=0.95)[,2],lty=2)
lines(1:101,HPDinterval(as.mcmc(Flatfish_Depl), prob=0.75)[,1],lty=3)
lines(1:101,HPDinterval(as.mcmc(Flatfish_Depl), prob=0.75)[,2],lty=3)

plot(1:101,HPDinterval(as.mcmc(Sardine_Depl), prob=0.95)[,1], type="l", lty=2, ylim=c(0,1.6), las=1, xlab="Year", ylab="SSB/SSB0", main="Sardine")
lines(1:101,apply(Sardine_Depl,2,median),lty=1)
lines(1:101,HPDinterval(as.mcmc(Sardine_Depl), prob=0.95)[,2],lty=2)
lines(1:101,HPDinterval(as.mcmc(Sardine_Depl), prob=0.75)[,1],lty=3)
lines(1:101,HPDinterval(as.mcmc(Sardine_Depl), prob=0.75)[,2],lty=3)

#############################
#Getting Data from OMs
#############################
N_sim<-100
Cod_wdat<-Flatfish_wdat<-Sardine_wdat<-list()
N_comp<-1000
sd_catch<-0.05
sd_index<-0.5
fyear_dat<-26
lyear_dat<-100
prop_ckmr<-1
fyear_ckmr<-76
lyear_ckmr<-100
progress_bar<-TRUE
for (s in 1:N_sim){
 Cod_wdat[[s]]     <-Get_Data(OM=Cod_runs[[s]],     dat_seed=s,fyear_dat=fyear_dat,lyear_dat=lyear_dat,sd_catch=sd_catch,N_Comp=N_comp,q_index=0.0001,sd_index=sd_index,prop_ckmr=prop_ckmr,fyear_ckmr=fyear_ckmr,lyear_ckmr=lyear_ckmr)
 Flatfish_wdat[[s]]<-Get_Data(OM=Flatfish_runs[[s]],dat_seed=s,fyear_dat=fyear_dat,lyear_dat=lyear_dat,sd_catch=sd_catch,N_Comp=N_comp,q_index=0.0001,sd_index=sd_index,prop_ckmr=prop_ckmr,fyear_ckmr=fyear_ckmr,lyear_ckmr=lyear_ckmr)
 Sardine_wdat[[s]] <-Get_Data(OM=Sardine_runs[[s]], dat_seed=s,fyear_dat=fyear_dat,lyear_dat=lyear_dat,sd_catch=sd_catch,N_Comp=N_comp,q_index=0.0001,sd_index=sd_index,prop_ckmr=prop_ckmr,fyear_ckmr=fyear_ckmr,lyear_ckmr=lyear_ckmr)
  if(progress_bar==TRUE){
   plot(rep(1,length(1:s)), pch=16)
  }
}

#save(Cod_wdat, file=paste0(wd,"/Cod_wdat_N100_Ind50_ckmr25_1.RData"))
#save(Flatfish_wdat, file=paste0(wd,"/Flatfish_wdat_N100_Ind50_ckmr25_1.RData"))
#save(Sardine_wdat, file=paste0(wd,"/Sardine_wdat_N100_Ind50_ckmr25_1.RData"))

#############################################################
#TMB SCAAs fit to Fishery data without CKMR (Base models)
#############################################################

load(paste0(wd,"/Cod_wdat_N1000_Ind50.RData"))
load(paste0(wd,"/Flatfish_wdat_N1000_Ind50.RData"))
load(paste0(wd,"/Sardine_wdat_N1000_Ind50.RData"))

Cod_OM<-Cod_wdat
Flatfish_OM<-Flatfish_wdat
Sardine_OM<-Sardine_wdat
  
#TMB Section
library(TMB)

setwd(wd)
#Compile and load model 
compile("SCAA_Fisch_wAge0.cpp")

#Doing N Simulations
N_sim<-1:100
jfactor<-5
res_list<-list()
for (Q in 1:3){  #Running through the life history types
res_list[[Q]]<-list()
for (s in N_sim){
  
 if(Q==1){
  OM<-Cod_OM[[s]]
 } else if (Q==2){
   OM<-Flatfish_OM[[s]]
 }else if (Q==3){
   OM<-Sardine_OM[[s]]
 }
  
  dat<-list(fyear=OM$OM$fyear, lyear=75, fage=OM$OM$fage, lage=OM$OM$lage, 
            years=OM$OM$fyear:75, ages=OM$OM$fage:OM$OM$lage,
            obs_harv=OM$Obs_Catch,
            obs_index=OM$Obs_Index,
            obs_fishery_comp=OM$Obs_Catch_Comp/rowSums(OM$Obs_Catch_Comp),
            SS_fishery=rowSums(OM$Obs_Catch_Comp),
            Mat=OM$OM$Mat,
            Laa=OM$OM$Laa,
            Waa=OM$OM$Waa)
  
  #Parameters
  set.seed(s)
  par <- list(log_M=log(runif(1,min=OM$OM$Mref-OM$OM$Mref*0.2,max=OM$OM$Mref+OM$OM$Mref*0.2)),
              log_q=log(runif(1,min=OM$q_index-OM$q_index*0.2,max=OM$q_index+OM$q_index*0.2)),
              log_recruit_devs_init=rep(0,dat$lage),
              log_recruit_devs=rep(0,dat$lyear),
              steepness=OM$OM$h,
              log_R0=log(runif(1,min=OM$OM$R0-OM$OM$R0*0.2,max=OM$OM$R0+OM$OM$R0*0.2)),
              log_sigma_rec=log(OM$OM$sd_rec),
              log_sd_catch=log(OM$sd_catch),
              log_sd_index=log(OM$sd_index),
              Sel_logis_k=log(runif(1,min=OM$OM$Sel_slope-OM$OM$Sel_slope*0.2,max=OM$OM$Sel_slope+OM$OM$Sel_slope*0.2)),
              Sel_logis_midpt=log(runif(1,min=OM$OM$Sel_50-OM$OM$Sel_50*0.2,max=OM$OM$Sel_50+OM$OM$Sel_50*0.2)),
              log_fint=log(runif(length(OM$OM$F_int[26:100]),min=OM$OM$F_int[26:100]-OM$OM$F_int[26:100]*0.2,max=OM$OM$F_int[26:100]+OM$OM$F_int[26:100]*0.2)))  
  
  ################
  #TMB stuff
  ################
  dyn.load(dynlib("SCAA_Fisch_wAge0"))
  
  parm_names<-names(MakeADFun(dat, par, DLL="SCAA_Fisch_wAge0")$par)
  
  fixed<-list(steepness=factor(NA),
              log_sd_catch=factor(NA),
              log_sd_index=factor(NA))
  
  lower_bounds<-c(-5,-20,rep(-10,dat$lage),rep(-10,dat$lyear), 0, 5, -5,-5,-5,-5,-5,rep(-10,dat$lyear))
  upper_bounds<-c( 2,  1,rep( 10,dat$lage),rep( 10,dat$lyear), 1, 25, 2, 2, 2, 5, 5,rep(  0,dat$lyear))
  
  reffects=c("log_recruit_devs","log_recruit_devs_init")
  l<-lower_bounds[-which(parm_names %in% c(names(fixed),reffects))]
  u<-upper_bounds[-which(parm_names %in% c(names(fixed),reffects))]
  
  SCAA <- MakeADFun(dat, par, DLL="SCAA_Fisch_wAge0", map=fixed, random=reffects)
  SCAA_fit <- TMBhelper::fit_tmb(obj=SCAA, startpar=SCAA$par, lower=l, upper=u, newtonsteps = 1,getsd=TRUE,bias.correct=TRUE,getHessian=TRUE)
  
  res_list[[Q]][[s]]<-SCAA_fit
 }
}

#saveRDS(res_list[[1]], file=paste0(wd,"/SCAAfit_Cod_N1000_Ind50.RData"))
#saveRDS(res_list[[2]], file=paste0(wd,"/SCAAfit_Flatfish_N1000_Ind50.RData"))
#saveRDS(res_list[[3]], file=paste0(wd,"/SCAAfit_Sardine_N1000_Ind50.RData"))

res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N1000_Ind25.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N1000_Ind25.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N1000_Ind25.RData"))

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
 for (i in 1:100){
  if(f==1){
   if(!is.null(res_list[[f]][[i]]$par)){
    re_SSB[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "spbiomass"),3]-Cod_OM[[i]]$OM$SSB[26:101])/Cod_OM[[i]]$OM$SSB[26:101]
    re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_OM[[i]]$OM$SSB[26:101]/Cod_OM[[i]]$OM$SSB0)/(Cod_OM[[i]]$OM$SSB[26:101]/Cod_OM[[i]]$OM$SSB0)
    re_R0[i,f]<-(exp(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "log_R0"),1])-Cod_OM[[i]]$OM$R0)/Cod_OM[[i]]$OM$R0
    re_M[i,f]<-(exp(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "log_M"),1])-Cod_OM[[i]]$OM$Mref)/Cod_OM[[i]]$OM$Mref
   }
  }else if (f==2){
   if(!is.null(res_list[[f]][[i]]$par)){
     re_SSB[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "spbiomass"),3]-Flatfish_OM[[i]]$OM$SSB[26:101])/Flatfish_OM[[i]]$OM$SSB[26:101]
     re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_OM[[i]]$OM$SSB[26:101]/Flatfish_OM[[i]]$OM$SSB0)/(Flatfish_OM[[i]]$OM$SSB[26:101]/Flatfish_OM[[i]]$OM$SSB0)
     re_R0[i,f]<-(exp(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "log_R0"),1])-Flatfish_OM[[i]]$OM$R0)/Flatfish_OM[[i]]$OM$R0
     re_M[i,f]<-(exp(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "log_M"),1])-Flatfish_OM[[i]]$OM$Mref)/Flatfish_OM[[i]]$OM$Mref
   }
  } else if (f==3){
   if(!is.null(res_list[[f]][[i]]$par)){
     re_SSB[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "spbiomass"),3]-Sardine_OM[[i]]$OM$SSB[26:101])/Sardine_OM[[i]]$OM$SSB[26:101]
     re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_OM[[i]]$OM$SSB[26:101]/Sardine_OM[[i]]$OM$SSB0)/(Sardine_OM[[i]]$OM$SSB[26:101]/Sardine_OM[[i]]$OM$SSB0)
     re_R0[i,f]<-(exp(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "log_R0"),1])-Sardine_OM[[i]]$OM$R0)/Sardine_OM[[i]]$OM$R0
     re_M[i,f]<-(exp(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "log_M"),1])-Sardine_OM[[i]]$OM$Mref)/Sardine_OM[[i]]$OM$Mref
   }
  }
 }
}

#SSB
par(mfcol=c(3,2))
boxplot(re_SSB1[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N100", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB1[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N100", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB1[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N100", ylab="RE - SSB")
abline(h=0)

boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N1000", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N1000", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N1000", ylab="RE - SSB")
abline(h=0)

#Depletion
par(mfcol=c(3,2))
boxplot(re_Dep1[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N100", ylab="RE - Depletion")
abline(h=0)
boxplot(re_Dep1[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N100", ylab="RE - Depletion")
abline(h=0)
boxplot(re_Dep1[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N100", ylab="RE - Depletion")
abline(h=0)

boxplot(re_Dep[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N1000", ylab="RE - Depletion")
abline(h=0)
boxplot(re_Dep[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N1000", ylab="RE - Depletion")
abline(h=0)
boxplot(re_Dep[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N1000", ylab="RE - Depletion")
abline(h=0)

#R0
par(mfcol=c(3,2))
boxplot(re_R01[,1], ylim=c(-0.25,0.25), las=1, main="Cod - N100", ylab="RE - R0")
abline(h=0)
boxplot(re_R01[,2], ylim=c(-0.25,0.25), las=1, main="Flatfish - N100", ylab="RE - R0")
abline(h=0)
boxplot(re_R01[,3], ylim=c(-0.25,0.25), las=1, main="Sardine - N100", ylab="RE - R0")
abline(h=0)

boxplot(re_R0[,1], ylim=c(-0.25,0.25), las=1, main="Cod - N1000", ylab="RE - R0")
abline(h=0)
boxplot(re_R0[,2], ylim=c(-0.25,0.25), las=1, main="Flatfish - N1000", ylab="RE - R0")
abline(h=0)
boxplot(re_R0[,3], ylim=c(-0.25,0.25), las=1, main="Sardine - N1000", ylab="RE - R0")
abline(h=0)

#M
par(mfcol=c(3,2))
boxplot(re_M1[,1], ylim=c(-0.1,0.1), las=1, main="Cod - N100", ylab="RE - M")
abline(h=0)
boxplot(re_M1[,2], ylim=c(-0.1,0.1), las=1, main="Flatfish - N100", ylab="RE - M")
abline(h=0)
boxplot(re_M1[,3], ylim=c(-0.1,0.1), las=1, main="Sardine - N100", ylab="RE - M")
abline(h=0)

boxplot(re_M[,1], ylim=c(-0.1,0.1), las=1, main="Cod - N1000", ylab="RE - M")
abline(h=0)
boxplot(re_M[,2], ylim=c(-0.1,0.1), las=1, main="Flatfish - N1000", ylab="RE - M")
abline(h=0)
boxplot(re_M[,3], ylim=c(-0.1,0.1), las=1, main="Sardine - N1000", ylab="RE - M")
abline(h=0)


######################################
#TMB Model with both HSP and POP
######################################
load(paste0(wd,"/Cod_wdat_N100_Ind25_ckmr25_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N100_Ind25_ckmr25_1.RData"))
load(paste0(wd,"/Sardine_wdat_N100_Ind25_ckmr25_1.RData"))

Cod_OM<-Cod_wdat
Flatfish_OM<-Flatfish_wdat
Sardine_OM<-Sardine_wdat

#TMB Section
library(TMB)

setwd(wd)
#Compile and load model 
compile("CKMR_HSP_and_POP_Fisch_wAge0.cpp")

N_sim<-1:1
jfactor<-5
res_list<-list()
for (Q in 1:3){  #Running through the life history types
  res_list[[Q]]<-list()
  for (s in N_sim){
    
    if(Q==1){
      OM<-Cod_OM[[s]]
    } else if (Q==2){
      OM<-Flatfish_OM[[s]]
    }else if (Q==3){
      OM<-Sardine_OM[[s]]
    }

dat<-list(fyear=OM$OM$fyear, lyear=75, fage=OM$OM$fage, lage=OM$OM$lage, 
          years=OM$OM$fyear:75, ages=OM$OM$fage:OM$OM$lage,
          obs_harv=OM$Obs_Catch,
          obs_index=OM$Obs_Index,
          obs_fishery_comp=OM$Obs_Catch_Comp/rowSums(OM$Obs_Catch_Comp),
          SS_fishery=rowSums(OM$Obs_Catch_Comp),
          Mat=OM$OM$Mat,
          Laa=OM$OM$Laa,
          Waa=OM$OM$Waa,
          #CKMR HSP
          born_year_old_hsp=OM$born_year_old_hsp-(OM$fyear_dat-1),
          age_diff_hsp=OM$age_diff_hsp,
          n_ckmr_hsp=OM$n_ckmr_hsp,
          k_ckmr_hsp=OM$k_ckmr_hsp,
          #CKMR POP
          born_year_young_pop=OM$born_year_young_pop-(OM$fyear_dat-1), 
          age_diff_pop=OM$age_diff_pop,
          n_ckmr_pop=OM$n_ckmr_pop,
          k_ckmr_pop=OM$k_ckmr_pop)

#Parameters
set.seed(s)
par <- list(log_M=log(runif(1,min=OM$OM$Mref-OM$OM$Mref*0.2,max=OM$OM$Mref+OM$OM$Mref*0.2)),
            log_q=log(runif(1,min=OM$q_index-OM$q_index*0.2,max=OM$q_index+OM$q_index*0.2)),
            log_recruit_devs_init=rep(0,dat$lage),
            log_recruit_devs=rep(0,dat$lyear),
            steepness=OM$OM$h,
            log_R0=log(runif(1,min=OM$OM$R0-OM$OM$R0*0.2,max=OM$OM$R0+OM$OM$R0*0.2)),
            log_sigma_rec=log(OM$OM$sd_rec),
            log_sd_catch=log(OM$sd_catch),
            log_sd_index=log(OM$sd_index),
            Sel_logis_k=log(runif(1,min=OM$OM$Sel_slope-OM$OM$Sel_slope*0.2,max=OM$OM$Sel_slope+OM$OM$Sel_slope*0.2)),
            Sel_logis_midpt=log(runif(1,min=OM$OM$Sel_50-OM$OM$Sel_50*0.2,max=OM$OM$Sel_50+OM$OM$Sel_50*0.2)),
            log_fint=log(runif(length(OM$OM$F_int[26:100]),min=OM$OM$F_int[26:100]-OM$OM$F_int[26:100]*0.2,max=OM$OM$F_int[26:100]+OM$OM$F_int[26:100]*0.2)))  

dyn.load(dynlib("CKMR_HSP_and_POP_Fisch_wAge0"))

parm_names<-names(MakeADFun(dat, par, DLL="CKMR_HSP_and_POP_Fisch_wAge0")$par)

fixed<-list(steepness=factor(NA),
            log_sd_catch=factor(NA),
            log_sd_index=factor(NA))

lower_bounds<-c(-5,-20,rep(-10,dat$lage),rep(-10,dat$lyear), 0, 5, -5,-5,-5,-5,-5,rep(-10,dat$lyear))
upper_bounds<-c( 2,  1,rep( 10,dat$lage),rep( 10,dat$lyear), 1, 25, 2, 2, 2, 5, 5,rep(  0,dat$lyear))

reffects=c("log_recruit_devs","log_recruit_devs_init")
l<-lower_bounds[-which(parm_names %in% c(names(fixed),reffects))]
u<-upper_bounds[-which(parm_names %in% c(names(fixed),reffects))]

SCAA <- MakeADFun(dat, par, DLL="CKMR_HSP_and_POP_Fisch_wAge0", map=fixed, random=reffects)
SCAA_fit <- TMBhelper::fit_tmb(obj=SCAA, startpar=SCAA$par, lower=l, upper=u, newtonsteps=1, getsd=TRUE,bias.correct=TRUE,getHessian=TRUE)

   res_list[[Q]][[s]]<-SCAA_fit
  }
}


plot(1:101,Cod_OM[[1]]$OM$SSB,pch=16)
points(26:101,summary(res_list[[1]][[1]]$SD)[which(rownames(summary(res_list[[1]][[1]]$SD)) %in% "spbiomass"),3], col=2,pch=16)

plot(1:101,Flatfish_OM[[1]]$OM$SSB,pch=16)
points(26:101,summary(res_list[[2]][[1]]$SD)[which(rownames(summary(res_list[[2]][[1]]$SD)) %in% "spbiomass"),3], col=2,pch=16)

plot(1:101,Sardine_OM[[1]]$OM$SSB,pch=16)
points(26:101,summary(res_list[[3]][[1]]$SD)[which(rownames(summary(res_list[[3]][[1]]$SD)) %in% "spbiomass"),3], col=2,pch=16)

