
####################################################
#Looking at Kinship results
####################################################

wd<-"C:/Users/nfisch/Documents/GitHub/CKMR_Project/"

#Ncomp 100, sdindex 0.25, ckmr 5 years
load(paste0(wd,"/Cod_wdat_N100_Ind25_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N100_Ind25_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Sardine_wdat_N100_Ind25_ckmrmultinom5_1.RData"))

Cod_100_25_5<-Cod_wdat
Flatfish_100_25_5<-Flatfish_wdat
Sardine_100_25_5<-Sardine_wdat

#Ncomp 200, sdindex 0.25, ckmr 5 years
load(paste0(wd,"/Cod_wdat_N200_Ind25_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N200_Ind25_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Sardine_wdat_N200_Ind25_ckmrmultinom5_1.RData"))

Cod_200_25_5<-Cod_wdat
Flatfish_200_25_5<-Flatfish_wdat
Sardine_200_25_5<-Sardine_wdat

#Ncomp 1000, sdindex 0.25, ckmr 5 years
load(paste0(wd,"/Cod_wdat_N1000_Ind25_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N1000_Ind25_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Sardine_wdat_N1000_Ind25_ckmrmultinom5_1.RData"))

Cod_1000_25_5<-Cod_wdat
Flatfish_1000_25_5<-Flatfish_wdat
Sardine_1000_25_5<-Sardine_wdat

#Ncomp 2000, sdindex 0.25, ckmr 5 years
load(paste0(wd,"/Cod_wdat_N2000_Ind25_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N2000_Ind25_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Sardine_wdat_N2000_Ind25_ckmrmultinom5_1.RData"))

Cod_2000_25_5<-Cod_wdat
Flatfish_2000_25_5<-Flatfish_wdat
Sardine_2000_25_5<-Sardine_wdat

#Ncomp 5000, sdindex 0.25, ckmr 5 years
load(paste0(wd,"/Cod_wdat_N5000_Ind25_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N5000_Ind25_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Sardine_wdat_N5000_Ind25_ckmrmultinom5_1.RData"))

Cod_5000_25_5<-Cod_wdat
Flatfish_5000_25_5<-Flatfish_wdat
Sardine_5000_25_5<-Sardine_wdat

#Ncomp 100, sdindex 0.25, ckmr 10 years
load(paste0(wd,"/Cod_wdat_N100_Ind25_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N100_Ind25_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Sardine_wdat_N100_Ind25_ckmrmultinom10_1.RData"))

Cod_100_25_10<-Cod_wdat
Flatfish_100_25_10<-Flatfish_wdat
Sardine_100_25_10<-Sardine_wdat

#Ncomp 200, sdindex 0.25, ckmr 10 years
load(paste0(wd,"/Cod_wdat_N200_Ind25_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N200_Ind25_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Sardine_wdat_N200_Ind25_ckmrmultinom10_1.RData"))

Cod_200_25_10<-Cod_wdat
Flatfish_200_25_10<-Flatfish_wdat
Sardine_200_25_10<-Sardine_wdat

#Ncomp 1000, sdindex 0.25, ckmr 10 years
load(paste0(wd,"/Cod_wdat_N1000_Ind25_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N1000_Ind25_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Sardine_wdat_N1000_Ind25_ckmrmultinom10_1.RData"))

Cod_1000_25_10<-Cod_wdat
Flatfish_1000_25_10<-Flatfish_wdat
Sardine_1000_25_10<-Sardine_wdat

#Ncomp 2000, sdindex 0.25, ckmr 10 years
load(paste0(wd,"/Cod_wdat_N2000_Ind25_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N2000_Ind25_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Sardine_wdat_N2000_Ind25_ckmrmultinom10_1.RData"))

Cod_2000_25_10<-Cod_wdat
Flatfish_2000_25_10<-Flatfish_wdat
Sardine_2000_25_10<-Sardine_wdat

#Ncomp 5000, sdindex 0.25, ckmr 10 years
load(paste0(wd,"/Cod_wdat_N5000_Ind25_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N5000_Ind25_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Sardine_wdat_N5000_Ind25_ckmrmultinom10_1.RData"))

Cod_5000_25_10<-Cod_wdat
Flatfish_5000_25_10<-Flatfish_wdat
Sardine_5000_25_10<-Sardine_wdat

#Ncomp 100, sdindex 0.25, ckmr 25 years
load(paste0(wd,"/Cod_wdat_N100_Ind25_ckmrmultinom25_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N100_Ind25_ckmrmultinom25_1.RData"))
load(paste0(wd,"/Sardine_wdat_N100_Ind25_ckmrmultinom25_1.RData"))

Cod_100_25_25<-Cod_wdat
Flatfish_100_25_25<-Flatfish_wdat
Sardine_100_25_25<-Sardine_wdat

#Ncomp 200, sdindex 0.25, ckmr 25 years
load(paste0(wd,"/Cod_wdat_N200_Ind25_ckmrmultinom25_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N200_Ind25_ckmrmultinom25_1.RData"))
load(paste0(wd,"/Sardine_wdat_N200_Ind25_ckmrmultinom25_1.RData"))

Cod_200_25_25<-Cod_wdat
Flatfish_200_25_25<-Flatfish_wdat
Sardine_200_25_25<-Sardine_wdat

#Ncomp 1000, sdindex 0.25, ckmr 25 years
load(paste0(wd,"/Cod_wdat_N1000_Ind25_ckmrmultinom25_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N1000_Ind25_ckmrmultinom25_1.RData"))
load(paste0(wd,"/Sardine_wdat_N1000_Ind25_ckmrmultinom25_1.RData"))

Cod_1000_25_25<-Cod_wdat
Flatfish_1000_25_25<-Flatfish_wdat
Sardine_1000_25_25<-Sardine_wdat

#Ncomp 2000, sdindex 0.25, ckmr 25 years
load(paste0(wd,"/Cod_wdat_N2000_Ind25_ckmrmultinom25_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N2000_Ind25_ckmrmultinom25_1.RData"))
load(paste0(wd,"/Sardine_wdat_N2000_Ind25_ckmrmultinom25_1.RData"))

Cod_2000_25_25<-Cod_wdat
Flatfish_2000_25_25<-Flatfish_wdat
Sardine_2000_25_25<-Sardine_wdat

#Ncomp 5000, sdindex 0.25, ckmr 25 years
load(paste0(wd,"/Cod_wdat_N5000_Ind25_ckmrmultinom25_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N5000_Ind25_ckmrmultinom25_1.RData"))
load(paste0(wd,"/Sardine_wdat_N5000_Ind25_ckmrmultinom25_1.RData"))

Cod_5000_25_25<-Cod_wdat
Flatfish_5000_25_25<-Flatfish_wdat
Sardine_5000_25_25<-Sardine_wdat

#Ncomp 100, sdindex 0.50, ckmr 5 years
load(paste0(wd,"/Cod_wdat_N100_Ind50_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N100_Ind50_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Sardine_wdat_N100_Ind50_ckmrmultinom5_1.RData"))

Cod_100_50_5<-Cod_wdat
Flatfish_100_50_5<-Flatfish_wdat
Sardine_100_50_5<-Sardine_wdat

#Ncomp 200, sdindex 0.50, ckmr 5 years
load(paste0(wd,"/Cod_wdat_N200_Ind50_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N200_Ind50_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Sardine_wdat_N200_Ind50_ckmrmultinom5_1.RData"))

Cod_200_50_5<-Cod_wdat
Flatfish_200_50_5<-Flatfish_wdat
Sardine_200_50_5<-Sardine_wdat

#Ncomp 1000, sdindex 0.50, ckmr 5 years
load(paste0(wd,"/Cod_wdat_N1000_Ind50_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N1000_Ind50_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Sardine_wdat_N1000_Ind50_ckmrmultinom5_1.RData"))

Cod_1000_50_5<-Cod_wdat
Flatfish_1000_50_5<-Flatfish_wdat
Sardine_1000_50_5<-Sardine_wdat

#Ncomp 2000, sdindex 0.50, ckmr 5 years
load(paste0(wd,"/Cod_wdat_N2000_Ind50_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N2000_Ind50_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Sardine_wdat_N2000_Ind50_ckmrmultinom5_1.RData"))

Cod_2000_50_5<-Cod_wdat
Flatfish_2000_50_5<-Flatfish_wdat
Sardine_2000_50_5<-Sardine_wdat

#Ncomp 5000, sdindex 0.50, ckmr 5 years
load(paste0(wd,"/Cod_wdat_N5000_Ind50_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N5000_Ind50_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Sardine_wdat_N5000_Ind50_ckmrmultinom5_1.RData"))

Cod_5000_50_5<-Cod_wdat
Flatfish_5000_50_5<-Flatfish_wdat
Sardine_5000_50_5<-Sardine_wdat

#Ncomp 100, sdindex 0.50, ckmr 10 years
load(paste0(wd,"/Cod_wdat_N100_Ind50_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N100_Ind50_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Sardine_wdat_N100_Ind50_ckmrmultinom10_1.RData"))

Cod_100_50_10<-Cod_wdat
Flatfish_100_50_10<-Flatfish_wdat
Sardine_100_50_10<-Sardine_wdat

#Ncomp 200, sdindex 0.50, ckmr 10 years
load(paste0(wd,"/Cod_wdat_N200_Ind50_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N200_Ind50_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Sardine_wdat_N200_Ind50_ckmrmultinom10_1.RData"))

Cod_200_50_10<-Cod_wdat
Flatfish_200_50_10<-Flatfish_wdat
Sardine_200_50_10<-Sardine_wdat

#Ncomp 1000, sdindex 0.50, ckmr 10 years
load(paste0(wd,"/Cod_wdat_N1000_Ind50_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N1000_Ind50_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Sardine_wdat_N1000_Ind50_ckmrmultinom10_1.RData"))

Cod_1000_50_10<-Cod_wdat
Flatfish_1000_50_10<-Flatfish_wdat
Sardine_1000_50_10<-Sardine_wdat

#Ncomp 2000, sdindex 0.50, ckmr 10 years
load(paste0(wd,"/Cod_wdat_N2000_Ind50_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N2000_Ind50_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Sardine_wdat_N2000_Ind50_ckmrmultinom10_1.RData"))

Cod_2000_50_10<-Cod_wdat
Flatfish_2000_50_10<-Flatfish_wdat
Sardine_2000_50_10<-Sardine_wdat

#Ncomp 5000, sdindex 0.50, ckmr 10 years
load(paste0(wd,"/Cod_wdat_N5000_Ind50_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N5000_Ind50_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Sardine_wdat_N5000_Ind50_ckmrmultinom10_1.RData"))

