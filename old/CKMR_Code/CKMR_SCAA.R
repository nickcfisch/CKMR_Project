
##########################################
#Nicks CKMR Exploration
##########################################

#Toy Bravington Example
nj<-4             #Number of sampled juveniles
na<-6             #Number of sampled adults

POP <- 3 #Number of parent-offsping pairs found

#Abundance is then 2 * sampled juves * sampled parents, all divided by the number of POPs found
Abun <- (2 * nj * na)/POP
#So the number of expected pairs is equal to (sampled juves * sampled adults) / (0.5 * Abun), because each indv has two parents and chances of finding a pair are 1/N

#Or When a sampled juvenile is compared genetically with a randomly sampled adult, the chance that the pair will turn out to be a POP—i.e, that the adult will have one of the two marks from the juvenile—is 2/Nadult.

#OK so the likelihood calculations are simply a binomial of all your crosses, with prob i is POP with j as the ERRO
#Numerical version of Simple example above using Neg log-likelihood!
N<-NLL<-NA
for (i in 2:25){
  N[i]<-i
  p<-1/(0.5*N[i])
  NLL[i] <- -1*dbinom(x=3, size=24, prob=p, log=TRUE)
}
#minimum
plot(NLL)
abline(v=which.min(NLL))
abline(h=min(NLL, na.rm=TRUE))
#So need to do a binomial calc for each covariate, each age and year of birth

#######################################################################################
#OK, lets implement some more realism and start with a classical age-structured model 
#######################################################################################
#I made up all the following quantities
fage<-1
lage<-15

fyear<-1
lyear<-50

#Fishing intensity
k_int<-0.15
mid_int<-20
F_int<-0.3/(1+exp(-k_int*((fyear:lyear)-mid_int)))
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

M<-0.2
#Maa<-M*(Laa/Linf)^-1

Waa<-0.001*Laa^2.9 / 1000
#plot(Waa, las=1, type="b")

#Maturity
Mat<-c(0,0,0.5,1,1,1,1,1,1,1,1,1,1,1,1)

#Unfished Calcs
R0<-1e6
h<-0.8

lxo<-c(1,cumprod(exp(-rep(M,lage-1))))   #survivorship
lxo[lage]<-lxo[lage]/(1-exp(-M))   #plus group survivorship
#lxo<-c(1,cumprod(exp(-Maa[1:(lage-1)])))   #survivorship
#lxo[lage]<-lxo[lage]/(1-exp(-Maa[lage]))   #plus group survivorship
N0aa<-R0*lxo
SSB0<-sum(N0aa*Mat*Waa)  #Unfished SSB calc

#Population Simulation
Faa<-matrix(NA, nrow=lyear, ncol=lage)
Naa<-matrix(NA, nrow=lyear+1, ncol=lage)
Naa[1,]<-N0aa
SSB<-sum(Naa[1,]*Mat*Waa)

for(i in fyear:lyear){
  Naa[i+1,1] <- (4*h*R0*SSB[i])/(SSB0*(1-h)+SSB[i]*(5*h-1))
  Faa[i,]<-F_int[i]*Sel
  for(j in fage:(lage-1)){
   Naa[i+1,j+1]<-Naa[i,j]*exp(-(M+Faa[i,j]))
#   Naa[i+1,j+1]<-Naa[i,j]*exp(-(Maa[j]+Faa[i,j]))
  }
  Naa[i+1,lage]<-Naa[i+1,lage]+Naa[i,lage]*exp(-(M+Faa[i,lage])) #plus group
#  Naa[i+1,lage]<-Naa[i+1,lage]+Naa[i,lage]*exp(-(Maa[lage]+Faa[i,lage])) #plus group
  
 SSB[i+1] <- sum(Naa[i+1,]*Mat*Waa)
}

