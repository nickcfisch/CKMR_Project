#Runcode

require(TMB)
source("/blue/edvcamp/nfisch/Chapter_4/fit_tmb.R")

wd<-"/blue/edvcamp/nfisch/Chapter_4/mod/"

##Ncomp 100, noindex, 20yrs 
#load(paste0(wd,"/Cod_wdat_N100_Ind25_ckmrmultinom20_1.RData"))
#load(paste0(wd,"/Flatfish_wdat_N100_Ind25_ckmrmultinom20_1.RData"))
#load(paste0(wd,"/Sardine_wdat_N100_Ind25_ckmrmultinom20_1.RData"))

#Cod_OM<-Cod_wdat
#Flatfish_OM<-Flatfish_wdat
#Sardine_OM<-Sardine_wdat

#TMB Section
#setwd(wd)
#Compile and load model
#compile("SCAA_Fisch_wAge0.cpp")

#Doing N Simulations
N_sim<-1:100
res_list<-list()
for (Q in NULL){  #Running through the life history types
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
              Lamda_Index=0)
    
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
                log_q=factor(NA),
                log_sd_catch=factor(NA),
                log_sd_index=factor(NA))
    
    lower_bounds<-c(-5,-20,rep(-10,dat$lage),rep(-10,dat$lyear), 0, 5, -5,-5,-5,-5,-5,rep(-10,dat$lyear))
    upper_bounds<-c( 2,  1,rep( 10,dat$lage),rep( 10,dat$lyear), 1, 25, 2, 2, 2, 5, 5,rep(  0,dat$lyear))
    
    reffects=c("log_recruit_devs","log_recruit_devs_init")
    l<-lower_bounds[-which(parm_names %in% c(names(fixed),reffects))]
    u<-upper_bounds[-which(parm_names %in% c(names(fixed),reffects))]
    
    SCAA <- MakeADFun(dat, par, DLL="SCAA_Fisch_wAge0", map=fixed, random=reffects)
    SCAA_fit <- fit_tmb(obj=SCAA, startpar=SCAA$par, lower=l, upper=u, newtonsteps = 1,getsd=TRUE,bias.correct=TRUE,getHessian=TRUE)
    
    res_list[[s]]<-SCAA_fit
    print(c(s))
  }
   if(Q==1){
   saveRDS(res_list, file=paste0(wd,"/results/SCAAfit_Cod_N100_NoIndex_20yrs_noCKMR.RData"))
   } else if (Q==2){
   saveRDS(res_list, file=paste0(wd,"/results/SCAAfit_Flatfish_N100_NoIndex_20yrs_noCKMR.RData"))
   } else if (Q==3){
   saveRDS(res_list, file=paste0(wd,"/results/SCAAfit_Sardine_N100_NoIndex_20yrs_noCKMR.RData"))
   }  
}

#Ncomp 1000, noindex, 5yrs 
#load(paste0(wd,"/Cod_wdat_N1000_Ind25_ckmrmultinom5_1.RData"))
#load(paste0(wd,"/Flatfish_wdat_N1000_Ind25_ckmrmultinom5_1.RData"))
#load(paste0(wd,"/Sardine_wdat_N1000_Ind25_ckmrmultinom5_1.RData"))

#Cod_OM<-Cod_wdat
#Flatfish_OM<-Flatfish_wdat
#Sardine_OM<-Sardine_wdat

#TMB Section
#setwd(wd)
#Compile and load model
#compile("SCAA_Fisch_wAge0.cpp")

#Doing N Simulations
N_sim<-1:100
res_list<-list()
for (Q in NULL){  #Running through the life history types
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
              Lamda_Index=0)
    
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
                log_q=factor(NA),
                log_sd_catch=factor(NA),
                log_sd_index=factor(NA))
    
    lower_bounds<-c(-5,-20,rep(-10,dat$lage),rep(-10,dat$lyear), 0, 5, -5,-5,-5,-5,-5,rep(-10,dat$lyear))
    upper_bounds<-c( 2,  1,rep( 10,dat$lage),rep( 10,dat$lyear), 1, 25, 2, 2, 2, 5, 5,rep(  0,dat$lyear))
    
    reffects=c("log_recruit_devs","log_recruit_devs_init")
    l<-lower_bounds[-which(parm_names %in% c(names(fixed),reffects))]
    u<-upper_bounds[-which(parm_names %in% c(names(fixed),reffects))]
    
    SCAA <- MakeADFun(dat, par, DLL="SCAA_Fisch_wAge0", map=fixed, random=reffects)
    try(SCAA_fit <- fit_tmb(obj=SCAA, startpar=SCAA$par, lower=l, upper=u, newtonsteps = 1,getsd=TRUE,bias.correct=TRUE,getHessian=TRUE), silent=TRUE)
    
    res_list[[s]]<-SCAA_fit
    print(c(s))
  }
   if(Q==1){
   saveRDS(res_list, file=paste0(wd,"/results/SCAAfit_Cod_N1000_NoIndex_5yrs_noCKMR.RData"))
   } else if (Q==2){
   saveRDS(res_list, file=paste0(wd,"/results/SCAAfit_Flatfish_N1000_NoIndex_5yrs_noCKMR.RData"))
   } else if (Q==3){
   saveRDS(res_list, file=paste0(wd,"/results/SCAAfit_Sardine_N1000_NoIndex_5yrs_noCKMR.RData"))
   }  
}

#Ncomp 5000, noindex, 10yrs 
load(paste0(wd,"/Cod_wdat_N5000_Ind25_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N5000_Ind25_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Sardine_wdat_N5000_Ind25_ckmrmultinom10_1.RData"))

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
              Lamda_Index=0)
    
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
                log_q=factor(NA),
                log_sd_catch=factor(NA),
                log_sd_index=factor(NA))
    
    lower_bounds<-c(-5,-20,rep(-10,dat$lage),rep(-10,dat$lyear), 0, 5, -5,-5,-5,-5,-5,rep(-10,dat$lyear))
    upper_bounds<-c( 2,  1,rep( 10,dat$lage),rep( 10,dat$lyear), 1, 25, 2, 2, 2, 5, 5,rep(  0,dat$lyear))
    
    reffects=c("log_recruit_devs","log_recruit_devs_init")
    l<-lower_bounds[-which(parm_names %in% c(names(fixed),reffects))]
    u<-upper_bounds[-which(parm_names %in% c(names(fixed),reffects))]
    
    SCAA <- MakeADFun(dat, par, DLL="SCAA_Fisch_wAge0", map=fixed, random=reffects)
    try(SCAA_fit <- fit_tmb(obj=SCAA, startpar=SCAA$par, lower=l, upper=u, newtonsteps = 1,getsd=TRUE,bias.correct=TRUE,getHessian=TRUE), silent=TRUE)
    
    res_list[[s]]<-SCAA_fit
    print(c(s))
  }
   if(Q==1){
   saveRDS(res_list, file=paste0(wd,"/results/SCAAfit_Cod_N5000_NoIndex_10yrs_noCKMR.RData"))
   } else if (Q==2){
   saveRDS(res_list, file=paste0(wd,"/results/SCAAfit_Flatfish_N5000_NoIndex_10yrs_noCKMR.RData"))
   } else if (Q==3){
   saveRDS(res_list, file=paste0(wd,"/results/SCAAfit_Sardine_N5000_NoIndex_10yrs_noCKMR.RData"))
   }  
}

