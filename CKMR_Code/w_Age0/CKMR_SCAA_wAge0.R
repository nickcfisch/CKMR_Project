
##########################################
#Nicks CKMR Integration into Assessment
##########################################

#I made up all the following quantities
fage<-0
lage<-15

fyear<-1
lyear<-50

#Fishing intensity
k_int<-0.15
mid_int<-20
F_int<-0.4/(1+exp(-k_int*((fyear:lyear)-mid_int)))
#plot(F_int,ylim=c(0,0.5), las=1)

#Fishery Selectivity 
k<-2
mid<-4
Sel<-1/(1+exp(-k*((fage:lage)-mid)))
Sel<-Sel/max(Sel)
#plot(Sel, las=1,type="b")

#Length and Weight, with Weight as a stand in for fecundity
Linf<-500
BK<-0.25
tnot<--0.5
Laa<-Linf*(1-exp(-BK*((fage:lage)-tnot)))
#plot(Laa, las=1, type="b")

Mref<-0.4
Maa<-Mref*(Laa/Linf)^-1

Waa<-0.001*Laa^2.9 / 1000
#plot(Waa, las=1, type="b")

#Maturity
Mat<-c(0,0,0,0.5,1,1,1,1,1,1,1,1,1,1,1,1)

#Unfished Calcs
R0<-1e6
h<-0.59

lxo<-c(1,cumprod(exp(-Maa[1:lage])))   #survivorship
lxo[lage+1]<-lxo[lage+1]/(1-exp(-Maa[lage+1]))   #plus group survivorship
N0aa<-R0*lxo
SSB0<-sum(N0aa*Mat*Waa)  #Unfished SSB calc

#Population Simulation
Faa<-matrix(NA, nrow=lyear, ncol=lage+1)
Naa<-matrix(NA, nrow=lyear+1, ncol=lage+1)
Naa[1,]<-N0aa
SSB<-sum(Naa[1,]*Mat*Waa)

for(i in fyear:lyear){
  Faa[i,]<-F_int[i]*Sel
  for(j in 1:lage){
   Naa[i+1,j+1]<-Naa[i,j]*exp(-(Maa[j]+Faa[i,j]))
  }
  Naa[i+1,lage+1]<-Naa[i+1,lage+1]+Naa[i,lage+1]*exp(-(Maa[lage+1]+Faa[i,lage+1])) #plus group
  
 SSB[i+1] <- sum(Naa[i+1,]*Mat*Waa, na.rm=TRUE)
 Naa[i+1,1] <- (4*h*R0*SSB[i+1])/(SSB0*(1-h)+SSB[i+1]*(5*h-1))
}

#Getting Data
N_comp<-100
q<-exp(-15)
Dat_harv<-Dat_index<-NA
Dat_comp<-Caa<-matrix(NA, nrow=nrow(Faa), ncol=ncol(Faa))
for (i in 1:nrow(Faa)){
  Caa[i,]<-Faa[i,]/(Maa+Faa[i,])*Naa[i,]*(1-exp(-(Maa+Faa[i,])))
  Dat_harv[i]<-rnorm(n=1, mean=sum(Caa[i,]*Waa), sd=0.05*sum(Caa[i,]*Waa))
  Dat_comp[i,]<-rmultinom(n=1, size=N_comp, prob=Caa[i,])
  #Pretend the index is at the start of the year (i.e. no Nbar)
  Dat_index[i]<-rnorm(1, mean=q*sum(Naa[i,]*Waa*Sel), sd=0.25*q*sum(Naa[i,]*Waa*Sel))
} 

plot(rowSums(Naa), type="b", las=1, ylab="Abundance", xlab="Year", ylim=c(0,6e6))
plot(SSB, type="b", las=1, xlab="Year", ylab="SSB", ylim=c(0,1.5e12))
plot(rowSums(Caa), type="b", las=1, ylab="Abundance", xlab="Year", ylim=c(0,5e5))

###############
#TMB Model
###############
#TMB Section
library(TMB)

setwd("C:/Users/nfisch/Documents/CKMR Workshop/Nick_Example/w_Age0")
#Compile and load model 
compile("SimpleSCAA_Fisch_wAge0.cpp")

#Doing N Simulations
#N_sim<-1
#N_comp<-100
#Naa_sim<-matrix(NA,nrow=N_sim,ncol=51)
#jfactor<-10
#q<-exp(-15)
#for (s in 1:N_sim){
#  Dat_harv<-Dat_index<-NA
#  Dat_comp<-matrix(NA, nrow=nrow(Caa), ncol=ncol(Caa))
#  for (i in 1:nrow(Caa)){
#    Dat_harv[i]<-rnorm(n=1, mean=sum(Caa[i,]*Waa), sd=0.05*sum(Caa[i,]*Waa))
#    Dat_comp[i,]<-rmultinom(n=1, size=N_comp, prob=Caa[i,])
#    #Pretend the index is at the start of the year (i.e. no Nbar)
#    Dat_index[i]<-rnorm(1, mean=q*sum(Naa[i,]*Waa*Sel), sd=0.25*q*sum(Naa[i,]*Waa*Sel))
#  } 
  
dat<-list(fyear=fyear, lyear=lyear, fage=fage, lage=lage, years=fyear:lyear, ages=fage:lage,
          obs_harv=Dat_harv,
          obs_index=Dat_index,
          obs_fishery_comp=Dat_comp/rowSums(Dat_comp),
          SS_fishery=rowSums(Dat_comp),
          Mat=Mat,
          Wtage=Waa)

#Parameters
par <- list(log_M=jitter(log(0.4), factor=jfactor),
            log_q=jitter(-15, factor=jfactor),
            log_recruit_devs=rep(0,dat$lyear),
            steepness=0.59,
            log_R0=jitter(log(1e6), factor=jfactor),
            log_sigma_rec=log(0.3),
            log_cv_fishery=log(0.05),
            log_cv_index=log(0.25),
            Sel_logis_k=jitter(2, factor=jfactor),
            Sel_logis_midpt=jitter(4, factor=jfactor),
            log_fint=jitter(rep(log(0.2),dat$lyear), factor=jfactor))  

################
#TMB stuff
################
dyn.load(dynlib("SimpleSCAA_Fisch_wAge0"))

parm_names<-names(MakeADFun(dat, par, DLL="SimpleSCAA_Fisch_wAge0")$par)

fixed<-list(steepness=factor(NA),
            log_sigma_rec=factor(NA),
            log_recruit_devs=rep(factor(NA),dat$lyear),
            log_cv_fishery=factor(NA),
            log_cv_index=factor(NA))

lower_bounds<-c(-5,-20,rep(-10,dat$lyear), 0, 5, -5,-5,-5,-2,  0,rep(-20,dat$lyear))
upper_bounds<-c( 2,  1,rep( 10,dat$lyear), 1, 25, 2, 2, 2, 5, 20,rep(  0,dat$lyear))