Caa<-Faa/(M+Faa)*Naa[fyear:lyear,]*(1-exp(-(M+Faa)))
#Getting Data
N_comp<-100
q<-exp(-15)
Dat_harv<-Dat_index<-NA
Dat_comp<-matrix(NA, nrow=nrow(Caa), ncol=ncol(Caa))
for (i in 1:nrow(Caa)){
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

setwd("C:/Users/nfisch/Documents/CKMR Workshop/Nick_Example")
#Compile and load model 
compile("SimpleSCAA_Fisch.cpp")

#Doing N Simulations
N_sim<-100
N_comp<-100
Naa_sim<-matrix(NA,nrow=N_sim,ncol=51)
jfactor<-10
q<-exp(-15)
for (s in 1:N_sim){
  Dat_harv<-Dat_index<-NA
  Dat_comp<-matrix(NA, nrow=nrow(Caa), ncol=ncol(Caa))
  for (i in 1:nrow(Caa)){
    Dat_harv[i]<-rnorm(n=1, mean=sum(Caa[i,]*Waa), sd=0.05*sum(Caa[i,]*Waa))
    Dat_comp[i,]<-rmultinom(n=1, size=N_comp, prob=Caa[i,])
    #Pretend the index is at the start of the year (i.e. no Nbar)
    Dat_index[i]<-rnorm(1, mean=q*sum(Naa[i,]*Waa*Sel), sd=0.25*q*sum(Naa[i,]*Waa*Sel))
  } 
  
dat<-list(fyear=fyear, lyear=lyear, fage=fage, lage=lage, years=fyear:lyear, ages=fage:lage,
          obs_harv=Dat_harv,
          obs_index=Dat_index,
          obs_fishery_comp=Dat_comp/rowSums(Dat_comp),
          SS_fishery=rowSums(Dat_comp),
          Mat=Mat,
          Wtage=Waa)

#Parameters
par <- list(log_M=jitter(log(0.2), factor=jfactor),
            log_q=jitter(-15, factor=jfactor),
            log_recruit_devs=rep(0,dat$lyear),
            steepness=0.8,
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
dyn.load(dynlib("SimpleSCAA_Fisch"))

parm_names<-names(MakeADFun(dat, par, DLL="SimpleSCAA_Fisch")$par)

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

SCAA <- MakeADFun(dat, par, DLL="SimpleSCAA_Fisch", map=fixed, random=reffects)
#SCAA_fit <- TMBhelper::fit_tmb(obj=SCAA, startpar=SCAA$par, lower=l, upper=u, newtonsteps=1, getsd=TRUE,bias.correct=TRUE,getHessian=TRUE)
SCAA_fit <- TMBhelper::fit_tmb(obj=SCAA, startpar=SCAA$par, lower=l, upper=u, newtonsteps=1, quiet=TRUE)

Naa_sim[s,]<-rowSums(SCAA$report()$N)
}

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
  surv_prob<-matrix(NA, nrow=dim(pairs)[1], ncol=lage)
  HSP_calcs<-matrix(NA, nrow=dim(pairs)[1], ncol=lage)
  lxf<-list()
  for (i in 1:dim(pairs)[1]){
    
  #Probability you survived to the year of the second born
  lxf[[i]]<-matrix(NA,nrow=pairs$age_diff[i],ncol=lage+pairs$age_diff[i]-1)
  lxf[[i]][1,1:lage]<-exp(-(M+Faa[pairs$born_year.old[i],]))
  if(pairs$age_diff[i]>1){
   for (y in 1:(pairs$age_diff[i]-1)){        #Loop through the years the parent has to survive (1st year has 1 for survival)
    for (j in 1:(lage+pairs$age_diff[i]-2)){   #Loop through mature ages in the year of the first born
     if(j<(lage+1)){
       lxf[[i]][y+1,j+1] <- lxf[[i]][y,j]*exp(-(M+Faa[pairs$born_year.old[i]+y,j]))    #(y-1) is to account for the year in pop model
     } else if (j>lage){
       lxf[[i]][y+1,j+1] <- lxf[[i]][y,j]*exp(-(M+Faa[pairs$born_year.old[i]+y,lage]))    
     }
    }
   }
  }
  #Probability survived to the year of the second born (surviving the year of first born and all the way through the year before the second born)
  #From the age of the parent at the time of the first born
   surv_prob[i,]<-lxf[[i]][pairs$age_diff[i],pairs$age_diff[i]:(lage+pairs$age_diff[i]-1)]
   
   #Ok so now it is the number (fecundity) that could have given birth to the first born / total reproductive output  * survival to second born * (fecundity of age at second born / total reproductive output at time of second born)
   for(j in fage:lage){
     if ((j+pairs$age_diff[i])<=lage){
       HSP_calcs[i,j] <-  ( (Naa[pairs$born_year.old[i],j]*Mat[j]*Waa[j]) / pairs$Tot_reprod.old[i] ) * surv_prob[i,j]  * (4 * Mat[j+pairs$age_diff[i]]*Waa[j+pairs$age_diff[i]] / pairs$Tot_reprod[i])  #4 is for MHSP + FHSP
     } else if (j+pairs$age_diff[i]>lage){
       HSP_calcs[i,j] <-  ( (Naa[pairs$born_year.old[i],j]*Mat[j]*Waa[j]) / pairs$Tot_reprod.old[i] ) * surv_prob[i,j]  * (4 * Mat[lage]*Waa[lage] / pairs$Tot_reprod[i])  #4 is for MHSP + FHSP
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
  npy <- 50                       #number of samples each year (num per year)   
  Slo <- 25                        #year to start sampling
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
 surv_prob<-matrix(NA, nrow=nrow(collapsed_pairs), ncol=lage)
 HSP_calcs<-matrix(NA, nrow=nrow(collapsed_pairs), ncol=lage)
 lxf<-list()
 for (i in 1:nrow(collapsed_pairs)){
  #Probability you were alive in the year of the first born and survived to the year of the second born
  lxf[[i]]<-matrix(NA,nrow=collapsed_pairs$age_diff[i],ncol=lage+collapsed_pairs$age_diff[i]-1)
  if(collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i]>0){
   lxf[[i]][1,1:lage]<-exp(-(M+Faa[collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i],]))
  } else if (collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i]<1){ #to account for unfished years
   lxf[[i]][1,1:lage]<-exp(-M)
  }
  
  if(collapsed_pairs$age_diff[i]>1){
   for (y in 1:(collapsed_pairs$age_diff[i]-1)){        #Loop through the years the parent has to survive (1st year has 1 for survival)
    for (j in 1:(lage+collapsed_pairs$age_diff[i]-2)){   #Loop through mature ages in the year of the first born
     if(j<(lage+1)){ #if we are not in plus group
      if(collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i]>0){
        lxf[[i]][y+1,j+1] <- lxf[[i]][y,j]*exp(-(M+Faa[collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i]+y,j]))  #(y-1) is to account for the year in pop model
      } else if (collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i]<1){ #to account for unfished years
        lxf[[i]][y+1,j+1] <- lxf[[i]][y,j]*exp(-M)    
      }} else if (j>lage){
      if(collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i]>0){
        lxf[[i]][y+1,j+1] <- lxf[[i]][y,j]*exp(-(M+Faa[collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i]+y,lage]))  #collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i] is to get the birth year of first born
      } else if (collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i]<1){ #to account for unfished years
        lxf[[i]][y+1,j+1] <- lxf[[i]][y,j]*exp(-M)    
      }
     }
    } 
   }
  }
  #Probability you survived to the year of the second born (surviving the year of first born and all the way through the year before the second born)
  #From the age of the parent at the time of the first born
  surv_prob[i,]<-lxf[[i]][collapsed_pairs$age_diff[i],collapsed_pairs$age_diff[i]:(lage+collapsed_pairs$age_diff[i]-1)]
  
  #Ok so now it is the number (fecundity) that could have given birth to the first born / total reproductive output  * survival to second born * (fecundity of age at second born / total reproductive output at time of second born)
  for(j in fage:lage){
   if ((j+collapsed_pairs$age_diff[i])<=lage){ #If we are not in the plus group
     
    if(collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i]>0){ # if we're not in unfished years
     HSP_calcs[i,j] <-  ( (Naa[collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i],j]*Mat[j]*Waa[j]) / SSB[collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i]] ) * surv_prob[i,j]  * (4 * Mat[j+collapsed_pairs$age_diff[i]]*Waa[j+collapsed_pairs$age_diff[i]] / SSB[collapsed_pairs$born_year[i]])  #4 is for MHSP + FHSP
