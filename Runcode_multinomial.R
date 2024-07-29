
#Run Code

#devtools::install_github("kaskr/TMB_contrib_R/TMBhelper")
wd<-"C:/Users/fischn/Documents/GitHub/CKMR_Project/"

AEs<-readRDS("C:/Users/fischn/Documents/GitHub/CKMR_Project/AE_mat_list.RData")

########################
#CKMR 20 Years
########################

#Ncomp 100, sdindex 0.25
N_sim<-100
Cod_wdat<-Flatfish_wdat<-Sardine_wdat<-list()
#N_comp_preCKMR<-100
N_comp_preCKMR<-c(30,rep(0,9),40,rep(0,9),50,rep(0,4),60,rep(0,4),70,rep(0,4),80,rep(0,4),90,rep(0,4),rep(100,30))
N_comp_CKMR<-100
sd_catch<-0.05
sd_index<-0.25
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

save(Cod_wdat, file=paste0(wd,"/Cod_wdat_N100_Ind25_ckmrmultinom20_1.RData"))
save(Flatfish_wdat, file=paste0(wd,"/Flatfish_wdat_N100_Ind25_ckmrmultinom20_1.RData"))
save(Sardine_wdat, file=paste0(wd,"/Sardine_wdat_N100_Ind25_ckmrmultinom20_1.RData"))

#Ncomp 100, sdindex 0.5
N_sim<-100
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

save(Cod_wdat, file=paste0(wd,"/Cod_wdat_N100_Ind50_ckmrmultinom20_1.RData"))
save(Flatfish_wdat, file=paste0(wd,"/Flatfish_wdat_N100_Ind50_ckmrmultinom20_1.RData"))
save(Sardine_wdat, file=paste0(wd,"/Sardine_wdat_N100_Ind50_ckmrmultinom20_1.RData"))

#Ncomp 1000, sdindex 0.25
N_sim<-100
Cod_wdat<-Flatfish_wdat<-Sardine_wdat<-list()
#N_comp_preCKMR<-100
N_comp_preCKMR<-c(30,rep(0,9),40,rep(0,9),50,rep(0,4),60,rep(0,4),70,rep(0,4),80,rep(0,4),90,rep(0,4),rep(100,30))
N_comp_CKMR<-1000
sd_catch<-0.05
sd_index<-0.25
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

save(Cod_wdat, file=paste0(wd,"/Cod_wdat_N1000_Ind25_ckmrmultinom20_1.RData"))
save(Flatfish_wdat, file=paste0(wd,"/Flatfish_wdat_N1000_Ind25_ckmrmultinom20_1.RData"))
save(Sardine_wdat, file=paste0(wd,"/Sardine_wdat_N1000_Ind25_ckmrmultinom20_1.RData"))

#Ncomp 1000, sdindex 0.5
N_sim<-100
Cod_wdat<-Flatfish_wdat<-Sardine_wdat<-list()
#N_comp_preCKMR<-100
N_comp_preCKMR<-c(30,rep(0,9),40,rep(0,9),50,rep(0,4),60,rep(0,4),70,rep(0,4),80,rep(0,4),90,rep(0,4),rep(100,30))
N_comp_CKMR<-1000
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

save(Cod_wdat, file=paste0(wd,"/Cod_wdat_N1000_Ind50_ckmrmultinom20_1.RData"))
save(Flatfish_wdat, file=paste0(wd,"/Flatfish_wdat_N1000_Ind50_ckmrmultinom20_1.RData"))
save(Sardine_wdat, file=paste0(wd,"/Sardine_wdat_N1000_Ind50_ckmrmultinom20_1.RData"))

#Ncomp 5000, sdindex 0.25
N_sim<-100
Cod_wdat<-Flatfish_wdat<-Sardine_wdat<-list()
#N_comp_preCKMR<-100
N_comp_preCKMR<-c(30,rep(0,9),40,rep(0,9),50,rep(0,4),60,rep(0,4),70,rep(0,4),80,rep(0,4),90,rep(0,4),rep(100,30))
N_comp_CKMR<-5000
sd_catch<-0.05
sd_index<-0.25
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

save(Cod_wdat, file=paste0(wd,"/Cod_wdat_N5000_Ind25_ckmrmultinom20_1.RData"))
save(Flatfish_wdat, file=paste0(wd,"/Flatfish_wdat_N5000_Ind25_ckmrmultinom20_1.RData"))
save(Sardine_wdat, file=paste0(wd,"/Sardine_wdat_N5000_Ind25_ckmrmultinom20_1.RData"))