reffects=c("log_recruit_devs")
l<-lower_bounds[-which(parm_names %in% c(names(fixed),reffects))]
u<-upper_bounds[-which(parm_names %in% c(names(fixed),reffects))]

SCAA <- MakeADFun(dat, par, DLL="SimpleSCAA_Fisch_wAge0", map=fixed, random=reffects)
#SCAA_fit <- TMBhelper::fit_tmb(obj=SCAA, startpar=SCAA$par, lower=l, upper=u, newtonsteps=1, getsd=TRUE,bias.correct=TRUE,getHessian=TRUE)
SCAA_fit <- TMBhelper::fit_tmb(obj=SCAA, startpar=SCAA$par, lower=l, upper=u, newtonsteps=1, quiet=TRUE)

#Naa_sim[s,]<-rowSums(SCAA$report()$N)
#}

library(vioplot)
vioplot(Naa_sim, ylim=c(3e6,6e6), xlab="Year", ylab="Abundance", las=1)
lines(1:51, rowSums(Naa), col=1, lwd=2)
points(1:51,apply(Naa_sim,2,mean),col=2, pch=16)

##############################################
#Simulating HSPs from the population model 
##############################################
library(microbenchmark)
library(TMB)
library(tmbstan)
library(purrr)

#Simple, inefficient version here, does not have corrections for potential unfished, those are below. This version does help to understand what is going on
set.seed(2)
#Simulating the data
 npy <- 25                        #number of samples each year (num per year)   
# ^ IF THE SAMPLES GET ABOVE 20ISH/YEAR, COMPUTATION TAKES TOO LONG AND NEED TO SWITCH TO BINOMIAL
 Slo <- 20                         #year to start sampling
 Shi <- 50                         #final year in which to sample
 ages <- fage:lage                 #a vector of the ages at which individuals are sampled

  # sample npy individuals each year from Slo to Shi, and assign an age to each. The samples are taken from the Catch at age
 #THESE SHOULD PROBABLY NOT BE SAMPLED WITH REPLACEMENT AND BE SAMPLED DIRECTLY FROM THE ACTUAL AGE COMP DATA
  age_samples<-matrix(NA, nrow=length(Slo:Shi),ncol=npy)
  for(i in 1:length(Slo:Shi)){
   age_samples[i,] <- sample(ages, size = npy, replace = TRUE, prob = Caa[(Slo:Shi)[i],])
  }  
  
  samples <- data.frame(samp_year = rep(Slo:Shi, each=npy), age = c(t(age_samples)))
  samples <- cbind.data.frame(samples, born_year = samples$samp_year - samples$age)    #From the age and sampling year, calculate the year it was born in.
#  samples <- cbind.data.frame(samples, Tot_reprod = SSB[samples$born_year])        #Old way of doing total reproductive output, without unfished correction
  #The total reproductive output at the time it was born
  Tot_reprod <- rep(NA, length(samples$born_year))
  Tot_reprod[which(samples$born_year>0)] <- SSB[samples$born_year[which(samples$born_year>0)]]
  Tot_reprod[which(samples$born_year<1)] <- SSB0
  samples <- cbind.data.frame(samples, Tot_reprod = Tot_reprod)                         #The total reproductive output at the time it was born
  
  # now we form all the possible pairs of those samples
  n <- nrow(samples)
  s1 <- samples[rep(1:n, each = n),]
  s2 <- samples[rep(1:n, times = n),]
  names(s2) <- paste0(names(s2), ".old")
  
  #We keep only the pairs that were born in different years
  pairs <- cbind.data.frame(s1, s2)
  pairs <- pairs[c(pairs$born_year.old < pairs$born_year),]   #We enforce an ordering such that the first-born is the "old" one that was born in born_year.old (i.e. c1) and the younger one was born in born_year (i.e. c2)
  pairs <- cbind.data.frame(pairs, age_diff = pairs$born_year-pairs$born_year.old, HSP_prob = rep(NA, dim(pairs)[1])) 
  
  #Filling in the HSP probability
  #Need to integrate over all parents alive
  #Assuming 50/50 sex ratio
  
  ###################################################################################
  #Survival prob for each age given the age diff of the sample and the year sampled
  ###################################################################################
  
  #Now for loop through the samples
  surv_prob<-matrix(NA, nrow=dim(pairs)[1], ncol=length(ages))
  HSP_calcs<-matrix(NA, nrow=dim(pairs)[1], ncol=length(ages))
  lxf<-list()
  for (i in 1:dim(pairs)[1]){
    
  #Probability you survived to the year of the second born
  lxf[[i]]<-matrix(NA,nrow=pairs$age_diff[i],ncol=length(ages)+pairs$age_diff[i]-1)
  lxf[[i]][1,1:(lage+1)]<-exp(-(Maa+Faa[pairs$born_year.old[i],]))
  if(pairs$age_diff[i]>1){
   for (y in 1:(pairs$age_diff[i]-1)){        #Loop through the years the parent has to survive (1st year has 1 for survival)
    for (j in 1:((lage+1)+pairs$age_diff[i]-2)){   #Loop through mature ages in the year of the first born
     if(j<(lage+1)+1){
       lxf[[i]][y+1,j+1] <- lxf[[i]][y,j]*exp(-(Maa[j]+Faa[pairs$born_year.old[i]+y,j]))    #(y-1) is to account for the year in pop model
     } else if (j>(lage+1)){
       lxf[[i]][y+1,j+1] <- lxf[[i]][y,j]*exp(-(Maa[lage+1]+Faa[pairs$born_year.old[i]+y,lage+1]))    
     }
    }
   }
  }
  #Probability survived to the year of the second born (surviving the year of first born and all the way through the year before the second born)
  #From the age of the parent at the time of the first born
   surv_prob[i,]<-lxf[[i]][pairs$age_diff[i],pairs$age_diff[i]:((lage+1)+pairs$age_diff[i]-1)]
   
   #Ok so now it is the number (fecundity) that could have given birth to the first born / total reproductive output  * survival to second born * (fecundity of age at second born / total reproductive output at time of second born)
   for(j in 1:(lage+1)){
     if ((j+pairs$age_diff[i])<=(lage+1)){
       HSP_calcs[i,j] <-  ( (Naa[pairs$born_year.old[i],j]*Mat[j]*Waa[j]) / pairs$Tot_reprod.old[i] ) * surv_prob[i,j]  * (4 * Mat[j+pairs$age_diff[i]]*Waa[j+pairs$age_diff[i]] / pairs$Tot_reprod[i])  #4 is for MHSP + FHSP
     } else if (j+pairs$age_diff[i]>(lage+1)){
       HSP_calcs[i,j] <-  ( (Naa[pairs$born_year.old[i],j]*Mat[j]*Waa[j]) / pairs$Tot_reprod.old[i] ) * surv_prob[i,j]  * (4 * Mat[(lage+1)]*Waa[(lage+1)] / pairs$Tot_reprod[i])  #4 is for MHSP + FHSP
     }
   }
   
  }
  ######################################################################################
  
 #Then we sum over all the ages to get the HSP probability for that given data pair
  pairs$HSP_prob <- rowSums(HSP_calcs)

  # here we simulate whether each pair is an HSP or not by simulating
  # a Bernoulli random variable for each pair with success probability
  # of P(HSP | c1, c2).
  isHSP<-NA
  for (i in 1:dim(pairs)[1]){
    isHSP[i] = rbernoulli(1, p = pairs$HSP_prob[i])
  }
  pairs<-cbind.data.frame(pairs, isHSP)
  
  # As is often done in CKMR, we can summarize the kin pair data by counting up the number of kin pairs and non-kin pairs in each category
  # defined by different sets of covariates.  In this case different c1 and c2, though it is defined here in terms of c2 and the age difference.
  pair_counts <- aggregate(!pairs$isHSP, by=list(pairs$born_year, pairs$age_diff, pairs$HSP_prob), FUN=sum)
  pair_counts_hsp <- aggregate(pairs$isHSP, by=list(pairs$born_year, pairs$age_diff, pairs$HSP_prob), FUN=sum)
  
  pair_counts<-cbind.data.frame(pair_counts, pair_counts_hsp$x) #Adding a column of the number of pairs 
  colnames(pair_counts)<-c("born_year","age_diff","HSP_prob","n_UP","n_HSP")
  pair_counts<-pair_counts[order(pair_counts$born_year,pair_counts$age_diff),] #ordering the counts by year born and then the age difference
  
  sim_vals <- list(samples = samples, pairs = pairs, pair_counts = pair_counts, pair_data = pair_counts[,-3]) #Without HSP_prob, because the dataset we get won't know this
  
