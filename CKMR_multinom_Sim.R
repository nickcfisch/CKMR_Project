
#CKMR Simulator with Multinomial

#####################################################
#Population Simulations for each Life-history type
#####################################################

#wd<-"C:/Users/fischn/Documents/GitHub/CKMR_Project"

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
                   N_Comp_preCKMR=c(30,rep(0,9),40,rep(0,9),50,rep(0,4),60,rep(0,4),70,rep(0,4),80,rep(0,4),90,rep(0,4),rep(100,30)),
                   N_Comp_CKMR=200,
                   q_index=0.0001,
                   prop_ckmr=1,
                   fyear_ckmr=76,
                   lyear_ckmr=100,
                   pi_nu=0.736,   #False negative retention probability
                   AE_mat="identity")    #Given your true age i (row), this matrix defines the probability that you will be classified age j (column), #REMEMBER THIS NEEDS TO BE IN THE NUMBER OF AGES IN YOUR MODEL
                   {
  
  set.seed(dat_seed)
  if(AE_mat[1]=="identity"){
   AE_mat<-diag(length(OM$fage:OM$lage))
  }
  #Getting Data
  Obs_Catch<-Obs_Index_25<-Obs_Index_50<-NA
  Obs_Catch_Comp<-Obs_Catch_Comp_noAE<-matrix(NA,nrow=length(fyear_dat:lyear_dat),ncol=length(OM$fage:OM$lage))
  Obs_Catch_Comp_wiY<-array(0,dim=c(length(fyear_dat:lyear_dat),length(OM$fage:OM$lage),length(OM$fage:OM$lage)))
  N_Comp<-c(rep(0,fyear_dat-1),N_Comp_preCKMR[1:length(fyear_dat:(fyear_ckmr-1))],rep(N_Comp_CKMR,length(fyear_ckmr:lyear_ckmr)))
  ages_long<-data.frame(year=NA, true_age=NA, coded_age=NA) #making empty dataframe that I will remove NAs later
  for (d in fyear_dat:lyear_dat){
    Obs_Catch[d-(fyear_dat-1)]<-rlnorm(1, meanlog=log(sum(OM$Caa[d,]*OM$Waa)), sdlog=sd_catch)
    Obs_Catch_Comp_noAE[d-(fyear_dat-1),]<-rmultinom(n=1,size=N_Comp[d], prob=OM$Caa[d,])
    Obs_Index_25[d-(fyear_dat-1)]<-rlnorm(1, meanlog=log(sum(OM$Naa[d,]*((1-exp(-OM$Zaa[d,]))/OM$Zaa[d,])*OM$Sel*OM$Waa)*q_index), sdlog=0.25)
    Obs_Index_50[d-(fyear_dat-1)]<-rlnorm(1, meanlog=log(sum(OM$Naa[d,]*((1-exp(-OM$Zaa[d,]))/OM$Zaa[d,])*OM$Sel*OM$Waa)*q_index), sdlog=0.50)
    
    #Getting observed data with Ageing error
    #Another sampler is needed to get data in integers
    #and needs to be done on individual fish to remember the year, true age, and coded age for later CKMR calcs 
    for (a in 1:length(OM$fage:OM$lage)){
     if(Obs_Catch_Comp_noAE[d-(fyear_dat-1),a]>0){
      for(j in 1:Obs_Catch_Comp_noAE[d-(fyear_dat-1),a]){
       ages_long<-rbind.data.frame(ages_long,data.frame(year=d, true_age=a-1, coded_age=which(rmultinom(1,size=1,prob=AE_mat[a,])>0)-1))  #-1 necessary to account for age zeroes
      }
     }
    }
    
    Obs_Catch_Comp[d-(fyear_dat-1),]<-table(factor(ages_long$coded_age[ages_long$year==d],levels=OM$fage:OM$lage))
  }
  
  ages_long<-ages_long[-1,] #Just taking the NA out
  
  ##################################
  #Simulator for both HSP and POP
  ##################################

  #Simulating the data
  ages <- OM$fage:OM$lage          #a vector of the ages
  n_ckmr<-round(N_Comp_CKMR*prop_ckmr) #the number of ckmr samples
  samples<-data.frame(samp_year=NA, true_age=NA, coded_age=NA)
  if (prop_ckmr==1){
   samples <- data.frame(samp_year=ages_long$year[ages_long$year %in% fyear_ckmr:lyear_ckmr], true_age=ages_long$true_age[ages_long$year %in% fyear_ckmr:lyear_ckmr], coded_age=ages_long$coded_age[ages_long$year %in% fyear_ckmr:lyear_ckmr])
  }else if (prop_ckmr!=1){
   for(i in 1:length(fyear_ckmr:lyear_ckmr)){
    samples <- rbind.data.frame(samples,ages_long[sample(which(ages_long$year == (fyear_ckmr:lyear_ckmr)[i]), size = n_ckmr, replace = FALSE),] )
   }
  }
  
  samples <- cbind.data.frame(samples, true_born_year = samples$samp_year - samples$true_age, coded_born_year = samples$samp_year - samples$coded_age)    #From the age and sampling year, calculate the year it was born in.
  #The total reproductive output at the time it was born
  Tot_reprod <- rep(NA, length(samples$true_born_year))
  Tot_reprod[which(samples$true_born_year>0)] <- OM$SSB[samples$true_born_year[which(samples$true_born_year>0)]]
  Tot_reprod[which(samples$true_born_year<1)] <- OM$SSB0
  samples <- cbind.data.frame(samples, Tot_reprod = Tot_reprod)                         #The total reproductive output at the time it was born

  #Making unique ID to cross reference every sample with every other
  samples$unique_ID<-1:nrow(samples)
  
  samples_short<-aggregate(rep(1,nrow(samples)), by=list(samp_year=samples$samp_year, true_age=samples$true_age, coded_age=samples$coded_age, true_born_year=samples$true_born_year, coded_born_year=samples$coded_born_year, Tot_reprod=samples$Tot_reprod), FUN=sum)
  samples_short$unique_ID<-1:nrow(samples_short)
  
  out_short <- with(samples_short, crossprod(table(paste(samp_year,true_age,coded_age,true_born_year,coded_born_year,Tot_reprod),unique_ID)))
  out_short[lower.tri(out_short, diag = TRUE)] <- NA
  diag(out_short)<-0
  out_dat_short<-subset(as.data.frame.table(out_short), !is.na(Freq))
  final_short<-out_dat_short[order(out_dat_short$unique_ID),-3] #just taking out useless column
  
  samples_agg<-aggregate(rep(1,nrow(final_short)),
               by=list(samp_year.1=samples_short[final_short$unique_ID,  "samp_year"],true_age.1=samples_short[final_short$unique_ID,  "true_age"],coded_age.1=samples_short[final_short$unique_ID,  "coded_age"],true_born_year.1=samples_short[final_short$unique_ID,  "true_born_year"],coded_born_year.1=samples_short[final_short$unique_ID,  "coded_born_year"],Tot_reprod.1=samples_short[final_short$unique_ID,  "Tot_reprod"],num1=samples_short[final_short$unique_ID,  "x"],                                           
                       samp_year.2=samples_short[final_short$unique_ID.1,"samp_year"],true_age.2=samples_short[final_short$unique_ID.1,"true_age"],coded_age.2=samples_short[final_short$unique_ID.1,"coded_age"],true_born_year.2=samples_short[final_short$unique_ID.1,"true_born_year"],coded_born_year.2=samples_short[final_short$unique_ID.1,"coded_born_year"],Tot_reprod.2=samples_short[final_short$unique_ID.1,"Tot_reprod"],num2=samples_short[final_short$unique_ID.1,"x"]),
               FUN=sum)
  
  #Number of comparisons
  samples_agg$num_agg<-samples_agg$num1*samples_agg$num2
  
  #For comparing fish with identical covariates (k choose 2)
  samples_agg$num_agg<-ifelse(samples_agg$samp_year.1==samples_agg$samp_year.2 &
                              samples_agg$true_age.1==samples_agg$true_age.2 &
                              samples_agg$coded_age.1==samples_agg$coded_age.2 &
                              samples_agg$true_born_year.1==samples_agg$true_born_year.2 &
                              samples_agg$coded_born_year.1==samples_agg$coded_born_year.2,
                              choose(samples_agg$num1,2),samples_agg$num_agg)
  
  samples_agg<-samples_agg[-which(samples_agg$num_agg==0),]  #Taking out no observsations
  samples_agg<-samples_agg[,-which(colnames(samples_agg) %in% c("x","num1","num2"))] #Taking out useless columns
  #Renaming column
  colnames(samples_agg)<-c(colnames(samples_agg)[1:12],"reps")
  
  new_dat<-samples_agg
  for(i in 1:nrow(samples_agg)){
    if(samples_agg$true_born_year.1[i] < samples_agg$true_born_year.2[i]){
      new_dat[i,]<-samples_agg[i,]
    } else if (samples_agg$true_born_year.1[i] == samples_agg$true_born_year.2[i] & samples_agg$true_age.1[i] > samples_agg$true_age.2[i]){
      new_dat[i,]<-samples_agg[i,]
    } else if (samples_agg$true_born_year.1[i] == samples_agg$true_born_year.2[i] & samples_agg$true_age.1[i] == samples_agg$true_age.2[i]){
      if(samples_agg$coded_born_year.1[i] < samples_agg$coded_born_year.2[i]){
        new_dat[i,]<-samples_agg[i,]
      } else if(samples_agg$coded_born_year.1[i] == samples_agg$coded_born_year.2[i]){
        new_dat[i,]<-samples_agg[i,]
      } else if(samples_agg$coded_born_year.1[i] > samples_agg$coded_born_year.2[i]){
        new_dat[i,]<-c(samples_agg[i,7:12],samples_agg[i,1:6],samples_agg[i,13])
      }
    } else if (samples_agg$true_born_year.1[i] == samples_agg$true_born_year.2[i] & samples_agg$true_age.1[i] < samples_agg$true_age.2[i]){
      new_dat[i,]<-c(samples_agg[i,7:12],samples_agg[i,1:6],samples_agg[i,13])
    } else if (samples_agg$true_born_year.1[i] > samples_agg$true_born_year.2[i]){
      new_dat[i,]<-c(samples_agg[i,7:12],samples_agg[i,1:6],samples_agg[i,13])
    }}
  colnames(new_dat)<-c("samp_year.old","true_age.old","coded_age.old","true_born_year.old","coded_born_year.old","Tot_reprod.old","samp_year.young","true_age.young","coded_age.young","true_born_year.young","coded_born_year.young","Tot_reprod.young", "reps") #naming the columns 
  
  new_dat<-new_dat[order(new_dat$samp_year.old, new_dat$true_age.old, new_dat$coded_age.old, new_dat$true_born_year.old, new_dat$coded_born_year.old, new_dat$samp_year.young, new_dat$true_age.young,new_dat$coded_age.young, new_dat$true_born_year.young, new_dat$coded_born_year.young),]
  
  pairs <- cbind.data.frame(new_dat, true_age_diff = new_dat$true_born_year.young-new_dat$true_born_year.old, coded_age_diff = new_dat$coded_born_year.young-new_dat$coded_born_year.old, times=new_dat$reps) 
  
  #Rewrote using multinomial (and binomial. rather than bernoulli), because you can't have too many samples it gets too complex. With AE now need to keep track of the ages (in particular the age of the younger bc age of older is findable)
  collapsed_pairs<-pairs

  #Now for loop through the samples, and now we only consider the true ages (the coded stuff is just for bookkeeping and later data)
  surv_prob<-matrix(0, nrow=nrow(collapsed_pairs), ncol=(OM$lage+1))
  HSP_calcs<-matrix(0, nrow=nrow(collapsed_pairs), ncol=(OM$lage+1))
  lxf<-list()
  for (i in 1:nrow(collapsed_pairs)){
   #Probability you were alive in the year of the first born and survived to the year of the second born
   if(collapsed_pairs$true_age_diff[i]>0){ #Your true age difference has to be > 0
    lxf[[i]]<-matrix(NA,nrow=collapsed_pairs$true_age_diff[i],ncol=(OM$lage+1)+collapsed_pairs$true_age_diff[i]-1)
    if(collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i]>0){
      lxf[[i]][1,1:(OM$lage+1)]<-exp(-(OM$Maa+OM$Faa[collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i],]))
    } else if (collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i]<1){ #to account for unfished years
      lxf[[i]][1,1:(OM$lage+1)]<-exp(-OM$Maa)
    }
    
    if(collapsed_pairs$true_age_diff[i]>1){
      for (y in 1:(collapsed_pairs$true_age_diff[i]-1)){        #Loop through the years the parent has to survive (1st year has 1 for survival)
        for (j in 1:((OM$lage+1)+collapsed_pairs$true_age_diff[i]-2)){   #Loop through mature ages in the year of the first born
          if(j<=OM$lage){ #if we are not in plus group
            if(collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i]>0){
              lxf[[i]][y+1,j+1] <- lxf[[i]][y,j]*exp(-(OM$Maa[j+1]+OM$Faa[collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i]+y,j+1]))  
            } else if (collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i]<1){ #to account for unfished years
              lxf[[i]][y+1,j+1] <- lxf[[i]][y,j]*exp(-OM$Maa[j+1])    
            }} else if (j>OM$lage){
              if(collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i]>0){
                lxf[[i]][y+1,j+1] <- lxf[[i]][y,j]*exp(-(OM$Maa[OM$lage+1]+OM$Faa[collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i]+y,(OM$lage+1)]))  #collapsed_pairs$born_year.young[i]-collapsed_pairs$age_diff[i] is to get the birth year of first born
              } else if (collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i]<1){ #to account for unfished years
                lxf[[i]][y+1,j+1] <- lxf[[i]][y,j]*exp(-OM$Maa[OM$lage+1])    
              }
            }
        } 
      }
    }
    #Probability you survived to the year of the second born (surviving the year of first born and all the way through the year before the second born)
    #From the age of the parent at the time of the first born
    surv_prob[i,]<-lxf[[i]][collapsed_pairs$true_age_diff[i],collapsed_pairs$true_age_diff[i]:((OM$lage+1)+collapsed_pairs$true_age_diff[i]-1)]
    
    #Ok so now it is the number (fecundity) that could have given birth to the first born / total reproductive output  * survival to second born * (fecundity of age at second born / total reproductive output at time of second born)
    for(j in 2:(OM$lage+1)){ #you can't have been the parent at age 0
      if ((j+collapsed_pairs$true_age_diff[i])<=(OM$lage+1)){ #If we are not in the plus group
        
        if(collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i]>0){ # if we're not in unfished years
          HSP_calcs[i,j] <-  ( (OM$Naa[collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i],j]*OM$Mat[j]*OM$Waa[j]) / OM$SSB[collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i]] ) * surv_prob[i,j]  * (4 * OM$Mat[j+collapsed_pairs$true_age_diff[i]]*OM$Waa[j+collapsed_pairs$true_age_diff[i]] / OM$SSB[collapsed_pairs$true_born_year.young[i]])  #4 is for MHSP + FHSP