#Ncomp 5000, sdindex 0.5
N_sim<-100
Cod_wdat<-Flatfish_wdat<-Sardine_wdat<-list()
#N_comp_preCKMR<-100
N_comp_preCKMR<-c(30,rep(0,9),40,rep(0,9),50,rep(0,4),60,rep(0,4),70,rep(0,4),80,rep(0,4),90,rep(0,4),rep(100,30))
N_comp_CKMR<-5000
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

save(Cod_wdat, file=paste0(wd,"/Cod_wdat_N5000_Ind50_ckmrmultinom20_1.RData"))
save(Flatfish_wdat, file=paste0(wd,"/Flatfish_wdat_N5000_Ind50_ckmrmultinom20_1.RData"))
save(Sardine_wdat, file=paste0(wd,"/Sardine_wdat_N5000_Ind50_ckmrmultinom20_1.RData"))

##################################
#CKMR 10 Years
##################################

#Ncomp 100, sdindex 0.25
N_sim<-100
Cod_wdat<-Flatfish_wdat<-Sardine_wdat<-list()
#N_comp_preCKMR<-100
N_comp_preCKMR<-c(30,rep(0,9),40,rep(0,9),50,rep(0,4),60,rep(0,4),70,rep(0,4),80,rep(0,4),90,rep(0,4),rep(100,30))
N_comp_CKMR<-100
sd_catch<-0.05
sd_index<-0.25
fyear_dat<-26
lyear_dat<-100
prop_ckmr<-1
fyear_ckmr<-91
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

save(Cod_wdat, file=paste0(wd,"/Cod_wdat_N100_Ind25_ckmrmultinom10_1.RData"))
save(Flatfish_wdat, file=paste0(wd,"/Flatfish_wdat_N100_Ind25_ckmrmultinom10_1.RData"))
save(Sardine_wdat, file=paste0(wd,"/Sardine_wdat_N100_Ind25_ckmrmultinom10_1.RData"))

#Ncomp 100, sdindex 0.5
N_sim<-100
Cod_wdat<-Flatfish_wdat<-Sardine_wdat<-list()
#N_comp_preCKMR<-100
N_comp_preCKMR<-c(30,rep(0,9),40,rep(0,9),50,rep(0,4),60,rep(0,4),70,rep(0,4),80,rep(0,4),90,rep(0,4),rep(100,30))
N_comp_CKMR<-100
sd_catch<-0.05
sd_index<-0.5
fyear_dat<-26
lyear_dat<-100
prop_ckmr<-1
fyear_ckmr<-91
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

save(Cod_wdat, file=paste0(wd,"/Cod_wdat_N100_Ind50_ckmrmultinom10_1.RData"))
save(Flatfish_wdat, file=paste0(wd,"/Flatfish_wdat_N100_Ind50_ckmrmultinom10_1.RData"))
save(Sardine_wdat, file=paste0(wd,"/Sardine_wdat_N100_Ind50_ckmrmultinom10_1.RData"))

#Ncomp 1000, sdindex 0.25
N_sim<-100
Cod_wdat<-Flatfish_wdat<-Sardine_wdat<-list()
#N_comp_preCKMR<-100
N_comp_preCKMR<-c(30,rep(0,9),40,rep(0,9),50,rep(0,4),60,rep(0,4),70,rep(0,4),80,rep(0,4),90,rep(0,4),rep(100,30))
N_comp_CKMR<-1000
sd_catch<-0.05
sd_index<-0.25
fyear_dat<-26
lyear_dat<-100
prop_ckmr<-1
fyear_ckmr<-91
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

save(Cod_wdat, file=paste0(wd,"/Cod_wdat_N1000_Ind25_ckmrmultinom10_1.RData"))
save(Flatfish_wdat, file=paste0(wd,"/Flatfish_wdat_N1000_Ind25_ckmrmultinom10_1.RData"))
save(Sardine_wdat, file=paste0(wd,"/Sardine_wdat_N1000_Ind25_ckmrmultinom10_1.RData"))