#     HSP_calcs[i,j] <- ( ( (0.5*Naa[collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i],j]*Mat[j]*Waa[j]) / (0.5*SSB[collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i]]) ) * surv_prob[i,j]  * (Mat[j+collapsed_pairs$age_diff[i]]*Waa[j+collapsed_pairs$age_diff[i]] / (0.5*SSB[collapsed_pairs$born_year[i]])) ) + ( ( (0.5*Naa[collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i],j]*Mat[j]*Waa[j]) / (0.5*SSB[collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i]]) ) * surv_prob[i,j]  * (Mat[j+collapsed_pairs$age_diff[i]]*Waa[j+collapsed_pairs$age_diff[i]] / (0.5*SSB[collapsed_pairs$born_year[i]])) )
    } else if (collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i]<1){ #if we are in unfished years
    if(collapsed_pairs$born_year[i]>0){ #if second born is not in unfished years
     HSP_calcs[i,j] <-  ( (N0aa[j]*Mat[j]*Waa[j]) / SSB0 ) * surv_prob[i,j]  * (4 * Mat[j+collapsed_pairs$age_diff[i]]*Waa[j+collapsed_pairs$age_diff[i]] / SSB[collapsed_pairs$born_year[i]])  #4 is for MHSP + FHSP
    } else if (collapsed_pairs$born_year[i]<1){ #if second born is in unfished years
     HSP_calcs[i,j] <-  ( (N0aa[j]*Mat[j]*Waa[j]) / SSB0 ) * surv_prob[i,j]  * (4 * Mat[j+collapsed_pairs$age_diff[i]]*Waa[j+collapsed_pairs$age_diff[i]] / SSB0)  #4 is for MHSP + FHSP
    }}
     
    } else if (j+collapsed_pairs$age_diff[i]>lage){ #Now if we are in plus group
    if(collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i]>0){ #if we're not in unfished years
     HSP_calcs[i,j] <-  ( (Naa[collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i],j]*Mat[j]*Waa[j]) / SSB[collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i]] ) * surv_prob[i,j]  * (4 * Mat[lage]*Waa[lage] / SSB[collapsed_pairs$born_year[i]])  #4 is for MHSP + FHSP
    } else if (collapsed_pairs$born_year[i]-collapsed_pairs$age_diff[i]<1){ #if we are in unfished years
      if(collapsed_pairs$born_year[i]>0){ #if second born is not in unfished years
     HSP_calcs[i,j] <-  ( (N0aa[j]*Mat[j]*Waa[j]) / SSB0 ) * surv_prob[i,j]  * (4 * Mat[lage]*Waa[lage] / SSB[collapsed_pairs$born_year[i]])  #4 is for MHSP + FHSP
    } else if (collapsed_pairs$born_year[i]<1){ #if second born is in unfished years
     HSP_calcs[i,j] <-  ( (N0aa[j]*Mat[j]*Waa[j]) / SSB0 ) * surv_prob[i,j]  * (4 * Mat[lage]*Waa[lage] / SSB0)  #4 is for MHSP + FHSP
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

setwd("C:/Users/nfisch/Documents/CKMR Workshop/Nick_Example")
#Compile and load model 
compile("CKMR_HSP_Fisch.cpp")

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

dyn.load(dynlib("CKMR_HSP_Fisch"))

parm_names<-names(MakeADFun(dat, par, DLL="CKMR_HSP_Fisch")$par)

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

SCAA <- MakeADFun(dat, par, DLL="CKMR_HSP_Fisch", map=fixed, random=reffects)
#SCAA_fit <- TMBhelper::fit_tmb(obj=SCAA, startpar=SCAA$par, lower=l, upper=u, newtonsteps=1, getsd=TRUE,bias.correct=TRUE,getHessian=TRUE)
SCAA_fit <- TMBhelper::fit_tmb(obj=SCAA, startpar=SCAA$par, lower=l, upper=u, newtonsteps=1, quiet=TRUE)


SCAA$report()$L4

head(sim_vals$pair_counts)

-1*sum(dbinom(x=sim_vals$pair_counts$n_HSP,size=sim_vals$pair_counts$times,prob=sim_vals$pair_counts$HSP_prob,log=TRUE))

#########################
#Now POP model
#########################

#Simulating the data
set.seed(2)
npy <- 50                        #number of samples each year (num per year)   
Slo <- 25                         #year to start sampling
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
#    collapsed_pairs$prob_POP[i]<- (Mat[collapsed_pairs$age_diff[i]]*Waa[collapsed_pairs$age_diff[i]] / sum(0.5*Naa[collapsed_pairs$born_year.young[i],]*Mat*Waa )) + (Mat[collapsed_pairs$age_diff[i]]*Waa[collapsed_pairs$age_diff[i]] / sum(0.5*Naa[collapsed_pairs$born_year.young[i],]*Mat*Waa ))
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

setwd("C:/Users/nfisch/Documents/CKMR Workshop/Nick_Example")
#Compile and load model 
compile("CKMR_POP_Fisch.cpp")

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

dyn.load(dynlib("CKMR_POP_Fisch"))

parm_names<-names(MakeADFun(dat, par, DLL="CKMR_POP_Fisch")$par)

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

SCAA <- MakeADFun(dat, par, DLL="CKMR_POP_Fisch", map=fixed, random=reffects)
#SCAA_fit <- TMBhelper::fit_tmb(obj=SCAA, startpar=SCAA$par, lower=l, upper=u, newtonsteps=1, getsd=TRUE,bias.correct=TRUE,getHessian=TRUE)
SCAA_fit <- TMBhelper::fit_tmb(obj=SCAA, startpar=SCAA$par, lower=l, upper=u, newtonsteps=1, quiet=TRUE)


SCAA$report()$L4
#TMB does equal the true probs
-1*sum(dbinom(sim_vals$pair_data$n_POP, sim_vals$pair_data$times, sim_vals$pair_counts$prob_POP, log=TRUE))

##################################################################################################
#Doing 100 runs of normal SCAA, HSP SCAA, POP SCAA, and both HSP and POP integrated into SCAA
##################################################################################################
setwd("C:/Users/nfisch/Documents/CKMR Workshop/Nick_Example")
compile("SimpleSCAA_Fisch.cpp")
compile("CKMR_HSP_Fisch.cpp")
compile("CKMR_POP_Fisch.cpp")
compile("CKMR_HSP_and_POP_Fisch.cpp")

load("Data/700/CKMR_HSP_dat_list_wrecdev_700.RData")
load("Data/700/CKMR_POP_dat_list_wrecdev_700.RData")
load("Data/700/Orig_dat_list_wrecdev_700.RData")
load("Data/700/OM_list_wrecdev_700.RData")

N_sim<-100
Naa_sim<-Naa_sim_ckmr_hsp<-Naa_sim_ckmr_pop<-Naa_sim_ckmr_both<-matrix(NA,nrow=N_sim,ncol=51)
SB_sim<-SB_sim_ckmr_hsp<-SB_sim_ckmr_pop<-SB_sim_ckmr_both<-matrix(NA,nrow=N_sim,ncol=51)
SB_SE_sim<-SB_SE_sim_ckmr_hsp<-SB_SE_sim_ckmr_pop<-SB_SE_sim_ckmr_both<-matrix(NA,nrow=N_sim,ncol=51)
M_sim<-M_sim_ckmr_hsp<-M_sim_ckmr_pop<-M_sim_ckmr_both<-matrix(NA,nrow=N_sim,ncol=2)
jfactor<-10
Data_qual<-"Good"  #c("Good", "Medium", "Bad")

for (s in 1:N_sim){
  
  if(Data_qual=="Good"){
    ind_dat<-Orig_dat_list_wrecdev[[s]]$Dat_index_25
    comp_dat<-Orig_dat_list_wrecdev[[s]]$Dat_comp_100
  } else if (Data_qual=="Medium"){
    ind_dat<-Orig_dat_list_wrecdev[[s]]$Dat_index_50
    comp_dat<-Orig_dat_list_wrecdev[[s]]$Dat_comp_50
  }else if(Data_qual=="Bad"){
    ind_dat<-Orig_dat_list_wrecdev[[s]]$Dat_index_75
    comp_dat<-Orig_dat_list_wrecdev[[s]]$Dat_comp_25
  }

  dat<-list(fyear=fyear, lyear=lyear, fage=fage, lage=lage, years=fyear:lyear, ages=fage:lage,
            obs_harv=Orig_dat_list_wrecdev[[s]]$Dat_harv,
            obs_index=ind_dat,
            obs_fishery_comp=comp_dat/rowSums(comp_dat),
            SS_fishery=rowSums(comp_dat),
            Mat=Mat,
            Wtage=Waa)
  
  #Parameters
  par <- list(log_M=jitter(log(0.2), factor=jfactor),
              log_q=jitter(-15, factor=jfactor),
              log_recruit_devs=rep(0,dat$lyear),
              steepness=0.8,
              log_R0=jitter(log(1e6), factor=jfactor),
              log_sigma_rec=log(0.7),
              log_cv_fishery=log(0.05),
              log_cv_index=log(0.25),
              Sel_logis_k=jitter(2, factor=jfactor),
              Sel_logis_midpt=jitter(4, factor=jfactor),
              log_fint=jitter(rep(log(0.2),dat$lyear), factor=jfactor))  
  
  ################
  #TMB stuff
  ################
  dyn.load(dynlib("SimpleSCAA_Fisch"))
  
  parm_names<-names(MakeADFun(dat, par, DLL="SimpleSCAA_Fisch")$par)
  
  fixed<-list(steepness=factor(NA),
              log_cv_fishery=factor(NA),
              log_cv_index=factor(NA))
  
  lower_bounds<-c(-5,-20,rep(-10,dat$lyear), 0, 5, -5,-5,-5,-2,  0,rep(-20,dat$lyear))
  upper_bounds<-c( 2,  1,rep( 10,dat$lyear), 1, 25, 2, 2, 2, 5, 20,rep(  0,dat$lyear))
  
  reffects=c("log_recruit_devs")
  l<-lower_bounds[-which(parm_names %in% c(names(fixed),reffects))]
  u<-upper_bounds[-which(parm_names %in% c(names(fixed),reffects))]
  
  SCAA <- MakeADFun(dat, par, DLL="SimpleSCAA_Fisch", map=fixed, random=reffects)
  SCAA_fit <- TMBhelper::fit_tmb(obj=SCAA, startpar=SCAA$par, lower=l, upper=u, newtonsteps=1, getsd=TRUE,getHessian=TRUE)

  Naa_sim[s,]<-rowSums(SCAA$report()$N)
  M_sim[s,]<-summary(SCAA_fit$SD)[which(row.names(summary(SCAA_fit$SD)) %in%  c("log_M")),]
  SB_sim[s,]<-summary(SCAA_fit$SD)[which(row.names(summary(SCAA_fit$SD)) %in%  c("spbiomass")),1]
  SB_SE_sim[s,]<-summary(SCAA_fit$SD)[which(row.names(summary(SCAA_fit$SD)) %in%  c("spbiomass")),2]

  #Now CKMR
  #HSP
  dat<-list(fyear=fyear, lyear=lyear, fage=fage, lage=lage, years=fyear:lyear, ages=fage:lage,
            obs_harv=Orig_dat_list_wrecdev[[s]]$Dat_harv,
            obs_index=ind_dat,
            obs_fishery_comp=comp_dat/rowSums(comp_dat),
            SS_fishery=rowSums(comp_dat),
            Mat=Mat,
            Wtage=Waa,
            #CKMR data
            born_year_old=CKMR_HSP_dat_list_wrecdev[[s]]$born_year-CKMR_HSP_dat_list_wrecdev[[s]]$age_diff, 
            age_diff=CKMR_HSP_dat_list_wrecdev[[s]]$age_diff,
            n_ckmr=CKMR_HSP_dat_list_wrecdev[[s]]$times,
            k_ckmr_hsp=CKMR_HSP_dat_list_wrecdev[[s]]$n_HSP)
  
  #Parameters
  par <- list(log_M=jitter(log(0.2), factor=jfactor),
              log_q=jitter(-15, factor=jfactor),
              log_recruit_devs=rep(0,dat$lyear),
              steepness=0.8,
              log_R0=jitter(log(1e6), factor=jfactor),
              log_sigma_rec=log(0.7),
              log_cv_fishery=log(0.05),
              log_cv_index=log(0.25),
              Sel_logis_k=jitter(2, factor=jfactor),
              Sel_logis_midpt=jitter(4, factor=jfactor),
              log_fint=jitter(rep(log(0.2),dat$lyear), factor=jfactor))  
              
  dyn.load(dynlib("CKMR_HSP_Fisch"))
  
  parm_names<-names(MakeADFun(dat, par, DLL="CKMR_HSP_Fisch")$par)
  
  fixed<-list(steepness=factor(NA),
              log_cv_fishery=factor(NA),
              log_cv_index=factor(NA))
  
  lower_bounds<-c(-5,-20,rep(-10,dat$lyear), 0, 5, -5,-5,-5,-2,  0,rep(-20,dat$lyear))
  upper_bounds<-c( 2,  1,rep( 10,dat$lyear), 1, 25, 2, 2, 2, 5, 20,rep(  0,dat$lyear))
  
  reffects=c("log_recruit_devs")
  l<-lower_bounds[-which(parm_names %in% c(names(fixed),reffects))]
  u<-upper_bounds[-which(parm_names %in% c(names(fixed),reffects))]
  
  SCAA_ckmr_hsp <- MakeADFun(dat, par, DLL="CKMR_HSP_Fisch", map=fixed, random=reffects)
  SCAA_fit_ckmr_hsp <- TMBhelper::fit_tmb(obj=SCAA_ckmr_hsp, startpar=SCAA_ckmr_hsp$par, lower=l, upper=u, newtonsteps=1, getsd=TRUE,getHessian=TRUE)

  Naa_sim_ckmr_hsp[s,]<-rowSums(SCAA_ckmr_hsp$report()$N)
  M_sim_ckmr_hsp[s,]<-summary(SCAA_fit_ckmr_hsp$SD)[which(row.names(summary(SCAA_fit$SD)) %in%  c("log_M")),]
  SB_sim_ckmr_hsp[s,]<-summary(SCAA_fit_ckmr_hsp$SD)[which(row.names(summary(SCAA_fit$SD)) %in%  c("spbiomass")),1]
  SB_SE_sim_ckmr_hsp[s,]<-summary(SCAA_fit_ckmr_hsp$SD)[which(row.names(summary(SCAA_fit$SD)) %in%  c("spbiomass")),2]
  
  #Now POP model
  #Now CKMR
  dat<-list(fyear=fyear, lyear=lyear, fage=fage, lage=lage, years=fyear:lyear, ages=fage:lage,
            obs_harv=Orig_dat_list_wrecdev[[s]]$Dat_harv,
            obs_index=ind_dat,
            obs_fishery_comp=comp_dat/rowSums(comp_dat),
            SS_fishery=rowSums(comp_dat),
            Mat=Mat,
            Wtage=Waa,
            #CKMR data
            born_year_young=CKMR_POP_dat_list_wrecdev[[s]]$born_year.young, 
            age_diff=CKMR_POP_dat_list_wrecdev[[s]]$age_diff,
            n_ckmr=CKMR_POP_dat_list_wrecdev[[s]]$times,
            k_ckmr_pop=CKMR_POP_dat_list_wrecdev[[s]]$n_POP)
  
  #Parameters
  par <- list(log_M=jitter(log(0.2), factor=jfactor),
              log_q=jitter(-15, factor=jfactor),
              log_recruit_devs=rep(0,dat$lyear),
              steepness=0.8,
              log_R0=jitter(log(1e6), factor=jfactor),
              log_sigma_rec=log(0.7),
              log_cv_fishery=log(0.05),
              log_cv_index=log(0.25),
              Sel_logis_k=jitter(2, factor=jfactor),
              Sel_logis_midpt=jitter(4, factor=jfactor),
              log_fint=jitter(rep(log(0.2),dat$lyear), factor=jfactor))  
  
  dyn.load(dynlib("CKMR_POP_Fisch"))
  
  parm_names<-names(MakeADFun(dat, par, DLL="CKMR_POP_Fisch")$par)
  
  fixed<-list(steepness=factor(NA),
              log_cv_fishery=factor(NA),
              log_cv_index=factor(NA))
  
  lower_bounds<-c(-5,-20,rep(-10,dat$lyear), 0, 5, -5,-5,-5,-2,  0,rep(-20,dat$lyear))
  upper_bounds<-c( 2,  1,rep( 10,dat$lyear), 1, 25, 2, 2, 2, 5, 20,rep(  0,dat$lyear))
  
  reffects=c("log_recruit_devs")
  l<-lower_bounds[-which(parm_names %in% c(names(fixed),reffects))]
  u<-upper_bounds[-which(parm_names %in% c(names(fixed),reffects))]
  
  SCAA_ckmr_pop <- MakeADFun(dat, par, DLL="CKMR_POP_Fisch", map=fixed, random=reffects)
  SCAA_fit_ckmr_pop <- TMBhelper::fit_tmb(obj=SCAA_ckmr_pop, startpar=SCAA_ckmr_pop$par, lower=l, upper=u, newtonsteps=1, getsd=TRUE,getHessian=TRUE)
  
  Naa_sim_ckmr_pop[s,]<-rowSums(SCAA_ckmr_pop$report()$N)
  M_sim_ckmr_pop[s,]<-summary(SCAA_fit_ckmr_pop$SD)[which(row.names(summary(SCAA_fit$SD)) %in%  c("log_M")),]
  SB_sim_ckmr_pop[s,]<-summary(SCAA_fit_ckmr_pop$SD)[which(row.names(summary(SCAA_fit$SD)) %in%  c("spbiomass")),1]
  SB_SE_sim_ckmr_pop[s,]<-summary(SCAA_fit_ckmr_pop$SD)[which(row.names(summary(SCAA_fit$SD)) %in%  c("spbiomass")),2]
  
  #Now combined HSP and POP
  dat<-list(fyear=fyear, lyear=lyear, fage=fage, lage=lage, years=fyear:lyear, ages=fage:lage,
            obs_harv=Orig_dat_list_wrecdev[[s]]$Dat_harv,
            obs_index=ind_dat,
            obs_fishery_comp=comp_dat/rowSums(comp_dat),
            SS_fishery=rowSums(comp_dat),
            Mat=Mat,
            Wtage=Waa,
            #CKMR HSP data
            born_year_old_hsp=CKMR_HSP_dat_list_wrecdev[[s]]$born_year-CKMR_HSP_dat_list_wrecdev[[s]]$age_diff, 
            age_diff_hsp=CKMR_HSP_dat_list_wrecdev[[s]]$age_diff,
            n_ckmr_hsp=CKMR_HSP_dat_list_wrecdev[[s]]$times,
            k_ckmr_hsp=CKMR_HSP_dat_list_wrecdev[[s]]$n_HSP,
            #CKMR POP
            born_year_young_pop=CKMR_POP_dat_list_wrecdev[[s]]$born_year.young, 
            age_diff_pop=CKMR_POP_dat_list_wrecdev[[s]]$age_diff,
            n_ckmr_pop=CKMR_POP_dat_list_wrecdev[[s]]$times,
            k_ckmr_pop=CKMR_POP_dat_list_wrecdev[[s]]$n_POP)
  
  #Parameters
  par <- list(log_M=jitter(log(0.2), factor=jfactor),
              log_q=jitter(-15, factor=jfactor),
              log_recruit_devs=rep(0,dat$lyear),
              steepness=0.8,
              log_R0=jitter(log(1e6), factor=jfactor),
              log_sigma_rec=log(0.7),
              log_cv_fishery=log(0.05),
              log_cv_index=log(0.25),
              Sel_logis_k=jitter(2, factor=jfactor),
              Sel_logis_midpt=jitter(4, factor=jfactor),
              log_fint=jitter(rep(log(0.2),dat$lyear), factor=jfactor))  
  
  dyn.load(dynlib("CKMR_HSP_and_POP_Fisch"))
  
  parm_names<-names(MakeADFun(dat, par, DLL="CKMR_HSP_and_POP_Fisch")$par)
  
  fixed<-list(steepness=factor(NA),
              log_cv_fishery=factor(NA),
              log_cv_index=factor(NA))
  
  lower_bounds<-c(-5,-20,rep(-10,dat$lyear), 0, 5, -5,-5,-5,-2,  0,rep(-20,dat$lyear))
  upper_bounds<-c( 2,  1,rep( 10,dat$lyear), 1, 25, 2, 2, 2, 5, 20,rep(  0,dat$lyear))
  
  reffects=c("log_recruit_devs")
  l<-lower_bounds[-which(parm_names %in% c(names(fixed),reffects))]
  u<-upper_bounds[-which(parm_names %in% c(names(fixed),reffects))]
  
  SCAA_ckmr_both <- MakeADFun(dat, par, DLL="CKMR_HSP_and_POP_Fisch", map=fixed, random=reffects)
  SCAA_fit_ckmr_both <- TMBhelper::fit_tmb(obj=SCAA_ckmr_both, startpar=SCAA_ckmr_both$par, lower=l, upper=u, newtonsteps=1, getsd=TRUE,getHessian=TRUE)
  
  Naa_sim_ckmr_both[s,]<-rowSums(SCAA_ckmr_both$report()$N)
  M_sim_ckmr_both[s,]<-summary(SCAA_fit_ckmr_both$SD)[which(row.names(summary(SCAA_fit$SD)) %in%  c("log_M")),]
  SB_sim_ckmr_both[s,]<-summary(SCAA_fit_ckmr_both$SD)[which(row.names(summary(SCAA_fit$SD)) %in%  c("spbiomass")),1]
  SB_SE_sim_ckmr_both[s,]<-summary(SCAA_fit_ckmr_both$SD)[which(row.names(summary(SCAA_fit$SD)) %in%  c("spbiomass")),2]
}

RE_ckmr_hsp_N<-RE_ckmr_pop_N<-RE_ckmr_both_N<-RE_N<-matrix(NA, nrow=100,ncol=51)
for (s in 1:100){
 RE_N[s,]<-(Naa_sim[s,]-rowSums(OM_list_wrecdev[[s]]$Naa))/rowSums(OM_list_wrecdev[[s]]$Naa)
 RE_ckmr_hsp_N[s,]<-(Naa_sim_ckmr_hsp[s,]-rowSums(OM_list_wrecdev[[s]]$Naa))/rowSums(OM_list_wrecdev[[s]]$Naa)
 RE_ckmr_pop_N[s,]<-(Naa_sim_ckmr_pop[s,]-rowSums(OM_list_wrecdev[[s]]$Naa))/rowSums(OM_list_wrecdev[[s]]$Naa)
 RE_ckmr_both_N[s,]<-(Naa_sim_ckmr_both[s,]-rowSums(OM_list_wrecdev[[s]]$Naa))/rowSums(OM_list_wrecdev[[s]]$Naa)
}

Results_Bad_Data<-list(Naa_sim=Naa_sim,
                        Naa_sim_ckmr_hsp=Naa_sim_ckmr_hsp,
                        Naa_sim_ckmr_pop=Naa_sim_ckmr_pop,
                        Naa_sim_ckmr_both=Naa_sim_ckmr_both,
                        RE_N=RE_N,
                        RE_ckmr_hsp_N=RE_ckmr_hsp_N,
                        RE_ckmr_pop_N=RE_ckmr_pop_N,
                        RE_ckmr_both_N=RE_ckmr_both_N,
                        SB_sim=SB_sim,
                        SB_sim_ckmr_hsp=SB_sim_ckmr_hsp,
                        SB_sim_ckmr_pop=SB_sim_ckmr_pop,
                        SB_sim_ckmr_both=SB_sim_ckmr_both,
                        M_sim=M_sim,
                        M_sim_ckmr_hsp=M_sim_ckmr_hsp,
                        M_sim_ckmr_pop=M_sim_ckmr_pop,
                        M_sim_ckmr_both=M_sim_ckmr_both,
                        SB_SE_sim=SB_SE_sim,
                        SB_SE_sim_ckmr_hsp=SB_SE_sim_ckmr_hsp,
                        SB_SE_sim_ckmr_pop=SB_SE_sim_ckmr_pop,
                        SB_SE_sim_ckmr_both=SB_SE_sim_ckmr_both)

#save(Results_Bad_Data,file="C:/Users/nfisch/Documents/CKMR Workshop/Nick_Example/Data/700/Results_Bad_Data_700.RData")

library(vioplot)
par(mfrow=c(1,4))
vioplot(RE_N, col="white",ylim=c(-0.7,0.7), range=0,colMed="black", pchMed=20, cex=1.25, rectCol="black", border="black", las=1, lineCol="black")
abline(h=0)
vioplot(RE_ckmr_hsp_N, col="white",ylim=c(-0.7,0.7), range=0,colMed="black", pchMed=20, cex=1.25, rectCol="black", border="black", las=1, lineCol="black")
abline(h=0)
vioplot(RE_ckmr_pop_N, col="white",ylim=c(-0.7,0.7), range=0,colMed="black", pchMed=20, cex=1.25, rectCol="black", border="black", las=1, lineCol="black")
abline(h=0)
vioplot(RE_ckmr_both_N, col="white",ylim=c(-0.7,0.7), range=0,colMed="black", pchMed=20, cex=1.25, rectCol="black", border="black", las=1, lineCol="black")
abline(h=0)

par(mfrow=c(1,4))
vioplot(M_sim[,1], ylim=c(-1.7,-1.54))
abline(h=log(0.2))
vioplot(M_sim_ckmr_hsp[,1], ylim=c(-1.7,-1.54))
abline(h=log(0.2))
vioplot(M_sim_ckmr_pop[,1], ylim=c(-1.7,-1.54))
abline(h=log(0.2))
vioplot(M_sim_ckmr_both[,1], ylim=c(-1.7,-1.54))
abline(h=log(0.2))

par(mfrow=c(1,4))
vioplot(M_sim[,2], ylim=c(min(M_sim[,2]),max(M_sim[,2])))
vioplot(M_sim_ckmr_hsp[,2], ylim=c(min(M_sim[,2]),max(M_sim[,2])))
vioplot(M_sim_ckmr_pop[,2], ylim=c(min(M_sim[,2]),max(M_sim[,2])))
vioplot(M_sim_ckmr_both[,2], ylim=c(min(M_sim[,2]),max(M_sim[,2])))

par(mfrow=c(1,4))
vioplot(SB_sim, ylim=c())
vioplot(SB_sim_ckmr_hsp, ylim=c())
vioplot(SB_sim_ckmr_pop, ylim=c())
vioplot(SB_sim_ckmr_both, ylim=c())

par(mfrow=c(1,4))
vioplot(SB_SE_sim, ylim=c(2e6,2.5e7))
vioplot(SB_SE_sim_ckmr_hsp, ylim=c(2e6,2.5e7))
vioplot(SB_SE_sim_ckmr_pop, ylim=c(2e6,2.5e7))
vioplot(SB_SE_sim_ckmr_both, ylim=c(2e6,2.5e7))

par(mfrow=c(1,4))
vioplot(SB_SE_sim[,51], ylim=c(0.75e7,2.5e7))
abline(h=1.25e7)
vioplot(SB_SE_sim_ckmr_hsp[,51], ylim=c(0.75e7,2.5e7))
abline(h=1.25e7)
vioplot(SB_SE_sim_ckmr_pop[,51], ylim=c(0.75e7,2.5e7))
abline(h=1.25e7)
vioplot(SB_SE_sim_ckmr_both[,51], ylim=c(0.75e7,2.5e7))
abline(h=1.25e7)

#Middle of Time series
par(mfrow=c(1,4))
vioplot(SB_SE_sim[,25], ylim=c(0.25e7,1e7))
abline(h=.5e7)
vioplot(SB_SE_sim_ckmr_hsp[,25], ylim=c(0.25e7,1e7))
abline(h=.5e7)
vioplot(SB_SE_sim_ckmr_pop[,25], ylim=c(0.25e7,1e7))
abline(h=.5e7)
vioplot(SB_SE_sim_ckmr_both[,25], ylim=c(0.25e7,1e7))
abline(h=.5e7)


###########
#Bayes
###########

par <- list(log_M=jitter(log(0.2), factor=jfactor),
            log_q=jitter(-15, factor=jfactor),
            log_recruit_devs=rep(0,dat$lyear),
            steepness=0.8,
            log_R0=jitter(log(1e6), factor=jfactor),
            log_sigma_rec=log(0.3),
            log_cv_fishery=log(0.05),
            log_cv_index=log(0.25),
            Sel_logis_k=jitter(2, factor=jfactor),
            Sel_logis_midpt=jitter(4, factor=jfactor),
            log_fint=jitter(rep(log(0.2),dat$lyear), factor=jfactor)) 

dyn.load(dynlib("SimpleSCAA_Fisch"))
parm_names<-names(MakeADFun(dat, par, DLL="SimpleSCAA_Fisch")$par)

fixed<-list(steepness=factor(NA),
            log_cv_fishery=factor(NA),
            log_cv_index=factor(NA))

lower_bounds<-c(-5,-20,rep(-10,dat$lyear), 0, 5, -5,-5,-5,-2,  0,rep(-20,dat$lyear))
upper_bounds<-c( 2,  1,rep( 10,dat$lyear), 1, 25, 2, 2, 2, 5, 20,rep(  0,dat$lyear))

l<-lower_bounds[-which(parm_names %in% c(names(fixed)))]
u<-upper_bounds[-which(parm_names %in% c(names(fixed)))]

SCAA <- MakeADFun(dat, par, DLL="SimpleSCAA_Fisch", map=fixed)

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

dyn.load(dynlib("CKMR_HSP_Fisch"))

parm_names<-names(MakeADFun(dat, par, DLL="CKMR_HSP_Fisch")$par)

fixed<-list(steepness=factor(NA),
            log_cv_fishery=factor(NA),
            log_cv_index=factor(NA))

lower_bounds<-c(-5,-20,rep(-10,dat$lyear), 0, 5, -5,-5,-5,-2,  0,rep(-20,dat$lyear))
upper_bounds<-c( 2,  1,rep( 10,dat$lyear), 1, 25, 2, 2, 2, 5, 20,rep(  0,dat$lyear))

l<-lower_bounds[-which(parm_names %in% c(names(fixed)))]
u<-upper_bounds[-which(parm_names %in% c(names(fixed)))]

SCAA <- MakeADFun(dat, par, DLL="CKMR_HSP_Fisch", map=fixed)
fit_hsp <- tmbstan(SCAA,chains=1, open_progress=FALSE, init=SCAA$par,lower = l, upper = u, iter = 10000, warmup = 1000)
mc_samples_hsp <- rstan::extract(fit_hsp)

hist(mc_samples_hsp$log_M, breaks=seq(-1.75,-1.45,0.01))
hist(mc_samples$log_M, breaks=seq(-1.75,-1.45,0.01))















############################################
#Conventional tag model
############################################

Naa_tag<-matrix(0,nrow=51,ncol=15)
N_tag<-50 #Lets tag 50 fish a year, starting in year 21

for(i in 21:lyear){
  # Naa_tag[i,]<-Naa_tag[i,]+N_tag*Sel*Naa[i,]
  Naa_tag[i,]<-Naa_tag[i,]+rmultinom(n=1,size=N_tag,prob=Sel*Naa[i,])  #To be internally consistent, given releases the tagged population is not sampled from the Catch at age, right?, wouldnt matter prob is the same
  for(j in fage:(lage-1)){
    Naa_tag[i+1,j+1]<-Naa_tag[i,j]*exp(-(M+Faa[i,j])) 
  }
  Naa_tag[i+1,lage]<-Naa_tag[i+1,lage]+Naa_tag[i,lage]*exp(-(M+Faa[i,lage])) #plus group
  
}
#The expected returns is based on the fishing mortality rate and the Baranov Catch equation 
Exp_returns<-Faa/(M+Faa)*Naa_tag[1:50,]*(1-exp(-(M+Faa))) #So these will be in the Catch at age

Obs_returns<-matrix(NA, nrow=50,ncol=15)
for(i in 21:lyear){
  Obs_returns[i,]<-rmultinom(n=1,size=round(sum(Exp_returns[i,])), prob=Exp_returns[i,])
}

#Now estimation model

NLL<-NA
for(i in 21:lyear){
  NLL[i]<--1*dmultinom(x=Obs_returns[i,], prob=Exp_returns[i,], log=TRUE)
}

#Likelihood for returns, Neg Binom 
rpois(50,4)

dpois()