#          HSP_calcs[i,j] <- 2 * (( (0.5*OM$Naa[collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i],j]*OM$Mat[j]*OM$Waa[j]) / (0.5*OM$SSB[collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i]]) ) * surv_prob[i,j]  * (OM$Mat[j+collapsed_pairs$true_age_diff[i]]*OM$Waa[j+collapsed_pairs$true_age_diff[i]] / (0.5*OM$SSB[collapsed_pairs$true_born_year.young[i]])))  #4 is for MHSP + FHSP
        } else if (collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i]<1){ #if we are in unfished years
          if(collapsed_pairs$true_born_year.young[i]>0){ #if second born is not in unfished years
            HSP_calcs[i,j] <-  ( (OM$N0aa[j]*OM$Mat[j]*OM$Waa[j]) / OM$SSB0 ) * surv_prob[i,j]  * (4 * OM$Mat[j+collapsed_pairs$true_age_diff[i]]*OM$Waa[j+collapsed_pairs$true_age_diff[i]] / OM$SSB[collapsed_pairs$true_born_year.young[i]])  #4 is for MHSP + FHSP
          } else if (collapsed_pairs$true_born_year.young[i]<1){ #if second born is in unfished years
            HSP_calcs[i,j] <-  ( (OM$N0aa[j]*OM$Mat[j]*OM$Waa[j]) / OM$SSB0 ) * surv_prob[i,j]  * (4 * OM$Mat[j+collapsed_pairs$true_age_diff[i]]*OM$Waa[j+collapsed_pairs$true_age_diff[i]] / OM$SSB0)  #4 is for MHSP + FHSP
          }}
        
      } else if (j+collapsed_pairs$true_age_diff[i]>(OM$lage+1)){ #Now if we are in plus group
        if(collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i]>0){ #if we're not in unfished years
          HSP_calcs[i,j] <-  ( (OM$Naa[collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i],j]*OM$Mat[j]*OM$Waa[j]) / OM$SSB[collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i]] ) * surv_prob[i,j]  * (4 * OM$Mat[(OM$lage+1)]*OM$Waa[(OM$lage+1)] / OM$SSB[collapsed_pairs$true_born_year.young[i]])  #4 is for MHSP + FHSP
