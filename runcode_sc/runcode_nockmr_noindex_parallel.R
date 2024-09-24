#Runcode

#install.packages("/gpfs/fs7/dfo/hpcmc/pfm/nif000/rlib/TMB_1.9.14.tar.gz", repos=NULL,lib="/gpfs/fs7/dfo/hpcmc/pfm/nif000/rlib/", type="source")
library(TMB, lib.loc="/gpfs/fs7/dfo/hpcmc/pfm/nif000/rlib/")

source("/gpfs/fs7/dfo/hpcmc/pfm/nif000/github/CKMR_Project/fit_tmb.R")

wd<-"/gpfs/fs7/dfo/hpcmc/pfm/nif000/github/CKMR_Project/"

#TMB Section
setwd(wd)
#Compile and load model 
compile("SCAA_Fisch_wAE.cpp")
N_sim<-1:100
library(foreach,    lib.loc="/gpfs/fs7/dfo/hpcmc/pfm/nif000/rlib/")
library(doParallel, lib.loc="/gpfs/fs7/dfo/hpcmc/pfm/nif000/rlib/")

#setup parallel backend to use many processors
cl <- 100
registerDoParallel(cl)

run<-function(s=1,OM=NA){  
    dat<-list(fyear=OM$OM$fyear, lyear=75, fage=OM$OM$fage, lage=OM$OM$lage, 
              years=OM$OM$fyear:75, ages=OM$OM$fage:OM$OM$lage,
              obs_harv=OM$Obs_Catch,
              obs_index=OM$Obs_Index_25,
              obs_fishery_comp=OM$Obs_Catch_Comp/rowSums(OM$Obs_Catch_Comp),
              SS_fishery=rowSums(OM$Obs_Catch_Comp),
              Mat=OM$OM$Mat,
              Laa=OM$OM$Laa,
              Waa=OM$OM$Waa,
              #Switch for whether to use a data source or not, 0=no, 1=yes
              Lamda_Harvest=1,
              Lamda_Comp=1,
              Lamda_Index=0,
              AE_mat=OM$AE_mat)
    
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
                log_sd_index=log(0.25),
                Sel_logis_k=log(runif(1,min=OM$OM$Sel_slope-OM$OM$Sel_slope*0.5,max=OM$OM$Sel_slope+OM$OM$Sel_slope*0.5)),
                Sel_logis_midpt=log(runif(1,min=OM$OM$Sel_50-OM$OM$Sel_50*0.5,max=OM$OM$Sel_50+OM$OM$Sel_50*0.5)),
                log_fint=log(runif(length(OM$OM$F_int[26:100]),min=OM$OM$F_int[26:100]-OM$OM$F_int[26:100]*0.5,max=OM$OM$F_int[26:100]+OM$OM$F_int[26:100]*0.5)))  
    
    dyn.load(dynlib("SCAA_Fisch_wAE"))
    
    parm_names<-rep(names(par),lapply(par,length))
    
    fixed<-list(steepness=factor(NA),log_sigma_rec=factor(NA),log_q=factor(NA),
                log_sd_catch=factor(NA),
                log_sd_index=factor(NA))
    
    lower_bounds<-c(-5,-20,rep(-10,dat$lage),rep(-10,dat$lyear), 0, 5, -5,-5,-5,-5,-5,rep(-10,dat$lyear))
    upper_bounds<-c( 2,  1,rep( 10,dat$lage),rep( 10,dat$lyear), 1, 25, 2, 2, 2, 5, 5,rep(  0,dat$lyear))
    
    reffects=c("log_recruit_devs","log_recruit_devs_init")
    l<-lower_bounds[-which(parm_names %in% c(names(fixed)))]
    u<-upper_bounds[-which(parm_names %in% c(names(fixed)))]
    
    SCAA <- MakeADFun(dat, par, DLL="SCAA_Fisch_wAE", map=fixed)
    counter<-1  
    tryCatch({
    SCAA_fit <- fit_tmb(obj=SCAA, startpar=SCAA$par, lower=l, upper=u, newtonsteps = 1,getsd=TRUE)
    }, error=function(e){
    counter<<-0
    SCAA_fit<<-list(NA)
    })   
    
   return(SCAA_fit)
}
  
#Ncomp 5000, ckmr 20yrs
load(paste0(wd,"/Cod_wdat_N5000_ckmrmultinom20_1.RData"))
#load(paste0(wd,"/Flatfish_wdat_N1000_ckmrmultinom20_1.RData"))
#load(paste0(wd,"/Sardine_wdat_N1000_ckmrmultinom20_1.RData"))

res_list_Cod<-res_list_Flatfish<-res_list_Sardine<-list()

res_list_Cod  <- foreach (s=N_sim, .packages=c("TMB")) %dopar%{run(s=s, OM=Cod_wdat[[s]])}
saveRDS(res_list_Cod, file=paste0(wd,"/results/SCAAfit_Cod_N5000_NoIndex_20yrs_noCKMR.RData"))

#res_list_Flatfish  <- foreach (s=N_sim, .packages=c("TMB")) %dopar%{run(s=s, OM=Flatfish_wdat[[s]])}
#saveRDS(res_list_Flatfish, file=paste0(wd,"/results/SCAAfit_Flatfish_N1000_NoIndex_20yrs_noCKMR.RData"))

#res_list_Sardine  <- foreach (s=N_sim, .packages=c("TMB")) %dopar%{run(s=s, OM=Sardine_wdat[[s]])}
#saveRDS(res_list_Sardine, file=paste0(wd,"/results/SCAAfit_Sardine_N1000_NoIndex_20yrs_noCKMR.RData"))


