#Runcode

#install.packages("/gpfs/fs7/dfo/hpcmc/pfm/nif000/rlib/TMB_1.9.14.tar.gz", repos=NULL,lib="/gpfs/fs7/dfo/hpcmc/pfm/nif000/rlib/", type="source")
library(TMB, lib.loc="/gpfs/fs7/dfo/hpcmc/pfm/nif000/rlib/")

source("/gpfs/fs7/dfo/hpcmc/pfm/nif000/github/CKMR_Project/fit_tmb.R")

wd<-"/gpfs/fs7/dfo/hpcmc/pfm/nif000/github/CKMR_Project/"

##Ncomp 100, NoIndex, ckmr 5yrs
#load(paste0(wd,"Cod_wdat_N100_Ind25_ckmrmultinom5_1.RData"))
#load(paste0(wd,"Flatfish_wdat_N100_Ind25_ckmrmultinom5_1.RData"))
#load(paste0(wd,"Sardine_wdat_N100_Ind25_ckmrmultinom5_1.RData"))

##TMB Section
#setwd(wd)
##Compile and load model 
#compile("CKMRmultinom_POP_HSP_GPP_Fisch_wAE.cpp")

N_sim<-1:100
res_list<-list()
for (Q in NULL){  #Running through the life history types
  for (s in N_sim){
    
    if(Q==1){
      OM<-Cod_wdat[[s]]
    } else if (Q==2){
      OM<-Flatfish_wdat[[s]]
    }else if (Q==3){
      OM<-Sardine_wdat[[s]]
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
              #CKMR 
              coded_born_year_old=OM$born_year_old-(OM$fyear_dat-1),
              coded_age_diff=OM$age_diff,
              n_ckmr=OM$n_ckmr,
              k_ckmr_hsporggp=OM$k_ckmr_hsporggp,
              coded_born_year_young=OM$born_year_young-(OM$fyear_dat-1), 
              k_ckmr_pop=OM$k_ckmr_pop,
              samp_year_coded_old=OM$samp_year_old-(OM$fyear_dat-1),
              coded_age_one=OM$coded_age_young,
              coded_age_two=OM$coded_age_old,
              coded_one_min=sapply(OM$coded_age_young, FUN=function(x){min(which(OM$AE_mat[,x+1]>0.01)-1)}),
              coded_one_max=sapply(OM$coded_age_young, FUN=function(x){max(which(OM$AE_mat[,x+1]>0.01)-1)}),
              coded_two_min=sapply(OM$coded_age_old, FUN=function(x){min(which(OM$AE_mat[,x+1]>0.01)-1)}),
              coded_two_max=sapply(OM$coded_age_old, FUN=function(x){max(which(OM$AE_mat[,x+1]>0.01)-1)}),
              #Switch for whether to use a data source or not, 0=no, 1=yes
              Lamda_Harvest=1,
              Lamda_Comp=1,
              Lamda_Index=0,
              Lamda_CKMR=1,
              AE_mat=OM$AE_mat,
              pi_nu=OM$pi_nu)
    
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
    
    dyn.load(dynlib("CKMRmultinom_POP_HSP_GPP_Fisch_wAE"))
    
    parm_names<-rep(names(par),lapply(par,length))
    
    fixed<-list(steepness=factor(NA),log_sigma_rec=factor(NA),log_q=factor(NA),
                log_sd_catch=factor(NA),
                log_sd_index=factor(NA))
    
    lower_bounds<-c(-5,-20,rep(-10,dat$lage),rep(-10,dat$lyear), 0, 5, -5,-5,-5,-5,-5,rep(-10,dat$lyear))
    upper_bounds<-c( 2,  1,rep( 10,dat$lage),rep( 10,dat$lyear), 1, 25, 2, 2, 2, 5, 5,rep(  0,dat$lyear))
    
    reffects=c("log_recruit_devs","log_recruit_devs_init")
    l<-lower_bounds[-which(parm_names %in% c(names(fixed)))]
    u<-upper_bounds[-which(parm_names %in% c(names(fixed)))]
    
    SCAA <- MakeADFun(dat, par, DLL="CKMRmultinom_POP_HSP_GPP_Fisch_wAE", map=fixed)
    counter<-1  
    tryCatch({
    SCAA_fit <- fit_tmb(obj=SCAA, startpar=SCAA$par, lower=l, upper=u, newtonsteps = 1,getsd=TRUE)
    }, error=function(e){
    counter<<-0
    SCAA_fit<<-list(NA)
    })   
    
    res_list[[s]]<-SCAA_fit
    print(c(Q,s))
  }
   if(Q==1){
   saveRDS(res_list, file=paste0(wd,"/results/SCAAfit_Cod_N100_NoIndex_ckmrmultinom5.RData"))
   } else if (Q==2){
   saveRDS(res_list, file=paste0(wd,"/results/SCAAfit_Flatfish_N100_NoIndex_ckmrmultinom5.RData"))
   } else if (Q==3){
   saveRDS(res_list, file=paste0(wd,"/results/SCAAfit_Sardine_N100_NoIndex_ckmrmultinom5.RData"))
   }  
}