Cod_5000_50_10<-Cod_wdat
Flatfish_5000_50_10<-Flatfish_wdat
Sardine_5000_50_10<-Sardine_wdat

#Ncomp 100, sdindex 0.50, ckmr 25 years
load(paste0(wd,"/Cod_wdat_N100_Ind50_ckmrmultinom25_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N100_Ind50_ckmrmultinom25_1.RData"))
load(paste0(wd,"/Sardine_wdat_N100_Ind50_ckmrmultinom25_1.RData"))

Cod_100_50_50<-Cod_wdat
Flatfish_100_50_50<-Flatfish_wdat
Sardine_100_50_50<-Sardine_wdat

#Ncomp 200, sdindex 0.50, ckmr 25 years
load(paste0(wd,"/Cod_wdat_N200_Ind50_ckmrmultinom25_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N200_Ind50_ckmrmultinom25_1.RData"))
load(paste0(wd,"/Sardine_wdat_N200_Ind50_ckmrmultinom25_1.RData"))

Cod_200_50_50<-Cod_wdat
Flatfish_200_50_50<-Flatfish_wdat
Sardine_200_50_50<-Sardine_wdat

#Ncomp 1000, sdindex 0.50, ckmr 25 years
load(paste0(wd,"/Cod_wdat_N1000_Ind50_ckmrmultinom25_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N1000_Ind50_ckmrmultinom25_1.RData"))
load(paste0(wd,"/Sardine_wdat_N1000_Ind50_ckmrmultinom25_1.RData"))

Cod_1000_50_50<-Cod_wdat
Flatfish_1000_50_50<-Flatfish_wdat
Sardine_1000_50_50<-Sardine_wdat

#Ncomp 2000, sdindex 0.50, ckmr 25 years
load(paste0(wd,"/Cod_wdat_N2000_Ind50_ckmrmultinom25_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N2000_Ind50_ckmrmultinom25_1.RData"))
load(paste0(wd,"/Sardine_wdat_N2000_Ind50_ckmrmultinom25_1.RData"))

Cod_2000_50_50<-Cod_wdat
Flatfish_2000_50_50<-Flatfish_wdat
Sardine_2000_50_50<-Sardine_wdat

#Ncomp 5000, sdindex 0.50, ckmr 25 years
load(paste0(wd,"/Cod_wdat_N5000_Ind50_ckmrmultinom25_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N5000_Ind50_ckmrmultinom25_1.RData"))
load(paste0(wd,"/Sardine_wdat_N5000_Ind50_ckmrmultinom25_1.RData"))

Cod_5000_50_50<-Cod_wdat
Flatfish_5000_50_50<-Flatfish_wdat
Sardine_5000_50_50<-Sardine_wdat

#############################################
#Looking at the number of pairs by treatment 
#############################################
#Getting it into more usable data 
Pairs_Cod_100_25_5<-Pairs_Cod_200_25_5<-Pairs_Cod_1000_25_5<-Pairs_Cod_2000_25_5<-Pairs_Cod_5000_25_5<-matrix(NA, nrow=100,ncol=2)
Pairs_Cod_100_25_10<-Pairs_Cod_200_25_10<-Pairs_Cod_1000_25_10<-Pairs_Cod_2000_25_10<-Pairs_Cod_5000_25_10<-matrix(NA, nrow=100,ncol=2)
Pairs_Cod_100_25_25<-Pairs_Cod_200_25_25<-Pairs_Cod_1000_25_25<-Pairs_Cod_2000_25_25<-Pairs_Cod_5000_25_25<-matrix(NA, nrow=100,ncol=2)
Pairs_Flatfish_100_25_5<-Pairs_Flatfish_200_25_5<-Pairs_Flatfish_1000_25_5<-Pairs_Flatfish_2000_25_5<-Pairs_Flatfish_5000_25_5<-matrix(NA, nrow=100,ncol=2)
Pairs_Flatfish_100_25_10<-Pairs_Flatfish_200_25_10<-Pairs_Flatfish_1000_25_10<-Pairs_Flatfish_2000_25_10<-Pairs_Flatfish_5000_25_10<-matrix(NA, nrow=100,ncol=2)
Pairs_Flatfish_100_25_25<-Pairs_Flatfish_200_25_25<-Pairs_Flatfish_1000_25_25<-Pairs_Flatfish_2000_25_25<-Pairs_Flatfish_5000_25_25<-matrix(NA, nrow=100,ncol=2)
Pairs_Sardine_100_25_5<-Pairs_Sardine_200_25_5<-Pairs_Sardine_1000_25_5<-Pairs_Sardine_2000_25_5<-Pairs_Sardine_5000_25_5<-matrix(NA, nrow=100,ncol=2)
Pairs_Sardine_100_25_10<-Pairs_Sardine_200_25_10<-Pairs_Sardine_1000_25_10<-Pairs_Sardine_2000_25_10<-Pairs_Sardine_5000_25_10<-matrix(NA, nrow=100,ncol=2)
Pairs_Sardine_100_25_25<-Pairs_Sardine_200_25_25<-Pairs_Sardine_1000_25_25<-Pairs_Sardine_2000_25_25<-Pairs_Sardine_5000_25_25<-matrix(NA, nrow=100,ncol=2)
for (i in 1:100){
 Pairs_Cod_100_25_5[i,1]<-(sum(Cod_100_25_5[[i]]$k_ckmr_pop))
 Pairs_Cod_100_25_5[i,2]<-(sum(Cod_100_25_5[[i]]$k_ckmr_hsp))
 Pairs_Cod_200_25_5[i,1]<-(sum(Cod_200_25_5[[i]]$k_ckmr_pop))
 Pairs_Cod_200_25_5[i,2]<-(sum(Cod_200_25_5[[i]]$k_ckmr_hsp))
 Pairs_Cod_1000_25_5[i,1]<-(sum(Cod_1000_25_5[[i]]$k_ckmr_pop))
 Pairs_Cod_1000_25_5[i,2]<-(sum(Cod_1000_25_5[[i]]$k_ckmr_hsp))
 Pairs_Cod_2000_25_5[i,1]<-(sum(Cod_2000_25_5[[i]]$k_ckmr_pop))
 Pairs_Cod_2000_25_5[i,2]<-(sum(Cod_2000_25_5[[i]]$k_ckmr_hsp))
 Pairs_Cod_5000_25_5[i,1]<-(sum(Cod_5000_25_5[[i]]$k_ckmr_pop))
 Pairs_Cod_5000_25_5[i,2]<-(sum(Cod_5000_25_5[[i]]$k_ckmr_hsp))
 
 Pairs_Cod_100_25_10[i,1]<-(sum(Cod_100_25_10[[i]]$k_ckmr_pop))
 Pairs_Cod_100_25_10[i,2]<-(sum(Cod_100_25_10[[i]]$k_ckmr_hsp))
 Pairs_Cod_200_25_10[i,1]<-(sum(Cod_200_25_10[[i]]$k_ckmr_pop))
 Pairs_Cod_200_25_10[i,2]<-(sum(Cod_200_25_10[[i]]$k_ckmr_hsp))
 Pairs_Cod_1000_25_10[i,1]<-(sum(Cod_1000_25_10[[i]]$k_ckmr_pop))
 Pairs_Cod_1000_25_10[i,2]<-(sum(Cod_1000_25_10[[i]]$k_ckmr_hsp))
 Pairs_Cod_2000_25_10[i,1]<-(sum(Cod_2000_25_10[[i]]$k_ckmr_pop))
 Pairs_Cod_2000_25_10[i,2]<-(sum(Cod_2000_25_10[[i]]$k_ckmr_hsp))
 Pairs_Cod_5000_25_10[i,1]<-(sum(Cod_5000_25_10[[i]]$k_ckmr_pop))
 Pairs_Cod_5000_25_10[i,2]<-(sum(Cod_5000_25_10[[i]]$k_ckmr_hsp))
 
 Pairs_Cod_100_25_25[i,1]<-(sum(Cod_100_25_25[[i]]$k_ckmr_pop))
 Pairs_Cod_100_25_25[i,2]<-(sum(Cod_100_25_25[[i]]$k_ckmr_hsp))
 Pairs_Cod_200_25_25[i,1]<-(sum(Cod_200_25_25[[i]]$k_ckmr_pop))
 Pairs_Cod_200_25_25[i,2]<-(sum(Cod_200_25_25[[i]]$k_ckmr_hsp))
 Pairs_Cod_1000_25_25[i,1]<-(sum(Cod_1000_25_25[[i]]$k_ckmr_pop))
 Pairs_Cod_1000_25_25[i,2]<-(sum(Cod_1000_25_25[[i]]$k_ckmr_hsp))
 Pairs_Cod_2000_25_25[i,1]<-(sum(Cod_2000_25_25[[i]]$k_ckmr_pop))
 Pairs_Cod_2000_25_25[i,2]<-(sum(Cod_2000_25_25[[i]]$k_ckmr_hsp))
 Pairs_Cod_5000_25_25[i,1]<-(sum(Cod_5000_25_25[[i]]$k_ckmr_pop))
 Pairs_Cod_5000_25_25[i,2]<-(sum(Cod_5000_25_25[[i]]$k_ckmr_hsp))
 
 Pairs_Flatfish_100_25_5[i,1]<-(sum(Flatfish_100_25_5[[i]]$k_ckmr_pop))
 Pairs_Flatfish_100_25_5[i,2]<-(sum(Flatfish_100_25_5[[i]]$k_ckmr_hsp))
 Pairs_Flatfish_200_25_5[i,1]<-(sum(Flatfish_200_25_5[[i]]$k_ckmr_pop))
 Pairs_Flatfish_200_25_5[i,2]<-(sum(Flatfish_200_25_5[[i]]$k_ckmr_hsp))
 Pairs_Flatfish_1000_25_5[i,1]<-(sum(Flatfish_1000_25_5[[i]]$k_ckmr_pop))
 Pairs_Flatfish_1000_25_5[i,2]<-(sum(Flatfish_1000_25_5[[i]]$k_ckmr_hsp))
 Pairs_Flatfish_2000_25_5[i,1]<-(sum(Flatfish_2000_25_5[[i]]$k_ckmr_pop))
 Pairs_Flatfish_2000_25_5[i,2]<-(sum(Flatfish_2000_25_5[[i]]$k_ckmr_hsp))
 Pairs_Flatfish_5000_25_5[i,1]<-(sum(Flatfish_5000_25_5[[i]]$k_ckmr_pop))
 Pairs_Flatfish_5000_25_5[i,2]<-(sum(Flatfish_5000_25_5[[i]]$k_ckmr_hsp))
 
 Pairs_Flatfish_100_25_10[i,1]<-(sum(Flatfish_100_25_10[[i]]$k_ckmr_pop))
 Pairs_Flatfish_100_25_10[i,2]<-(sum(Flatfish_100_25_10[[i]]$k_ckmr_hsp))
 Pairs_Flatfish_200_25_10[i,1]<-(sum(Flatfish_200_25_10[[i]]$k_ckmr_pop))
 Pairs_Flatfish_200_25_10[i,2]<-(sum(Flatfish_200_25_10[[i]]$k_ckmr_hsp))
 Pairs_Flatfish_1000_25_10[i,1]<-(sum(Flatfish_1000_25_10[[i]]$k_ckmr_pop))
 Pairs_Flatfish_1000_25_10[i,2]<-(sum(Flatfish_1000_25_10[[i]]$k_ckmr_hsp))
 Pairs_Flatfish_2000_25_10[i,1]<-(sum(Flatfish_2000_25_10[[i]]$k_ckmr_pop))
 Pairs_Flatfish_2000_25_10[i,2]<-(sum(Flatfish_2000_25_10[[i]]$k_ckmr_hsp))
 Pairs_Flatfish_5000_25_10[i,1]<-(sum(Flatfish_5000_25_10[[i]]$k_ckmr_pop))
 Pairs_Flatfish_5000_25_10[i,2]<-(sum(Flatfish_5000_25_10[[i]]$k_ckmr_hsp))
 
 Pairs_Flatfish_100_25_25[i,1]<-(sum(Flatfish_100_25_25[[i]]$k_ckmr_pop))
 Pairs_Flatfish_100_25_25[i,2]<-(sum(Flatfish_100_25_25[[i]]$k_ckmr_hsp))
 Pairs_Flatfish_200_25_25[i,1]<-(sum(Flatfish_200_25_25[[i]]$k_ckmr_pop))
 Pairs_Flatfish_200_25_25[i,2]<-(sum(Flatfish_200_25_25[[i]]$k_ckmr_hsp))
 Pairs_Flatfish_1000_25_25[i,1]<-(sum(Flatfish_1000_25_25[[i]]$k_ckmr_pop))
 Pairs_Flatfish_1000_25_25[i,2]<-(sum(Flatfish_1000_25_25[[i]]$k_ckmr_hsp))
 Pairs_Flatfish_2000_25_25[i,1]<-(sum(Flatfish_2000_25_25[[i]]$k_ckmr_pop))
 Pairs_Flatfish_2000_25_25[i,2]<-(sum(Flatfish_2000_25_25[[i]]$k_ckmr_hsp))
 Pairs_Flatfish_5000_25_25[i,1]<-(sum(Flatfish_5000_25_25[[i]]$k_ckmr_pop))
 Pairs_Flatfish_5000_25_25[i,2]<-(sum(Flatfish_5000_25_25[[i]]$k_ckmr_hsp))
 
 Pairs_Sardine_100_25_5[i,1]<-(sum(Sardine_100_25_5[[i]]$k_ckmr_pop))
 Pairs_Sardine_100_25_5[i,2]<-(sum(Sardine_100_25_5[[i]]$k_ckmr_hsp))
 Pairs_Sardine_200_25_5[i,1]<-(sum(Sardine_200_25_5[[i]]$k_ckmr_pop))
 Pairs_Sardine_200_25_5[i,2]<-(sum(Sardine_200_25_5[[i]]$k_ckmr_hsp))
 Pairs_Sardine_1000_25_5[i,1]<-(sum(Sardine_1000_25_5[[i]]$k_ckmr_pop))
 Pairs_Sardine_1000_25_5[i,2]<-(sum(Sardine_1000_25_5[[i]]$k_ckmr_hsp))
 Pairs_Sardine_2000_25_5[i,1]<-(sum(Sardine_2000_25_5[[i]]$k_ckmr_pop))
 Pairs_Sardine_2000_25_5[i,2]<-(sum(Sardine_2000_25_5[[i]]$k_ckmr_hsp))
 Pairs_Sardine_5000_25_5[i,1]<-(sum(Sardine_5000_25_5[[i]]$k_ckmr_pop))
 Pairs_Sardine_5000_25_5[i,2]<-(sum(Sardine_5000_25_5[[i]]$k_ckmr_hsp))
 
 Pairs_Sardine_100_25_10[i,1]<-(sum(Sardine_100_25_10[[i]]$k_ckmr_pop))
 Pairs_Sardine_100_25_10[i,2]<-(sum(Sardine_100_25_10[[i]]$k_ckmr_hsp))
 Pairs_Sardine_200_25_10[i,1]<-(sum(Sardine_200_25_10[[i]]$k_ckmr_pop))
 Pairs_Sardine_200_25_10[i,2]<-(sum(Sardine_200_25_10[[i]]$k_ckmr_hsp))
 Pairs_Sardine_1000_25_10[i,1]<-(sum(Sardine_1000_25_10[[i]]$k_ckmr_pop))
 Pairs_Sardine_1000_25_10[i,2]<-(sum(Sardine_1000_25_10[[i]]$k_ckmr_hsp))
 Pairs_Sardine_2000_25_10[i,1]<-(sum(Sardine_2000_25_10[[i]]$k_ckmr_pop))
 Pairs_Sardine_2000_25_10[i,2]<-(sum(Sardine_2000_25_10[[i]]$k_ckmr_hsp))
 Pairs_Sardine_5000_25_10[i,1]<-(sum(Sardine_5000_25_10[[i]]$k_ckmr_pop))
 Pairs_Sardine_5000_25_10[i,2]<-(sum(Sardine_5000_25_10[[i]]$k_ckmr_hsp))
 
 Pairs_Sardine_100_25_25[i,1]<-(sum(Sardine_100_25_25[[i]]$k_ckmr_pop))
 Pairs_Sardine_100_25_25[i,2]<-(sum(Sardine_100_25_25[[i]]$k_ckmr_hsp))
 Pairs_Sardine_200_25_25[i,1]<-(sum(Sardine_200_25_25[[i]]$k_ckmr_pop))
 Pairs_Sardine_200_25_25[i,2]<-(sum(Sardine_200_25_25[[i]]$k_ckmr_hsp))
 Pairs_Sardine_1000_25_25[i,1]<-(sum(Sardine_1000_25_25[[i]]$k_ckmr_pop))
 Pairs_Sardine_1000_25_25[i,2]<-(sum(Sardine_1000_25_25[[i]]$k_ckmr_hsp))
 Pairs_Sardine_2000_25_25[i,1]<-(sum(Sardine_2000_25_25[[i]]$k_ckmr_pop))
 Pairs_Sardine_2000_25_25[i,2]<-(sum(Sardine_2000_25_25[[i]]$k_ckmr_hsp))
 Pairs_Sardine_5000_25_25[i,1]<-(sum(Sardine_5000_25_25[[i]]$k_ckmr_pop))
 Pairs_Sardine_5000_25_25[i,2]<-(sum(Sardine_5000_25_25[[i]]$k_ckmr_hsp))
}