#Ncomp 1000, sdindex 0.5
N_sim<-100
Cod_wdat<-Flatfish_wdat<-Sardine_wdat<-list()
#N_comp_preCKMR<-100
N_comp_preCKMR<-c(30,rep(0,9),40,rep(0,9),50,rep(0,4),60,rep(0,4),70,rep(0,4),80,rep(0,4),90,rep(0,4),rep(100,30))
N_comp_CKMR<-1000
sd_catch<-0.05
sd_index<-0.5
fyear_dat<-26
lyear_dat<-100
prop_ckmr<-1
fyear_ckmr<-91
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

save(Cod_wdat, file=paste0(wd,"/Cod_wdat_N1000_Ind50_ckmrmultinom10_1.RData"))
save(Flatfish_wdat, file=paste0(wd,"/Flatfish_wdat_N1000_Ind50_ckmrmultinom10_1.RData"))
save(Sardine_wdat, file=paste0(wd,"/Sardine_wdat_N1000_Ind50_ckmrmultinom10_1.RData"))

#Ncomp 5000, sdindex 0.25
N_sim<-100
Cod_wdat<-Flatfish_wdat<-Sardine_wdat<-list()
#N_comp_preCKMR<-100
N_comp_preCKMR<-c(30,rep(0,9),40,rep(0,9),50,rep(0,4),60,rep(0,4),70,rep(0,4),80,rep(0,4),90,rep(0,4),rep(100,30))
N_comp_CKMR<-5000
sd_catch<-0.05
sd_index<-0.25
fyear_dat<-26
lyear_dat<-100
prop_ckmr<-1
fyear_ckmr<-91
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

save(Cod_wdat, file=paste0(wd,"/Cod_wdat_N5000_Ind25_ckmrmultinom10_1.RData"))
save(Flatfish_wdat, file=paste0(wd,"/Flatfish_wdat_N5000_Ind25_ckmrmultinom10_1.RData"))
save(Sardine_wdat, file=paste0(wd,"/Sardine_wdat_N5000_Ind25_ckmrmultinom10_1.RData"))

#Ncomp 5000, sdindex 0.5
N_sim<-100
Cod_wdat<-Flatfish_wdat<-Sardine_wdat<-list()
#N_comp_preCKMR<-100
N_comp_preCKMR<-c(30,rep(0,9),40,rep(0,9),50,rep(0,4),60,rep(0,4),70,rep(0,4),80,rep(0,4),90,rep(0,4),rep(100,30))
N_comp_CKMR<-5000
sd_catch<-0.05
sd_index<-0.5
fyear_dat<-26
lyear_dat<-100
prop_ckmr<-1
fyear_ckmr<-91
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

save(Cod_wdat, file=paste0(wd,"/Cod_wdat_N5000_Ind50_ckmrmultinom10_1.RData"))
save(Flatfish_wdat, file=paste0(wd,"/Flatfish_wdat_N5000_Ind50_ckmrmultinom10_1.RData"))
save(Sardine_wdat, file=paste0(wd,"/Sardine_wdat_N5000_Ind50_ckmrmultinom10_1.RData"))

##################################
#CKMR 5 Years
##################################

#Ncomp 100, sdindex 0.25
N_sim<-100
Cod_wdat<-Flatfish_wdat<-Sardine_wdat<-list()
#N_comp_preCKMR<-100
N_comp_preCKMR<-c(30,rep(0,9),40,rep(0,9),50,rep(0,4),60,rep(0,4),70,rep(0,4),80,rep(0,4),90,rep(0,4),rep(100,30))
N_comp_CKMR<-100
sd_catch<-0.05
sd_index<-0.25
fyear_dat<-26
lyear_dat<-100
prop_ckmr<-1
fyear_ckmr<-96
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

save(Cod_wdat, file=paste0(wd,"/Cod_wdat_N100_Ind25_ckmrmultinom5_1.RData"))
save(Flatfish_wdat, file=paste0(wd,"/Flatfish_wdat_N100_Ind25_ckmrmultinom5_1.RData"))
save(Sardine_wdat, file=paste0(wd,"/Sardine_wdat_N100_Ind25_ckmrmultinom5_1.RData"))

#Ncomp 100, sdindex 0.5
N_sim<-100
Cod_wdat<-Flatfish_wdat<-Sardine_wdat<-list()
#N_comp_preCKMR<-100
N_comp_preCKMR<-c(30,rep(0,9),40,rep(0,9),50,rep(0,4),60,rep(0,4),70,rep(0,4),80,rep(0,4),90,rep(0,4),rep(100,30))
N_comp_CKMR<-100
sd_catch<-0.05
sd_index<-0.5
fyear_dat<-26
lyear_dat<-100
prop_ckmr<-1
fyear_ckmr<-96
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

