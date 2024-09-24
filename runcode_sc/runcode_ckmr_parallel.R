#Runcode

#install.packages("/gpfs/fs7/dfo/hpcmc/pfm/nif000/rlib/TMB_1.9.14.tar.gz", repos=NULL,lib="/gpfs/fs7/dfo/hpcmc/pfm/nif000/rlib/", type="source")
library(TMB, lib.loc="/gpfs/fs7/dfo/hpcmc/pfm/nif000/rlib/")

source("/gpfs/fs7/dfo/hpcmc/pfm/nif000/github/CKMR_Project/fit_tmb.R")

wd<-"/gpfs/fs7/dfo/hpcmc/pfm/nif000/github/CKMR_Project/"

#TMB Section
setwd(wd)
#Compile and load model 
compile("CKMRmultinom_POP_HSP_GPP_Fisch_wAE.cpp")
N_sim<-1:100
library(foreach,    lib.loc="/gpfs/fs7/dfo/hpcmc/pfm/nif000/rlib/")
library(doParallel, lib.loc="/gpfs/fs7/dfo/hpcmc/pfm/nif000/rlib/")

#setup parallel backend to use many processors
cl <- 10
registerDoParallel(cl)

run<-function(s=1, OM=NA, sd_ind=0.25){
if(sd_ind==0.25){
  obs_ind<-OM$Obs_Index_25
 }else if(sd_ind==0.50){
 obs_ind<-OM$Obs_Index_50
 }
  
    dat<-list(fyear=OM$OM$fyear, lyear=75, fage=OM$OM$fage, lage=OM$OM$lage, 
              years=OM$OM$fyear:75, ages=OM$OM$fage:OM$OM$lage,
              obs_harv=OM$Obs_Catch,
              obs_index=obs_ind,
              obs_fishery_comp=OM$Obs_Catch_Comp/rowSums(OM$Obs_Catch_Comp),
              SS_fishery=rowSums(OM$Obs_Catch_Comp),
              Mat=OM$OM$Mat,
              Laa=OM$OM$Laa,
              Waa=OM$OM$Waa,
              #CKMR 
              coded_born_year_old=OM$born_year_old-(OM$fyear_dat-1),
              n_ckmr=OM$n_ckmr,
              k_ckmr_hsporggp=OM$k_ckmr_hsporggp,
              coded_born_year_young=OM$born_year_young-(OM$fyear_dat-1), 
              k_ckmr_pop=OM$k_ckmr_pop,
              samp_year_coded_old=OM$samp_year_old-(OM$fyear_dat-1),
              coded_age_one=OM$coded_age_young,
              coded_age_two=OM$coded_age_old,
              coded_one_min=sapply(OM$coded_age_young, FUN=function(x){min(which(OM$AE_mat[,x+1]>0.001)-1)}),
              coded_one_max=sapply(OM$coded_age_young, FUN=function(x){max(which(OM$AE_mat[,x+1]>0.001)-1)}),
              coded_two_min=sapply(OM$coded_age_old, FUN=function(x){min(which(OM$AE_mat[,x+1]>0.001)-1)}),
              coded_two_max=sapply(OM$coded_age_old, FUN=function(x){max(which(OM$AE_mat[,x+1]>0.001)-1)}),
              #Switch for whether to use a data source or not, 0=no, 1=yes
              Lamda_Harvest=1,
              Lamda_Comp=1,
              Lamda_Index=1,
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
                log_sd_index=log(sd_ind),
                Sel_logis_k=log(runif(1,min=OM$OM$Sel_slope-OM$OM$Sel_slope*0.5,max=OM$OM$Sel_slope+OM$OM$Sel_slope*0.5)),
                Sel_logis_midpt=log(runif(1,min=OM$OM$Sel_50-OM$OM$Sel_50*0.5,max=OM$OM$Sel_50+OM$OM$Sel_50*0.5)),
                log_fint=log(runif(length(OM$OM$F_int[26:100]),min=OM$OM$F_int[26:100]-OM$OM$F_int[26:100]*0.5,max=OM$OM$F_int[26:100]+OM$OM$F_int[26:100]*0.5)))  
    
    dyn.load(dynlib("CKMRmultinom_POP_HSP_GPP_Fisch_wAE"))
    
    parm_names<-rep(names(par),lapply(par,length))
    
    fixed<-list(steepness=factor(NA),log_sigma_rec=factor(NA),
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
    
   return(SCAA_fit)
}
  
#Ncomp 5000, ckmr 10yrs
#load(paste0(wd,"/Cod_wdat_N5000_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N5000_ckmrmultinom20_1.RData"))
#load(paste0(wd,"/Sardine_wdat_N5000_ckmrmultinom20_1.RData"))

res_list_Cod<-res_list_Flatfish<-res_list_Sardine<-list()

#N_sim<-c(1  , 2 ,  3 ,  4 ,  5  , 6,   7 ,  8 ,  9 , 10 , 11  ,12  ,14 , 15, 17 , 18 , 19 , 20  ,21, 22  ,23 , 24, 25  ,27,  28,  29,  30,  31,  32,  33,  34,  35  ,36,  37 , 38 , 39 , 40  ,41  ,42, 43  ,44 , 45 , 46,  47,  48 , 49 , 50 , 51 , 52 , 53  ,54 , 55,  56, 57 , 58 , 59 , 60  ,61 ,62 , 63 , 64 , 65, 66 , 67 , 68,  69 , 71,  72,  73 , 74 , 75,  76,  77,  78 , 79 , 80 ,81 , 82,  83 , 84 , 85 , 86 , 87 , 88 , 89 , 90 , 91,  92,  93,  94,  95,  96,  97, 98, 100)
#res_list_Cod  <- foreach (s=N_sim, .packages=c("TMB")) %dopar%{run(s=s, OM=Cod_wdat[[s]], sd_ind=0.50)}
#saveRDS(res_list_Cod, file=paste0(wd,"/results/SCAAfit_Cod_N5000_Ind50_ckmrmultinom20_2.RData"))

#N_sim<-c(2   ,4  , 5 ,  6 ,  7 ,  9  ,10  ,11 , 12  ,13 , 14 , 15 , 16,  17  ,19,  20 , 21 , 22,  23,  24  ,25 , 26,  27 , 28,  29 , 31 , 32  ,34 ,36  ,37  ,38 , 39 , 42,  43 , 44 , 45 , 46 , 47,  48,  52,  54 , 55  ,58 , 59,  60,  62,  64 , 65,  66 , 67 , 68,  70 , 72,  73,  75 , 76,  77  ,78,  81,  82,  83, 91 , 96,  97 , 99, 100)
#res_list_Flatfish  <- foreach (s=N_sim, .packages=c("TMB")) %dopar%{run(s=s, OM=Flatfish_wdat[[s]], sd_ind=0.50)}
#saveRDS(res_list_Flatfish, file=paste0(wd,"/results/SCAAfit_Flatfish_N1000_Ind50_ckmrmultinom20_4.RData"))

#N_sim<-c(2 , 3, 11, 12, 14, 23, 26, 27, 37, 38, 39 ,47, 49, 58,64 ,69, 71, 72 ,76, 77, 80, 91, 96, 97, 98)
#res_list_Sardine  <- foreach (s=N_sim, .packages=c("TMB")) %dopar%{run(s=s, OM=Sardine_wdat[[s]], sd_ind=0.50)}
#saveRDS(res_list_Sardine, file=paste0(wd,"/results/SCAAfit_Sardine_N5000_Ind50_ckmrmultinom20_2.RData"))
  

#N_sim<-c(61:80)
#res_list_Cod  <- foreach (s=N_sim, .packages=c("TMB")) %dopar%{run(s=s, OM=Cod_wdat[[s]], sd_ind=0.25)}
#saveRDS(res_list_Cod, file=paste0(wd,"/results/SCAAfit_Cod_N5000_Ind25_ckmrmultinom20_61_80.RData"))

N_sim<-c(1:10)
res_list_Flatfish  <- foreach (s=N_sim, .packages=c("TMB")) %dopar%{run(s=s, OM=Flatfish_wdat[[s]], sd_ind=0.25)}
saveRDS(res_list_Flatfish, file=paste0(wd,"/results/SCAAfit_Flatfish_N5000_Ind25_ckmrmultinom20_1_10.RData"))

#res_list_Sardine  <- foreach (s=N_sim, .packages=c("TMB")) %dopar%{run(s=s, OM=Sardine_wdat[[s]], sd_ind=0.25)}
#saveRDS(res_list_Sardine, file=paste0(wd,"/results/SCAAfit_Sardine_N5000_Ind25_ckmrmultinom20.RData"))