#N100
#tiff(paste0(wd,"CKMRPairs_N100.tiff"), height=20, width=30, units='cm', compression="lzw", res=500)
par(mfrow=c(3,6), oma=c(2,2,1,1), mar=c(4,4,2.5,1))
hist(Pairs_Cod_100_25_5[,1], breaks=seq(-0.5,1e6,1), xlim=c(-1,10), las=1, xlab="", main="")
mtext(text="5yr", side=2, line=4.5, font=2)
mtext(text="POP", side=3, line=-2,font=2)
hist(Pairs_Cod_100_25_5[,2], breaks=seq(-0.5,1e6,1), xlim=c(-1,10), las=1, xlab="", main="", ylab="")
mtext(text="Cod", side=3, line=2, at=-4, font=2)
mtext(text="HSP", side=3, line=-2,font=2)

hist(Pairs_Flatfish_100_25_5[,1], breaks=seq(-0.5,1e6,10), xlim=c(-1,400), las=1, xlab="", main="", ylab="")
mtext(text="POP", side=3, line=-2,font=2)
hist(Pairs_Flatfish_100_25_5[,2], breaks=seq(-0.5,1e6,10), xlim=c(-1,400), las=1, xlab="", main="", ylab="")
mtext(text="Flatfish", side=3, line=2, at=-75, font=2)
mtext(text="HSP", side=3, line=-2,font=2)

hist(Pairs_Sardine_100_25_5[,1], breaks=seq(-0.5,1e6,1), xlim=c(-1,10), las=1, xlab="", main="", ylab="")
mtext(text="POP", side=3, line=-2,font=2)
hist(Pairs_Sardine_100_25_5[,2], breaks=seq(-0.5,1e6,1), xlim=c(-1,10), las=1, xlab="", main="", ylab="")
mtext(text="Sardine", side=3, line=2, at=-4, font=2)
mtext(text="HSP", side=3, line=-2,font=2)

hist(Pairs_Cod_100_25_10[,1], breaks=seq(-0.5,1e6,1), xlim=c(-1,10), las=1, xlab="", main="")
mtext(text="10yr", side=2, line=4.5, font=2)
hist(Pairs_Cod_100_25_10[,2], breaks=seq(-0.5,1e6,1), xlim=c(-1,10), las=1, xlab="", main="", ylab="")

hist(Pairs_Flatfish_100_25_10[,1], breaks=seq(-0.5,1e6,10), xlim=c(-1,400), las=1, xlab="", main="", ylab="")
hist(Pairs_Flatfish_100_25_10[,2], breaks=seq(-0.5,1e6,10), xlim=c(-1,400), las=1, xlab="", main="", ylab="")

hist(Pairs_Sardine_100_25_10[,1], breaks=seq(-0.5,1e6,1), xlim=c(-1,10), las=1, xlab="", main="", ylab="")
hist(Pairs_Sardine_100_25_10[,2], breaks=seq(-0.5,1e6,1), xlim=c(-1,10), las=1, xlab="", main="", ylab="")

hist(Pairs_Cod_100_25_25[,1], breaks=seq(-0.5,1e6,1), xlim=c(-1,10), las=1, xlab="Parent-Offspring Pairs", main="")
mtext(text="25yr", side=2, line=4.5, font=2)
hist(Pairs_Cod_100_25_25[,2], breaks=seq(-0.5,1e6,1), xlim=c(-1,10), las=1, xlab="Half-Sibling Pairs", main="", ylab="")

hist(Pairs_Flatfish_100_25_25[,1], breaks=seq(-0.5,1e6,10), xlim=c(-1,400), las=1, xlab="Parent-Offspring Pairs", main="", ylab="")
hist(Pairs_Flatfish_100_25_25[,2], breaks=seq(-0.5,1e6,10), xlim=c(-1,400), las=1, xlab="Half-Sibling Pairs", main="", ylab="")