save(Cod_wdat, file=paste0(wd,"/Cod_wdat_N100_Ind50_ckmrmultinom5_1.RData"))
save(Flatfish_wdat, file=paste0(wd,"/Flatfish_wdat_N100_Ind50_ckmrmultinom5_1.RData"))
save(Sardine_wdat, file=paste0(wd,"/Sardine_wdat_N100_Ind50_ckmrmultinom5_1.RData"))

#Ncomp 1000, sdindex 0.25
N_sim<-100
Cod_wdat<-Flatfish_wdat<-Sardine_wdat<-list()
#N_comp_preCKMR<-100
N_comp_preCKMR<-c(30,rep(0,9),40,rep(0,9),50,rep(0,4),60,rep(0,4),70,rep(0,4),80,rep(0,4),90,rep(0,4),rep(100,30))
N_comp_CKMR<-1000
sd_catch<-0.05
sd_index<-0.25
fyear_dat<-26
lyear_dat<-100
prop_ckmr<-1
fyear_ckmr<-96
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

save(Cod_wdat, file=paste0(wd,"/Cod_wdat_N1000_Ind25_ckmrmultinom5_1.RData"))
save(Flatfish_wdat, file=paste0(wd,"/Flatfish_wdat_N1000_Ind25_ckmrmultinom5_1.RData"))
save(Sardine_wdat, file=paste0(wd,"/Sardine_wdat_N1000_Ind25_ckmrmultinom5_1.RData"))

#Ncomp 1000, sdindex 0.5
N_sim<-100
Cod_wdat<-Flatfish_wdat<-Sardine_wdat<-list()
#N_comp_preCKMR<-100
N_comp_preCKMR<-c(30,rep(0,9),40,rep(0,9),50,rep(0,4),60,rep(0,4),70,rep(0,4),80,rep(0,4),90,rep(0,4),rep(100,30))
N_comp_CKMR<-1000
sd_catch<-0.05
sd_index<-0.5
fyear_dat<-26
lyear_dat<-100
prop_ckmr<-1
fyear_ckmr<-96
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

save(Cod_wdat, file=paste0(wd,"/Cod_wdat_N1000_Ind50_ckmrmultinom5_1.RData"))
save(Flatfish_wdat, file=paste0(wd,"/Flatfish_wdat_N1000_Ind50_ckmrmultinom5_1.RData"))
save(Sardine_wdat, file=paste0(wd,"/Sardine_wdat_N1000_Ind50_ckmrmultinom5_1.RData"))

#Ncomp 5000, sdindex 0.25
N_sim<-100
Cod_wdat<-Flatfish_wdat<-Sardine_wdat<-list()
#N_comp_preCKMR<-100
N_comp_preCKMR<-c(30,rep(0,9),40,rep(0,9),50,rep(0,4),60,rep(0,4),70,rep(0,4),80,rep(0,4),90,rep(0,4),rep(100,30))
N_comp_CKMR<-5000
sd_catch<-0.05
sd_index<-0.25
fyear_dat<-26
lyear_dat<-100
prop_ckmr<-1
fyear_ckmr<-96
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

save(Cod_wdat, file=paste0(wd,"/Cod_wdat_N5000_Ind25_ckmrmultinom5_1.RData"))
save(Flatfish_wdat, file=paste0(wd,"/Flatfish_wdat_N5000_Ind25_ckmrmultinom5_1.RData"))
save(Sardine_wdat, file=paste0(wd,"/Sardine_wdat_N5000_Ind25_ckmrmultinom5_1.RData"))

#Ncomp 5000, sdindex 0.5
N_sim<-100
Cod_wdat<-Flatfish_wdat<-Sardine_wdat<-list()
#N_comp_preCKMR<-100
N_comp_preCKMR<-c(30,rep(0,9),40,rep(0,9),50,rep(0,4),60,rep(0,4),70,rep(0,4),80,rep(0,4),90,rep(0,4),rep(100,30))
N_comp_CKMR<-5000
sd_catch<-0.05
sd_index<-0.5
fyear_dat<-26
lyear_dat<-100
prop_ckmr<-1
fyear_ckmr<-96
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