#          HSP_calcs[i,j] <- 2 * (( (0.5*OM$Naa[collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i],j]*OM$Mat[j]*OM$Waa[j]) / (0.5*OM$SSB[collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i]] )) * surv_prob[i,j]  * (OM$Mat[(OM$lage+1)]*OM$Waa[(OM$lage+1)] / (0.5*OM$SSB[collapsed_pairs$true_born_year.young[i]])))  #4 is for MHSP + FHSP
        } else if (collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i]<1){ #if we are in unfished years
          if(collapsed_pairs$true_born_year.young[i]>0){ #if second born is not in unfished years
            HSP_calcs[i,j] <-  ( (OM$N0aa[j]*OM$Mat[j]*OM$Waa[j]) / OM$SSB0 ) * surv_prob[i,j]  * (4 * OM$Mat[(OM$lage+1)]*OM$Waa[(OM$lage+1)] / OM$SSB[collapsed_pairs$true_born_year.young[i]])  #4 is for MHSP + FHSP
          } else if (collapsed_pairs$true_born_year[i]<1){ #if second born is in unfished years
            HSP_calcs[i,j] <-  ( (OM$N0aa[j]*OM$Mat[j]*OM$Waa[j]) / OM$SSB0 ) * surv_prob[i,j]  * (4 * OM$Mat[(OM$lage+1)]*OM$Waa[(OM$lage+1)] / OM$SSB0)  #4 is for MHSP + FHSP
          }}
      }
    }
   }
  }
  #Then we sum over all the ages to get the HSP probability for that given data pair
  collapsed_pairs$HSP_prob <- rowSums(HSP_calcs)

  ####################
  #Now POP calcs
  ####################
  
  #Now for loop through the samples
  collapsed_pairs$prob_POP<-0
  for (i in 1:nrow(collapsed_pairs)){
   if(collapsed_pairs$true_age_diff[i]>0){ #Your true age difference has to be > 0
    #Ok so the fecundity based on the age of the potential parent / (0.5 * the total reproductive output of the population at the time of juves birth )
    if(collapsed_pairs$true_born_year.young[i]>0){  #if not in unfished territory
      collapsed_pairs$prob_POP[i]<- 2*(OM$Mat[collapsed_pairs$true_age_diff[i]+1]*OM$Waa[collapsed_pairs$true_age_diff[i]+1] / sum( OM$Naa[collapsed_pairs$true_born_year.young[i],]*OM$Mat*OM$Waa ))
    } else if(collapsed_pairs$true_born_year.young[i]<1){
      collapsed_pairs$prob_POP[i]<- 2*(OM$Mat[collapsed_pairs$true_age_diff[i]+1]*OM$Waa[collapsed_pairs$true_age_diff[i]+1] / sum( OM$N0aa*OM$Mat*OM$Waa ))
    }
   }
  }#Don't need to consider plus group calcs bc max age diff will be 25

  #if the sample year of the older is the same year as born year of younger, multiply by 50%
  collapsed_pairs$prob_POP<-ifelse(collapsed_pairs$samp_year.old == collapsed_pairs$true_born_year.young,0.5*collapsed_pairs$prob_POP,collapsed_pairs$prob_POP)    
  
  # A potential parent has to have been sampled after or on the year of youngs birth, because sampling is lethal 
  collapsed_pairs$prob_POP<-ifelse(collapsed_pairs$samp_year.old >= collapsed_pairs$true_born_year.young,collapsed_pairs$prob_POP,0)    
  
  ####################################
  #Now GGP Probabilities
  ####################################
  #Now for loop through the samples
  collapsed_pairs$prob_GGP<-0
  for (i in 1:nrow(collapsed_pairs)){
    #Your true age difference has to be > 0,
    if(collapsed_pairs$true_age_diff[i]>0){ 
      for (k in 1:OM$lage){  #Looping through potential ages of potential parent. you can't have been the parent at age 0
        #sample year of older must be greater than birth year of the parent 
        if(collapsed_pairs$samp_year.old[i]>(collapsed_pairs$true_born_year.young[i]-k)){
          #age of grandparent at year of parents birth must be positive 
          if(((collapsed_pairs$true_born_year.young[i]-k)-(collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i])) > 0 & ((collapsed_pairs$true_born_year.young[i]-k)-(collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i])) < (OM$lage+1)){ #if we're not in plus group, and age of grandparent at year of parents birth must be positive 
            
            if((collapsed_pairs$true_born_year.young[i]-k)>0 & collapsed_pairs$true_born_year.young[i]>0){  #if not in unfished territory
              
              #P(GGP)=2 * sum over parent ages (Naa[birth year of younger,age of potential parent] * Fec[age of potential parent at time of youngers birth]/SSB[birth year of younger] * Fec[age of grandparent at time of parents birth]/(0.5*SSB[year of potential parents birth]) )
              #So the birth year of the potential parent of the younger is the birth year of younger - age of parent at time of youngers birth
              #The age of the grandparent at the time of the parents birth is the birth year of the parent - the birth year of the grandparent
              collapsed_pairs$prob_GGP[i]<- collapsed_pairs$prob_GGP[i] +
                OM$Naa[collapsed_pairs$true_born_year.young[i],k+1] *
                ((OM$Mat[k+1]*OM$Waa[k+1])/sum(OM$Naa[collapsed_pairs$true_born_year.young[i],]*OM$Mat*OM$Waa)) *
                ((OM$Mat[(collapsed_pairs$true_born_year.young[i]-k)-(collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i])+1]*OM$Waa[(collapsed_pairs$true_born_year.young[i]-k)-(collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i])+1])/(0.5*sum(OM$Naa[collapsed_pairs$true_born_year.young[i]-k,]*OM$Mat*OM$Waa)))
              
            } else if((collapsed_pairs$true_born_year.young[i]-k)<1 & collapsed_pairs$true_born_year.young[i]>0){  #if in unfished territory
              collapsed_pairs$prob_GGP[i]<- collapsed_pairs$prob_GGP[i] +
                OM$Naa[collapsed_pairs$true_born_year.young[i],k+1] *
                ((OM$Mat[k+1]*OM$Waa[k+1])/sum(OM$Naa[collapsed_pairs$true_born_year.young[i],]*OM$Mat*OM$Waa)) *
                ((OM$Mat[(collapsed_pairs$true_born_year.young[i]-k)-(collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i])+1]*OM$Waa[(collapsed_pairs$true_born_year.young[i]-k)-(collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i])+1])/(0.5*sum(OM$N0aa*OM$Mat*OM$Waa)))
              
            } else if((collapsed_pairs$true_born_year.young[i]-k)<1 & collapsed_pairs$true_born_year.young[i]<1){  #if in unfished territory
              collapsed_pairs$prob_GGP[i]<- collapsed_pairs$prob_GGP[i] +
                OM$N0aa[,k+1] *
                ((OM$Mat[k+1]*OM$Waa[k+1])/sum(OM$N0aa*OM$Mat*OM$Waa)) *
                ((OM$Mat[(collapsed_pairs$true_born_year.young[i]-k)-(collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i])+1]*OM$Waa[(collapsed_pairs$true_born_year.young[i]-k)-(collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i])+1])/(0.5*sum(OM$N0aa*OM$Mat*OM$Waa)))
            }
            
            #Now if we are in plus group territory. Same calcs just plus group
          } else if(((collapsed_pairs$true_born_year.young[i]-k)-(collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i])) > OM$lage){
            if((collapsed_pairs$true_born_year.young[i]-k)>0 & collapsed_pairs$true_born_year.young[i]>0){  #if not in unfished territory
              collapsed_pairs$prob_GGP[i]<- collapsed_pairs$prob_GGP[i] +
                OM$Naa[collapsed_pairs$true_born_year.young[i],k+1] *
                ((OM$Mat[k+1]*OM$Waa[k+1])/sum(OM$Naa[collapsed_pairs$true_born_year.young[i],]*OM$Mat*OM$Waa)) *
                ((OM$Mat[OM$lage+1]*OM$Waa[OM$lage+1])/(0.5*sum(OM$Naa[collapsed_pairs$true_born_year.young[i]-k,]*OM$Mat*OM$Waa)))
            } else if((collapsed_pairs$true_born_year.young[i]-k)<1 & collapsed_pairs$true_born_year.young[i]>0){  #if in unfished territory
              collapsed_pairs$prob_GGP[i]<- collapsed_pairs$prob_GGP[i] +
                OM$Naa[collapsed_pairs$true_born_year.young[i],k+1] *
                ((OM$Mat[k+1]*OM$Waa[k+1])/sum(OM$Naa[collapsed_pairs$true_born_year.young[i],]*OM$Mat*OM$Waa)) *
                ((OM$Mat[OM$lage+1]*OM$Waa[OM$lage+1])/(0.5*sum(OM$N0aa*OM$Mat*OM$Waa)))
              
            } else if((collapsed_pairs$true_born_year.young[i]-k)<1 & collapsed_pairs$true_born_year.young[i]<1){  #if in unfished territory
              collapsed_pairs$prob_GGP[i]<- collapsed_pairs$prob_GGP[i] +
                OM$N0aa[,k+1] *
                ((OM$Mat[k+1]*OM$Waa[k+1])/sum(OM$N0aa*OM$Mat*OM$Waa)) *
                ((OM$Mat[OM$lage+1]*OM$Waa[OM$lage+1])/(0.5*sum(OM$N0aa*OM$Mat*OM$Waa)))
            }
            
          }
        }
  #######Instead if the sample year of older is equal to the birth year of the potential parent 
        if(collapsed_pairs$samp_year.old[i]==(collapsed_pairs$true_born_year.young[i]-k)){
          #age of grandparent at year of parents birth must be positive 
          if(((collapsed_pairs$true_born_year.young[i]-k)-(collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i])) > 0 & ((collapsed_pairs$true_born_year.young[i]-k)-(collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i])) < (OM$lage+1)){ #if we're not in plus group, and age of grandparent at year of parents birth must be positive 
            
            if((collapsed_pairs$true_born_year.young[i]-k)>0 & collapsed_pairs$true_born_year.young[i]>0){  #if not in unfished territory
              
              #P(GGP)=2 * sum over parent ages (Naa[birth year of younger,age of potential parent] * Fec[age of potential parent at time of youngers birth]/SSB[birth year of younger] * Fec[age of grandparent at time of parents birth]/(0.5*SSB[year of potential parents birth]) )
              #So the birth year of the potential parent of the younger is the birth year of younger - age of parent at time of youngers birth
              #The age of the grandparent at the time of the parents birth is the birth year of the parent - the birth year of the grandparent
              collapsed_pairs$prob_GGP[i]<- collapsed_pairs$prob_GGP[i] + 0.5 *
                OM$Naa[collapsed_pairs$true_born_year.young[i],k+1] *
                ((OM$Mat[k+1]*OM$Waa[k+1])/sum(OM$Naa[collapsed_pairs$true_born_year.young[i],]*OM$Mat*OM$Waa)) *
                ((OM$Mat[(collapsed_pairs$true_born_year.young[i]-k)-(collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i])+1]*OM$Waa[(collapsed_pairs$true_born_year.young[i]-k)-(collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i])+1])/(0.5*sum(OM$Naa[collapsed_pairs$true_born_year.young[i]-k,]*OM$Mat*OM$Waa))) 
              
            } else if((collapsed_pairs$true_born_year.young[i]-k)<1 & collapsed_pairs$true_born_year.young[i]>0){  #if in unfished territory
              collapsed_pairs$prob_GGP[i]<- collapsed_pairs$prob_GGP[i] + 0.5 *
                OM$Naa[collapsed_pairs$true_born_year.young[i],k+1] *
                ((OM$Mat[k+1]*OM$Waa[k+1])/sum(OM$Naa[collapsed_pairs$true_born_year.young[i],]*OM$Mat*OM$Waa)) *
                ((OM$Mat[(collapsed_pairs$true_born_year.young[i]-k)-(collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i])+1]*OM$Waa[(collapsed_pairs$true_born_year.young[i]-k)-(collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i])+1])/(0.5*sum(OM$N0aa*OM$Mat*OM$Waa))) 
              
            } else if((collapsed_pairs$true_born_year.young[i]-k)<1 & collapsed_pairs$true_born_year.young[i]<1){  #if in unfished territory
              collapsed_pairs$prob_GGP[i]<- collapsed_pairs$prob_GGP[i] + 0.5 *
                OM$N0aa[,k+1] *
                ((OM$Mat[k+1]*OM$Waa[k+1])/sum(OM$N0aa*OM$Mat*OM$Waa)) *
                ((OM$Mat[(collapsed_pairs$true_born_year.young[i]-k)-(collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i])+1]*OM$Waa[(collapsed_pairs$true_born_year.young[i]-k)-(collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i])+1])/(0.5*sum(OM$N0aa*OM$Mat*OM$Waa))) 
            }
            
            #Now if we are in plus group territory. Same calcs just plus group
          } else if(((collapsed_pairs$true_born_year.young[i]-k)-(collapsed_pairs$true_born_year.young[i]-collapsed_pairs$true_age_diff[i])) > OM$lage){
            if((collapsed_pairs$true_born_year.young[i]-k)>0 & collapsed_pairs$true_born_year.young[i]>0){  #if not in unfished territory
              collapsed_pairs$prob_GGP[i]<- collapsed_pairs$prob_GGP[i] + 0.5 *
                OM$Naa[collapsed_pairs$true_born_year.young[i],k+1] *
                ((OM$Mat[k+1]*OM$Waa[k+1])/sum(OM$Naa[collapsed_pairs$true_born_year.young[i],]*OM$Mat*OM$Waa)) *
                ((OM$Mat[OM$lage+1]*OM$Waa[OM$lage+1])/(0.5*sum(OM$Naa[collapsed_pairs$true_born_year.young[i]-k,]*OM$Mat*OM$Waa))) 
            } else if((collapsed_pairs$true_born_year.young[i]-k)<1 & collapsed_pairs$true_born_year.young[i]>0){  #if in unfished territory
              collapsed_pairs$prob_GGP[i]<- collapsed_pairs$prob_GGP[i] + 0.5 *
                OM$Naa[collapsed_pairs$true_born_year.young[i],k+1] *
                ((OM$Mat[k+1]*OM$Waa[k+1])/sum(OM$Naa[collapsed_pairs$true_born_year.young[i],]*OM$Mat*OM$Waa)) *
                ((OM$Mat[OM$lage+1]*OM$Waa[OM$lage+1])/(0.5*sum(OM$N0aa*OM$Mat*OM$Waa))) 
              
            } else if((collapsed_pairs$true_born_year.young[i]-k)<1 & collapsed_pairs$true_born_year.young[i]<1){  #if in unfished territory
              collapsed_pairs$prob_GGP[i]<- collapsed_pairs$prob_GGP[i] + 0.5 *
                OM$N0aa[,k+1] *
                ((OM$Mat[k+1]*OM$Waa[k+1])/sum(OM$N0aa*OM$Mat*OM$Waa)) *
                ((OM$Mat[OM$lage+1]*OM$Waa[OM$lage+1])/(0.5*sum(OM$N0aa*OM$Mat*OM$Waa))) 
            }
            
          }
        }
      }
    }
  }
  
  #Multiplying by two for the probability of MGGP or PGGP
  collapsed_pairs$prob_GGP<-2*collapsed_pairs$prob_GGP
  
  collapsed_pairs$n_UP<-collapsed_pairs$n_HSPorGGP<-collapsed_pairs$n_POP<-NA
  for (m in 1:nrow(collapsed_pairs)){
   collapsed_pairs[m,c("n_UP","n_HSPorGGP","n_POP")]<-t(rmultinom(1, size=collapsed_pairs$times[m], prob=c(1-((collapsed_pairs$HSP_prob[m]+collapsed_pairs$prob_GGP[m])*pi_nu+collapsed_pairs$prob_POP[m]),(collapsed_pairs$HSP_prob[m]+collapsed_pairs$prob_GGP[m])*pi_nu,collapsed_pairs$prob_POP[m])))
  }
  
  #ordering the counts by coded year born and then the coded age difference (for data purposes)
  collapsed_pairs<-collapsed_pairs[order(collapsed_pairs$coded_born_year.young,collapsed_pairs$true_born_year.young,collapsed_pairs$true_age_diff),] 
  
  collapsed_data<-aggregate.data.frame(x=collapsed_pairs[,c("times", "n_UP", "n_HSPorGGP","n_POP")], by=list(collapsed_pairs$coded_born_year.young,collapsed_pairs$samp_year.old,collapsed_pairs$coded_age.young,collapsed_pairs$coded_age.old), FUN=sum)
  colnames(collapsed_data)<-c("coded_born_year.young", "samp_year.old","coded_age.young","coded_age.old","times", "n_UP", "n_HSPorGGP","n_POP")
  
  sim_vals <- list(samples = samples, pairs=pairs, pair_counts = collapsed_pairs, pair_data = collapsed_data[,c("coded_born_year.young", "samp_year.old","coded_age.young","coded_age.old","n_UP", "n_HSPorGGP","n_POP","times")])
    
  return(list(OM=OM,dat_seed=dat_seed,sd_catch=sd_catch,N_Comp_preCKMR=N_Comp_preCKMR,N_Comp_CKMR=N_Comp_CKMR,q_index=q_index,fyear_dat=fyear_dat,lyear_dat=lyear_dat,prop_ckmr=prop_ckmr,fyear_ckmr=fyear_ckmr,lyear_ckmr=lyear_ckmr,pi_nu=pi_nu,AE_mat=AE_mat,
  #            pair_counts=sim_vals$pair_counts, #too memory intensive to upload (and don't use for anything)
              Obs_Catch=Obs_Catch,
              Obs_Catch_Comp=Obs_Catch_Comp,
              Obs_Index_25=Obs_Index_25,
              Obs_Index_50=Obs_Index_50,
              #CKMR HSP data
              born_year_old=sim_vals$pair_data$samp_year.old-sim_vals$pair_data$coded_age.old, 
              n_ckmr=sim_vals$pair_data$times,
              k_ckmr_hsporggp=sim_vals$pair_data$n_HSPorGGP,
              #CKMR POP
              born_year_young=sim_vals$pair_data$coded_born_year.young, 
              k_ckmr_pop=sim_vals$pair_data$n_POP,
              samp_year_old=sim_vals$pair_data$samp_year.old,
              coded_age_young=sim_vals$pair_data$coded_age.young,
              coded_age_old=sim_vals$pair_data$coded_age.old  ))
}