#####################################################################
 #Ok now what if you have way more samples, we use the binomial now 
  #This version also has corrections for unfished
#####################################################################
  library(microbenchmark)
  library(TMB)
  library(tmbstan)
  library(purrr)
  
  #Simulating the data
  set.seed(2)
  npy <- 25                       #number of samples each year (num per year)   
  Slo <- 20                        #year to start sampling
  Shi <- 50                        #final year in which to sample
  ages <- fage:lage                #a vector of the ages at which individuals are sampled
  
  # sample npy individuals each year from Slo to Shi, and assign an age to each. The samples are taken from the Catch at age
  age_samples<-matrix(NA, nrow=length(Slo:Shi),ncol=npy)
  for(i in 1:length(Slo:Shi)){
   age_samples[i,] <- sample(ages, size = npy, replace = TRUE, prob = Caa[(Slo:Shi)[i],])
  }  
  
  samples <- data.frame(samp_year = rep(Slo:Shi, each=npy), age = c(t(age_samples)))
  samples <- cbind.data.frame(samples, born_year = samples$samp_year - samples$age)    #From the age and sampling year, calculate the year it was born in.
  #The total reproductive output at the time it was born
  Tot_reprod <- rep(NA, length(samples$born_year))
  Tot_reprod[which(samples$born_year>0)] <- SSB[samples$born_year[which(samples$born_year>0)]]
  Tot_reprod[which(samples$born_year<1)] <- SSB0
  samples <- cbind.data.frame(samples, Tot_reprod = Tot_reprod)                         #The total reproductive output at the time it was born
  
  #now we form all the possible pairs of those samples
  #New way to do it that is more efficient
  pairs<-do.call(cbind.data.frame,Map(expand.grid,samples,samples))
  colnames(pairs)<-c("samp_year.old","samp_year","age.old","age","born_year.old","born_year","Tot_reprod.old","Tot_reprod") #naming the columns 
  pairs <- pairs[c(pairs$born_year.old < pairs$born_year),]   
  pairs <- pairs[,c("samp_year","age","born_year","Tot_reprod","samp_year.old","age.old","born_year.old","Tot_reprod.old")] #just reordering the columns
  pairs <- cbind.data.frame(pairs, age_diff = pairs$born_year-pairs$born_year.old) 
  