##Ncomp 1000, NoIndex, ckmr 5yrs
#load(paste0(wd,"/Cod_wdat_N1000_Ind25_ckmrmultinom5_1.RData"))
#load(paste0(wd,"/Flatfish_wdat_N1000_Ind25_ckmrmultinom5_1.RData"))
#load(paste0(wd,"/Sardine_wdat_N1000_Ind25_ckmrmultinom5_1.RData"))

##TMB Section
#setwd(wd)
##Compile and load model 
#compile("CKMRmultinom_POP_HSP_GPP_Fisch_wAE.cpp")

N_sim<-1:100
res_list<-list()
for (Q in NULL){  #Running through the life history types
  for (s in N_sim){
    
    if(Q==1){
      OM<-Cod_wdat[[s]]
    } else if (Q==2){
      OM<-Flatfish_wdat[[s]]
    }else if (Q==3){
      OM<-Sardine_wdat[[s]]
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
              #CKMR 
              coded_born_year_old=OM$born_year_old-(OM$fyear_dat-1),
              coded_age_diff=OM$age_diff,
              n_ckmr=OM$n_ckmr,
              k_ckmr_hsporggp=OM$k_ckmr_hsporggp,
              coded_born_year_young=OM$born_year_young-(OM$fyear_dat-1), 
              k_ckmr_pop=OM$k_ckmr_pop,
              samp_year_coded_old=OM$samp_year_old-(OM$fyear_dat-1),
              coded_age_one=OM$coded_age_young,
              coded_age_two=OM$coded_age_old,
              coded_one_min=sapply(OM$coded_age_young, FUN=function(x){min(which(OM$AE_mat[,x+1]>0.01)-1)}),
              coded_one_max=sapply(OM$coded_age_young, FUN=function(x){max(which(OM$AE_mat[,x+1]>0.01)-1)}),
              coded_two_min=sapply(OM$coded_age_old, FUN=function(x){min(which(OM$AE_mat[,x+1]>0.01)-1)}),
              coded_two_max=sapply(OM$coded_age_old, FUN=function(x){max(which(OM$AE_mat[,x+1]>0.01)-1)}),
              #Switch for whether to use a data source or not, 0=no, 1=yes
              Lamda_Harvest=1,
              Lamda_Comp=1,
              Lamda_Index=0,
              Lamda_CKMR=1,
              AE_mat=OM$AE_mat,
              pi_nu=OM$pi_nu)
    
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
    
    dyn.load(dynlib("CKMRmultinom_POP_HSP_GPP_Fisch_wAE"))
    
    parm_names<-rep(names(par),lapply(par,length))
    
    fixed<-list(steepness=factor(NA),log_sigma_rec=factor(NA),log_q=factor(NA),
                log_sd_catch=factor(NA),
                log_sd_index=factor(NA))
    
    lower_bounds<-c(-5,-20,rep(-10,dat$lage),rep(-10,dat$lyear), 0, 5, -5,-5,-5,-5,-5,rep(-10,dat$lyear))
    upper_bounds<-c( 2,  1,rep( 10,dat$lage),rep( 10,dat$lyear), 1, 25, 2, 2, 2, 5, 5,rep(  0,dat$lyear))
    
    reffects=c("log_recruit_devs","log_recruit_devs_init")
    l<-lower_bounds[-which(parm_names %in% c(names(fixed)))]
    u<-upper_bounds[-which(parm_names %in% c(names(fixed)))]
    
    SCAA <- MakeADFun(dat, par, DLL="CKMRmultinom_POP_HSP_GPP_Fisch_wAE", map=fixed)
    counter<-1  
    tryCatch({
    SCAA_fit <- fit_tmb(obj=SCAA, startpar=SCAA$par, lower=l, upper=u, newtonsteps = 1,getsd=TRUE)
    }, error=function(e){
    counter<<-0
    SCAA_fit<<-list(NA)
    })   
    
    res_list[[s]]<-SCAA_fit
    print(c(Q,s))
  }
   if(Q==1){
   saveRDS(res_list, file=paste0(wd,"/results/SCAAfit_Cod_N1000_NoIndex_ckmrmultinom5.RData"))
   } else if (Q==2){
   saveRDS(res_list, file=paste0(wd,"/results/SCAAfit_Flatfish_N1000_NoIndex_ckmrmultinom5.RData"))
   } else if (Q==3){
   saveRDS(res_list, file=paste0(wd,"/results/SCAAfit_Sardine_N1000_NoIndex_ckmrmultinom5.RData"))
   }  
}