#Fhigh is F that equals 0.85 MSY, as is flow

#Sardine, 0.425 is fmsy, fhigh is 0.7875, flow is 0.2037
#MSY 122577.8 (*0.85 = 104191.1), 
#1.7 is approx age at 50% maturity, making 3.733245 the generation time, as gen time = k+(1/(exp(M)-1))
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
#2.4 is approx age at 50% maturity, making 6.916656 the generation time, as gen time = k+(1/(exp(M)-1))
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
#Age at 50% maturity is 1.5, making generation time 6.02, as gen time = k+(1/(exp(M)-1))
#sum((Cod_runs[[1]]$lxo*Cod_runs[[1]]$Mat*Cod_runs[[1]]$Waa)/sum(Cod_runs[[1]]$lxo*Cod_runs[[1]]$Mat*Cod_runs[[1]]$Waa)*0:25)
#same as weighted.mean(0:25,w=(Cod_runs[[1]]$lxo*Cod_runs[[1]]$Mat*Cod_runs[[1]]$Waa)/sum(Cod_runs[[1]]$lxo*Cod_runs[[1]]$Mat*Cod_runs[[1]]$Waa))
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

#SSB plots
par(mfrow=c(3,3), oma=c(3,2,1,1), mar=c(2,4,1,1))
plot(1:101,rowSums(t(t(Cod_runs[[1]]$Naa)*Cod_runs[[1]]$Mat)), ylim=c(0,8e8), las=1, xlab="", ylab="", main="Cod", type="l", col="grey50", xaxt="n")
mtext(text="Spawning Abundance",side=2, line=4)
Cod_Sabun<-matrix(NA, nrow=Nsim,ncol=101)
Cod_Sabun[1,]<-rowSums(t(t(Cod_runs[[1]]$Naa)*Cod_runs[[1]]$Mat))
for(s in 2:Nsim){  
  lines(1:101,rowSums(t(t(Cod_runs[[s]]$Naa)*Cod_runs[[s]]$Mat)), col="grey50")
  Cod_Sabun[s,]<-rowSums(t(t(Cod_runs[[s]]$Naa)*Cod_runs[[s]]$Mat))
}
plot(1:101,rowSums(t(t(Flatfish_runs[[1]]$Naa)*Flatfish_runs[[1]]$Mat)), ylim=c(0,2.5e5), las=1, xlab="", ylab="", main="Flatfish", type="l", col="grey50", xaxt="n")
Flatfish_Sabun<-matrix(NA, nrow=Nsim,ncol=101)
Flatfish_Sabun[1,]<-rowSums(t(t(Flatfish_runs[[1]]$Naa)*Flatfish_runs[[1]]$Mat))
for(s in 2:Nsim){  
  lines(1:101,rowSums(t(t(Flatfish_runs[[s]]$Naa)*Flatfish_runs[[s]]$Mat)), col="grey50")
  Flatfish_Sabun[s,]<-rowSums(t(t(Flatfish_runs[[s]]$Naa)*Flatfish_runs[[s]]$Mat))
}
plot(1:101,rowSums(t(t(Sardine_runs[[1]]$Naa)*Sardine_runs[[1]]$Mat)), ylim=c(0,4e7), las=1, xlab="", ylab="", main="Sardine", type="l", col="grey50", xaxt="n")
Sardine_Sabun<-matrix(NA, nrow=Nsim,ncol=101)
Sardine_Sabun[1,]<-rowSums(t(t(Sardine_runs[[1]]$Naa)*Sardine_runs[[1]]$Mat))
for(s in 2:Nsim){ 
  lines(1:101,rowSums(t(t(Sardine_runs[[s]]$Naa)*Sardine_runs[[s]]$Mat)), col="grey50")
  Sardine_Sabun[s,]<-rowSums(t(t(Sardine_runs[[s]]$Naa)*Sardine_runs[[s]]$Mat))
}
plot(1:101,apply(Cod_Sabun,2,quantile,probs=0.975), type="l", lty=2, ylim=c(0,8e8), las=1, xlab="", ylab="", main="", xaxt="n")
mtext(text="Spawning Abundance",side=2, line=4)
lines(1:101,apply(Cod_Sabun,2,median),lty=1)
lines(1:101,apply(Cod_Sabun,2,quantile,probs=0.025),lty=2)
lines(1:101,apply(Cod_Sabun,2,quantile,probs=0.875),lty=3)
lines(1:101,apply(Cod_Sabun,2,quantile,probs=0.125),lty=3)