#Rewrote using binomial, because you can't have too many samples it gets too complex. 
 collapsed_pairs<-aggregate(rep(1,nrow(pairs)),by=list(pairs$born_year,pairs$age_diff), FUN=sum)
 colnames(collapsed_pairs)<-c("born_year", "age_diff","times")

 #Now for loop through the samples
 surv_prob<-matrix(NA, nrow=nrow(collapsed_pairs), ncol=(lage+1))
 HSP_calcs<-matrix(NA, nrow=nrow(collapsed_pairs), ncol=(lage+1))
 lxf<-list()
 for (i in 1:nrow(collapsed_pairs)){
  #Probability you were alive in the year of the first born and survived to the year of the second born
  lxf[[i]]<-matrix(NA,nrow=collapsed_pairs$age_diff[i],ncol=(lage+1)+collapsed_pairs$age_diff[i]-1)
  if(collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i]>0){
   lxf[[i]][1,1:(lage+1)]<-exp(-(Maa+Faa[collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i],]))
  } else if (collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i]<1){ #to account for unfished years
   lxf[[i]][1,1:(lage+1)]<-exp(-Maa)
  }
  
  if(collapsed_pairs$age_diff[i]>1){
   for (y in 1:(collapsed_pairs$age_diff[i]-1)){        #Loop through the years the parent has to survive (1st year has 1 for survival)
    for (j in 1:((lage+1)+collapsed_pairs$age_diff[i]-2)){   #Loop through mature ages in the year of the first born
     if(j<(lage+1)+1){ #if we are not in plus group
      if(collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i]>0){
        lxf[[i]][y+1,j+1] <- lxf[[i]][y,j]*exp(-(Maa[j]+Faa[collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i]+y,j]))  #(y-1) is to account for the year in pop model
      } else if (collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i]<1){ #to account for unfished years
        lxf[[i]][y+1,j+1] <- lxf[[i]][y,j]*exp(-Maa[j])    
      }} else if (j>(lage+1)){
      if(collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i]>0){
        lxf[[i]][y+1,j+1] <- lxf[[i]][y,j]*exp(-(Maa[lage+1]+Faa[collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i]+y,(lage+1)]))  #collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i] is to get the birth year of first born
      } else if (collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i]<1){ #to account for unfished years
        lxf[[i]][y+1,j+1] <- lxf[[i]][y,j]*exp(-Maa[lage+1])    
      }
     }
    } 
   }
  }
  #Probability you survived to the year of the second born (surviving the year of first born and all the way through the year before the second born)
  #From the age of the parent at the time of the first born
  surv_prob[i,]<-lxf[[i]][collapsed_pairs$age_diff[i],collapsed_pairs$age_diff[i]:((lage+1)+collapsed_pairs$age_diff[i]-1)]
  
  #Ok so now it is the number (fecundity) that could have given birth to the first born / total reproductive output  * survival to second born * (fecundity of age at second born / total reproductive output at time of second born)
  for(j in 1:(lage+1)){
   if ((j+collapsed_pairs$age_diff[i])<=(lage+1)){ #If we are not in the plus group
     
    if(collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i]>0){ # if we're not in unfished years
     HSP_calcs[i,j] <-  ( (Naa[collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i],j]*Mat[j]*Waa[j]) / SSB[collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i]] ) * surv_prob[i,j]  * (4 * Mat[j+collapsed_pairs$age_diff[i]]*Waa[j+collapsed_pairs$age_diff[i]] / SSB[collapsed_pairs$born_year[i]])  #4 is for MHSP + FHSP
    } else if (collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i]<1){ #if we are in unfished years
    if(collapsed_pairs$born_year[i]>0){ #if second born is not in unfished years
     HSP_calcs[i,j] <-  ( (N0aa[j]*Mat[j]*Waa[j]) / SSB0 ) * surv_prob[i,j]  * (4 * Mat[j+collapsed_pairs$age_diff[i]]*Waa[j+collapsed_pairs$age_diff[i]] / SSB[collapsed_pairs$born_year[i]])  #4 is for MHSP + FHSP
    } else if (collapsed_pairs$born_year[i]<1){ #if second born is in unfished years
     HSP_calcs[i,j] <-  ( (N0aa[j]*Mat[j]*Waa[j]) / SSB0 ) * surv_prob[i,j]  * (4 * Mat[j+collapsed_pairs$age_diff[i]]*Waa[j+collapsed_pairs$age_diff[i]] / SSB0)  #4 is for MHSP + FHSP
    }}
     
    } else if (j+collapsed_pairs$age_diff[i]>(lage+1)){ #Now if we are in plus group
    if(collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i]>0){ #if we're not in unfished years
     HSP_calcs[i,j] <-  ( (Naa[collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i],j]*Mat[j]*Waa[j]) / SSB[collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i]] ) * surv_prob[i,j]  * (4 * Mat[(lage+1)]*Waa[(lage+1)] / SSB[collapsed_pairs$born_year[i]])  #4 is for MHSP + FHSP
    } else if (collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i]<1){ #if we are in unfished years
      if(collapsed_pairs$born_year[i]>0){ #if second born is not in unfished years
     HSP_calcs[i,j] <-  ( (N0aa[j]*Mat[j]*Waa[j]) / SSB0 ) * surv_prob[i,j]  * (4 * Mat[(lage+1)]*Waa[(lage+1)] / SSB[collapsed_pairs$born_year[i]])  #4 is for MHSP + FHSP
    } else if (collapsed_pairs$born_year[i]<1){ #if second born is in unfished years
     HSP_calcs[i,j] <-  ( (N0aa[j]*Mat[j]*Waa[j]) / SSB0 ) * surv_prob[i,j]  * (4 * Mat[(lage+1)]*Waa[(lage+1)] / SSB0)  #4 is for MHSP + FHSP
    }}
  }
 }
}
#Then we sum over all the ages to get the HSP probability for that given data pair
 collapsed_pairs$HSP_prob <- rowSums(HSP_calcs)

# here we simulate whether each pair is an HSP or not by simulating
# a binomial with n as the number of reps of covariates
 collapsed_pairs$n_HSP <- rbinom(nrow(collapsed_pairs), size=collapsed_pairs$times, p = collapsed_pairs$HSP_prob)
 
 collapsed_pairs$n_UP<-collapsed_pairs$times-collapsed_pairs$n_HSP #Getting the number of non pairs
 collapsed_pairs<-collapsed_pairs[order(collapsed_pairs$born_year,collapsed_pairs$age_diff),] #ordering the counts by year born and then the age difference

 sim_vals <- list(samples = samples, pairs = pairs, pair_counts = collapsed_pairs, pair_data = collapsed_pairs[,c("born_year", "age_diff", "n_UP", "n_HSP","times")]) #pair_data is Without HSP_prob, because the dataset we get won't know this
  
sim_vals$samples
sim_vals$pairs
sim_vals$pair_counts
sim_vals$pair_data$n_HSP

#######################################
#Adding HSP CKMR data into assessment
#######################################
library(TMB)

setwd("C:/Users/nfisch/Documents/CKMR Workshop/Nick_Example/w_Age0")
#Compile and load model 
compile("CKMR_HSP_Fisch_wAge0.cpp")

dat<-list(fyear=fyear, lyear=lyear, fage=fage, lage=lage, years=fyear:lyear, ages=fage:lage,
          obs_harv=Dat_harv,
          obs_index=Dat_index,
          obs_fishery_comp=Dat_comp/rowSums(Dat_comp),
          SS_fishery=rowSums(Dat_comp),
          Mat=Mat,
          Wtage=Waa,
          #CKMR data
          born_year_old=sim_vals$pair_data$born_year-sim_vals$pair_data$age_diff, 
          age_diff=sim_vals$pair_data$age_diff,
          n_ckmr=sim_vals$pair_data$times,
          k_ckmr_hsp=sim_vals$pair_data$n_HSP)

#Parameters
par <- list(log_M=log(0.4),
            log_q=-15,
            log_recruit_devs=rep(0,dat$lyear),
            steepness=0.59,
            log_R0=log(1e6),
            log_sigma_rec=log(0.3),
            log_cv_fishery=log(0.05),
            log_cv_index=log(0.25),
            Sel_logis_k=2,
            Sel_logis_midpt=4,
            log_fint=log(F_int))  

dyn.load(dynlib("CKMR_HSP_Fisch_wAge0"))

parm_names<-names(MakeADFun(dat, par, DLL="CKMR_HSP_Fisch_wAge0")$par)

fixed<-list(steepness=factor(NA),
            log_sigma_rec=factor(NA),
            log_recruit_devs=rep(factor(NA),dat$lyear),
            log_cv_fishery=factor(NA),
            log_cv_index=factor(NA))

lower_bounds<-c(-5,-20,rep(-10,dat$lyear), 0, 5, -5,-5,-5,-2,  0,rep(-20,dat$lyear))
upper_bounds<-c( 2,  1,rep( 10,dat$lyear), 1, 25, 2, 2, 2, 5, 20,rep(  0,dat$lyear))

reffects=c("log_recruit_devs")
l<-lower_bounds[-which(parm_names %in% c(names(fixed),reffects))]
u<-upper_bounds[-which(parm_names %in% c(names(fixed),reffects))]