hist(Pairs_Sardine_100_25_25[,1], breaks=seq(-0.5,1e6,1), xlim=c(-1,10), las=1, xlab="Parent-Offspring Pairs", main="", ylab="")
hist(Pairs_Sardine_100_25_25[,2], breaks=seq(-0.5,1e6,1), xlim=c(-1,10), las=1, xlab="Half-Sibling Pairs", main="", ylab="")
#dev.off()

#N200
#tiff(paste0(wd,"CKMRPairs_N200.tiff"), height=20, width=30, units='cm', compression="lzw", res=500)
par(mfrow=c(3,6), oma=c(2,2,1,1), mar=c(4,4,2.5,1))
hist(Pairs_Cod_200_25_5[,1], breaks=seq(-0.5,1e6,1), xlim=c(-1,10), las=1, xlab="", main="")
mtext(text="5yr", side=2, line=4.5, font=2)
mtext(text="POP", side=3, line=-2,font=2)
hist(Pairs_Cod_200_25_5[,2], breaks=seq(-0.5,1e6,1), xlim=c(-1,10), las=1, xlab="", main="", ylab="")
mtext(text="Cod", side=3, line=2, at=-4, font=2)
mtext(text="HSP", side=3, line=-2,font=2)

hist(Pairs_Flatfish_200_25_5[,1], breaks=seq(-0.5,1e6,10), xlim=c(-1,400), las=1, xlab="", main="", ylab="")
mtext(text="POP", side=3, line=-2,font=2)
hist(Pairs_Flatfish_200_25_5[,2], breaks=seq(-0.5,1e6,10), xlim=c(-1,400), las=1, xlab="", main="", ylab="")
mtext(text="Flatfish", side=3, line=2, at=-75, font=2)
mtext(text="HSP", side=3, line=-2,font=2)

hist(Pairs_Sardine_200_25_5[,1], breaks=seq(-0.5,1e6,1), xlim=c(-1,10), las=1, xlab="", main="", ylab="")
mtext(text="POP", side=3, line=-2,font=2)
hist(Pairs_Sardine_200_25_5[,2], breaks=seq(-0.5,1e6,1), xlim=c(-1,10), las=1, xlab="", main="", ylab="")
mtext(text="Sardine", side=3, line=2, at=-4, font=2)
mtext(text="HSP", side=3, line=-2,font=2)

hist(Pairs_Cod_200_25_10[,1], breaks=seq(-0.5,1e6,1), xlim=c(-1,10), las=1, xlab="", main="")
mtext(text="10yr", side=2, line=4.5, font=2)
hist(Pairs_Cod_200_25_10[,2], breaks=seq(-0.5,1e6,1), xlim=c(-1,10), las=1, xlab="", main="", ylab="")

hist(Pairs_Flatfish_200_25_10[,1], breaks=seq(-0.5,1e6,10), xlim=c(-1,400), las=1, xlab="", main="", ylab="")
hist(Pairs_Flatfish_200_25_10[,2], breaks=seq(-0.5,1e6,10), xlim=c(-1,400), las=1, xlab="", main="", ylab="")

hist(Pairs_Sardine_200_25_10[,1], breaks=seq(-0.5,1e6,1), xlim=c(-1,10), las=1, xlab="", main="", ylab="")
hist(Pairs_Sardine_200_25_10[,2], breaks=seq(-0.5,1e6,1), xlim=c(-1,10), las=1, xlab="", main="", ylab="")

hist(Pairs_Cod_200_25_25[,1], breaks=seq(-0.5,1e6,1), xlim=c(-1,10), las=1, xlab="Parent-Offspring Pairs", main="")
mtext(text="25yr", side=2, line=4.5, font=2)
hist(Pairs_Cod_200_25_25[,2], breaks=seq(-0.5,1e6,1), xlim=c(-1,10), las=1, xlab="Half-Sibling Pairs", main="", ylab="")

hist(Pairs_Flatfish_200_25_25[,1], breaks=seq(-0.5,1e6,10), xlim=c(-1,400), las=1, xlab="Parent-Offspring Pairs", main="", ylab="")
hist(Pairs_Flatfish_200_25_25[,2], breaks=seq(-0.5,1e6,10), xlim=c(-1,400), las=1, xlab="Half-Sibling Pairs", main="", ylab="")

hist(Pairs_Sardine_200_25_25[,1], breaks=seq(-0.5,1e6,1), xlim=c(-1,10), las=1, xlab="Parent-Offspring Pairs", main="", ylab="")
hist(Pairs_Sardine_200_25_25[,2], breaks=seq(-0.5,1e6,1), xlim=c(-1,10), las=1, xlab="Half-Sibling Pairs", main="", ylab="")
#dev.off()

#N1000
#tiff(paste0(wd,"CKMRPairs_N1000.tiff"), height=20, width=30, units='cm', compression="lzw", res=500)
par(mfrow=c(3,6), oma=c(2,2,1,1), mar=c(4,4,2.5,1))
hist(Pairs_Cod_1000_25_5[,1], breaks=seq(-0.5,1e6,1), xlim=c(-1,10), las=1, xlab="", main="")
mtext(text="5yr", side=2, line=4.5, font=2)
mtext(text="POP", side=3, line=-2,font=2)
hist(Pairs_Cod_1000_25_5[,2], breaks=seq(-0.5,1e6,1), xlim=c(-1,10), las=1, xlab="", main="", ylab="")
mtext(text="Cod", side=3, line=2, at=-4, font=2)
mtext(text="HSP", side=3, line=-2,font=2)

hist(Pairs_Flatfish_1000_25_5[,1], breaks=seq(-0.5,1e6,100), xlim=c(-1,15000), las=1, xlab="", main="", ylab="")
mtext(text="POP", side=3, line=-2,font=2)
hist(Pairs_Flatfish_1000_25_5[,2], breaks=seq(-0.5,1e6,100), xlim=c(-1,15000), las=1, xlab="", main="", ylab="")
mtext(text="Flatfish", side=3, line=2, at=-2500, font=2)
mtext(text="HSP", side=3, line=-2,font=2)

hist(Pairs_Sardine_1000_25_5[,1], breaks=seq(-0.5,1e6,1), xlim=c(-1,100), las=1, xlab="", main="", ylab="")
mtext(text="POP", side=3, line=-2,font=2)
hist(Pairs_Sardine_1000_25_5[,2], breaks=seq(-0.5,1e6,1), xlim=c(-1,100), las=1, xlab="", main="", ylab="")
mtext(text="Sardine", side=3, line=2, at=-25, font=2)
mtext(text="HSP", side=3, line=-2,font=2)

hist(Pairs_Cod_1000_25_10[,1], breaks=seq(-0.5,1e6,1), xlim=c(-1,10), las=1, xlab="", main="")
mtext(text="10yr", side=2, line=4.5, font=2)
hist(Pairs_Cod_1000_25_10[,2], breaks=seq(-0.5,1e6,1), xlim=c(-1,10), las=1, xlab="", main="", ylab="")

hist(Pairs_Flatfish_1000_25_10[,1], breaks=seq(-0.5,1e6,100), xlim=c(-1,15000), las=1, xlab="", main="", ylab="")
hist(Pairs_Flatfish_1000_25_10[,2], breaks=seq(-0.5,1e6,100), xlim=c(-1,15000), las=1, xlab="", main="", ylab="")

hist(Pairs_Sardine_1000_25_10[,1], breaks=seq(-0.5,1e6,1), xlim=c(-1,100), las=1, xlab="", main="", ylab="")
hist(Pairs_Sardine_1000_25_10[,2], breaks=seq(-0.5,1e6,1), xlim=c(-1,100), las=1, xlab="", main="", ylab="")

hist(Pairs_Cod_1000_25_25[,1], breaks=seq(-0.5,1e6,1), xlim=c(-1,10), las=1, xlab="Parent-Offspring Pairs", main="")
mtext(text="25yr", side=2, line=4.5, font=2)
hist(Pairs_Cod_1000_25_25[,2], breaks=seq(-0.5,1e6,1), xlim=c(-1,10), las=1, xlab="Half-Sibling Pairs", main="", ylab="")

hist(Pairs_Flatfish_1000_25_25[,1], breaks=seq(-0.5,1e6,100), xlim=c(-1,15000), las=1, xlab="Parent-Offspring Pairs", main="", ylab="")
hist(Pairs_Flatfish_1000_25_25[,2], breaks=seq(-0.5,1e6,100), xlim=c(-1,15000), las=1, xlab="Half-Sibling Pairs", main="", ylab="")

hist(Pairs_Sardine_1000_25_25[,1], breaks=seq(-0.5,1e6,1), xlim=c(-1,100), las=1, xlab="Parent-Offspring Pairs", main="", ylab="")
hist(Pairs_Sardine_1000_25_25[,2], breaks=seq(-0.5,1e6,1), xlim=c(-1,100), las=1, xlab="Half-Sibling Pairs", main="", ylab="")
#dev.off()

#N2000
#tiff(paste0(wd,"CKMRPairs_N2000.tiff"), height=20, width=30, units='cm', compression="lzw", res=500)
par(mfrow=c(3,6), oma=c(2,2,1,1), mar=c(4,4,2.5,1))
hist(Pairs_Cod_2000_25_5[,1], breaks=seq(-0.5,1e6,1), xlim=c(-1,25), las=1, xlab="", main="")
mtext(text="5yr", side=2, line=4.5, font=2)
mtext(text="POP", side=3, line=-2,font=2)
hist(Pairs_Cod_2000_25_5[,2], breaks=seq(-0.5,1e6,1), xlim=c(-1,25), las=1, xlab="", main="", ylab="")
mtext(text="Cod", side=3, line=2, at=-8, font=2)
mtext(text="HSP", side=3, line=-2,font=2)

hist(Pairs_Flatfish_2000_25_5[,1], breaks=seq(-0.5,1e6,500), xlim=c(-1,50000), las=1, xlab="", main="", ylab="")
mtext(text="POP", side=3, line=-2,font=2)
hist(Pairs_Flatfish_2000_25_5[,2], breaks=seq(-0.5,1e6,500), xlim=c(-1,50000), las=1, xlab="", main="", ylab="")
mtext(text="Flatfish", side=3, line=2, at=-10000, font=2)
mtext(text="HSP", side=3, line=-2,font=2)

hist(Pairs_Sardine_2000_25_5[,1], breaks=seq(-0.5,1e6,10), xlim=c(-1,500), las=1, xlab="", main="", ylab="")
mtext(text="POP", side=3, line=-2,font=2)
hist(Pairs_Sardine_2000_25_5[,2], breaks=seq(-0.5,1e6,10), xlim=c(-1,500), las=1, xlab="", main="", ylab="")
mtext(text="Sardine", side=3, line=2, at=-130, font=2)
mtext(text="HSP", side=3, line=-2,font=2)