save(Cod_wdat, file=paste0(wd,"/Cod_wdat_N5000_Ind50_ckmrmultinom5_1.RData"))
save(Flatfish_wdat, file=paste0(wd,"/Flatfish_wdat_N5000_Ind50_ckmrmultinom5_1.RData"))
save(Sardine_wdat, file=paste0(wd,"/Sardine_wdat_N5000_Ind50_ckmrmultinom5_1.RData"))

#############################################################
#TMB SCAAs fit to Fishery data without CKMR (Base models)
#############################################################

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
compile("SCAA_Fisch_wAE.cpp")

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
              Lamda_Index=1,
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
                log_sd_index=log(OM$sd_index),
                Sel_logis_k=log(runif(1,min=OM$OM$Sel_slope-OM$OM$Sel_slope*0.5,max=OM$OM$Sel_slope+OM$OM$Sel_slope*0.5)),
                Sel_logis_midpt=log(runif(1,min=OM$OM$Sel_50-OM$OM$Sel_50*0.5,max=OM$OM$Sel_50+OM$OM$Sel_50*0.5)),
                log_fint=log(runif(length(OM$OM$F_int[26:100]),min=OM$OM$F_int[26:100]-OM$OM$F_int[26:100]*0.5,max=OM$OM$F_int[26:100]+OM$OM$F_int[26:100]*0.5)))  
    
    ################
    #TMB stuff
    ################
    dyn.load(dynlib("SCAA_Fisch_wAE"))
    
    parm_names<-rep(names(par),lapply(par,length))
    
    fixed<-list(steepness=factor(NA),log_sigma_rec=factor(NA),
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
      SCAA_fit <- TMBhelper::fit_tmb(obj=SCAA, startpar=SCAA$par, lower=l, upper=u, newtonsteps = 1,getsd=TRUE)
    }, error=function(e){
      counter<<-0
      SCAA_fit<<-list(NA)
    })   
    
    res_list[[Q]][[s]]<-SCAA_fit
    print(c(Q,s))
  }
}

saveRDS(res_list[[1]], file=paste0(wd,"/SCAAfit_Cod_N100_Ind25_20yrs_noCKMR.RData"))
saveRDS(res_list[[2]], file=paste0(wd,"/SCAAfit_Flatfish_N100_Ind25_20yrs_noCKMR.RData"))
saveRDS(res_list[[3]], file=paste0(wd,"/SCAAfit_Sardine_N100_Ind25_20yrs_noCKMR.RData"))

#############################################################
#TMB SCAAs fit to Fishery data without CKMR (Base models)
#############################################################

load(paste0(wd,"/Cod_wdat_N100_Ind50_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N100_Ind50_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Sardine_wdat_N100_Ind50_ckmrmultinom20_1.RData"))

Cod_OM<-Cod_wdat
Flatfish_OM<-Flatfish_wdat
Sardine_OM<-Sardine_wdat

#TMB Section
library(TMB)

setwd(wd)
#Compile and load model 
compile("SCAA_Fisch_wAE.cpp")

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
              Lamda_Index=1,
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
                log_sd_index=log(OM$sd_index),
                Sel_logis_k=log(runif(1,min=OM$OM$Sel_slope-OM$OM$Sel_slope*0.5,max=OM$OM$Sel_slope+OM$OM$Sel_slope*0.5)),
                Sel_logis_midpt=log(runif(1,min=OM$OM$Sel_50-OM$OM$Sel_50*0.5,max=OM$OM$Sel_50+OM$OM$Sel_50*0.5)),
                log_fint=log(runif(length(OM$OM$F_int[26:100]),min=OM$OM$F_int[26:100]-OM$OM$F_int[26:100]*0.5,max=OM$OM$F_int[26:100]+OM$OM$F_int[26:100]*0.5)))  
    
    ################
    #TMB stuff
    ################
    dyn.load(dynlib("SCAA_Fisch_wAE"))
    
    parm_names<-rep(names(par),lapply(par,length))
    
    fixed<-list(steepness=factor(NA),log_sigma_rec=factor(NA),
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
      SCAA_fit <- TMBhelper::fit_tmb(obj=SCAA, startpar=SCAA$par, lower=l, upper=u, newtonsteps = 1,getsd=TRUE)
    }, error=function(e){
      counter<<-0
      SCAA_fit<<-list(NA)
    })   
    
    res_list[[Q]][[s]]<-SCAA_fit
    print(c(Q,s))
  }
}