SCAA <- MakeADFun(dat, par, DLL="CKMR_HSP_Fisch_wAge0", map=fixed, random=reffects)
#SCAA_fit <- TMBhelper::fit_tmb(obj=SCAA, startpar=SCAA$par, lower=l, upper=u, newtonsteps=1, getsd=TRUE,bias.correct=TRUE,getHessian=TRUE)
SCAA_fit <- TMBhelper::fit_tmb(obj=SCAA, startpar=SCAA$par, lower=l, upper=u, newtonsteps=1, quiet=TRUE)

SCAA$report()$L1
SCAA$report()$L2
SCAA$report()$L3

SCAA$report()$L4

-1*sum(dbinom(x=sim_vals$pair_counts$n_HSP,size=sim_vals$pair_counts$times,prob=sim_vals$pair_counts$HSP_prob,log=TRUE))

#########################
#Now POP model
#########################

#Simulating the data
set.seed(2)
npy <- 25                        #number of samples each year (num per year)   
Slo <- 20                         #year to start sampling
Shi <- 50                         #final year in which to sample
ages <- fage:lage                 #a vector of the ages at which individuals are sampled

# sample npy individuals each year from Slo to Shi, and assign an age to each. The samples are taken from the Catch at age
age_samples<-matrix(NA, nrow=length(Slo:Shi),ncol=npy)
for(i in 1:(Shi-Slo+1)){
  age_samples[i,] <- sample(ages, size = npy, replace = TRUE, prob = Caa[i+Slo-1,])
}  

samples <- data.frame(samp_year = rep(Slo:Shi, each=npy), age = c(t(age_samples)))
samples <- cbind.data.frame(samples, born_year = samples$samp_year - samples$age)    #From the age and sampling year, calculate the year it was born in.
#The total reproductive output at the time it was born
Tot_reprod <- rep(NA, length(samples$born_year))
Tot_reprod[which(samples$born_year>0)] <- SSB[samples$born_year[which(samples$born_year>0)]]
Tot_reprod[which(samples$born_year<1)] <- SSB0
samples <- cbind.data.frame(samples, Tot_reprod = Tot_reprod)                         #The total reproductive output at the time it was born

#now we form all the possible pairs of those samples
pairs<-do.call(cbind.data.frame,Map(expand.grid,samples,samples))
colnames(pairs)<-c("samp_year.old","samp_year.young","age.old","age.young","born_year.old","born_year.young","Tot_reprod.old","Tot_reprod.young") #naming the columns 
#Ok so now in this case we want to remove all pairs where a potential adult is not two years older than the potential kin
pairs <- pairs[c(c(pairs$born_year.old < pairs$born_year.young)),]   # A potential parent has to have been born before a potential young
pairs <- pairs[c(pairs$samp_year.old >= pairs$born_year.young),]   # A potential parent has to have been sampled after or on the year of youngs birth, because sampling is lethal  
pairs <- pairs[,c("samp_year.young","age.young","born_year.young","Tot_reprod.young","samp_year.old","age.old","born_year.old","Tot_reprod.old")] #just reordering the columns
pairs <- cbind.data.frame(pairs, age_diff = pairs$born_year.young-pairs$born_year.old) 

#Rewrote using binomial, because you can't have too many samples it gets too complex. 
collapsed_pairs<-aggregate(rep(1,nrow(pairs)),by=list(pairs$born_year.young,pairs$age_diff), FUN=sum)
colnames(collapsed_pairs)<-c("born_year.young", "age_diff","times")

#Now for loop through the samples
collapsed_pairs$prob_POP<-NA
for (i in 1:nrow(collapsed_pairs)){
  #Ok so the fecudity based on the age of the potential parent / (0.5 * the total reproductive output of the population at the time of juves birth )
  #Then we multiply by two to account for POP by Dad or Mom
   if(collapsed_pairs$born_year.young[i]>0){  #if not in unfished territory
    collapsed_pairs$prob_POP[i]<- 4*(Mat[collapsed_pairs$age_diff[i]]*Waa[collapsed_pairs$age_diff[i]] / sum( Naa[collapsed_pairs$born_year.young[i],]*Mat*Waa ))
   } else if(collapsed_pairs$born_year.young[i]<1){
    collapsed_pairs$prob_POP[i]<- 4*(Mat[collapsed_pairs$age_diff[i]]*Waa[collapsed_pairs$age_diff[i]] / sum( N0aa*Mat*Waa ))
   }
  }#Don't need to consider plus group calcs bc max age diff will be 15

collapsed_pairs$n_POP <- rbinom(nrow(collapsed_pairs), size=collapsed_pairs$times, p = collapsed_pairs$prob_POP)

collapsed_pairs$n_nonPOP<-collapsed_pairs$times-collapsed_pairs$n_POP #Getting the number of non pairs
collapsed_pairs<-collapsed_pairs[order(collapsed_pairs$born_year.young,collapsed_pairs$age_diff),] #ordering the counts by year born and then the age difference

sim_vals <- list(samples = samples, pairs = pairs, pair_counts = collapsed_pairs, pair_data = collapsed_pairs[,c("born_year.young","age_diff","n_nonPOP","n_POP","times")]) 

sim_vals$samples
sim_vals$pairs
sim_vals$pair_counts
sim_vals$pair_data$n_POP

#######################################
#Adding POP CKMR data into assessment
#######################################
library(TMB)

setwd("C:/Users/nfisch/Documents/CKMR Workshop/Nick_Example/w_Age0")
#Compile and load model 
compile("CKMR_POP_Fisch_wAge0.cpp")

dat<-list(fyear=fyear, lyear=lyear, fage=fage, lage=lage, years=fyear:lyear, ages=fage:lage,
          obs_harv=Dat_harv,
          obs_index=Dat_index,
          obs_fishery_comp=Dat_comp/rowSums(Dat_comp),
          SS_fishery=rowSums(Dat_comp),
          Mat=Mat,
          Wtage=Waa,
          #CKMR data
          born_year_young=sim_vals$pair_data$born_year.young, 
          age_diff=sim_vals$pair_data$age_diff,
          n_ckmr=sim_vals$pair_data$times,
          k_ckmr_pop=sim_vals$pair_data$n_POP)

#Parameters
par <- list(log_M=log(0.4),
            log_q=-15,
            log_recruit_devs=rep(0,dat$lyear),
            steepness=0.59,
            log_R0=log(1e6),
            log_sigma_rec=log(0.3),
            log_cv_fishery=log(0.05),
            log_cv_index=log(0.25),
            Sel_logis_k=2,
            Sel_logis_midpt=4,
            log_fint=log(F_int))  

dyn.load(dynlib("CKMR_POP_Fisch_wAge0"))