hist(Pairs_Cod_2000_25_10[,1], breaks=seq(-0.5,1e6,1), xlim=c(-1,25), las=1, xlab="", main="")
mtext(text="10yr", side=2, line=4.5, font=2)
hist(Pairs_Cod_2000_25_10[,2], breaks=seq(-0.5,1e6,1), xlim=c(-1,25), las=1, xlab="", main="", ylab="")

hist(Pairs_Flatfish_2000_25_10[,1], breaks=seq(-0.5,1e6,500), xlim=c(-1,50000), las=1, xlab="", main="", ylab="")
hist(Pairs_Flatfish_2000_25_10[,2], breaks=seq(-0.5,1e6,500), xlim=c(-1,50000), las=1, xlab="", main="", ylab="")

hist(Pairs_Sardine_2000_25_10[,1], breaks=seq(-0.5,1e6,10), xlim=c(-1,500), las=1, xlab="", main="", ylab="")
hist(Pairs_Sardine_2000_25_10[,2], breaks=seq(-0.5,1e6,10), xlim=c(-1,500), las=1, xlab="", main="", ylab="")

hist(Pairs_Cod_2000_25_25[,1], breaks=seq(-0.5,1e6,1), xlim=c(-1,25), las=1, xlab="Parent-Offspring Pairs", main="")
mtext(text="25yr", side=2, line=4.5, font=2)
hist(Pairs_Cod_2000_25_25[,2], breaks=seq(-0.5,1e6,1), xlim=c(-1,25), las=1, xlab="Half-Sibling Pairs", main="", ylab="")

hist(Pairs_Flatfish_2000_25_25[,1], breaks=seq(-0.5,1e6,500), xlim=c(-1,50000), las=1, xlab="Parent-Offspring Pairs", main="", ylab="")
hist(Pairs_Flatfish_2000_25_25[,2], breaks=seq(-0.5,1e6,500), xlim=c(-1,50000), las=1, xlab="Half-Sibling Pairs", main="", ylab="")

hist(Pairs_Sardine_2000_25_25[,1], breaks=seq(-0.5,1e6,10), xlim=c(-1,500), las=1, xlab="Parent-Offspring Pairs", main="", ylab="")
hist(Pairs_Sardine_2000_25_25[,2], breaks=seq(-0.5,1e6,10), xlim=c(-1,500), las=1, xlab="Half-Sibling Pairs", main="", ylab="")
#dev.off()

#N5000
#tiff(paste0(wd,"CKMRPairs_N5000.tiff"), height=20, width=30, units='cm', compression="lzw", res=500)
par(mfrow=c(3,6), oma=c(2,2,1,1), mar=c(4,4,2.5,1))
hist(Pairs_Cod_5000_25_5[,1], breaks=seq(-0.5,1e6,1), xlim=c(-1,120), las=1, xlab="", main="")
mtext(text="5yr", side=2, line=4.5, font=2)
mtext(text="POP", side=3, line=-2,font=2)
hist(Pairs_Cod_5000_25_5[,2], breaks=seq(-0.5,1e6,1), xlim=c(-1,120), las=1, xlab="", main="", ylab="")
mtext(text="Cod", side=3, line=2, at=-30, font=2)
mtext(text="HSP", side=3, line=-2,font=2)

hist(Pairs_Flatfish_5000_25_5[,1], breaks=seq(-0.5,1e6,2e3), xlim=c(-1,3e5), las=1, xlab="", main="", ylab="")
mtext(text="POP", side=3, line=-2,font=2)
hist(Pairs_Flatfish_5000_25_5[,2], breaks=seq(-0.5,1e6,2e3), xlim=c(-1,3e5), las=1, xlab="", main="", ylab="")
mtext(text="Flatfish", side=3, line=2, at=-50000, font=2)
mtext(text="HSP", side=3, line=-2,font=2)

hist(Pairs_Sardine_5000_25_5[,1], breaks=seq(-0.5,1e6,50), xlim=c(-1,2500), las=1, xlab="", main="", ylab="")
mtext(text="POP", side=3, line=-2,font=2)
hist(Pairs_Sardine_5000_25_5[,2], breaks=seq(-0.5,1e6,50), xlim=c(-1,2500), las=1, xlab="", main="", ylab="")
mtext(text="Sardine", side=3, line=2, at=-600, font=2)
mtext(text="HSP", side=3, line=-2,font=2)

hist(Pairs_Cod_5000_25_10[,1], breaks=seq(-0.5,1e6,1), xlim=c(-1,120), las=1, xlab="", main="")
mtext(text="10yr", side=2, line=4.5, font=2)
hist(Pairs_Cod_5000_25_10[,2], breaks=seq(-0.5,1e6,1), xlim=c(-1,120), las=1, xlab="", main="", ylab="")

hist(Pairs_Flatfish_5000_25_10[,1], breaks=seq(-0.5,1e6,2e3), xlim=c(-1,3e5), las=1, xlab="", main="", ylab="")
hist(Pairs_Flatfish_5000_25_10[,2], breaks=seq(-0.5,1e6,2e3), xlim=c(-1,3e5), las=1, xlab="", main="", ylab="")

hist(Pairs_Sardine_5000_25_10[,1], breaks=seq(-0.5,1e6,50), xlim=c(-1,2500), las=1, xlab="", main="", ylab="")
hist(Pairs_Sardine_5000_25_10[,2], breaks=seq(-0.5,1e6,50), xlim=c(-1,2500), las=1, xlab="", main="", ylab="")

hist(Pairs_Cod_5000_25_25[,1], breaks=seq(-0.5,1e6,1), xlim=c(-1,120), las=1, xlab="Parent-Offspring Pairs", main="")
mtext(text="25yr", side=2, line=4.5, font=2)
hist(Pairs_Cod_5000_25_25[,2], breaks=seq(-0.5,1e6,1), xlim=c(-1,120), las=1, xlab="Half-Sibling Pairs", main="", ylab="")

hist(Pairs_Flatfish_5000_25_25[,1], breaks=seq(-0.5,1e6,2e3), xlim=c(-1,3e5), las=1, xlab="Parent-Offspring Pairs", main="", ylab="")
hist(Pairs_Flatfish_5000_25_25[,2], breaks=seq(-0.5,1e6,2e3), xlim=c(-1,3e5), las=1, xlab="Half-Sibling Pairs", main="", ylab="")

hist(Pairs_Sardine_5000_25_25[,1], breaks=seq(-0.5,1e6,50), xlim=c(-1,2500), las=1, xlab="Parent-Offspring Pairs", main="", ylab="")
hist(Pairs_Sardine_5000_25_25[,2], breaks=seq(-0.5,1e6,50), xlim=c(-1,2500), las=1, xlab="Half-Sibling Pairs", main="", ylab="")
#dev.off()

##################################
#SCAAs without CKMR data
##################################

#N100 and index sd 0.25
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N100_Ind25.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N100_Ind25.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N100_Ind25.RData"))

Cod_wdat<-Cod_100_25_5
Flatfish_wdat<-Flatfish_100_25_5
Sardine_wdat<-Sardine_100_25_5
  
re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
      #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
      re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
      re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      
    }else if (f==2){
      re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
      #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
      re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
      re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      
    } else if (f==3){
      re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
      #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
      re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
      re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N200, Index SD - 0.25, CKMR 5yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N200, Index SD - 0.25, CKMR 5yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N200, Index SD - 0.25, CKMR 5yrs", ylab="RE - SSB")
abline(h=0)

#R0
boxplot(re_R0[,1], ylim=c(-0.25,0.25), las=1, main="", ylab="RE - R0")
abline(h=0)
boxplot(re_R0[,2], ylim=c(-0.25,0.25), las=1, main="", ylab="RE - R0")
abline(h=0)
boxplot(re_R0[,3], ylim=c(-0.25,0.25), las=1, main="", ylab="RE - R0")
abline(h=0)

#M
boxplot(re_M[,1], ylim=c(-0.1,0.1), las=1, main="", ylab="RE - M")
abline(h=0)
boxplot(re_M[,2], ylim=c(-0.1,0.1), las=1, main="", ylab="RE - M")
abline(h=0)
boxplot(re_M[,3], ylim=c(-0.1,0.1), las=1, main="", ylab="RE - M")
abline(h=0)

#Variance of relative error for point estimates
sd_RE_ssb_N100_Ind25<-apply(re_SSB,c(1,3),sd)
sd_RE_R0_N100_Ind25<-apply(re_R0,2,sd)
sd_RE_M_N100_Ind25<-apply(re_M,2,sd)

#variance of absolute relative error
sd_ARE_ssb_N100_Ind25<-apply(abs(re_SSB),c(1,3),sd)
sd_ARE_R0_N100_Ind25<-apply(abs(re_R0),2,sd)
sd_ARE_M_N100_Ind25<-apply(abs(re_M),2,sd)

#Precision within sims
SD_ssb_N100_Ind25<-CV_ssb_N100_Ind25<-array(NA, dim=c(3,100,76)) 
SD_R0_N100_Ind25<-matrix(NA, nrow=3, ncol=100)
SD_M_N100_Ind25<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    CV_ssb_N100_Ind25[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$unbiased$value
    SD_ssb_N100_Ind25[f,i,]<-res_list[[f]][[i]]$SD$sd
    SD_R0_N100_Ind25[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
    SD_M_N100_Ind25[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
  }
}

#N200, sd index 0.25
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N200_Ind25.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N200_Ind25.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N200_Ind25.RData"))

Cod_wdat<-Cod_200_25_5
Flatfish_wdat<-Flatfish_200_25_5
Sardine_wdat<-Sardine_200_25_5

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
      #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
      re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
      re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      
    }else if (f==2){
      re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
      #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
      re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
      re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      
    } else if (f==3){
      re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
      #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
      re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
      re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      
    }
  }
}

#Variance of relative error for point estimates
sd_RE_ssb_N200_Ind25<-apply(re_SSB,c(1,3),sd)
sd_RE_R0_N200_Ind25<-apply(re_R0,2,sd)
sd_RE_M_N200_Ind25<-apply(re_M,2,sd)

#variance of absolute relative error
sd_ARE_ssb_N200_Ind25<-apply(abs(re_SSB),c(1,3),sd)
sd_ARE_R0_N200_Ind25<-apply(abs(re_R0),2,sd)
sd_ARE_M_N200_Ind25<-apply(abs(re_M),2,sd)