plot(1:101,apply(Flatfish_Sabun,2,quantile,probs=0.975), type="l", lty=2, ylim=c(0,2.5e5), las=1, xlab="", ylab="", main="", xaxt="n")
mtext(text="",side=1, line=3)
lines(1:101,apply(Flatfish_Sabun,2,median),lty=1)
lines(1:101,apply(Flatfish_Sabun,2,quantile,probs=0.025),lty=2)
lines(1:101,apply(Flatfish_Sabun,2,quantile,probs=0.875),lty=3)
lines(1:101,apply(Flatfish_Sabun,2,quantile,probs=0.125),lty=3)
legend("top", c("Median","Inner 75%","Inner 95%"), lwd=1, lty=c(1,3,2))

plot(1:101,apply(Sardine_Sabun,2,quantile,probs=0.975), type="l", lty=2, ylim=c(0,4e7), las=1, xlab="", ylab="", main="", xaxt="n")
lines(1:101,apply(Sardine_Sabun,2,median),lty=1)
lines(1:101,apply(Sardine_Sabun,2,quantile,probs=0.025),lty=2)
lines(1:101,apply(Sardine_Sabun,2,quantile,probs=0.875),lty=3)
lines(1:101,apply(Sardine_Sabun,2,quantile,probs=0.125),lty=3)