parm_names<-names(MakeADFun(dat, par, DLL="CKMR_POP_Fisch_wAge0")$par)

fixed<-list(steepness=factor(NA),
            log_sigma_rec=factor(NA),
            log_recruit_devs=rep(factor(NA),dat$lyear),
            log_cv_fishery=factor(NA),
            log_cv_index=factor(NA))

lower_bounds<-c(-5,-20,rep(-10,dat$lyear), 0, 5, -5,-5,-5,-2,  0,rep(-20,dat$lyear))
upper_bounds<-c( 2,  1,rep( 10,dat$lyear), 1, 25, 2, 2, 2, 5, 20,rep(  0,dat$lyear))

reffects=c("log_recruit_devs")
l<-lower_bounds[-which(parm_names %in% c(names(fixed),reffects))]
u<-upper_bounds[-which(parm_names %in% c(names(fixed),reffects))]

SCAA <- MakeADFun(dat, par, DLL="CKMR_POP_Fisch_wAge0", map=fixed, random=reffects)
#SCAA_fit <- TMBhelper::fit_tmb(obj=SCAA, startpar=SCAA$par, lower=l, upper=u, newtonsteps=1, getsd=TRUE,bias.correct=TRUE,getHessian=TRUE)
SCAA_fit <- TMBhelper::fit_tmb(obj=SCAA, startpar=SCAA$par, lower=l, upper=u, newtonsteps=1, quiet=TRUE)

SCAA$report()$L1
SCAA$report()$L2
SCAA$report()$L3

SCAA$report()$L4
#TMB does equal the true probs
-1*sum(dbinom(sim_vals$pair_data$n_POP, sim_vals$pair_data$times, sim_vals$pair_counts$prob_POP, log=TRUE))

##################################
#Simulator for both HSP and POP
##################################
library(microbenchmark)
library(TMB)
library(tmbstan)
library(purrr)

#Simulating the data
set.seed(2)
npy <- 25                       #number of samples each year (num per year)   
Slo <- 20                        #year to start sampling
Shi <- 50                        #final year in which to sample
ages <- fage:lage                #a vector of the ages at which individuals are sampled

# sample npy individuals each year from Slo to Shi, and assign an age to each. The samples are taken from the Catch at age
age_samples<-matrix(NA, nrow=length(Slo:Shi),ncol=npy)
for(i in 1:length(Slo:Shi)){
  age_samples[i,] <- sample(ages, size = npy, replace = TRUE, prob = Caa[(Slo:Shi)[i],])
}  