saveRDS(res_list[[1]], file=paste0(wd,"/SCAAfit_Cod_N100_Ind50_20yrs_noCKMR.RData"))
saveRDS(res_list[[2]], file=paste0(wd,"/SCAAfit_Flatfish_N100_Ind50_20yrs_noCKMR.RData"))
saveRDS(res_list[[3]], file=paste0(wd,"/SCAAfit_Sardine_N100_Ind50_20yrs_noCKMR.RData"))


#############################################################
#TMB SCAAs fit to Fishery data without CKMR (Base models)
#############################################################

load(paste0(wd,"/Cod_wdat_N1000_Ind25_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N1000_Ind25_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Sardine_wdat_N1000_Ind25_ckmrmultinom20_1.RData"))

Cod_OM<-Cod_wdat
Flatfish_OM<-Flatfish_wdat
Sardine_OM<-Sardine_wdat

#TMB Section
library(TMB)

setwd(wd)
#Compile and load model 
compile("SCAA_Fisch_wAE.cpp")

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
              Lamda_Index=1,
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
                log_sd_index=log(OM$sd_index),
                Sel_logis_k=log(runif(1,min=OM$OM$Sel_slope-OM$OM$Sel_slope*0.5,max=OM$OM$Sel_slope+OM$OM$Sel_slope*0.5)),
                Sel_logis_midpt=log(runif(1,min=OM$OM$Sel_50-OM$OM$Sel_50*0.5,max=OM$OM$Sel_50+OM$OM$Sel_50*0.5)),
                log_fint=log(runif(length(OM$OM$F_int[26:100]),min=OM$OM$F_int[26:100]-OM$OM$F_int[26:100]*0.5,max=OM$OM$F_int[26:100]+OM$OM$F_int[26:100]*0.5)))  
    
    ################
    #TMB stuff
    ################
    dyn.load(dynlib("SCAA_Fisch_wAE"))
    
    parm_names<-rep(names(par),lapply(par,length))
    
    fixed<-list(steepness=factor(NA),log_sigma_rec=factor(NA),
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
      SCAA_fit <- TMBhelper::fit_tmb(obj=SCAA, startpar=SCAA$par, lower=l, upper=u, newtonsteps = 1,getsd=TRUE)
    }, error=function(e){
      counter<<-0
      SCAA_fit<<-list(NA)
    })   
    
    res_list[[Q]][[s]]<-SCAA_fit
    print(c(Q,s))
  }
}

saveRDS(res_list[[1]], file=paste0(wd,"/SCAAfit_Cod_N1000_Ind25_20yrs_noCKMR.RData"))
saveRDS(res_list[[2]], file=paste0(wd,"/SCAAfit_Flatfish_N1000_Ind25_20yrs_noCKMR.RData"))
saveRDS(res_list[[3]], file=paste0(wd,"/SCAAfit_Sardine_N1000_Ind25_20yrs_noCKMR.RData"))

#############################################################
#TMB SCAAs fit to Fishery data without CKMR (Base models)
#############################################################

load(paste0(wd,"/Cod_wdat_N1000_Ind50_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N1000_Ind50_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Sardine_wdat_N1000_Ind50_ckmrmultinom20_1.RData"))

Cod_OM<-Cod_wdat
Flatfish_OM<-Flatfish_wdat
Sardine_OM<-Sardine_wdat

#TMB Section
library(TMB)

setwd(wd)
#Compile and load model 
compile("SCAA_Fisch_wAE.cpp")

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
              Lamda_Index=1,
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
                log_sd_index=log(OM$sd_index),
                Sel_logis_k=log(runif(1,min=OM$OM$Sel_slope-OM$OM$Sel_slope*0.5,max=OM$OM$Sel_slope+OM$OM$Sel_slope*0.5)),
                Sel_logis_midpt=log(runif(1,min=OM$OM$Sel_50-OM$OM$Sel_50*0.5,max=OM$OM$Sel_50+OM$OM$Sel_50*0.5)),
                log_fint=log(runif(length(OM$OM$F_int[26:100]),min=OM$OM$F_int[26:100]-OM$OM$F_int[26:100]*0.5,max=OM$OM$F_int[26:100]+OM$OM$F_int[26:100]*0.5)))  
    
    ################
    #TMB stuff
    ################
    dyn.load(dynlib("SCAA_Fisch_wAE"))
    
    parm_names<-rep(names(par),lapply(par,length))
    
    fixed<-list(steepness=factor(NA),log_sigma_rec=factor(NA),
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
      SCAA_fit <- TMBhelper::fit_tmb(obj=SCAA, startpar=SCAA$par, lower=l, upper=u, newtonsteps = 1,getsd=TRUE)
    }, error=function(e){
      counter<<-0
      SCAA_fit<<-list(NA)
    })   
    
    res_list[[Q]][[s]]<-SCAA_fit
    print(c(Q,s))
  }
}