# #Now Depletion
# plot(1:101,Cod_runs[[1]]$SSB/Cod_runs[[1]]$SSB0, ylim=c(0,2.75), las=1, xlab="", ylab="", main="", type="l", col="grey50", xaxt="n")
# mtext(text="SSB/SSB0",side=2, line=4)
# Cod_Depl<-matrix(NA, nrow=Nsim,ncol=101)
# Cod_Depl[1,]<-Cod_runs[[1]]$SSB/Cod_runs[[1]]$SSB0
# for(s in 2:Nsim){
#   Cod_Depl[s,]<-Cod_runs[[s]]$SSB/Cod_runs[[s]]$SSB0
#   lines(1:101,Cod_runs[[s]]$SSB/Cod_runs[[s]]$SSB0, col="grey50")
# }
# plot(1:101,Flatfish_runs[[1]]$SSB/Flatfish_runs[[1]]$SSB0, ylim=c(0,2.75), las=1, xlab="", ylab="", main="", type="l", col="grey50", xaxt="n")
# Flatfish_Depl<-matrix(NA, nrow=Nsim,ncol=101)
# Flatfish_Depl[1,]<-Flatfish_runs[[1]]$SSB/Flatfish_runs[[1]]$SSB0
# for(s in 2:Nsim){
#   Flatfish_Depl[s,]<-Flatfish_runs[[s]]$SSB/Flatfish_runs[[s]]$SSB0
#   lines(1:101,Flatfish_runs[[s]]$SSB/Flatfish_runs[[s]]$SSB0, col="grey50")
# }
# plot(1:101,Sardine_runs[[1]]$SSB/Sardine_runs[[1]]$SSB0, ylim=c(0,2.75), las=1, xlab="", ylab="", main="", type="l", col="grey50", xaxt="n")
# Sardine_Depl<-matrix(NA, nrow=Nsim,ncol=101)
# Sardine_Depl[1,]<-Sardine_runs[[1]]$SSB/Sardine_runs[[1]]$SSB0
# for(s in 2:Nsim){
#   Sardine_Depl[s,]<-Sardine_runs[[s]]$SSB/Sardine_runs[[s]]$SSB0
#   lines(1:101,Sardine_runs[[s]]$SSB/Sardine_runs[[s]]$SSB0, col="grey50")
# }
#Ok looking at some CIs of the intervals
plot(1:101,apply(Cod_Depl,2,quantile,probs=0.975), type="l", lty=2, ylim=c(0,2), las=1, xlab="", ylab="", main="")
mtext(text="SSB/SSB0",side=2, line=4)
lines(1:101,apply(Cod_Depl,2,median),lty=1)
lines(1:101,apply(Cod_Depl,2,quantile,probs=0.025),lty=2)
lines(1:101,apply(Cod_Depl,2,quantile,probs=0.875),lty=3)
lines(1:101,apply(Cod_Depl,2,quantile,probs=0.125),lty=3)

plot(1:101,apply(Flatfish_Depl,2,quantile,probs=0.975), type="l", lty=2, ylim=c(0,2), las=1, xlab="", ylab="", main="")
mtext(text="Year",side=1, line=3)
lines(1:101,apply(Flatfish_Depl,2,median),lty=1)
lines(1:101,apply(Flatfish_Depl,2,quantile,probs=0.025),lty=2)
lines(1:101,apply(Flatfish_Depl,2,quantile,probs=0.875),lty=3)
lines(1:101,apply(Flatfish_Depl,2,quantile,probs=0.125),lty=3)
legend("top", c("Median","Inner 75%","Inner 95%"), lwd=1, lty=c(1,3,2))

plot(1:101,apply(Sardine_Depl,2,quantile,probs=0.975), type="l", lty=2, ylim=c(0,2), las=1, xlab="", ylab="", main="")
lines(1:101,apply(Sardine_Depl,2,median),lty=1)
lines(1:101,apply(Sardine_Depl,2,quantile,probs=0.025),lty=2)
lines(1:101,apply(Sardine_Depl,2,quantile,probs=0.875),lty=3)
lines(1:101,apply(Sardine_Depl,2,quantile,probs=0.125),lty=3)

######################################
#Example of Getting Data from OMs
######################################
N_sim<-1
Cod_wdat<-Flatfish_wdat<-Sardine_wdat<-list()
#N_comp_preCKMR<-100
N_comp_preCKMR<-c(30,rep(0,9),40,rep(0,9),50,rep(0,4),60,rep(0,4),70,rep(0,4),80,rep(0,4),90,rep(0,4),rep(100,30))
N_comp_CKMR<-100
sd_catch<-0.05
sd_index<-0.5
fyear_dat<-26
lyear_dat<-100
prop_ckmr<-1
fyear_ckmr<-81
lyear_ckmr<-100
pi_nu<-0.736
progress_bar<-TRUE
for (s in 1:N_sim){
  Cod_wdat[[s]]     <-Get_Data(OM=Cod_runs[[s]],     dat_seed=s,fyear_dat=fyear_dat,lyear_dat=lyear_dat,sd_catch=sd_catch,N_Comp_preCKMR=N_comp_preCKMR,N_Comp_CKMR=N_comp_CKMR,q_index=0.0001,sd_index=sd_index,prop_ckmr=prop_ckmr,fyear_ckmr=fyear_ckmr,lyear_ckmr=lyear_ckmr,pi_nu=pi_nu,AE_mat=AEs[[1]])
  Flatfish_wdat[[s]]<-Get_Data(OM=Flatfish_runs[[s]],dat_seed=s,fyear_dat=fyear_dat,lyear_dat=lyear_dat,sd_catch=sd_catch,N_Comp_preCKMR=N_comp_preCKMR,N_Comp_CKMR=N_comp_CKMR,q_index=0.0001,sd_index=sd_index,prop_ckmr=prop_ckmr,fyear_ckmr=fyear_ckmr,lyear_ckmr=lyear_ckmr,pi_nu=pi_nu,AE_mat=AEs[[2]])
  Sardine_wdat[[s]] <-Get_Data(OM=Sardine_runs[[s]], dat_seed=s,fyear_dat=fyear_dat,lyear_dat=lyear_dat,sd_catch=sd_catch,N_Comp_preCKMR=N_comp_preCKMR,N_Comp_CKMR=N_comp_CKMR,q_index=0.0001,sd_index=sd_index,prop_ckmr=prop_ckmr,fyear_ckmr=fyear_ckmr,lyear_ckmr=lyear_ckmr,pi_nu=pi_nu,AE_mat=AEs[[3]])
  if(progress_bar==TRUE){
    plot(rep(1,length(1:s)), pch=16)
  }
}