samples <- data.frame(samp_year = rep(Slo:Shi, each=npy), age = c(t(age_samples)))
samples <- cbind.data.frame(samples, born_year = samples$samp_year - samples$age)    #From the age and sampling year, calculate the year it was born in.
#The total reproductive output at the time it was born
Tot_reprod <- rep(NA, length(samples$born_year))
Tot_reprod[which(samples$born_year>0)] <- SSB[samples$born_year[which(samples$born_year>0)]]
Tot_reprod[which(samples$born_year<1)] <- SSB0
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
surv_prob<-matrix(NA, nrow=nrow(collapsed_pairs_hsp), ncol=(lage+1))
HSP_calcs<-matrix(NA, nrow=nrow(collapsed_pairs_hsp), ncol=(lage+1))
lxf<-list()
for (i in 1:nrow(collapsed_pairs_hsp)){
  #Probability you were alive in the year of the first born and survived to the year of the second born
  lxf[[i]]<-matrix(NA,nrow=collapsed_pairs_hsp$age_diff[i],ncol=(lage+1)+collapsed_pairs_hsp$age_diff[i]-1)
  if(collapsed_pairs_hsp$born_year[i]-collapsed_pairs_hsp$age_diff[i]>0){
    lxf[[i]][1,1:(lage+1)]<-exp(-(Maa+Faa[collapsed_pairs_hsp$born_year[i]-collapsed_pairs_hsp$age_diff[i],]))
  } else if (collapsed_pairs_hsp$born_year[i]-collapsed_pairs_hsp$age_diff[i]<1){ #to account for unfished years
    lxf[[i]][1,1:(lage+1)]<-exp(-Maa)
  }
  
  if(collapsed_pairs_hsp$age_diff[i]>1){
    for (y in 1:(collapsed_pairs_hsp$age_diff[i]-1)){        #Loop through the years the parent has to survive (1st year has 1 for survival)
      for (j in 1:((lage+1)+collapsed_pairs_hsp$age_diff[i]-2)){   #Loop through mature ages in the year of the first born
        if(j<(lage+1)+1){ #if we are not in plus group
          if(collapsed_pairs_hsp$born_year[i]-collapsed_pairs_hsp$age_diff[i]>0){
            lxf[[i]][y+1,j+1] <- lxf[[i]][y,j]*exp(-(Maa[j]+Faa[collapsed_pairs_hsp$born_year[i]-collapsed_pairs_hsp$age_diff[i]+y,j]))  #(y-1) is to account for the year in pop model
          } else if (collapsed_pairs_hsp$born_year[i]-collapsed_pairs_hsp$age_diff[i]<1){ #to account for unfished years
            lxf[[i]][y+1,j+1] <- lxf[[i]][y,j]*exp(-Maa[j])    
          }} else if (j>(lage+1)){
            if(collapsed_pairs_hsp$born_year[i]-collapsed_pairs_hsp$age_diff[i]>0){
              lxf[[i]][y+1,j+1] <- lxf[[i]][y,j]*exp(-(Maa[lage+1]+Faa[collapsed_pairs_hsp$born_year[i]-collapsed_pairs_hsp$age_diff[i]+y,(lage+1)]))  #collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i] is to get the birth year of first born
            } else if (collapsed_pairs_hsp$born_year[i]-collapsed_pairs_hsp$age_diff[i]<1){ #to account for unfished years
              lxf[[i]][y+1,j+1] <- lxf[[i]][y,j]*exp(-Maa[lage+1])    
            }
          }
      } 
    }
  }
  #Probability you survived to the year of the second born (surviving the year of first born and all the way through the year before the second born)
  #From the age of the parent at the time of the first born
  surv_prob[i,]<-lxf[[i]][collapsed_pairs_hsp$age_diff[i],collapsed_pairs_hsp$age_diff[i]:((lage+1)+collapsed_pairs_hsp$age_diff[i]-1)]
  
  #Ok so now it is the number (fecundity) that could have given birth to the first born / total reproductive output  * survival to second born * (fecundity of age at second born / total reproductive output at time of second born)
  for(j in 1:(lage+1)){
    if ((j+collapsed_pairs_hsp$age_diff[i])<=(lage+1)){ #If we are not in the plus group
      
      if(collapsed_pairs_hsp$born_year[i]-collapsed_pairs_hsp$age_diff[i]>0){ # if we're not in unfished years
        HSP_calcs[i,j] <-  ( (Naa[collapsed_pairs_hsp$born_year[i]-collapsed_pairs_hsp$age_diff[i],j]*Mat[j]*Waa[j]) / SSB[collapsed_pairs_hsp$born_year[i]-collapsed_pairs_hsp$age_diff[i]] ) * surv_prob[i,j]  * (4 * Mat[j+collapsed_pairs_hsp$age_diff[i]]*Waa[j+collapsed_pairs_hsp$age_diff[i]] / SSB[collapsed_pairs_hsp$born_year[i]])  #4 is for MHSP + FHSP
      } else if (collapsed_pairs_hsp$born_year[i]-collapsed_pairs_hsp$age_diff[i]<1){ #if we are in unfished years
        if(collapsed_pairs_hsp$born_year[i]>0){ #if second born is not in unfished years
          HSP_calcs[i,j] <-  ( (N0aa[j]*Mat[j]*Waa[j]) / SSB0 ) * surv_prob[i,j]  * (4 * Mat[j+collapsed_pairs_hsp$age_diff[i]]*Waa[j+collapsed_pairs_hsp$age_diff[i]] / SSB[collapsed_pairs_hsp$born_year[i]])  #4 is for MHSP + FHSP
        } else if (collapsed_pairs_hsp$born_year[i]<1){ #if second born is in unfished years
          HSP_calcs[i,j] <-  ( (N0aa[j]*Mat[j]*Waa[j]) / SSB0 ) * surv_prob[i,j]  * (4 * Mat[j+collapsed_pairs_hsp$age_diff[i]]*Waa[j+collapsed_pairs_hsp$age_diff[i]] / SSB0)  #4 is for MHSP + FHSP
        }}
      
    } else if (j+collapsed_pairs_hsp$age_diff[i]>(lage+1)){ #Now if we are in plus group
      if(collapsed_pairs_hsp$born_year[i]-collapsed_pairs_hsp$age_diff[i]>0){ #if we're not in unfished years
        HSP_calcs[i,j] <-  ( (Naa[collapsed_pairs_hsp$born_year[i]-collapsed_pairs_hsp$age_diff[i],j]*Mat[j]*Waa[j]) / SSB[collapsed_pairs_hsp$born_year[i]-collapsed_pairs_hsp$age_diff[i]] ) * surv_prob[i,j]  * (4 * Mat[(lage+1)]*Waa[(lage+1)] / SSB[collapsed_pairs_hsp$born_year[i]])  #4 is for MHSP + FHSP
      } else if (collapsed_pairs_hsp$born_year[i]-collapsed_pairs_hsp$age_diff[i]<1){ #if we are in unfished years
        if(collapsed_pairs_hsp$born_year[i]>0){ #if second born is not in unfished years
          HSP_calcs[i,j] <-  ( (N0aa[j]*Mat[j]*Waa[j]) / SSB0 ) * surv_prob[i,j]  * (4 * Mat[(lage+1)]*Waa[(lage+1)] / SSB[collapsed_pairs_hsp$born_year[i]])  #4 is for MHSP + FHSP
        } else if (collapsed_pairs_hsp$born_year[i]<1){ #if second born is in unfished years
          HSP_calcs[i,j] <-  ( (N0aa[j]*Mat[j]*Waa[j]) / SSB0 ) * surv_prob[i,j]  * (4 * Mat[(lage+1)]*Waa[(lage+1)] / SSB0)  #4 is for MHSP + FHSP
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
  #Ok so the fecudity based on the age of the potential parent / (0.5 * the total reproductive output of the population at the time of juves birth )
  #Then we multiply by two to account for POP by Dad or Mom
  if(collapsed_pairs_pop$born_year.young[i]>0){  #if not in unfished territory
    collapsed_pairs_pop$prob_POP[i]<- 4*(Mat[collapsed_pairs_pop$age_diff[i]]*Waa[collapsed_pairs_pop$age_diff[i]] / sum( Naa[collapsed_pairs_pop$born_year.young[i],]*Mat*Waa ))
  } else if(collapsed_pairs_pop$born_year.young[i]<1){
    collapsed_pairs_pop$prob_POP[i]<- 4*(Mat[collapsed_pairs_pop$age_diff[i]]*Waa[collapsed_pairs_pop$age_diff[i]] / sum( N0aa*Mat*Waa ))
  }
}#Don't need to consider plus group calcs bc max age diff will be 15

collapsed_pairs_pop$n_POP <- rbinom(nrow(collapsed_pairs_pop), size=collapsed_pairs_pop$times, p = collapsed_pairs_pop$prob_POP)

collapsed_pairs_pop$n_nonPOP<-collapsed_pairs_pop$times-collapsed_pairs_pop$n_POP #Getting the number of non pairs
collapsed_pairs_pop<-collapsed_pairs_pop[order(collapsed_pairs_pop$born_year.young,collapsed_pairs_pop$age_diff),] #ordering the counts by year born and then the age difference

sim_vals_pop <- list(samples = samples, pairs = pairs_pop, pair_counts = collapsed_pairs_pop, pair_data = collapsed_pairs_pop[,c("born_year.young","age_diff","n_nonPOP","n_POP","times")]) 


######################################
#TMB Model with both HSP and POP
######################################
library(TMB)

setwd("C:/Users/nfisch/Documents/CKMR Workshop/Nick_Example/w_Age0")
#Compile and load model 
compile("CKMR_HSP_and_POP_Fisch_wAge0.cpp")

dat<-list(fyear=fyear, lyear=lyear, fage=fage, lage=lage, years=fyear:lyear, ages=fage:lage,
          obs_harv=Dat_harv,
          obs_index=Dat_index,
          obs_fishery_comp=Dat_comp/rowSums(Dat_comp),
          SS_fishery=rowSums(Dat_comp),
          Mat=Mat,
          Wtage=Waa,
          #CKMR HSP data
          born_year_old_hsp=sim_vals_hsp$pair_data$born_year-sim_vals_hsp$pair_data$age_diff, 
          age_diff_hsp=sim_vals_hsp$pair_data$age_diff,
          n_ckmr_hsp=sim_vals_hsp$pair_data$times,
          k_ckmr_hsp=sim_vals_hsp$pair_data$n_HSP,
          #CKMR POP
          born_year_young_pop=sim_vals_pop$pair_data$born_year.young, 
          age_diff_pop=sim_vals_pop$pair_data$age_diff,
          n_ckmr_pop=sim_vals_pop$pair_data$times,
          k_ckmr_pop=sim_vals_pop$pair_data$n_POP)

#Parameters
par <- list(log_M=log(0.4),
            log_q=-15,
            log_recruit_devs=rep(0,dat$lyear),
            steepness=0.59,
            log_R0=log(1e6),
            log_sigma_rec=log(0.3),
            log_cv_fishery=log(0.05),
            log_cv_index=log(0.25),
            Sel_logis_k=2,
            Sel_logis_midpt=4,
            log_fint=log(F_int))  

dyn.load(dynlib("CKMR_HSP_and_POP_Fisch_wAge0"))

parm_names<-names(MakeADFun(dat, par, DLL="CKMR_HSP_and_POP_Fisch_wAge0")$par)

fixed<-list(steepness=factor(NA),
            log_sigma_rec=factor(NA),
            log_recruit_devs=rep(factor(NA),dat$lyear),
            log_cv_fishery=factor(NA),
            log_cv_index=factor(NA))

lower_bounds<-c(-5,-20,rep(-10,dat$lyear), 0, 5, -5,-5,-5,-2,  0,rep(-20,dat$lyear))
upper_bounds<-c( 2,  1,rep( 10,dat$lyear), 1, 25, 2, 2, 2, 5, 20,rep(  0,dat$lyear))

reffects=c("log_recruit_devs")
l<-lower_bounds[-which(parm_names %in% c(names(fixed),reffects))]
u<-upper_bounds[-which(parm_names %in% c(names(fixed),reffects))]

SCAA <- MakeADFun(dat, par, DLL="CKMR_HSP_and_POP_Fisch_wAge0", map=fixed, random=reffects)
SCAA_fit <- TMBhelper::fit_tmb(obj=SCAA, startpar=SCAA$par, lower=l, upper=u, newtonsteps=1, getsd=TRUE,getHessian=TRUE)

SCAA$report()$L4
-1*sum(dbinom(x=sim_vals_hsp$pair_counts$n_HSP,size=sim_vals_hsp$pair_counts$times,prob=sim_vals_hsp$pair_counts$HSP_prob,log=TRUE))
SCAA$report()$L5
-1*sum(dbinom(sim_vals_pop$pair_data$n_POP, sim_vals_pop$pair_data$times, sim_vals_pop$pair_counts$prob_POP, log=TRUE))

###########
#Bayes
###########
#Did not convert this yet to Age 0

par <- list(log_M=jitter(log(0.4), factor=jfactor),
            log_q=jitter(-15, factor=jfactor),
            log_recruit_devs=rep(0,dat$lyear),
            steepness=0.59,
            log_R0=jitter(log(1e6), factor=jfactor),
            log_sigma_rec=log(0.3),
            log_cv_fishery=log(0.05),
            log_cv_index=log(0.25),
            Sel_logis_k=jitter(2, factor=jfactor),
            Sel_logis_midpt=jitter(4, factor=jfactor),
            log_fint=jitter(rep(log(0.2),dat$lyear), factor=jfactor)) 

dyn.load(dynlib("SimpleSCAA_Fisch_wAge0"))
parm_names<-names(MakeADFun(dat, par, DLL="SimpleSCAA_Fisch_wAge0")$par)

fixed<-list(steepness=factor(NA),
            log_cv_fishery=factor(NA),
            log_cv_index=factor(NA))

lower_bounds<-c(-5,-20,rep(-10,dat$lyear), 0, 5, -5,-5,-5,-2,  0,rep(-20,dat$lyear))
upper_bounds<-c( 2,  1,rep( 10,dat$lyear), 1, 25, 2, 2, 2, 5, 20,rep(  0,dat$lyear))

l<-lower_bounds[-which(parm_names %in% c(names(fixed)))]
u<-upper_bounds[-which(parm_names %in% c(names(fixed)))]

SCAA <- MakeADFun(dat, par, DLL="SimpleSCAA_Fisch_wAge0", map=fixed)

fit <- tmbstan(SCAA,chains=1, open_progress=FALSE, init=SCAA$par,lower = l, upper = u, iter = 10000, warmup = 1000)
mc_samples <- rstan::extract(fit)

str(mc_samples)
#Now HSP model
dat<-list(fyear=fyear, lyear=lyear, fage=fage, lage=lage, years=fyear:lyear, ages=fage:lage,
          obs_harv=Orig_dat_list_wrecdev[[1]]$Dat_harv,
          obs_index=Orig_dat_list_wrecdev[[1]]$Dat_index,
          obs_fishery_comp=Orig_dat_list_wrecdev[[1]]$Dat_comp/rowSums(Orig_dat_list_wrecdev[[1]]$Dat_comp),
          SS_fishery=rowSums(Orig_dat_list_wrecdev[[1]]$Dat_comp),
          Mat=Mat,
          Wtage=Waa,
          #CKMR data
          born_year_old=CKMR_dat_list_wrecdev[[1]]$born_year-CKMR_dat_list_wrecdev[[1]]$age_diff, 
          age_diff=CKMR_dat_list_wrecdev[[1]]$age_diff,
          n_ckmr=CKMR_dat_list_wrecdev[[1]]$times,
          k_ckmr_hsp=CKMR_dat_list_wrecdev[[1]]$n_HSP)

#Parameters
par <- list(log_M=log(0.2),
            log_q=-15,
            log_recruit_devs=rep(0,dat$lyear),
            steepness=0.8,
            log_R0=log(1e6),
            log_sigma_rec=log(0.3),
            log_cv_fishery=log(0.05),
            log_cv_index=log(0.25),
            Sel_logis_k=2,
            Sel_logis_midpt=4,
            log_fint=log(F_int))  

dyn.load(dynlib("CKMR_HSP_Fisch_wAge0"))

parm_names<-names(MakeADFun(dat, par, DLL="CKMR_HSP_Fisch_wAge0")$par)

fixed<-list(steepness=factor(NA),
            log_cv_fishery=factor(NA),
            log_cv_index=factor(NA))

lower_bounds<-c(-5,-20,rep(-10,dat$lyear), 0, 5, -5,-5,-5,-2,  0,rep(-20,dat$lyear))
upper_bounds<-c( 2,  1,rep( 10,dat$lyear), 1, 25, 2, 2, 2, 5, 20,rep(  0,dat$lyear))

l<-lower_bounds[-which(parm_names %in% c(names(fixed)))]
u<-upper_bounds[-which(parm_names %in% c(names(fixed)))]

SCAA <- MakeADFun(dat, par, DLL="CKMR_HSP_Fisch_wAge0", map=fixed)
fit_hsp <- tmbstan(SCAA,chains=1, open_progress=FALSE, init=SCAA$par,lower = l, upper = u, iter = 10000, warmup = 1000)
mc_samples_hsp <- rstan::extract(fit_hsp)

hist(mc_samples_hsp$log_M, breaks=seq(-1.75,-1.45,0.01))
hist(mc_samples$log_M, breaks=seq(-1.75,-1.45,0.01))