saveRDS(res_list[[1]], file=paste0(wd,"/SCAAfit_Cod_N1000_Ind50_20yrs_noCKMR.RData"))
saveRDS(res_list[[2]], file=paste0(wd,"/SCAAfit_Flatfish_N1000_Ind50_20yrs_noCKMR.RData"))
saveRDS(res_list[[3]], file=paste0(wd,"/SCAAfit_Sardine_N1000_Ind50_20yrs_noCKMR.RData"))

###############################################
######################################
#TMB Model with HSP, POP, and GGP
######################################
###############################################
#Ncomp 100, sdindex 0.25, ckmr 20 years
load(paste0(wd,"/Cod_wdat_N100_Ind25_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N100_Ind25_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Sardine_wdat_N100_Ind25_ckmrmultinom20_1.RData"))

#TMB Section
library(TMB)

setwd(wd)
#Compile and load model 
compile("CKMRmultinom_POP_HSP_GPP_Fisch_wAE.cpp")

N_sim<-1:100
res_list<-list()
for (Q in 1:3){  #Running through the life history types
  res_list[[Q]]<-list()
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
                log_sd_index=log(OM$sd_index),
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
    SCAA_fit <- TMBhelper::fit_tmb(obj=SCAA, startpar=SCAA$par, lower=l, upper=u, newtonsteps=1, getsd=TRUE)
    
    res_list[[Q]][[s]]<-SCAA_fit
    print(c(Q,s))
  }
}

saveRDS(res_list[[1]], file=paste0(wd,"/SCAAfit_Cod_N100_Ind25_ckmrmultinom20.RData"))
saveRDS(res_list[[2]], file=paste0(wd,"/SCAAfit_Flatfish_N100_Ind25_ckmrmultinom20.RData"))
saveRDS(res_list[[3]], file=paste0(wd,"/SCAAfit_Sardine_N100_Ind25_ckmrmultinom20.RData"))

#########################
#Ncomp 1000, sdindex 0.25
#########################
load(paste0(wd,"/Cod_wdat_N1000_Ind25_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N1000_Ind25_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Sardine_wdat_N1000_Ind25_ckmrmultinom20_1.RData"))

#TMB Section
library(TMB)

setwd(wd)
#Compile and load model 
compile("CKMRmultinom_POP_HSP_GPP_Fisch_wAE.cpp")

N_sim<-1:100
res_list<-list()
for (Q in 1:3){  #Running through the life history types
  res_list[[Q]]<-list()
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
                log_sd_index=log(OM$sd_index),
                Sel_logis_k=log(runif(1,min=OM$OM$Sel_slope-OM$OM$Sel_slope*0.5,max=OM$OM$Sel_slope+OM$OM$Sel_slope*0.5)),
                Sel_logis_midpt=log(runif(1,min=OM$OM$Sel_50-OM$OM$Sel_50*0.5,max=OM$OM$Sel_50+OM$OM$Sel_50*0.5)),
                log_fint=log(runif(length(OM$OM$F_int[26:100]),min=OM$OM$F_int[26:100]-OM$OM$F_int[26:100]*0.5,max=OM$OM$F_int[26:100]+OM$OM$F_int[26:100]*0.5)))  
    
    dyn.load(dynlib("CKMRmultinom_POP_HSP_GPP_Fisch_wAE"))
    
    parm_names<-rep(names(par),lapply(par,length))
    
    fixed<-list(steepness=factor(NA),
                log_sd_catch=factor(NA),
                log_sd_index=factor(NA))
    
    lower_bounds<-c(-5,-20,rep(-10,dat$lage),rep(-10,dat$lyear), 0, 5, -5,-5,-5,-5,-5,rep(-10,dat$lyear))
    upper_bounds<-c( 2,  1,rep( 10,dat$lage),rep( 10,dat$lyear), 1, 25, 2, 2, 2, 5, 5,rep(  0,dat$lyear))
    
    reffects=c("log_recruit_devs","log_recruit_devs_init")
    l<-lower_bounds[-which(parm_names %in% c(names(fixed),reffects))]
    u<-upper_bounds[-which(parm_names %in% c(names(fixed),reffects))]
    
    SCAA <- MakeADFun(dat, par, DLL="CKMRmultinom_POP_HSP_GPP_Fisch_wAE", map=fixed, random=reffects)
    SCAA_fit <- TMBhelper::fit_tmb(obj=SCAA, startpar=SCAA$par, lower=l, upper=u, newtonsteps=1, getsd=TRUE,bias.correct=TRUE)
    
    res_list[[Q]][[s]]<-SCAA_fit
    print(c(Q,s))
  }
}