#save(Cod_wdat,     file=paste0(wd,     "/Cod_wdat_N200_Ind50_ckmr25_1.RData"))
#save(Flatfish_wdat,file=paste0(wd,"/Flatfish_wdat_N200_Ind50_ckmr25_1.RData"))
#save(Sardine_wdat, file=paste0(wd, "/Sardine_wdat_N200_Ind50_ckmr25_1.RData"))

#####################################################################
#Example of TMB SCAAs fit to Fishery data without CKMR (Base models)
#####################################################################

load(paste0(wd,"/Cod_wdat_N100_Ind25_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N100_Ind25_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Sardine_wdat_N100_Ind25_ckmrmultinom20_1.RData"))

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
              Lamda_Harvest=1,                           #Switch for whether to use a data source or not, 0=no, 1=yes
              Lamda_Comp=1,
              Lamda_Index=1)
    
    #Parameters
    set.seed(s)
    par <- list(log_M=log(runif(1,min=OM$OM$Mref-OM$OM$Mref*0.5,max=OM$OM$Mref+OM$OM$Mref*0.5)),
                log_q=log(runif(1,min=OM$q_index-OM$q_index*0.5,max=OM$q_index+OM$q_index*0.5)),
                log_recruit_devs_init=rep(0,dat$lage),
                log_recruit_devs=rep(0,dat$lyear),
                steepness=OM$OM$h,
                log_R0=log(runif(1,min=OM$OM$R0-OM$OM$R0*0.5,max=OM$OM$R0+OM$OM$R0*0.5)),
                log_sigma_rec=log(OM$OM$sd_rec),
                log_sd_catch=log(OM$sd_catch),
                log_sd_index=log(OM$sd_index),
                Sel_logis_k=log(runif(1,min=OM$OM$Sel_slope-OM$OM$Sel_slope*0.5,max=OM$OM$Sel_slope+OM$OM$Sel_slope*0.5)),
                Sel_logis_midpt=log(runif(1,min=OM$OM$Sel_50-OM$OM$Sel_50*0.5,max=OM$OM$Sel_50+OM$OM$Sel_50*0.5)),
                log_fint=log(runif(length(OM$OM$F_int[26:100]),min=OM$OM$F_int[26:100]-OM$OM$F_int[26:100]*0.5,max=OM$OM$F_int[26:100]+OM$OM$F_int[26:100]*0.5)))  
    
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
    print(c(Q,s))
  }
}

#saveRDS(res_list[[1]], file=paste0(wd,"/SCAAfit_Cod_N100_Ind25_20yrs_noCKMR.RData"))
#saveRDS(res_list[[2]], file=paste0(wd,"/SCAAfit_Flatfish_N100_Ind25_20yrs_noCKMR.RData"))
#saveRDS(res_list[[3]], file=paste0(wd,"/SCAAfit_Sardine_N100_Ind25_20yrs_noCKMR.RData"))

###############################################
######################################
#Example of TMB Model with both HSP and POP
######################################
###############################################

#Ncomp 100, sdindex 0.25, ckmr 20 years
load(paste0(wd,"/Cod_wdat_N100_Ind25_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N100_Ind25_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Sardine_wdat_N100_Ind25_ckmrmultinom20_1.RData"))

Cod_OM<-Cod_wdat
Flatfish_OM<-Flatfish_wdat
Sardine_OM<-Sardine_wdat

#TMB Section
library(TMB)

setwd(wd)
#Compile and load model 
compile("CKMRmultinom_HSP_and_POP_Fisch_wAge0.cpp")

N_sim<-1:100
res_list<-list()
for (Q in 1:3){  #Running through the life history types
  res_list[[Q]]<-list()
  for (s in N_sim){
    
    if(Q==1){
      OM<-Cod_OM[[s]]
      gen_time<-1.51
    } else if (Q==2){
      OM<-Flatfish_OM[[s]]
      gen_time<-2.4
    }else if (Q==3){
      OM<-Sardine_OM[[s]]
      gen_time<-1.7
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
              gen_time=gen_time,
              #CKMR 
              born_year_old=OM$born_year_old-(OM$fyear_dat-1),
              age_diff=OM$age_diff,
              n_ckmr=OM$n_ckmr,
              k_ckmr_hsporggp=OM$k_ckmr_hsporggp,
              born_year_young=OM$born_year_young-(OM$fyear_dat-1), 
              k_ckmr_pop=OM$k_ckmr_pop,
              samp_year_old=OM$samp_year_old-(OM$fyear_dat-1),
              #Switch for whether to use a data source or not, 0=no, 1=yes
              Lamda_Harvest=1,
              Lamda_Comp=1,
              Lamda_Index=1,
              Lamda_CKMR=1)
    
    #Parameters
    set.seed(s)
    par <- list(log_M=log(runif(1,min=OM$OM$Mref-OM$OM$Mref*0.5,max=OM$OM$Mref+OM$OM$Mref*0.5)),
                log_q=log(runif(1,min=OM$q_index-OM$q_index*0.5,max=OM$q_index+OM$q_index*0.5)),
                log_recruit_devs_init=rep(0,dat$lage),
                log_recruit_devs=rep(0,dat$lyear),
                steepness=OM$OM$h,
                log_R0=log(runif(1,min=OM$OM$R0-OM$OM$R0*0.5,max=OM$OM$R0+OM$OM$R0*0.5)),
                log_sigma_rec=log(OM$OM$sd_rec),
                log_sd_catch=log(OM$sd_catch),
                log_sd_index=log(OM$sd_index),
                Sel_logis_k=log(runif(1,min=OM$OM$Sel_slope-OM$OM$Sel_slope*0.5,max=OM$OM$Sel_slope+OM$OM$Sel_slope*0.5)),
                Sel_logis_midpt=log(runif(1,min=OM$OM$Sel_50-OM$OM$Sel_50*0.5,max=OM$OM$Sel_50+OM$OM$Sel_50*0.5)),
                log_fint=log(runif(length(OM$OM$F_int[26:100]),min=OM$OM$F_int[26:100]-OM$OM$F_int[26:100]*0.5,max=OM$OM$F_int[26:100]+OM$OM$F_int[26:100]*0.5)))  
    
    dyn.load(dynlib("CKMRmultinom_HSP_and_POP_Fisch_wAge0"))
    
    parm_names<-names(MakeADFun(dat, par, DLL="CKMRmultinom_HSP_and_POP_Fisch_wAge0")$par)
    
    fixed<-list(steepness=factor(NA),
                log_sd_catch=factor(NA),
                log_sd_index=factor(NA))
    
    lower_bounds<-c(-5,-20,rep(-10,dat$lage),rep(-10,dat$lyear), 0, 5, -5,-5,-5,-5,-5,rep(-10,dat$lyear))
    upper_bounds<-c( 2,  1,rep( 10,dat$lage),rep( 10,dat$lyear), 1, 25, 2, 2, 2, 5, 5,rep(  0,dat$lyear))
    
    reffects=c("log_recruit_devs","log_recruit_devs_init")
    l<-lower_bounds[-which(parm_names %in% c(names(fixed),reffects))]
    u<-upper_bounds[-which(parm_names %in% c(names(fixed),reffects))]
    
    SCAA <- MakeADFun(dat, par, DLL="CKMRmultinom_HSP_and_POP_Fisch_wAge0", map=fixed, random=reffects)
    SCAA_fit <- TMBhelper::fit_tmb(obj=SCAA, startpar=SCAA$par, lower=l, upper=u, newtonsteps=1, getsd=TRUE,bias.correct=TRUE,getHessian=TRUE)
    
    res_list[[Q]][[s]]<-SCAA_fit
    print(c(Q,s))
  }
}