#Precision within sims
SD_ssb_N200_Ind25<-CV_ssb_N200_Ind25<-array(NA, dim=c(3,100,76)) 
SD_R0_N200_Ind25<-matrix(NA, nrow=3, ncol=100)
SD_M_N200_Ind25<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    CV_ssb_N200_Ind25[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$unbiased$value
    SD_ssb_N200_Ind25[f,i,]<-res_list[[f]][[i]]$SD$sd
    SD_R0_N200_Ind25[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
    SD_M_N200_Ind25[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
  }
}

#N1000, sd index 0.25
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N1000_Ind25.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N1000_Ind25.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N1000_Ind25.RData"))

Cod_wdat<-Cod_1000_25_5
Flatfish_wdat<-Flatfish_1000_25_5
Sardine_wdat<-Sardine_1000_25_5

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
      #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
      re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
      re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      
    }else if (f==2){
      re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
      #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
      re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
      re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      
    } else if (f==3){
      re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
      #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
      re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
      re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      
    }
  }
}

#Variance of relative error for point estimates
sd_RE_ssb_N1000_Ind25<-apply(re_SSB,c(1,3),sd)
sd_RE_R0_N1000_Ind25<-apply(re_R0,2,sd)
sd_RE_M_N1000_Ind25<-apply(re_M,2,sd)

#variance of absolute relative error
sd_ARE_ssb_N1000_Ind25<-apply(abs(re_SSB),c(1,3),sd)
sd_ARE_R0_N1000_Ind25<-apply(abs(re_R0),2,sd)
sd_ARE_M_N1000_Ind25<-apply(abs(re_M),2,sd)

#Precision within sims
SD_ssb_N1000_Ind25<-CV_ssb_N1000_Ind25<-array(NA, dim=c(3,100,76)) 
SD_R0_N1000_Ind25<-matrix(NA, nrow=3, ncol=100)
SD_M_N1000_Ind25<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    CV_ssb_N1000_Ind25[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$unbiased$value
    SD_ssb_N1000_Ind25[f,i,]<-res_list[[f]][[i]]$SD$sd
    SD_R0_N1000_Ind25[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
    SD_M_N1000_Ind25[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
  }
}

#N2000, sd index 0.25
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N2000_Ind25.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N2000_Ind25.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N2000_Ind25.RData"))

Cod_wdat<-Cod_2000_25_5
Flatfish_wdat<-Flatfish_2000_25_5
Sardine_wdat<-Sardine_2000_25_5

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
      #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
      re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
      re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      
    }else if (f==2){
      re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
      #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
      re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
      re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      
    } else if (f==3){
      re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
      #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
      re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
      re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      
    }
  }
}

#Variance of relative error for point estimates
sd_RE_ssb_N2000_Ind25<-apply(re_SSB,c(1,3),sd)
sd_RE_R0_N2000_Ind25<-apply(re_R0,2,sd)
sd_RE_M_N2000_Ind25<-apply(re_M,2,sd)

#variance of absolute relative error
sd_ARE_ssb_N2000_Ind25<-apply(abs(re_SSB),c(1,3),sd)
sd_ARE_R0_N2000_Ind25<-apply(abs(re_R0),2,sd)
sd_ARE_M_N2000_Ind25<-apply(abs(re_M),2,sd)

#Precision within sims
SD_ssb_N2000_Ind25<-CV_ssb_N2000_Ind25<-array(NA, dim=c(3,100,76)) 
SD_R0_N2000_Ind25<-matrix(NA, nrow=3, ncol=100)
SD_M_N2000_Ind25<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    CV_ssb_N2000_Ind25[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$unbiased$value
    SD_ssb_N2000_Ind25[f,i,]<-res_list[[f]][[i]]$SD$sd
    SD_R0_N2000_Ind25[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
    SD_M_N2000_Ind25[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
  }
}

#N5000, sd index 0.25
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N5000_Ind25.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N5000_Ind25.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N5000_Ind25.RData"))

Cod_wdat<-Cod_5000_25_5
Flatfish_wdat<-Flatfish_5000_25_5
Sardine_wdat<-Sardine_5000_25_5

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
      #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
      re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
      re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      
    }else if (f==2){
      re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
      #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
      re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
      re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      
    } else if (f==3){
      re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
      #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
      re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
      re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      
    }
  }
}

#Variance of relative error for point estimates
sd_RE_ssb_N5000_Ind25<-apply(re_SSB,c(1,3),sd)
sd_RE_R0_N5000_Ind25<-apply(re_R0,2,sd)
sd_RE_M_N5000_Ind25<-apply(re_M,2,sd)

#variance of absolute relative error
sd_ARE_ssb_N5000_Ind25<-apply(abs(re_SSB),c(1,3),sd)
sd_ARE_R0_N5000_Ind25<-apply(abs(re_R0),2,sd)
sd_ARE_M_N5000_Ind25<-apply(abs(re_M),2,sd)

#Precision within sims
SD_ssb_N5000_Ind25<-CV_ssb_N5000_Ind25<-array(NA, dim=c(3,100,76)) 
SD_R0_N5000_Ind25<-matrix(NA, nrow=3, ncol=100)
SD_M_N5000_Ind25<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    CV_ssb_N5000_Ind25[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$unbiased$value
    SD_ssb_N5000_Ind25[f,i,]<-res_list[[f]][[i]]$SD$sd
    SD_R0_N5000_Ind25[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
    SD_M_N5000_Ind25[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
  }
}

#N100 and index sd 0.50
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N100_Ind50.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N100_Ind50.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N100_Ind50.RData"))

Cod_wdat<-Cod_100_50_5
Flatfish_wdat<-Flatfish_100_50_5
Sardine_wdat<-Sardine_100_50_5

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
      #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
      re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
      re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      
    }else if (f==2){
      re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
      #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
      re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
      re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      
    } else if (f==3){
      re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
      #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
      re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
      re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.50,0.50), las=1, main="Cod - N200, Index SD - 0.50, CKMR 5yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.50,0.50), las=1, main="Flatfish - N200, Index SD - 0.50, CKMR 5yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.50,0.50), las=1, main="Sardine - N200, Index SD - 0.50, CKMR 5yrs", ylab="RE - SSB")
abline(h=0)

#R0
boxplot(re_R0[,1], ylim=c(-0.50,0.50), las=1, main="", ylab="RE - R0")
abline(h=0)
boxplot(re_R0[,2], ylim=c(-0.50,0.50), las=1, main="", ylab="RE - R0")
abline(h=0)
boxplot(re_R0[,3], ylim=c(-0.50,0.50), las=1, main="", ylab="RE - R0")
abline(h=0)

#M
boxplot(re_M[,1], ylim=c(-0.1,0.1), las=1, main="", ylab="RE - M")
abline(h=0)
boxplot(re_M[,2], ylim=c(-0.1,0.1), las=1, main="", ylab="RE - M")
abline(h=0)
boxplot(re_M[,3], ylim=c(-0.1,0.1), las=1, main="", ylab="RE - M")
abline(h=0)

#Variance of relative error for point estimates
sd_RE_ssb_N100_Ind50<-apply(re_SSB,c(1,3),sd)
sd_RE_R0_N100_Ind50<-apply(re_R0,2,sd)
sd_RE_M_N100_Ind50<-apply(re_M,2,sd)

#variance of absolute relative error
sd_ARE_ssb_N100_Ind50<-apply(abs(re_SSB),c(1,3),sd)
sd_ARE_R0_N100_Ind50<-apply(abs(re_R0),2,sd)
sd_ARE_M_N100_Ind50<-apply(abs(re_M),2,sd)

#Precision within sims
SD_ssb_N100_Ind50<-CV_ssb_N100_Ind50<-array(NA, dim=c(3,100,76)) 
SD_R0_N100_Ind50<-matrix(NA, nrow=3, ncol=100)
SD_M_N100_Ind50<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    CV_ssb_N100_Ind50[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$unbiased$value
    SD_ssb_N100_Ind50[f,i,]<-res_list[[f]][[i]]$SD$sd
    SD_R0_N100_Ind50[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
    SD_M_N100_Ind50[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
  }
}


#N200, sd index 0.50
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N200_Ind50.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N200_Ind50.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N200_Ind50.RData"))

Cod_wdat<-Cod_200_50_5
Flatfish_wdat<-Flatfish_200_50_5
Sardine_wdat<-Sardine_200_50_5

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
      #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
      re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
      re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      
    }else if (f==2){
      re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
      #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
      re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
      re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      
    } else if (f==3){
      re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
      #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
      re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
      re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      
    }
  }
}

#Variance of relative error for point estimates
sd_RE_ssb_N200_Ind50<-apply(re_SSB,c(1,3),sd)
sd_RE_R0_N200_Ind50<-apply(re_R0,2,sd)
sd_RE_M_N200_Ind50<-apply(re_M,2,sd)

#variance of absolute relative error
sd_ARE_ssb_N200_Ind50<-apply(abs(re_SSB),c(1,3),sd)
sd_ARE_R0_N200_Ind50<-apply(abs(re_R0),2,sd)
sd_ARE_M_N200_Ind50<-apply(abs(re_M),2,sd)

#Precision within sims
SD_ssb_N200_Ind50<-CV_ssb_N200_Ind50<-array(NA, dim=c(3,100,76)) 
SD_R0_N200_Ind50<-matrix(NA, nrow=3, ncol=100)
SD_M_N200_Ind50<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    CV_ssb_N200_Ind50[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$unbiased$value
    SD_ssb_N200_Ind50[f,i,]<-res_list[[f]][[i]]$SD$sd
    SD_R0_N200_Ind50[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
    SD_M_N200_Ind50[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
  }
}

#N1000, sd index 0.50
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N1000_Ind50.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N1000_Ind50.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N1000_Ind50.RData"))

Cod_wdat<-Cod_1000_50_5
Flatfish_wdat<-Flatfish_1000_50_5
Sardine_wdat<-Sardine_1000_50_5

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
      #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
      re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
      re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      
    }else if (f==2){
      re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
      #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
      re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
      re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      
    } else if (f==3){
      re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
      #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
      re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
      re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      
    }
  }
}

#Variance of relative error for point estimates
sd_RE_ssb_N1000_Ind50<-apply(re_SSB,c(1,3),sd)
sd_RE_R0_N1000_Ind50<-apply(re_R0,2,sd)
sd_RE_M_N1000_Ind50<-apply(re_M,2,sd)

#variance of absolute relative error
sd_ARE_ssb_N1000_Ind50<-apply(abs(re_SSB),c(1,3),sd)
sd_ARE_R0_N1000_Ind50<-apply(abs(re_R0),2,sd)
sd_ARE_M_N1000_Ind50<-apply(abs(re_M),2,sd)

