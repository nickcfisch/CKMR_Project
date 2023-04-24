
####################################################
#Looking at Kinship results
####################################################

wd<-"C:/Users/nicholas.fisch/Documents/GitHub/CKMR_Project/"

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

#############################################
#Getting it into more usable data 
#############################################
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
res_list<-list()
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

res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N200_Ind25.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N200_Ind25.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N200_Ind25.RData"))

re_Dep1<-re_SSB1<-array(NA, dim=c(3,100,76))
re_R01<-re_M1<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(!is.null(res_list[[f]][[i]]$par)){
        re_SSB1[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "spbiomass"),3]-Cod_OM[[i]]$OM$SSB[26:101])/Cod_OM[[i]]$OM$SSB[26:101]
        re_Dep1[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_OM[[i]]$OM$SSB[26:101]/Cod_OM[[i]]$OM$SSB0)/(Cod_OM[[i]]$OM$SSB[26:101]/Cod_OM[[i]]$OM$SSB0)
        re_R01[i,f]<-(exp(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "log_R0"),1])-Cod_OM[[i]]$OM$R0)/Cod_OM[[i]]$OM$R0
        re_M1[i,f]<-(exp(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "log_M"),1])-Cod_OM[[i]]$OM$Mref)/Cod_OM[[i]]$OM$Mref
      }
    }else if (f==2){
      if(!is.null(res_list[[f]][[i]]$par)){
        re_SSB1[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "spbiomass"),3]-Flatfish_OM[[i]]$OM$SSB[26:101])/Flatfish_OM[[i]]$OM$SSB[26:101]
        re_Dep1[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_OM[[i]]$OM$SSB[26:101]/Flatfish_OM[[i]]$OM$SSB0)/(Flatfish_OM[[i]]$OM$SSB[26:101]/Flatfish_OM[[i]]$OM$SSB0)
        re_R01[i,f]<-(exp(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "log_R0"),1])-Flatfish_OM[[i]]$OM$R0)/Flatfish_OM[[i]]$OM$R0
        re_M1[i,f]<-(exp(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "log_M"),1])-Flatfish_OM[[i]]$OM$Mref)/Flatfish_OM[[i]]$OM$Mref
      }
    } else if (f==3){
      if(!is.null(res_list[[f]][[i]]$par)){
        re_SSB1[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "spbiomass"),3]-Sardine_OM[[i]]$OM$SSB[26:101])/Sardine_OM[[i]]$OM$SSB[26:101]
        re_Dep1[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_OM[[i]]$OM$SSB[26:101]/Sardine_OM[[i]]$OM$SSB0)/(Sardine_OM[[i]]$OM$SSB[26:101]/Sardine_OM[[i]]$OM$SSB0)
        re_R01[i,f]<-(exp(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "log_R0"),1])-Sardine_OM[[i]]$OM$R0)/Sardine_OM[[i]]$OM$R0
        re_M1[i,f]<-(exp(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "log_M"),1])-Sardine_OM[[i]]$OM$Mref)/Sardine_OM[[i]]$OM$Mref
      }
    }
  }
}


res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N1000_Ind50.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N1000_Ind50.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N1000_Ind50.RData"))

re_Dep2<-re_SSB2<-array(NA, dim=c(3,100,76))
re_R02<-re_M2<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(!is.null(res_list[[f]][[i]]$par)){
        re_SSB2[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "spbiomass"),3]-Cod_OM[[i]]$OM$SSB[26:101])/Cod_OM[[i]]$OM$SSB[26:101]
        re_Dep2[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_OM[[i]]$OM$SSB[26:101]/Cod_OM[[i]]$OM$SSB0)/(Cod_OM[[i]]$OM$SSB[26:101]/Cod_OM[[i]]$OM$SSB0)
        re_R02[i,f]<-(exp(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "log_R0"),1])-Cod_OM[[i]]$OM$R0)/Cod_OM[[i]]$OM$R0
        re_M2[i,f]<-(exp(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "log_M"),1])-Cod_OM[[i]]$OM$Mref)/Cod_OM[[i]]$OM$Mref
      }
    }else if (f==2){
      if(!is.null(res_list[[f]][[i]]$par)){
        re_SSB2[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "spbiomass"),3]-Flatfish_OM[[i]]$OM$SSB[26:101])/Flatfish_OM[[i]]$OM$SSB[26:101]
        re_Dep2[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_OM[[i]]$OM$SSB[26:101]/Flatfish_OM[[i]]$OM$SSB0)/(Flatfish_OM[[i]]$OM$SSB[26:101]/Flatfish_OM[[i]]$OM$SSB0)
        re_R02[i,f]<-(exp(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "log_R0"),1])-Flatfish_OM[[i]]$OM$R0)/Flatfish_OM[[i]]$OM$R0
        re_M2[i,f]<-(exp(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "log_M"),1])-Flatfish_OM[[i]]$OM$Mref)/Flatfish_OM[[i]]$OM$Mref
      }
    } else if (f==3){
      if(!is.null(res_list[[f]][[i]]$par)){
        re_SSB2[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "spbiomass"),3]-Sardine_OM[[i]]$OM$SSB[26:101])/Sardine_OM[[i]]$OM$SSB[26:101]
        re_Dep2[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_OM[[i]]$OM$SSB[26:101]/Sardine_OM[[i]]$OM$SSB0)/(Sardine_OM[[i]]$OM$SSB[26:101]/Sardine_OM[[i]]$OM$SSB0)
        re_R02[i,f]<-(exp(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "log_R0"),1])-Sardine_OM[[i]]$OM$R0)/Sardine_OM[[i]]$OM$R0
        re_M2[i,f]<-(exp(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "log_M"),1])-Sardine_OM[[i]]$OM$Mref)/Sardine_OM[[i]]$OM$Mref
      }
    }
  }
}