saveRDS(res_list[[1]], file=paste0(wd,"/SCAAfit_Cod_N1000_Ind25_ckmrmultinom20.RData"))
saveRDS(res_list[[2]], file=paste0(wd,"/SCAAfit_Flatfish_N1000_Ind25_ckmrmultinom20.RData"))
saveRDS(res_list[[3]], file=paste0(wd,"/SCAAfit_Sardine_N1000_Ind25_ckmrmultinom20.RData"))

#########################
#Ncomp 1000, sdindex 0.5
#########################
load(paste0(wd,"/Cod_wdat_N1000_Ind50_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N1000_Ind50_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Sardine_wdat_N1000_Ind50_ckmrmultinom20_1.RData"))

#TMB Section
library(TMB)

setwd(wd)
#Compile and load model 
compile("CKMRmultinom_POP_HSP_GPP_Fisch_wAE.cpp")

N_sim<-1:100
res_list<-list()
for (Q in 1:3){  #Running through the life history types
  res_list[[Q]]<-list()
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
                log_sd_index=log(OM$sd_index),
                Sel_logis_k=log(runif(1,min=OM$OM$Sel_slope-OM$OM$Sel_slope*0.5,max=OM$OM$Sel_slope+OM$OM$Sel_slope*0.5)),
                Sel_logis_midpt=log(runif(1,min=OM$OM$Sel_50-OM$OM$Sel_50*0.5,max=OM$OM$Sel_50+OM$OM$Sel_50*0.5)),
                log_fint=log(runif(length(OM$OM$F_int[26:100]),min=OM$OM$F_int[26:100]-OM$OM$F_int[26:100]*0.5,max=OM$OM$F_int[26:100]+OM$OM$F_int[26:100]*0.5)))  
    
    dyn.load(dynlib("CKMRmultinom_POP_HSP_GPP_Fisch_wAE"))
    
    parm_names<-rep(names(par),lapply(par,length))
    
    fixed<-list(steepness=factor(NA),
                log_sd_catch=factor(NA),
                log_sd_index=factor(NA))
    
    lower_bounds<-c(-5,-20,rep(-10,dat$lage),rep(-10,dat$lyear), 0, 5, -5,-5,-5,-5,-5,rep(-10,dat$lyear))
    upper_bounds<-c( 2,  1,rep( 10,dat$lage),rep( 10,dat$lyear), 1, 25, 2, 2, 2, 5, 5,rep(  0,dat$lyear))
    
    reffects=c("log_recruit_devs","log_recruit_devs_init")
    l<-lower_bounds[-which(parm_names %in% c(names(fixed),reffects))]
    u<-upper_bounds[-which(parm_names %in% c(names(fixed),reffects))]
    
    SCAA <- MakeADFun(dat, par, DLL="CKMRmultinom_POP_HSP_GPP_Fisch_wAE", map=fixed, random=reffects)
    SCAA_fit <- TMBhelper::fit_tmb(obj=SCAA, startpar=SCAA$par, lower=l, upper=u, newtonsteps=1, getsd=TRUE,bias.correct=TRUE)
    
    res_list[[Q]][[s]]<-SCAA_fit
    print(c(Q,s))
  }
}

saveRDS(res_list[[1]], file=paste0(wd,"/SCAAfit_Cod_N1000_Ind50_ckmrmultinom20.RData"))
saveRDS(res_list[[2]], file=paste0(wd,"/SCAAfit_Flatfish_N1000_Ind50_ckmrmultinom20.RData"))
saveRDS(res_list[[3]], file=paste0(wd,"/SCAAfit_Sardine_N1000_Ind50_ckmrmultinom20.RData"))

