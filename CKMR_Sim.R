#####################################################
#Population Simulations for each Life-history type
#####################################################

#Still need to save population output
SimPop<-function(seed=i,
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
                 stochastic=TRUE){            #log scale rec sd

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
  Naa[i+1,lage+1]<-Naa[i+1,lage+1]+Naa[i,lage+1]*exp(-(Maa[lage+1]+Faa[i,lage+1])) #plus group
  
  SSB[i+1] <- sum(Naa[i+1,]*Mat*Waa, na.rm=TRUE)
  if (stochastic==TRUE){
#  Naa[i+1,1] <- (4*h*R0*SSB[i+1])/(SSB0*(1-h)+SSB[i+1]*(5*h-1))*exp(rnorm(1,mean=0, sd=sd_rec))
   Naa[i+1,1] <- rlnorm(n=1,meanlog=log((4*h*R0*SSB[i+1])/(SSB0*(1-h)+SSB[i+1]*(5*h-1))), sdlog=sd_rec)
  } else {
   Naa[i+1,1] <- (4*h*R0*SSB[i+1])/(SSB0*(1-h)+SSB[i+1]*(5*h-1))
  }
}

Caa<-Faa/Zaa*Naa[1:lyear,]*(1-exp(-Zaa))

#Now saving everything
#print(list(Tot_Yield=sum(t(t(Caa)*Waa)), Yield_TermYr=sum(Caa[lyear,]*Waa)))
print(F_int)
}

#Fhigh is F that equals 0.85 MSY, as is flow

#Sardine, 0.33 is fmsy for Sardine, fhigh is 0.6021535, flow is 0.16
#MSY 46304.48 (*0.85 = 39358.81)
for (i in 1:100){
SimPop(seed=i,fage=0,lage=15,fyear=1,lyear=100,
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
       stochastic=FALSE)
}

#For Flatfish, fmsy is 0.25, MSY is 1596.706 (*0.85= 1357.2), and fhigh which reaches 0.85*MSY is 0.516, flow is 0.11
for (i in 1:100){
  SimPop(seed=i,
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
       stochastic=FALSE)
}

#For Cod, fmsy is 0.11, MSY is 8119380 (*0.85=6901473), f that reaches 0.85*MSY is 0.1981, flow is 0.05825
  for (i in 1:100){
    SimPop(seed=i,
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
       stochastic=FALSE)
}

#Function for regular data gathering 



#Then CKMR