res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N200_Ind50.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N200_Ind50.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N200_Ind50.RData"))

re_Dep3<-re_SSB3<-array(NA, dim=c(3,100,76))
re_R03<-re_M3<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(!is.null(res_list[[f]][[i]]$par)){
        re_SSB3[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "spbiomass"),3]-Cod_OM[[i]]$OM$SSB[26:101])/Cod_OM[[i]]$OM$SSB[26:101]
        re_Dep3[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_OM[[i]]$OM$SSB[26:101]/Cod_OM[[i]]$OM$SSB0)/(Cod_OM[[i]]$OM$SSB[26:101]/Cod_OM[[i]]$OM$SSB0)
        re_R03[i,f]<-(exp(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "log_R0"),1])-Cod_OM[[i]]$OM$R0)/Cod_OM[[i]]$OM$R0
        re_M3[i,f]<-(exp(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "log_M"),1])-Cod_OM[[i]]$OM$Mref)/Cod_OM[[i]]$OM$Mref
      }
    }else if (f==2){
      if(!is.null(res_list[[f]][[i]]$par)){
        re_SSB3[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "spbiomass"),3]-Flatfish_OM[[i]]$OM$SSB[26:101])/Flatfish_OM[[i]]$OM$SSB[26:101]
        re_Dep3[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_OM[[i]]$OM$SSB[26:101]/Flatfish_OM[[i]]$OM$SSB0)/(Flatfish_OM[[i]]$OM$SSB[26:101]/Flatfish_OM[[i]]$OM$SSB0)
        re_R03[i,f]<-(exp(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "log_R0"),1])-Flatfish_OM[[i]]$OM$R0)/Flatfish_OM[[i]]$OM$R0
        re_M3[i,f]<-(exp(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "log_M"),1])-Flatfish_OM[[i]]$OM$Mref)/Flatfish_OM[[i]]$OM$Mref
      }
    } else if (f==3){
      if(!is.null(res_list[[f]][[i]]$par)){
        re_SSB3[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "spbiomass"),3]-Sardine_OM[[i]]$OM$SSB[26:101])/Sardine_OM[[i]]$OM$SSB[26:101]
        re_Dep3[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_OM[[i]]$OM$SSB[26:101]/Sardine_OM[[i]]$OM$SSB0)/(Sardine_OM[[i]]$OM$SSB[26:101]/Sardine_OM[[i]]$OM$SSB0)
        re_R03[i,f]<-(exp(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "log_R0"),1])-Sardine_OM[[i]]$OM$R0)/Sardine_OM[[i]]$OM$R0
        re_M3[i,f]<-(exp(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "log_M"),1])-Sardine_OM[[i]]$OM$Mref)/Sardine_OM[[i]]$OM$Mref
      }
    }
  }
}