#saveRDS(res_list[[1]], file=paste0(wd,"/SCAAfit_Cod_N100_Ind25_ckmrmultinom20.RData"))
#saveRDS(res_list[[2]], file=paste0(wd,"/SCAAfit_Flatfish_N100_Ind25_ckmrmultinom20.RData"))
#saveRDS(res_list[[3]], file=paste0(wd,"/SCAAfit_Sardine_N100_Ind25_ckmrmultinom20.RData"))





#Exploratory OMs with Dome-shaped selectivity


###########################################
#Dome Shaped Selectivity on OM
###########################################

SimPop_Dome<-function(seed=1,
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
                 B1=3.5,
                 B2=-4,
                 B3=4,
                 B4=0.2,
                 B5=0.02,
                 B6=0.7,
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
  age<-fage:lage
  Amin<-fage
  Amax<-lage

  #functions
  peak2<-B1+1+((0.99*Amax-B1-1)/(1+exp(-B2)))
  t1<-exp(-(Amin-B1)^2/exp(B3))
  t2<-exp(-(Amax-peak2)^2/exp(B4))
  
  j1<-(1+exp(-20*((age-B1)/(1+abs(age-B1)))))^-1
  j2<-(1+exp(-20*((age-peak2)/(1+abs(age-peak2)))))^-1
  
  #Long form
  asc<-(1+exp(-B5))^-1+(1-(1+exp(-B5))^-1)*((exp(-(age-B1)^2/exp(B3))-t1)/(1-t1))
  dsc<-1+(((1+exp(-B6))^-1)-1)*((exp(-(age-peak2)/exp(B4))-1)/(t2-1))
  
  #Actual Sel
  Sel<-asc*(1-j1)+j1*((1-j2)+j2*dsc)
  Sel<-Sel/max(Sel)
  
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
              Mat_50=Mat_50,Mat_slope=Mat_slope,B1=B1,B2=B2,B3=B3,B4=B4,B5=B5,B6=B6,R0=R0,h=h,sd_rec=sd_rec,fint=fint,fhigh=fhigh,flow=flow,stochastic=stochastic,
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


#Sardine, 0.425 is fmsy, fhigh is 0.7875, flow is 0.2037
#MSY 122577.8 (*0.85 = 104191.1)
Nsim<-100
Sardine_Dome_runs<-list()
for (s in 1:Nsim){
  Sardine_Dome_runs[[s]]<-SimPop_Dome(seed=s,fage=0,lage=15,fyear=1,lyear=100,
                            Linf=25,
                            a3=0.5,
                            L1=10,
                            BK=0.4,
                            Weight_scaling=1.7e-5,
                            Weight_allometry=2.9,
                            Mref=0.4,
                            Mat_50=15.9,
                            Mat_slope=-0.9,
                            B1=2.5620178,
                            B2=-0.7837787,
                            B3=-0.1770974,
                            B4=0.3569738,
                            B5=-6.3504313,
                            B6=0.6924779,
                            R0=exp(16),
                            h=0.59,
                            sd_rec=0.73,
                            const_F=FALSE,
                            fint=0.25,
                            fhigh=0.78, 
                            flow=0.2075,
                            stochastic=TRUE)
}

#For Flatfish, fmsy is 0.27, MSY is 5240.563 (*0.85= 4454.479), and fhigh which reaches 0.85*MSY is 0.5425, flow is 0.1259
Flatfish_Dome_runs<-list()
for (s in 1:Nsim){
  Flatfish_Dome_runs[[s]]<-SimPop_Dome(seed=s,
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
                             B1=3.5640193,
                             B2=-0.9683777,
                             B3=0.6786179,
                             B4=0.4179561,
                             B5=-5.6397411,
                             B6=0.6920124,
                             R0=exp(10.5),
                             h=0.76,
                             sd_rec=0.7,
                             const_F=FALSE,
                             fint=0.25,
                             fhigh=0.5375, 
                             flow=0.12, 
                             stochastic=TRUE)
}

#For Cod, fmsy is 0.12, MSY is 160865265 (*0.85=136735475), f that reaches 0.85*MSY is 0.20284, flow is 0.06232
Cod_Dome_runs<-list()
for (s in 1:Nsim){
  Cod_Dome_runs[[s]]<-SimPop_Dome(seed=s,
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
                        B1=2.1734853,
                        B2=-0.7235318,
                        B3=-0.4950544,
                        B4=0.3445215,
                        B5=-5.1449292,
                        B6=0.6926436,
                        R0=exp(18.7),
                        h=0.65,
                        sd_rec=0.4,
                        const_F=FALSE,
                        fint=0.25,
                        fhigh=0.2, 
                        flow=0.0605, 
                        stochastic=TRUE)
}

#save(Cod_Dome_runs, file=paste0(wd,"/Cod_Dome.RData"))
#save(Flatfish_Dome_runs, file=paste0(wd,"/Flatfish_Dome.RData"))
#save(Sardine_Dome_runs, file=paste0(wd,"/Sardine_Dome.RData"))

Cod_N<-matrix(NA, nrow=Nsim,ncol=101)
Cod_Dome_N<-matrix(NA, nrow=Nsim,ncol=101)
Flatfish_N<-matrix(NA, nrow=Nsim,ncol=101)
Flatfish_Dome_N<-matrix(NA, nrow=Nsim,ncol=101)
Sardine_N<-matrix(NA, nrow=Nsim,ncol=101)
Sardine_Dome_N<-matrix(NA, nrow=Nsim,ncol=101)
for(s in 1:Nsim){
  Cod_N[s,26:101]<-rowSums(t(t(Cod_runs[[s]]$Naa[26:101,])*Cod_runs[[s]]$Sel))
  Cod_Dome_N[s,26:101]<-rowSums(t(t(Cod_Dome_runs[[s]]$Naa[26:101,])*Cod_Dome_runs[[s]]$Sel))
  
  Flatfish_N[s,26:101]<-rowSums(t(t(Flatfish_runs[[s]]$Naa[26:101,])*Flatfish_runs[[s]]$Sel))
  Flatfish_Dome_N[s,26:101]<-rowSums(t(t(Flatfish_Dome_runs[[s]]$Naa[26:101,])*Flatfish_Dome_runs[[s]]$Sel))

  Sardine_N[s,26:101]<-rowSums(t(t(Sardine_runs[[s]]$Naa[26:101,])*Sardine_runs[[s]]$Sel))
  Sardine_Dome_N[s,26:101]<-rowSums(t(t(Sardine_Dome_runs[[s]]$Naa[26:101,])*Sardine_Dome_runs[[s]]$Sel))
}

vioplot((Cod_Dome_N[,26:101]-Cod_N[,26:101])/Cod_N[,26:101], ylim=c())
abline(h=0, lty=2)
vioplot((Flatfish_Dome_N[,26:101]-Flatfish_N[,26:101])/Flatfish_N[,26:101], ylim=c())
abline(h=0, lty=2)
vioplot((Sardine_Dome_N[,26:101]-Sardine_N[,26:101])/Sardine_N[,26:101], ylim=c())
abline(h=0, lty=2)



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


##########################################
#Deterministic to check calculations
##########################################
par <- list(log_M=log(OM$OM$Mref),
            log_q=log(OM$q_index),
            log_recruit_devs_init=OM$OM$lrecdevs[(25-(OM$OM$lage-1)):25],
            log_recruit_devs=OM$OM$lrecdevs[26:100],
            steepness=OM$OM$h,
            log_R0=log(OM$OM$R0),
            log_sigma_rec=log(OM$OM$sd_rec),
            log_sd_catch=log(OM$sd_catch),
            log_sd_index=log(OM$sd_index),
            Sel_logis_k=log(OM$OM$Sel_slope),
            Sel_logis_midpt=log(OM$OM$Sel_50),
            log_fint=log(OM$OM$F_int[26:100]))