#Ncomp 5000, NoIndex, ckmr 20yrs
load(paste0(wd,"/Cod_wdat_N5000_Ind25_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N5000_Ind25_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Sardine_wdat_N5000_Ind25_ckmrmultinom20_1.RData"))

#TMB Section
setwd(wd)
#Compile and load model 
compile("CKMRmultinom_POP_HSP_GPP_Fisch_wAE.cpp")

N_sim<-1:100
res_list<-list()
for (Q in 1:1){  #Running through the life history types
  for (s in N_sim){
    
    if(Q==1){
      OM<-Cod_wdat[[s]]
    } else if (Q==2){
      OM<-Flatfish_wdat[[s]]
    }else if (Q==3){
      OM<-Sardine_wdat[[s]]
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
              #CKMR 
              coded_born_year_old=OM$born_year_old-(OM$fyear_dat-1),
              coded_age_diff=OM$age_diff,
              n_ckmr=OM$n_ckmr,
              k_ckmr_hsporggp=OM$k_ckmr_hsporggp,
              coded_born_year_young=OM$born_year_young-(OM$fyear_dat-1), 
              k_ckmr_pop=OM$k_ckmr_pop,
              samp_year_coded_old=OM$samp_year_old-(OM$fyear_dat-1),
              coded_age_one=OM$coded_age_young,
              coded_age_two=OM$coded_age_old,
              coded_one_min=sapply(OM$coded_age_young, FUN=function(x){min(which(OM$AE_mat[,x+1]>0.01)-1)}),
              coded_one_max=sapply(OM$coded_age_young, FUN=function(x){max(which(OM$AE_mat[,x+1]>0.01)-1)}),
              coded_two_min=sapply(OM$coded_age_old, FUN=function(x){min(which(OM$AE_mat[,x+1]>0.01)-1)}),
              coded_two_max=sapply(OM$coded_age_old, FUN=function(x){max(which(OM$AE_mat[,x+1]>0.01)-1)}),
              #Switch for whether to use a data source or not, 0=no, 1=yes
              Lamda_Harvest=1,
              Lamda_Comp=1,
              Lamda_Index=0,
              Lamda_CKMR=1,
              AE_mat=OM$AE_mat,
              pi_nu=OM$pi_nu)
    
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
    
    dyn.load(dynlib("CKMRmultinom_POP_HSP_GPP_Fisch_wAE"))
    
    parm_names<-rep(names(par),lapply(par,length))
    
    fixed<-list(steepness=factor(NA),log_sigma_rec=factor(NA),log_q=factor(NA),
                log_sd_catch=factor(NA),
                log_sd_index=factor(NA))
    
    lower_bounds<-c(-5,-20,rep(-10,dat$lage),rep(-10,dat$lyear), 0, 5, -5,-5,-5,-5,-5,rep(-10,dat$lyear))
    upper_bounds<-c( 2,  1,rep( 10,dat$lage),rep( 10,dat$lyear), 1, 25, 2, 2, 2, 5, 5,rep(  0,dat$lyear))
    
    reffects=c("log_recruit_devs","log_recruit_devs_init")
    l<-lower_bounds[-which(parm_names %in% c(names(fixed)))]
    u<-upper_bounds[-which(parm_names %in% c(names(fixed)))]
    
    SCAA <- MakeADFun(dat, par, DLL="CKMRmultinom_POP_HSP_GPP_Fisch_wAE", map=fixed)
    counter<-1  
    tryCatch({
    SCAA_fit <- fit_tmb(obj=SCAA, startpar=SCAA$par, lower=l, upper=u, newtonsteps = 1,getsd=TRUE)
    }, error=function(e){
    counter<<-0
    SCAA_fit<<-list(NA)
    })   
    
    res_list[[s]]<-SCAA_fit
    print(c(Q,s))
  }
   if(Q==1){
   saveRDS(res_list, file=paste0(wd,"/results/SCAAfit_Cod_N5000_NoIndex_ckmrmultinom20.RData"))
   } else if (Q==2){
   saveRDS(res_list, file=paste0(wd,"/results/SCAAfit_Flatfish_N5000_NoIndex_ckmrmultinom20.RData"))
   } else if (Q==3){
   saveRDS(res_list, file=paste0(wd,"/results/SCAAfit_Sardine_N5000_NoIndex_ckmrmultinom20.RData"))
   }  
}