#Precision within sims
SD_ssb_N1000_Ind50<-CV_ssb_N1000_Ind50<-array(NA, dim=c(3,100,76)) 
SD_R0_N1000_Ind50<-matrix(NA, nrow=3, ncol=100)
SD_M_N1000_Ind50<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    CV_ssb_N1000_Ind50[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$unbiased$value
    SD_ssb_N1000_Ind50[f,i,]<-res_list[[f]][[i]]$SD$sd
    SD_R0_N1000_Ind50[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
    SD_M_N1000_Ind50[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
  }
}

#N2000, sd index 0.50
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N2000_Ind50.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N2000_Ind50.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N2000_Ind50.RData"))

Cod_wdat<-Cod_2000_50_5
Flatfish_wdat<-Flatfish_2000_50_5
Sardine_wdat<-Sardine_2000_50_5

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
      #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
      re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
      re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      
    }else if (f==2){
      re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
      #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
      re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
      re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      
    } else if (f==3){
      re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
      #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
      re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
      re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      
    }
  }
}

#Variance of relative error for point estimates
sd_RE_ssb_N2000_Ind50<-apply(re_SSB,c(1,3),sd)
sd_RE_R0_N2000_Ind50<-apply(re_R0,2,sd)
sd_RE_M_N2000_Ind50<-apply(re_M,2,sd)

#variance of absolute relative error
sd_ARE_ssb_N2000_Ind50<-apply(abs(re_SSB),c(1,3),sd)
sd_ARE_R0_N2000_Ind50<-apply(abs(re_R0),2,sd)
sd_ARE_M_N2000_Ind50<-apply(abs(re_M),2,sd)

#Precision within sims
SD_ssb_N2000_Ind50<-CV_ssb_N2000_Ind50<-array(NA, dim=c(3,100,76)) 
SD_R0_N2000_Ind50<-matrix(NA, nrow=3, ncol=100)
SD_M_N2000_Ind50<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    CV_ssb_N2000_Ind50[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$unbiased$value
    SD_ssb_N2000_Ind50[f,i,]<-res_list[[f]][[i]]$SD$sd
    SD_R0_N2000_Ind50[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
    SD_M_N2000_Ind50[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
  }
}

#N5000, sd index 0.50
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N5000_Ind50.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N5000_Ind50.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N5000_Ind50.RData"))

Cod_wdat<-Cod_5000_50_5
Flatfish_wdat<-Flatfish_5000_50_5
Sardine_wdat<-Sardine_5000_50_5

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
      #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
      re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
      re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      
    }else if (f==2){
      re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
      #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
      re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
      re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      
    } else if (f==3){
      re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
      #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
      re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
      re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      
    }
  }
}

#Variance of relative error for point estimates
sd_RE_ssb_N5000_Ind50<-apply(re_SSB,c(1,3),sd)
sd_RE_R0_N5000_Ind50<-apply(re_R0,2,sd)
sd_RE_M_N5000_Ind50<-apply(re_M,2,sd)

#variance of absolute relative error
sd_ARE_ssb_N5000_Ind50<-apply(abs(re_SSB),c(1,3),sd)
sd_ARE_R0_N5000_Ind50<-apply(abs(re_R0),2,sd)
sd_ARE_M_N5000_Ind50<-apply(abs(re_M),2,sd)

