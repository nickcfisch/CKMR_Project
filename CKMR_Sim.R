#####################################################
#Population Simulations for each Life-history type
#####################################################

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
Maa<-Mref*(Laa/(Linf*0.75))^-1
#Maa<-rep(Mref,length(fage:lage))    #Constant M

#Maturity
Mat<-1/(1+exp(Mat_slope*(Laa-Mat_50)))

#Fishery Selectivity 
Sel<-1/(1+exp(-Sel_slope*(Laa-Sel_50)))
Sel<-Sel/max(Sel)

#Fishing intensity, starts in year 25
k_int<-0.15
mid_int<-20
F_int<-NA
#F_int[fyear:lyear]<-fint
F_int[fyear:25]<-0
F_int[26:85]<-fhigh/length(26:85)*(1:length(26:85))
F_int[86:lyear]<-F_int[85]+(flow-fhigh)/length(86:lyear)*(1:length(86:lyear))

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

for(i in fyear:lyear){
  Faa[i,]<-F_int[i]*Sel
  Zaa[i,]<-Maa+Faa[i,]
  for(j in 1:lage){
    Naa[i+1,j+1]<-Naa[i,j]*exp(-Zaa[i,j])
  }
  Naa[i+1,lage+1]<-Naa[i+1,lage+1]+Naa[i,lage+1]*exp(-Zaa[i,lage+1]) #plus group
  
  SSB[i+1] <- sum(Naa[i+1,]*Mat*Waa, na.rm=TRUE)
  if (stochastic==TRUE){
   Naa[i+1,1] <- (4*h*R0*SSB[i+1])/(SSB0*(1-h)+SSB[i+1]*(5*h-1))*exp(rnorm(n=1,mean=0, sd=sd_rec)-0.5*sd_rec^2)
#   Naa[i+1,1] <- rlnorm(n=1,meanlog=log((4*h*R0*SSB[i+1])/(SSB0*(1-h)+SSB[i+1]*(5*h-1))), sdlog=sd_rec)
  } else {
   Naa[i+1,1] <- (4*h*R0*SSB[i+1])/(SSB0*(1-h)+SSB[i+1]*(5*h-1))
  }
}

Caa<-Faa/Zaa*Naa[1:lyear,]*(1-exp(-Zaa))

return(list(fage=fage,lage=lage,seed=seed,fyear=fyear,lyear=lyear,Linf=Linf,a3=a3,L1=L1,BK=BK,Weight_scaling=Weight_scaling,Weight_allometry=Weight_allometry,Mref=Mref,
            Mat_50=Mat_50,Mat_slope=Mat_slope,Sel_50=Sel_50,Sel_slope=Sel_slope,R0=R0,h=h,sd_rec=sd_rec,fint=fint,fhigh=fhigh,flow=flow,stochastic=stochastic,
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

#To get fmsy and stuff
#Tot_Yield=sum(t(t(Caa)*Waa))      Yield_TermYr=sum(Caa[lyear,]*Waa))


Get_Data<-function(OM=NA,              #Operating model from which to model
                   dat_seed=1,
                   sd_catch=0.05,
                   N_Comp=100,
                   q_index=0.0001,
                   sd_index=0.25){

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

#Sardine, 0.33 is fmsy for Sardine, fhigh is 0.6021535, flow is 0.16
#MSY 46304.48 (*0.85 = 39358.81)
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
   fhigh=0.6021535, 
   flow=0.16,
   stochastic=TRUE)
}

#For Flatfish, fmsy is 0.25, MSY is 1596.706 (*0.85= 1357.2), and fhigh which reaches 0.85*MSY is 0.516, flow is 0.11
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
   fhigh=0.516, 
   flow=0.11, 
   stochastic=TRUE)
}

#For Cod, fmsy is 0.11, MSY is 8119380 (*0.85=6901473), f that reaches 0.85*MSY is 0.1981, flow is 0.05825
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
   fhigh=0.1981, 
   flow=0.05825, 
   stochastic=TRUE)
}


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

#Then CKMR