#SSB
par(mfcol=c(3,4))
boxplot(re_SSB1[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N100, Index SD - 0.25", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB1[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N100, Index SD - 0.25", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB1[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N100, Index SD - 0.25", ylab="RE - SSB")
abline(h=0)

boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N1000, Index SD - 0.25", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N1000, Index SD - 0.25", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N1000, Index SD - 0.25", ylab="RE - SSB")
abline(h=0)

boxplot(re_SSB3[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N100, Index SD - 0.5", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB3[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N100, Index SD - 0.5", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB3[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N100, Index SD - 0.5", ylab="RE - SSB")
abline(h=0)

boxplot(re_SSB2[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N1000, Index SD - 0.5", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB2[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N1000, Index SD - 0.5", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB2[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N1000, Index SD - 0.5", ylab="RE - SSB")
abline(h=0)

#Depletion
par(mfcol=c(3,4))
boxplot(re_Dep1[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N100, Index SD - 0.25", ylab="RE - Dep")
abline(h=0)
boxplot(re_Dep1[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N100, Index SD - 0.25", ylab="RE - Dep")
abline(h=0)
boxplot(re_Dep1[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N100, Index SD - 0.25", ylab="RE - Dep")
abline(h=0)

boxplot(re_Dep[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N1000, Index SD - 0.25", ylab="RE - Dep")
abline(h=0)
boxplot(re_Dep[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N1000, Index SD - 0.25", ylab="RE - Dep")
abline(h=0)
boxplot(re_Dep[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N1000, Index SD - 0.25", ylab="RE - Dep")
abline(h=0)

boxplot(re_Dep3[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N100, Index SD - 0.5", ylab="RE - Dep")
abline(h=0)
boxplot(re_Dep3[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N100, Index SD - 0.5", ylab="RE - Dep")
abline(h=0)
boxplot(re_Dep3[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N100, Index SD - 0.5", ylab="RE - Dep")
abline(h=0)

boxplot(re_Dep2[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N1000, Index SD - 0.5", ylab="RE - Dep")
abline(h=0)
boxplot(re_Dep2[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N1000, Index SD - 0.5", ylab="RE - Dep")
abline(h=0)
boxplot(re_Dep2[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N1000, Index SD - 0.5", ylab="RE - Dep")
abline(h=0)


#R0
par(mfcol=c(3,4))
boxplot(re_R01[,1], ylim=c(-0.25,0.25), las=1, main="Cod - N100, Index SD - 0.25", ylab="RE - R0")
abline(h=0)
boxplot(re_R01[,2], ylim=c(-0.25,0.25), las=1, main="Flatfish - N100, Index SD - 0.25", ylab="RE - R0")
abline(h=0)
boxplot(re_R01[,3], ylim=c(-0.25,0.25), las=1, main="Sardine - N100, Index SD - 0.25", ylab="RE - R0")
abline(h=0)

boxplot(re_R0[,1], ylim=c(-0.25,0.25), las=1, main="Cod - N1000, Index SD - 0.25", ylab="RE - R0")
abline(h=0)
boxplot(re_R0[,2], ylim=c(-0.25,0.25), las=1, main="Flatfish - N1000, Index SD - 0.25", ylab="RE - R0")
abline(h=0)
boxplot(re_R0[,3], ylim=c(-0.25,0.25), las=1, main="Sardine - N1000, Index SD - 0.25", ylab="RE - R0")
abline(h=0)

boxplot(re_R03[,1], ylim=c(-0.25,0.25), las=1, main="Cod - N100, Index SD - 0.5", ylab="RE - R0")
abline(h=0)
boxplot(re_R03[,2], ylim=c(-0.25,0.25), las=1, main="Flatfish - N100, Index SD - 0.5", ylab="RE - R0")
abline(h=0)
boxplot(re_R03[,3], ylim=c(-0.25,0.25), las=1, main="Sardine - N100, Index SD - 0.5", ylab="RE - R0")
abline(h=0)

boxplot(re_R02[,1], ylim=c(-0.25,0.25), las=1, main="Cod - N1000, Index SD - 0.5", ylab="RE - R0")
abline(h=0)
boxplot(re_R02[,2], ylim=c(-0.25,0.25), las=1, main="Flatfish - N1000, Index SD - 0.5", ylab="RE - R0")
abline(h=0)
boxplot(re_R02[,3], ylim=c(-0.25,0.25), las=1, main="Sardine - N1000, Index SD - 0.5", ylab="RE - R0")
abline(h=0)

#M
par(mfcol=c(3,4))
boxplot(re_M1[,1], ylim=c(-0.1,0.1), las=1, main="Cod - N100, Index SD - 0.25", ylab="RE - M")
abline(h=0)
boxplot(re_M1[,2], ylim=c(-0.1,0.1), las=1, main="Flatfish - N100, Index SD - 0.25", ylab="RE - M")
abline(h=0)
boxplot(re_M1[,3], ylim=c(-0.1,0.1), las=1, main="Sardine - N100, Index SD - 0.25", ylab="RE - M")
abline(h=0)

boxplot(re_M[,1], ylim=c(-0.1,0.1), las=1, main="Cod - N1000, Index SD - 0.25", ylab="RE - M")
abline(h=0)
boxplot(re_M[,2], ylim=c(-0.1,0.1), las=1, main="Flatfish - N1000, Index SD - 0.25", ylab="RE - M")
abline(h=0)
boxplot(re_M[,3], ylim=c(-0.1,0.1), las=1, main="Sardine - N1000, Index SD - 0.25", ylab="RE - M")
abline(h=0)

boxplot(re_M3[,1], ylim=c(-0.1,0.1), las=1, main="Cod - N100, Index SD - 0.5", ylab="RE - M")
abline(h=0)
boxplot(re_M3[,2], ylim=c(-0.1,0.1), las=1, main="Flatfish - N100, Index SD - 0.5", ylab="RE - M")
abline(h=0)
boxplot(re_M3[,3], ylim=c(-0.1,0.1), las=1, main="Sardine - N100, Index SD - 0.5", ylab="RE - M")
abline(h=0)

boxplot(re_M2[,1], ylim=c(-0.1,0.1), las=1, main="Cod - N1000, Index SD - 0.5", ylab="RE - M")
abline(h=0)
boxplot(re_M2[,2], ylim=c(-0.1,0.1), las=1, main="Flatfish - N1000, Index SD - 0.5", ylab="RE - M")
abline(h=0)
boxplot(re_M2[,3], ylim=c(-0.1,0.1), las=1, main="Sardine - N1000, Index SD - 0.5", ylab="RE - M")
abline(h=0)