#Precision within sims
SD_ssb_N5000_Ind50<-CV_ssb_N5000_Ind50<-array(NA, dim=c(3,100,76)) 
SD_R0_N5000_Ind50<-matrix(NA, nrow=3, ncol=100)
SD_M_N5000_Ind50<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    CV_ssb_N5000_Ind50[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$unbiased$value
    SD_ssb_N5000_Ind50[f,i,]<-res_list[[f]][[i]]$SD$sd
    SD_R0_N5000_Ind50[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
    SD_M_N5000_Ind50[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
  }
}


##################################
#SCAAs with CKMR data
##################################

#Get Precision between sims and within sims

#N100, 5yrs CKMR data
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N100_Ind25_ckmrmultinom5.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N100_Ind25_ckmrmultinom5.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N100_Ind25_ckmrmultinom5.RData"))

load(paste0(wd,"/Cod_wdat_N100_Ind25_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N100_Ind25_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Sardine_wdat_N100_Ind25_ckmrmultinom5_1.RData"))

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
      #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
      re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
      re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      
    }else if (f==2){
      re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
      #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
      re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
      re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      
    } else if (f==3){
      re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
      #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
      re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
      re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N200, Index SD - 0.25, CKMR 5yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N200, Index SD - 0.25, CKMR 5yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N200, Index SD - 0.25, CKMR 5yrs", ylab="RE - SSB")
abline(h=0)

#R0
boxplot(re_R0[,1], ylim=c(-0.25,0.25), las=1, main="", ylab="RE - R0")
abline(h=0)
boxplot(re_R0[,2], ylim=c(-0.25,0.25), las=1, main="", ylab="RE - R0")
abline(h=0)
boxplot(re_R0[,3], ylim=c(-0.25,0.25), las=1, main="", ylab="RE - R0")
abline(h=0)

#M
boxplot(re_M[,1], ylim=c(-0.1,0.1), las=1, main="", ylab="RE - M")
abline(h=0)
boxplot(re_M[,2], ylim=c(-0.1,0.1), las=1, main="", ylab="RE - M")
abline(h=0)
boxplot(re_M[,3], ylim=c(-0.1,0.1), las=1, main="", ylab="RE - M")
abline(h=0)

#Variance of relative error for point estimates
sd_RE_ssb_N100_Ind25_ckmrmultinom5<-apply(re_SSB,c(1,3),sd)
sd_RE_R0_N100_Ind25_ckmrmultinom5<-apply(re_R0,2,sd)
sd_RE_M_N100_Ind25_ckmrmultinom5<-apply(re_M,2,sd)

#variance of absolute relative error
sd_ARE_ssb_N100_Ind25_ckmrmultinom5<-apply(abs(re_SSB),c(1,3),sd)
sd_ARE_R0_N100_Ind25_ckmrmultinom5<-apply(abs(re_R0),2,sd)
sd_ARE_M_N100_Ind25_ckmrmultinom5<-apply(abs(re_M),2,sd)

#Precision within sims
SD_ssb_N100_Ind25_ckmrmultinom5<-CV_ssb_N100_Ind25_ckmrmultinom5<-array(NA, dim=c(3,100,76)) 
SD_R0_N100_Ind25_ckmrmultinom5<-matrix(NA, nrow=3, ncol=100)
SD_M_N100_Ind25_ckmrmultinom5<-matrix(NA, nrow=3, ncol=100)
 for(f in 1:3){
  for (i in 1:100){
   CV_ssb_N100_Ind25_ckmrmultinom5[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$unbiased$value
   SD_ssb_N100_Ind25_ckmrmultinom5[f,i,]<-res_list[[f]][[i]]$SD$sd
   SD_R0_N100_Ind25_ckmrmultinom5[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
   SD_M_N100_Ind25_ckmrmultinom5[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
  }
 }

########################
#N200, 5yrs CKMR data
########################
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N200_Ind25_ckmrmultinom5.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N200_Ind25_ckmrmultinom5.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N200_Ind25_ckmrmultinom5.RData"))

load(paste0(wd,"/Cod_wdat_N200_Ind25_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N200_Ind25_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Sardine_wdat_N200_Ind25_ckmrmultinom5_1.RData"))

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      
    }else if (f==2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      
    } else if (f==3){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$unbiased$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[3])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed[1])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N200, Index SD - 0.25, CKMR 5yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N200, Index SD - 0.25, CKMR 5yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N200, Index SD - 0.25, CKMR 5yrs", ylab="RE - SSB")
abline(h=0)

#R0
boxplot(re_R0[,1], ylim=c(-0.25,0.25), las=1, main="", ylab="RE - R0")
abline(h=0)
boxplot(re_R0[,2], ylim=c(-0.25,0.25), las=1, main="", ylab="RE - R0")
abline(h=0)
boxplot(re_R0[,3], ylim=c(-0.25,0.25), las=1, main="", ylab="RE - R0")
abline(h=0)

#M
boxplot(re_M[,1], ylim=c(-0.1,0.1), las=1, main="", ylab="RE - M")
abline(h=0)
boxplot(re_M[,2], ylim=c(-0.1,0.1), las=1, main="", ylab="RE - M")
abline(h=0)
boxplot(re_M[,3], ylim=c(-0.1,0.1), las=1, main="", ylab="RE - M")
abline(h=0)

#Now SD of relative error
sd_RE_ssb_N200_Ind25_ckmrmultinom5<-apply(re_SSB,c(1,3),sd)
sd_RE_R0_N200_Ind25_ckmrmultinom5<-apply(re_R0,2,sd)
sd_RE_M_N200_Ind25_ckmrmultinom5<-apply(re_M,2,sd)

#SD of absolute relative error
sd_ARE_ssb_N200_Ind25_ckmrmultinom5<-apply(abs(re_SSB),c(1,3),sd)
sd_ARE_R0_N200_Ind25_ckmrmultinom5<-apply(abs(re_R0),2,sd)
sd_ARE_M_N200_Ind25_ckmrmultinom5<-apply(abs(re_M),2,sd)

#Precision within sims
SD_ssb_N200_Ind25_ckmrmultinom5<-CV_ssb_N200_Ind25_ckmrmultinom5<-array(NA, dim=c(3,100,76)) 
SD_R0_N200_Ind25_ckmrmultinom5<-matrix(NA, nrow=3, ncol=100)
SD_M_N200_Ind25_ckmrmultinom5<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    CV_ssb_N200_Ind25_ckmrmultinom5[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$unbiased$value
    SD_ssb_N200_Ind25_ckmrmultinom5[f,i,]<-res_list[[f]][[i]]$SD$sd
    SD_R0_N200_Ind25_ckmrmultinom5[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
    SD_M_N200_Ind25_ckmrmultinom5[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
  }
}

#########################################
#Comparative plots
#########################################

#SSB
par(mfrow=c(3,2))
boxplot(CV_ssb_N100_Ind25_ckmrmultinom5[1,,], ylim=c(0.04,0.15), las=1, main="Cod - N100 - CKMR 5 years")
boxplot(CV_ssb_N100_Ind25[1,,], add=TRUE, ylim=c(0.04,0.15), las=1, main="", col=2)
boxplot(CV_ssb_N200_Ind25_ckmrmultinom5[1,,], ylim=c(0.04,0.15), las=1, main="Cod - N200 - CKMR 5 years")
boxplot(CV_ssb_N200_Ind25[1,,], add=TRUE, ylim=c(0.04,0.15), las=1, main="", col=2)
boxplot(CV_ssb_N100_Ind25_ckmrmultinom5[2,,], ylim=c(0.04,0.18), las=1, main="Flatfish - N100 - CKMR 5 years", ylab="CV of SSB")
boxplot(CV_ssb_N100_Ind25[2,,], add=TRUE, ylim=c(0.04,0.18), las=1, main="", col=2)
boxplot(CV_ssb_N200_Ind25_ckmrmultinom5[2,,], ylim=c(0.04,0.18), las=1, main="Flatfish - N200 - CKMR 5 years")
boxplot(CV_ssb_N200_Ind25[2,,], add=TRUE, ylim=c(0.04,0.18), las=1, main="", col=2)
boxplot(CV_ssb_N100_Ind25_ckmrmultinom5[3,,], ylim=c(0.04,0.23), las=1, main="Sardine - N100 - CKMR 5 years")
boxplot(CV_ssb_N100_Ind25[3,,], add=TRUE, ylim=c(0.04,0.23), las=1, main="", col=2)
boxplot(CV_ssb_N200_Ind25_ckmrmultinom5[3,,], ylim=c(0.04,0.23), las=1, main="Sardine - N200 - CKMR 5 years")
boxplot(CV_ssb_N200_Ind25[3,,], add=TRUE, ylim=c(0.04,0.23), las=1, main="", col=2)

#R0 and M
par(mfcol=c(3,4))
boxplot(cbind(SD_R0_N100_Ind25[1,],SD_R0_N100_Ind25_ckmrmultinom5[1,]), ylim=c(0.07,0.11), las=1, main="Cod - SD log(R0) - N100", xaxt="n")
boxplot(cbind(SD_R0_N100_Ind25[2,],SD_R0_N100_Ind25_ckmrmultinom5[2,]), ylim=c(0.10,0.17), las=1, main="Flatfish - SD log(R0) - N100", ylab="SD of log(R0)", xaxt="n")
boxplot(cbind(SD_R0_N100_Ind25[3,],SD_R0_N100_Ind25_ckmrmultinom5[3,]), ylim=c(0.12,0.21), las=1, main="Sardine - SD log(R0) - N100", xaxt="n")
axis(side=1, at=1:2, labels=c("No CKMR","CKMR 5 Years"))

boxplot(cbind(SD_R0_N200_Ind25[1,],SD_R0_N200_Ind25_ckmrmultinom5[1,]), ylim=c(0.07,0.11), las=1, main="Cod - SD log(R0) - N200", xaxt="n")
boxplot(cbind(SD_R0_N200_Ind25[2,],SD_R0_N200_Ind25_ckmrmultinom5[2,]), ylim=c(0.10,0.17), las=1, main="Flatfish - SD log(R0) - N200", ylab="SD of log(R0)", xaxt="n")
boxplot(cbind(SD_R0_N200_Ind25[3,],SD_R0_N200_Ind25_ckmrmultinom5[3,]), ylim=c(0.12,0.21), las=1, main="Sardine - SD log(R0) - N200", xaxt="n")
axis(side=1, at=1:2, labels=c("No CKMR","CKMR 5 Years"))

#M
boxplot(cbind(SD_M_N100_Ind25[1,],SD_M_N100_Ind25_ckmrmultinom5[1,]), ylim=c(0.023,0.029), las=1, main="Cod - SD log(M) - N100", xaxt="n")
boxplot(cbind(SD_M_N100_Ind25[2,],SD_M_N100_Ind25_ckmrmultinom5[2,]), ylim=c(0.036,0.048), las=1, main="Flatfish - SD log(M) - N100", ylab="SD of log(M)", xaxt="n")
boxplot(cbind(SD_M_N100_Ind25[3,],SD_M_N100_Ind25_ckmrmultinom5[3,]), ylim=c(0.035,0.044), las=1, main="Sardine - SD log(M) - N100", xaxt="n")
axis(side=1, at=1:2, labels=c("No CKMR","CKMR 5 Years"))

boxplot(cbind(SD_M_N200_Ind25[1,],SD_M_N200_Ind25_ckmrmultinom5[1,]), ylim=c(0.023,0.029), las=1, main="Cod - SD log(M) - N200", xaxt="n")
boxplot(cbind(SD_M_N200_Ind25[2,],SD_M_N200_Ind25_ckmrmultinom5[2,]), ylim=c(0.036,0.048), las=1, main="Flatfish - SD log(M) - N200", ylab="SD of log(M)", xaxt="n")
boxplot(cbind(SD_M_N200_Ind25[3,],SD_M_N200_Ind25_ckmrmultinom5[3,]), ylim=c(0.035,0.044), las=1, main="Sardine - SD log(M) - N120", xaxt="n")
axis(side=1, at=1:2, labels=c("No CKMR","CKMR 5 Years"))

#SD of point estimates between sims
par(mfcol=c(3,4))
plot(sd_RE_ssb_N100_Ind25[1,], pch=16, ylim=c(0.05,0.14), las=1, ylab="", main="Cod - N100")
points(sd_RE_ssb_N100_Ind25_ckmrmultinom5[1,], pch=16, col=2)
plot(sd_RE_ssb_N100_Ind25[2,], pch=16, ylim=c(0.04,0.16), las=1, ylab="SD SSB RE", main="Flatfish - N100")
points(sd_RE_ssb_N100_Ind25_ckmrmultinom5[2,], pch=16, col=2)
plot(sd_RE_ssb_N100_Ind25[3,], pch=16, ylim=c(0.05,0.20), las=1, ylab="", main="Sardine - N100")
points(sd_RE_ssb_N100_Ind25_ckmrmultinom5[3,], pch=16, col=2)

plot(sd_RE_ssb_N200_Ind25[1,], pch=16, ylim=c(0.05,0.14), las=1, ylab="", main="Cod - N200")
points(sd_RE_ssb_N200_Ind25_ckmrmultinom5[1,], pch=16, col=2)
plot(sd_RE_ssb_N200_Ind25[2,], pch=16, ylim=c(0.04,0.15), las=1, ylab="SD SSB RE", main="Flatfish - N200")
points(sd_RE_ssb_N200_Ind25_ckmrmultinom5[2,], pch=16, col=2)
plot(sd_RE_ssb_N200_Ind25[3,], pch=16, ylim=c(0.05,0.20), las=1, ylab="", main="Sardine - N200")
points(sd_RE_ssb_N200_Ind25_ckmrmultinom5[3,], pch=16, col=2)

plot(sd_ARE_ssb_N100_Ind25[1,], pch=16, ylim=c(0,0.09), las=1, ylab="", main="Cod - N100")
points(sd_ARE_ssb_N100_Ind25_ckmrmultinom5[1,], pch=16, col=2)
plot(sd_ARE_ssb_N100_Ind25[2,], pch=16, ylim=c(0,0.10), las=1, ylab="SD SSB ARE", main="Flatfish - N100")
points(sd_ARE_ssb_N100_Ind25_ckmrmultinom5[2,], pch=16, col=2)
plot(sd_ARE_ssb_N100_Ind25[3,], pch=16, ylim=c(0,0.15), las=1, ylab="", main="Sardine - N100")
points(sd_ARE_ssb_N100_Ind25_ckmrmultinom5[3,], pch=16, col=2)

plot(sd_ARE_ssb_N200_Ind25[1,], pch=16, ylim=c(0,0.09), las=1, ylab="", main="Cod - N200")
points(sd_ARE_ssb_N200_Ind25_ckmrmultinom5[1,], pch=16, col=2)
plot(sd_ARE_ssb_N200_Ind25[2,], pch=16, ylim=c(0,0.10), las=1, ylab="SD SSB ARE", main="Flatfish - N200")
points(sd_ARE_ssb_N200_Ind25_ckmrmultinom5[2,], pch=16, col=2)
plot(sd_ARE_ssb_N200_Ind25[3,], pch=16, ylim=c(0,0.15), las=1, ylab="", main="Sardine - N200")
points(sd_ARE_ssb_N200_Ind25_ckmrmultinom5[3,], pch=16, col=2)

#R0 and M sd of relative error between sims 
par(mfrow=c(2,4))
plot(1:3,sd_RE_R0_N100_Ind25, ylim=c(0,0.2), las=1, ylab="SD RE log(R0)", xaxt="n", pch=16, main="N100-CKMR5", xlab="",xlim=c(0.5,3.5))
points(1:3,sd_RE_R0_N100_Ind25_ckmrmultinom5, pch=16, col=2)
plot(1:3,sd_RE_R0_N200_Ind25, ylim=c(0,0.2), las=1, ylab="", xaxt="n", pch=16, main="N200-CKMR5", xlab="",xlim=c(0.5,3.5))
points(1:3,sd_RE_R0_N200_Ind25_ckmrmultinom5, pch=16, col=2)
plot(1:3,sd_ARE_R0_N100_Ind25, ylim=c(0,0.2), las=1, ylab="SD ARE log(R0)", xaxt="n", pch=16, main="N100-CKMR5", xlab="",xlim=c(0.5,3.5))
points(1:3,sd_ARE_R0_N100_Ind25_ckmrmultinom5, pch=16, col=2)
plot(1:3,sd_ARE_R0_N200_Ind25, ylim=c(0,0.2), las=1, ylab="", xaxt="n", pch=16, main="N200-CKMR5", xlab="",xlim=c(0.5,3.5))
points(1:3,sd_ARE_R0_N200_Ind25_ckmrmultinom5, pch=16, col=2)

plot(1:3,sd_RE_M_N100_Ind25, ylim=c(0,0.05), las=1, ylab="SD RE log(M)", xaxt="n", pch=16, main="N100-CKMR5", xlab="",xlim=c(0.5,3.5))
points(1:3,sd_RE_M_N100_Ind25_ckmrmultinom5, pch=16, col=2)
axis(side=1,at=1:3, labels=c("Cod", "Flatfish", "Sardine"))
plot(1:3,sd_RE_M_N200_Ind25, ylim=c(0,0.05), las=1, ylab="", xaxt="n", pch=16, main="N200-CKMR5", xlab="",xlim=c(0.5,3.5))
points(1:3,sd_RE_M_N200_Ind25_ckmrmultinom5, pch=16, col=2)
axis(side=1,at=1:3, labels=c("Cod", "Flatfish", "Sardine"))
plot(1:3,sd_ARE_M_N100_Ind25, ylim=c(0,0.05), las=1, ylab="SD ARE log(M)", xaxt="n", pch=16, main="N100-CKMR5", xlab="",xlim=c(0.5,3.5))
points(1:3,sd_ARE_M_N100_Ind25_ckmrmultinom5, pch=16, col=2)
axis(side=1,at=1:3, labels=c("Cod", "Flatfish", "Sardine"))
plot(1:3,sd_ARE_M_N200_Ind25, ylim=c(0,0.05), las=1, ylab="", xaxt="n", pch=16, main="N200-CKMR5", xlab="",xlim=c(0.5,3.5))
points(1:3,sd_ARE_M_N200_Ind25_ckmrmultinom5, pch=16, col=2)
axis(side=1,at=1:3, labels=c("Cod", "Flatfish", "Sardine"))

     
     
     