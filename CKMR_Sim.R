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
                   sd_catch=0.05,
                   N_Comp=100,
                   q_index=0.0001,
                   sd_index=0.25, sd){

  set.seed(dat_seed)
  #Getting Data
  Obs_Catch<-Obs_Index<-NA
  Obs_Catch_Comp<-matrix(NA,nrow=75,ncol=length(OM$fage:OM$lage))
  for (d in 26:100){
    Obs_Catch[d-25]<-rlnorm(1, meanlog=log(sum(OM$Caa[d,]*OM$Waa)), sdlog=sd_catch)
    Obs_Catch_Comp[d-25,]<-rmultinom(n=1,size=N_Comp, prob=OM$Caa[d,])
    Obs_Index[d-25]<-rlnorm(1, meanlog=log(sum(OM$Naa[d,]*((1-exp(-OM$Zaa[d,]))/OM$Zaa[d,])*OM$Sel*OM$Waa)*q_index), sdlog=sd_index)
  }

  return(list(OM=OM,dat_seed=dat_seed,sd_catch=sd_catch,N_Comp=N_Comp,q_index=q_index,sd_index=sd_index,
              Obs_Catch=Obs_Catch,
              Obs_Catch_Comp=Obs_Catch_Comp,
              Obs_Index=Obs_Index))
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
sd_index<-0.25
for (s in 1:N_sim){
 Cod_wdat[[s]] <-    Get_Data(OM=Cod_runs[[s]],     dat_seed=s,sd_catch=sd_catch,N_Comp=N_comp,q_index=0.0001,sd_index=sd_index)
 Flatfish_wdat[[s]]<-Get_Data(OM=Flatfish_runs[[s]],dat_seed=s,sd_catch=sd_catch,N_Comp=N_comp,q_index=0.0001,sd_index=sd_index)
 Sardine_wdat[[s]]<- Get_Data(OM=Sardine_runs[[s]], dat_seed=s,sd_catch=sd_catch,N_Comp=N_comp,q_index=0.0001,sd_index=sd_index)
}

#save(Cod_wdat, file=paste0(wd,"/Cod_wdat_N1000_Ind25.RData"))
#save(Flatfish_wdat, file=paste0(wd,"/Flatfish_wdat_N1000_Ind25.RData"))
#save(Sardine_wdat, file=paste0(wd,"/Sardine_wdat_N1000_Ind25.RData"))

#############################################################
#TMB SCAAs fit to Fishery data without CKMR (Base models)
#############################################################

load(paste0(wd,"/Cod_wdat_N100_Ind25.RData"))
load(paste0(wd,"/Flatfish_wdat_N100_Ind25.RData"))
load(paste0(wd,"/Sardine_wdat_N100_Ind25.RData"))

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
  par <- list(log_M=log(jitter(OM$OM$Mref, factor=jfactor)),
              log_q=log(jitter(OM$q_index, factor=jfactor)),
              log_recruit_devs_init=rep(0,dat$lage),
              log_recruit_devs=rep(0,dat$lyear),
              steepness=OM$OM$h,
              log_R0=log(jitter(OM$OM$R0, factor=jfactor)),
              log_sigma_rec=log(OM$OM$sd_rec),
              log_sd_catch=log(OM$sd_catch),
              log_sd_index=log(OM$sd_index),
              Sel_logis_k=jitter(log(OM$OM$Sel_slope), factor=jfactor),
              Sel_logis_midpt=jitter(log(OM$OM$Sel_50), factor=jfactor),
              log_fint=log(jitter(OM$OM$F_int[26:100], factor=jfactor)))  
  
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
  SCAA_fit <- TMBhelper::fit_tmb(obj=SCAA, startpar=SCAA$par, lower=l, upper=u, getsd=TRUE,bias.correct=TRUE,getHessian=TRUE)
  
  res_list[[Q]][[s]]<-SCAA_fit
 }
}

#saveRDS(res_list[[1]], file=paste0(wd,"/SCAAfit_Cod_N100_Ind25.RData"))
#saveRDS(res_list[[2]], file=paste0(wd,"/SCAAfit_Flatfish_N100_Ind25.RData"))
#saveRDS(res_list[[3]], file=paste0(wd,"/SCAAfit_Sardine_N100_Ind25.RData"))

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
