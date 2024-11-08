
####################################################
#Looking at Kinship results
####################################################

#wd<-"C:/Users/fischn/Documents/GitHub/CKMR_Project/"

#Ncomp 100, ckmr 5 years
load(paste0(wd,"/Cod_wdat_N100_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N100_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Sardine_wdat_N100_ckmrmultinom5_1.RData"))

Cod_100_5<-Cod_wdat
Flatfish_100_5<-Flatfish_wdat
Sardine_100_5<-Sardine_wdat

#Ncomp 1000, ckmr 5 years
load(paste0(wd,"/Cod_wdat_N1000_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N1000_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Sardine_wdat_N1000_ckmrmultinom5_1.RData"))

Cod_1000_5<-Cod_wdat
Flatfish_1000_5<-Flatfish_wdat
Sardine_1000_5<-Sardine_wdat

#Ncomp 5000, ckmr 5 years
load(paste0(wd,"/Cod_wdat_N5000_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N5000_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Sardine_wdat_N5000_ckmrmultinom5_1.RData"))

Cod_5000_5<-Cod_wdat
Flatfish_5000_5<-Flatfish_wdat
Sardine_5000_5<-Sardine_wdat

#Ncomp 100, ckmr 10 years
load(paste0(wd,"/Cod_wdat_N100_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N100_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Sardine_wdat_N100_ckmrmultinom10_1.RData"))

Cod_100_10<-Cod_wdat
Flatfish_100_10<-Flatfish_wdat
Sardine_100_10<-Sardine_wdat

#Ncomp 1000, ckmr 10 years
load(paste0(wd,"/Cod_wdat_N1000_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N1000_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Sardine_wdat_N1000_ckmrmultinom10_1.RData"))

Cod_1000_10<-Cod_wdat
Flatfish_1000_10<-Flatfish_wdat
Sardine_1000_10<-Sardine_wdat

#Ncomp 5000, ckmr 10 years
load(paste0(wd,"/Cod_wdat_N5000_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N5000_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Sardine_wdat_N5000_ckmrmultinom10_1.RData"))

Cod_5000_10<-Cod_wdat
Flatfish_5000_10<-Flatfish_wdat
Sardine_5000_10<-Sardine_wdat

#Ncomp 100, ckmr 20 years
load(paste0(wd,"/Cod_wdat_N100_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N100_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Sardine_wdat_N100_ckmrmultinom20_1.RData"))

Cod_100_20<-Cod_wdat
Flatfish_100_20<-Flatfish_wdat
Sardine_100_20<-Sardine_wdat

#Ncomp 1000, ckmr 20 years
load(paste0(wd,"/Cod_wdat_N1000_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N1000_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Sardine_wdat_N1000_ckmrmultinom20_1.RData"))

Cod_1000_20<-Cod_wdat
Flatfish_1000_20<-Flatfish_wdat
Sardine_1000_20<-Sardine_wdat

#Ncomp 5000, ckmr 20 years
load(paste0(wd,"/Cod_wdat_N5000_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N5000_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Sardine_wdat_N5000_ckmrmultinom20_1.RData"))

Cod_5000_20<-Cod_wdat
Flatfish_5000_20<-Flatfish_wdat
Sardine_5000_20<-Sardine_wdat

#############################################
#Looking at the number of pairs by treatment 
#############################################
#Getting it into more usable data 
Pairs_Cod_100_5<-Pairs_Cod_1000_5<-Pairs_Cod_5000_5<-matrix(NA, nrow=100,ncol=2)
Pairs_Cod_100_10<-Pairs_Cod_1000_10<-Pairs_Cod_5000_10<-matrix(NA, nrow=100,ncol=2)
Pairs_Cod_100_20<-Pairs_Cod_1000_20<-Pairs_Cod_5000_20<-matrix(NA, nrow=100,ncol=2)
Pairs_Flatfish_100_5<-Pairs_Flatfish_1000_5<-Pairs_Flatfish_5000_5<-matrix(NA, nrow=100,ncol=2)
Pairs_Flatfish_100_10<-Pairs_Flatfish_1000_10<-Pairs_Flatfish_5000_10<-matrix(NA, nrow=100,ncol=2)
Pairs_Flatfish_100_20<-Pairs_Flatfish_1000_20<-Pairs_Flatfish_5000_20<-matrix(NA, nrow=100,ncol=2)
Pairs_Sardine_100_5<-Pairs_Sardine_1000_5<-Pairs_Sardine_5000_5<-matrix(NA, nrow=100,ncol=2)
Pairs_Sardine_100_10<-Pairs_Sardine_1000_10<-Pairs_Sardine_5000_10<-matrix(NA, nrow=100,ncol=2)
Pairs_Sardine_100_20<-Pairs_Sardine_1000_20<-Pairs_Sardine_5000_20<-matrix(NA, nrow=100,ncol=2)

for (i in 1:100){
  Pairs_Cod_100_5[i,1]<-(sum(Cod_100_5[[i]]$k_ckmr_pop))
  Pairs_Cod_100_5[i,2]<-(sum(Cod_100_5[[i]]$k_ckmr_hsporggp))
  Pairs_Cod_1000_5[i,1]<-(sum(Cod_1000_5[[i]]$k_ckmr_pop))
  Pairs_Cod_1000_5[i,2]<-(sum(Cod_1000_5[[i]]$k_ckmr_hsporggp))
  Pairs_Cod_5000_5[i,1]<-(sum(Cod_5000_5[[i]]$k_ckmr_pop))
  Pairs_Cod_5000_5[i,2]<-(sum(Cod_5000_5[[i]]$k_ckmr_hsporggp))
  
  Pairs_Cod_100_10[i,1]<-(sum(Cod_100_10[[i]]$k_ckmr_pop))
  Pairs_Cod_100_10[i,2]<-(sum(Cod_100_10[[i]]$k_ckmr_hsporggp))
  Pairs_Cod_1000_10[i,1]<-(sum(Cod_1000_10[[i]]$k_ckmr_pop))
  Pairs_Cod_1000_10[i,2]<-(sum(Cod_1000_10[[i]]$k_ckmr_hsporggp))
  Pairs_Cod_5000_10[i,1]<-(sum(Cod_5000_10[[i]]$k_ckmr_pop))
  Pairs_Cod_5000_10[i,2]<-(sum(Cod_5000_10[[i]]$k_ckmr_hsporggp))
  
  Pairs_Cod_100_20[i,1]<-(sum(Cod_100_20[[i]]$k_ckmr_pop))
  Pairs_Cod_100_20[i,2]<-(sum(Cod_100_20[[i]]$k_ckmr_hsporggp))
  Pairs_Cod_1000_20[i,1]<-(sum(Cod_1000_20[[i]]$k_ckmr_pop))
  Pairs_Cod_1000_20[i,2]<-(sum(Cod_1000_20[[i]]$k_ckmr_hsporggp))
  Pairs_Cod_5000_20[i,1]<-(sum(Cod_5000_20[[i]]$k_ckmr_pop))
  Pairs_Cod_5000_20[i,2]<-(sum(Cod_5000_20[[i]]$k_ckmr_hsporggp))
  
  Pairs_Flatfish_100_5[i,1]<-(sum(Flatfish_100_5[[i]]$k_ckmr_pop))
  Pairs_Flatfish_100_5[i,2]<-(sum(Flatfish_100_5[[i]]$k_ckmr_hsporggp))
  Pairs_Flatfish_1000_5[i,1]<-(sum(Flatfish_1000_5[[i]]$k_ckmr_pop))
  Pairs_Flatfish_1000_5[i,2]<-(sum(Flatfish_1000_5[[i]]$k_ckmr_hsporggp))
  Pairs_Flatfish_5000_5[i,1]<-(sum(Flatfish_5000_5[[i]]$k_ckmr_pop))
  Pairs_Flatfish_5000_5[i,2]<-(sum(Flatfish_5000_5[[i]]$k_ckmr_hsporggp))
  
  Pairs_Flatfish_100_10[i,1]<-(sum(Flatfish_100_10[[i]]$k_ckmr_pop))
  Pairs_Flatfish_100_10[i,2]<-(sum(Flatfish_100_10[[i]]$k_ckmr_hsporggp))
  Pairs_Flatfish_1000_10[i,1]<-(sum(Flatfish_1000_10[[i]]$k_ckmr_pop))
  Pairs_Flatfish_1000_10[i,2]<-(sum(Flatfish_1000_10[[i]]$k_ckmr_hsporggp))
  Pairs_Flatfish_5000_10[i,1]<-(sum(Flatfish_5000_10[[i]]$k_ckmr_pop))
  Pairs_Flatfish_5000_10[i,2]<-(sum(Flatfish_5000_10[[i]]$k_ckmr_hsporggp))
  
  Pairs_Flatfish_100_20[i,1]<-(sum(Flatfish_100_20[[i]]$k_ckmr_pop))
  Pairs_Flatfish_100_20[i,2]<-(sum(Flatfish_100_20[[i]]$k_ckmr_hsporggp))
  Pairs_Flatfish_1000_20[i,1]<-(sum(Flatfish_1000_20[[i]]$k_ckmr_pop))
  Pairs_Flatfish_1000_20[i,2]<-(sum(Flatfish_1000_20[[i]]$k_ckmr_hsporggp))
  Pairs_Flatfish_5000_20[i,1]<-(sum(Flatfish_5000_20[[i]]$k_ckmr_pop))
  Pairs_Flatfish_5000_20[i,2]<-(sum(Flatfish_5000_20[[i]]$k_ckmr_hsporggp))
  
  Pairs_Sardine_100_5[i,1]<-(sum(Sardine_100_5[[i]]$k_ckmr_pop))
  Pairs_Sardine_100_5[i,2]<-(sum(Sardine_100_5[[i]]$k_ckmr_hsporggp))
  Pairs_Sardine_1000_5[i,1]<-(sum(Sardine_1000_5[[i]]$k_ckmr_pop))
  Pairs_Sardine_1000_5[i,2]<-(sum(Sardine_1000_5[[i]]$k_ckmr_hsporggp))
  Pairs_Sardine_5000_5[i,1]<-(sum(Sardine_5000_5[[i]]$k_ckmr_pop))
  Pairs_Sardine_5000_5[i,2]<-(sum(Sardine_5000_5[[i]]$k_ckmr_hsporggp))
  
  Pairs_Sardine_100_10[i,1]<-(sum(Sardine_100_10[[i]]$k_ckmr_pop))
  Pairs_Sardine_100_10[i,2]<-(sum(Sardine_100_10[[i]]$k_ckmr_hsporggp))
  Pairs_Sardine_1000_10[i,1]<-(sum(Sardine_1000_10[[i]]$k_ckmr_pop))
  Pairs_Sardine_1000_10[i,2]<-(sum(Sardine_1000_10[[i]]$k_ckmr_hsporggp))
  Pairs_Sardine_5000_10[i,1]<-(sum(Sardine_5000_10[[i]]$k_ckmr_pop))
  Pairs_Sardine_5000_10[i,2]<-(sum(Sardine_5000_10[[i]]$k_ckmr_hsporggp))
  
  Pairs_Sardine_100_20[i,1]<-(sum(Sardine_100_20[[i]]$k_ckmr_pop))
  Pairs_Sardine_100_20[i,2]<-(sum(Sardine_100_20[[i]]$k_ckmr_hsporggp))
  Pairs_Sardine_1000_20[i,1]<-(sum(Sardine_1000_20[[i]]$k_ckmr_pop))
  Pairs_Sardine_1000_20[i,2]<-(sum(Sardine_1000_20[[i]]$k_ckmr_hsporggp))
  Pairs_Sardine_5000_20[i,1]<-(sum(Sardine_5000_20[[i]]$k_ckmr_pop))
  Pairs_Sardine_5000_20[i,2]<-(sum(Sardine_5000_20[[i]]$k_ckmr_hsporggp))
}


#Trying boxplot as reviewer suggested 
#tiff(paste0(wd,"/CKMRPairs.tiff"), height=25, width=35, units='cm', compression="lzw", res=500)
par(mfrow=c(3,3), oma=c(2,6,1,1), mar=c(3.5,0,1,0), bty="C")
boxplot(Pairs_Cod_100_5, at=1:2, ylim=c(0,10), las=1, xlab="", main="", xlim=c(0.5,9.5), xaxt="n", col=c("rosybrown1", "skyblue"), bty="L", cex.axis=1.3)
boxplot(Pairs_Cod_100_10, at=4:5, ylim=c(0,10), las=1, xlab="", main="", xlim=c(0.5,9.5), xaxt="n",yaxt="n", col=c("rosybrown1", "skyblue"), add=TRUE)
boxplot(Pairs_Cod_100_20, at=7:8, ylim=c(0,10), las=1, xlab="", main="", xlim=c(0.5,9.5), xaxt="n",yaxt="n", col=c("rosybrown1", "skyblue"), add=TRUE)
axis(side=1, at=seq(1.5,25.5,3), c("5yrs","10yrs","20yrs","5yrs","10yrs","20yrs","5yrs","10yrs","20yrs"), cex.axis=1.5)
mtext(side=3,"100 CKMR Samples",line=-3, cex=1.2)
boxplot(Pairs_Cod_1000_5, at=10:11, ylim=c(0,20), las=1, xlab="", main="Cod", xlim=c(9.5,18.5), xaxt="n", col=c("rosybrown1", "skyblue"), cex.axis=1.3)
boxplot(Pairs_Cod_1000_10, at=13:14, ylim=c(0,20), las=1, xlab="", main="", xlim=c(9.5,18.5), xaxt="n",yaxt="n", col=c("rosybrown1", "skyblue"), add=TRUE)
boxplot(Pairs_Cod_1000_20, at=16:17, ylim=c(0,20), las=1, xlab="", main="", xlim=c(9.5,18.5), xaxt="n",yaxt="n", col=c("rosybrown1", "skyblue"), add=TRUE)
axis(side=1, at=seq(1.5,25.5,3), c("5yrs","10yrs","20yrs","5yrs","10yrs","20yrs","5yrs","10yrs","20yrs"), cex.axis=1.5)
mtext(side=3,"1,000 CKMR Samples",line=-3, cex=1.2)
par(bty="o")
boxplot(Pairs_Cod_5000_5, at=19:20, ylim=c(0,80), las=1, xlab="", main="", xlim=c(18.5,26.5), xaxt="n", col=c("rosybrown1", "skyblue"), cex.axis=1.3)
boxplot(Pairs_Cod_5000_10, at=22:23, ylim=c(0,80), las=1, xlab="", main="", xlim=c(18.5,26.5), xaxt="n",yaxt="n", col=c("rosybrown1", "skyblue"), add=TRUE)
boxplot(Pairs_Cod_5000_20, at=25:26, ylim=c(0,80), las=1, xlab="", main="", xlim=c(18.5,26.5), xaxt="n",yaxt="n", col=c("rosybrown1", "skyblue"), add=TRUE)
axis(side=1, at=seq(1.5,25.5,3), c("5yrs","10yrs","20yrs","5yrs","10yrs","20yrs","5yrs","10yrs","20yrs"), cex.axis=1.5)
mtext(side=3,"5,000 CKMR Samples",line=-3, cex=1.2)
#Flatfish
boxplot(Pairs_Flatfish_100_5, at=1:2, ylim=c(0,200), las=1, xlab="", main="", xlim=c(0.5,9.5), xaxt="n", col=c("rosybrown1", "skyblue"), bty="L", cex.axis=1.3)
mtext(side=2,"Pairs Found",line=4, cex=1.2)
boxplot(Pairs_Flatfish_100_10, at=4:5, ylim=c(0,200), las=1, xlab="", main="", xlim=c(0.5,9.5), xaxt="n",yaxt="n", col=c("rosybrown1", "skyblue"), add=TRUE)
boxplot(Pairs_Flatfish_100_20, at=7:8, ylim=c(0,200), las=1, xlab="", main="", xlim=c(0.5,9.5), xaxt="n",yaxt="n", col=c("rosybrown1", "skyblue"), add=TRUE)
axis(side=1, at=seq(1.5,25.5,3), c("5yrs","10yrs","20yrs","5yrs","10yrs","20yrs","5yrs","10yrs","20yrs"), cex.axis=1.5)
boxplot(Pairs_Flatfish_1000_5, at=10:11, ylim=c(0,1.05e4), las=1, xlab="", main="Flatfish", xlim=c(9.5,18.5), xaxt="n", col=c("rosybrown1", "skyblue"), cex.axis=1.3)
legend("top", c("POP", "HSP+GGP"),pch=15, col=c("rosybrown1", "skyblue"), bty="n", pt.cex=2, cex=2)
boxplot(Pairs_Flatfish_1000_10, at=13:14, ylim=c(0,1.05e4), las=1, xlab="", main="", xlim=c(9.5,18.5), xaxt="n",yaxt="n", col=c("rosybrown1", "skyblue"), add=TRUE)
boxplot(Pairs_Flatfish_1000_20, at=16:17, ylim=c(0,1.05e4), las=1, xlab="", main="", xlim=c(9.5,18.5), xaxt="n",yaxt="n", col=c("rosybrown1", "skyblue"), add=TRUE)
axis(side=1, at=seq(1.5,25.5,3), c("5yrs","10yrs","20yrs","5yrs","10yrs","20yrs","5yrs","10yrs","20yrs"), cex.axis=1.5)
par(bty="o")
boxplot(Pairs_Flatfish_5000_5, at=19:20, ylim=c(0,2.6e5), las=1, xlab="", main="", xlim=c(18.5,26.5), xaxt="n", col=c("rosybrown1", "skyblue"), cex.axis=1.3)
boxplot(Pairs_Flatfish_5000_10, at=22:23, ylim=c(0,2.6e5), las=1, xlab="", main="", xlim=c(18.5,26.5), xaxt="n",yaxt="n", col=c("rosybrown1", "skyblue"), add=TRUE)
boxplot(Pairs_Flatfish_5000_20, at=25:26, ylim=c(0,2.6e5), las=1, xlab="", main="", xlim=c(18.5,26.5), xaxt="n",yaxt="n", col=c("rosybrown1", "skyblue"), add=TRUE)
axis(side=1, at=seq(1.5,25.5,3), c("5yrs","10yrs","20yrs","5yrs","10yrs","20yrs","5yrs","10yrs","20yrs"), cex.axis=1.5)
#Sardine
boxplot(Pairs_Sardine_100_5, at=1:2, ylim=c(0,20), las=1, xlab="", main="", xlim=c(0.5,9.5), xaxt="n", col=c("rosybrown1", "skyblue"), bty="L", cex.axis=1.3)
boxplot(Pairs_Sardine_100_10, at=4:5, ylim=c(0,20), las=1, xlab="", main="", xlim=c(0.5,9.5), xaxt="n",yaxt="n", col=c("rosybrown1", "skyblue"), add=TRUE)
boxplot(Pairs_Sardine_100_20, at=7:8, ylim=c(0,20), las=1, xlab="", main="", xlim=c(0.5,9.5), xaxt="n",yaxt="n", col=c("rosybrown1", "skyblue"), add=TRUE)
axis(side=1, at=seq(1.5,25.5,3), c("5yrs","10yrs","20yrs","5yrs","10yrs","20yrs","5yrs","10yrs","20yrs"), cex.axis=1.5)
boxplot(Pairs_Sardine_1000_5, at=10:11, ylim=c(0,103), las=1, xlab="", main="Sardine", xlim=c(9.5,18.5), xaxt="n", col=c("rosybrown1", "skyblue"), cex.axis=1.3)
mtext(side=1,"Number of Years of CKMR Collection",line=3.5, cex=1.2)
boxplot(Pairs_Sardine_1000_10, at=13:14, ylim=c(0,103), las=1, xlab="", main="", xlim=c(9.5,18.5), xaxt="n",yaxt="n", col=c("rosybrown1", "skyblue"), add=TRUE)
boxplot(Pairs_Sardine_1000_20, at=16:17, ylim=c(0,103), las=1, xlab="", main="", xlim=c(9.5,18.5), xaxt="n",yaxt="n", col=c("rosybrown1", "skyblue"), add=TRUE)
axis(side=1, at=seq(1.5,25.5,3), c("5yrs","10yrs","20yrs","5yrs","10yrs","20yrs","5yrs","10yrs","20yrs"), cex.axis=1.5)
par(bty="o")
boxplot(Pairs_Sardine_5000_5, at=19:20, ylim=c(0,2.05e3), las=1, xlab="", main="", xlim=c(18.5,26.5), xaxt="n", col=c("rosybrown1", "skyblue"), cex.axis=1.3)
boxplot(Pairs_Sardine_5000_10, at=22:23, ylim=c(0,2.05e3), las=1, xlab="", main="", xlim=c(18.5,26.5), xaxt="n",yaxt="n", col=c("rosybrown1", "skyblue"), add=TRUE)
boxplot(Pairs_Sardine_5000_20, at=25:26, ylim=c(0,2.05e3), las=1, xlab="", main="", xlim=c(18.5,26.5), xaxt="n",yaxt="n", col=c("rosybrown1", "skyblue"), add=TRUE)
axis(side=1, at=seq(1.5,25.5,3), c("5yrs","10yrs","20yrs","5yrs","10yrs","20yrs","5yrs","10yrs","20yrs"), cex.axis=1.5)
#dev.off()

#N100
#tiff(paste0(wd,"/CKMRPairs_N100.tiff"), height=20, width=30, units='cm', compression="lzw", res=500)
par(mfrow=c(3,6), oma=c(2,2,1,1), mar=c(4,4,2.5,1))
hist(Pairs_Cod_100_5[,1], breaks=seq(-0.5,1e6,1), xlim=c(-0.5,5), las=1, xlab="", main="")
mtext(text="5yr", side=2, line=4.5, font=2)
mtext(text="POP", side=3, line=-2,font=2)
hist(Pairs_Cod_100_5[,2], breaks=seq(-0.5,1e6,1), xlim=c(-0.5,5), las=1, xlab="", main="", ylab="")
mtext(text="Cod", side=3, line=2, at=-4, font=2)
mtext(text="HSP", side=3, line=-2,font=2)

hist(Pairs_Flatfish_100_5[,1], breaks=seq(-0.5,1e6,10), xlim=c(-0.5,200), las=1, xlab="", main="", ylab="")
mtext(text="POP", side=3, line=-2,font=2)
hist(Pairs_Flatfish_100_5[,2], breaks=seq(-0.5,1e6,10), xlim=c(-0.5,200), las=1, xlab="", main="", ylab="")
mtext(text="Flatfish", side=3, line=2, at=-75, font=2)
mtext(text="HSP", side=3, line=-2,font=2)

hist(Pairs_Sardine_100_5[,1], breaks=seq(-0.5,1e6,1), xlim=c(-0.5,5), las=1, xlab="", main="", ylab="")
mtext(text="POP", side=3, line=-2,font=2)
hist(Pairs_Sardine_100_5[,2], breaks=seq(-0.5,1e6,1), xlim=c(-0.5,5), las=1, xlab="", main="", ylab="")
mtext(text="Sardine", side=3, line=2, at=-4, font=2)
mtext(text="HSP", side=3, line=-2,font=2)

hist(Pairs_Cod_100_10[,1], breaks=seq(-0.5,1e6,1), xlim=c(-0.5,5), las=1, xlab="", main="")
mtext(text="10yr", side=2, line=4.5, font=2)
hist(Pairs_Cod_100_10[,2], breaks=seq(-0.5,1e6,1), xlim=c(-0.5,5), las=1, xlab="", main="", ylab="")

hist(Pairs_Flatfish_100_10[,1], breaks=seq(-0.5,1e6,10), xlim=c(-0.5,200), las=1, xlab="", main="", ylab="")
hist(Pairs_Flatfish_100_10[,2], breaks=seq(-0.5,1e6,10), xlim=c(-0.5,200), las=1, xlab="", main="", ylab="")

hist(Pairs_Sardine_100_10[,1], breaks=seq(-0.5,1e6,1), xlim=c(-0.5,5), las=1, xlab="", main="", ylab="")
hist(Pairs_Sardine_100_10[,2], breaks=seq(-0.5,1e6,1), xlim=c(-0.5,5), las=1, xlab="", main="", ylab="")

hist(Pairs_Cod_100_20[,1], breaks=seq(-0.5,1e6,1), xlim=c(-0.5,5), las=1, xlab="Parent-Offspring Pairs", main="")
mtext(text="20yr", side=2, line=4.5, font=2)
hist(Pairs_Cod_100_20[,2], breaks=seq(-0.5,1e6,1), xlim=c(-0.5,5), las=1, xlab="Half-Sibling Pairs", main="", ylab="")

hist(Pairs_Flatfish_100_20[,1], breaks=seq(-0.5,1e6,10), xlim=c(-0.5,200), las=1, xlab="Parent-Offspring Pairs", main="", ylab="")
hist(Pairs_Flatfish_100_20[,2], breaks=seq(-0.5,1e6,10), xlim=c(-0.5,200), las=1, xlab="Half-Sibling Pairs", main="", ylab="")

hist(Pairs_Sardine_100_20[,1], breaks=seq(-0.5,1e6,1), xlim=c(-0.5,5), las=1, xlab="Parent-Offspring Pairs", main="", ylab="")
hist(Pairs_Sardine_100_20[,2], breaks=seq(-0.5,1e6,1), xlim=c(-0.5,5), las=1, xlab="Half-Sibling Pairs", main="", ylab="")
#dev.off()

#N1000
#tiff(paste0(wd,"/CKMRPairs_N1000.tiff"), height=20, width=30, units='cm', compression="lzw", res=500)
par(mfrow=c(3,6), oma=c(2,2,1,1), mar=c(4,4,2.5,1))
hist(Pairs_Cod_1000_5[,1], breaks=seq(-0.5,1e6,1), xlim=c(-0.5,10), las=1, xlab="", main="")
mtext(text="5yr", side=2, line=4.5, font=2)
mtext(text="POP", side=3, line=-2,font=2)
hist(Pairs_Cod_1000_5[,2], breaks=seq(-0.5,1e6,1), xlim=c(-0.5,10), las=1, xlab="", main="", ylab="")
mtext(text="Cod", side=3, line=2, at=-4, font=2)
mtext(text="HSP", side=3, line=-2,font=2)

hist(Pairs_Flatfish_1000_5[,1], breaks=seq(-0.5,1e6,100), xlim=c(-0.5,15000), las=1, xlab="", main="", ylab="")
mtext(text="POP", side=3, line=-2,font=2)
hist(Pairs_Flatfish_1000_5[,2], breaks=seq(-0.5,1e6,100), xlim=c(-0.5,15000), las=1, xlab="", main="", ylab="")
mtext(text="Flatfish", side=3, line=2, at=-2500, font=2)
mtext(text="HSP", side=3, line=-2,font=2)

hist(Pairs_Sardine_1000_5[,1], breaks=seq(-0.5,1e6,1), xlim=c(-0.5,100), las=1, xlab="", main="", ylab="")
mtext(text="POP", side=3, line=-2,font=2)
hist(Pairs_Sardine_1000_5[,2], breaks=seq(-0.5,1e6,1), xlim=c(-0.5,100), las=1, xlab="", main="", ylab="")
mtext(text="Sardine", side=3, line=2, at=-25, font=2)
mtext(text="HSP", side=3, line=-2,font=2)

hist(Pairs_Cod_1000_10[,1], breaks=seq(-0.5,1e6,1), xlim=c(-0.5,10), las=1, xlab="", main="")
mtext(text="10yr", side=2, line=4.5, font=2)
hist(Pairs_Cod_1000_10[,2], breaks=seq(-0.5,1e6,1), xlim=c(-0.5,10), las=1, xlab="", main="", ylab="")

hist(Pairs_Flatfish_1000_10[,1], breaks=seq(-0.5,1e6,100), xlim=c(-0.5,15000), las=1, xlab="", main="", ylab="")
hist(Pairs_Flatfish_1000_10[,2], breaks=seq(-0.5,1e6,100), xlim=c(-0.5,15000), las=1, xlab="", main="", ylab="")

hist(Pairs_Sardine_1000_10[,1], breaks=seq(-0.5,1e6,1), xlim=c(-0.5,100), las=1, xlab="", main="", ylab="")
hist(Pairs_Sardine_1000_10[,2], breaks=seq(-0.5,1e6,1), xlim=c(-0.5,100), las=1, xlab="", main="", ylab="")

hist(Pairs_Cod_1000_20[,1], breaks=seq(-0.5,1e6,1), xlim=c(-0.5,10), las=1, xlab="Parent-Offspring Pairs", main="")
mtext(text="20yr", side=2, line=4.5, font=2)
hist(Pairs_Cod_1000_20[,2], breaks=seq(-0.5,1e6,1), xlim=c(-0.5,10), las=1, xlab="Half-Sibling Pairs", main="", ylab="")

hist(Pairs_Flatfish_1000_20[,1], breaks=seq(-0.5,1e6,100), xlim=c(-0.5,15000), las=1, xlab="Parent-Offspring Pairs", main="", ylab="")
hist(Pairs_Flatfish_1000_20[,2], breaks=seq(-0.5,1e6,100), xlim=c(-0.5,15000), las=1, xlab="Half-Sibling Pairs", main="", ylab="")

hist(Pairs_Sardine_1000_20[,1], breaks=seq(-0.5,1e6,1), xlim=c(-0.5,100), las=1, xlab="Parent-Offspring Pairs", main="", ylab="")
hist(Pairs_Sardine_1000_20[,2], breaks=seq(-0.5,1e6,1), xlim=c(-0.5,100), las=1, xlab="Half-Sibling Pairs", main="", ylab="")
#dev.off()

#N5000
#tiff(paste0(wd,"/CKMRPairs_N5000.tiff"), height=20, width=30, units='cm', compression="lzw", res=500)
par(mfrow=c(3,6), oma=c(2,2,1,1), mar=c(4,4,2.5,1))
hist(Pairs_Cod_5000_5[,1], breaks=seq(-0.5,1e6,1), xlim=c(-0.5,120), las=1, xlab="", main="")
mtext(text="5yr", side=2, line=4.5, font=2)
mtext(text="POP", side=3, line=-2,font=2)
hist(Pairs_Cod_5000_5[,2], breaks=seq(-0.5,1e6,1), xlim=c(-0.5,120), las=1, xlab="", main="", ylab="")
mtext(text="Cod", side=3, line=2, at=-30, font=2)
mtext(text="HSP", side=3, line=-2,font=2)

hist(Pairs_Flatfish_5000_5[,1], breaks=seq(-0.5,1e6,2e3), xlim=c(-0.5,3e5), las=1, xlab="", main="", ylab="")
mtext(text="POP", side=3, line=-2,font=2)
hist(Pairs_Flatfish_5000_5[,2], breaks=seq(-0.5,1e6,2e3), xlim=c(-0.5,3e5), las=1, xlab="", main="", ylab="")
mtext(text="Flatfish", side=3, line=2, at=-50000, font=2)
mtext(text="HSP", side=3, line=-2,font=2)

hist(Pairs_Sardine_5000_5[,1], breaks=seq(-0.5,1e6,50), xlim=c(-0.5,2500), las=1, xlab="", main="", ylab="")
mtext(text="POP", side=3, line=-2,font=2)
hist(Pairs_Sardine_5000_5[,2], breaks=seq(-0.5,1e6,50), xlim=c(-0.5,2500), las=1, xlab="", main="", ylab="")
mtext(text="Sardine", side=3, line=2, at=-600, font=2)
mtext(text="HSP", side=3, line=-2,font=2)

hist(Pairs_Cod_5000_10[,1], breaks=seq(-0.5,1e6,1), xlim=c(-0.5,120), las=1, xlab="", main="")
mtext(text="10yr", side=2, line=4.5, font=2)
hist(Pairs_Cod_5000_10[,2], breaks=seq(-0.5,1e6,1), xlim=c(-0.5,120), las=1, xlab="", main="", ylab="")

hist(Pairs_Flatfish_5000_10[,1], breaks=seq(-0.5,1e6,2e3), xlim=c(-0.5,3e5), las=1, xlab="", main="", ylab="")
hist(Pairs_Flatfish_5000_10[,2], breaks=seq(-0.5,1e6,2e3), xlim=c(-0.5,3e5), las=1, xlab="", main="", ylab="")

hist(Pairs_Sardine_5000_10[,1], breaks=seq(-0.5,1e6,50), xlim=c(-0.5,2500), las=1, xlab="", main="", ylab="")
hist(Pairs_Sardine_5000_10[,2], breaks=seq(-0.5,1e6,50), xlim=c(-0.5,2500), las=1, xlab="", main="", ylab="")

hist(Pairs_Cod_5000_20[,1], breaks=seq(-0.5,1e6,1), xlim=c(-0.5,120), las=1, xlab="Parent-Offspring Pairs", main="")
mtext(text="20yr", side=2, line=4.5, font=2)
hist(Pairs_Cod_5000_20[,2], breaks=seq(-0.5,1e6,1), xlim=c(-0.5,120), las=1, xlab="Half-Sibling Pairs", main="", ylab="")

hist(Pairs_Flatfish_5000_20[,1], breaks=seq(-0.5,1e6,2e3), xlim=c(-0.5,3e5), las=1, xlab="Parent-Offspring Pairs", main="", ylab="")
hist(Pairs_Flatfish_5000_20[,2], breaks=seq(-0.5,1e6,2e3), xlim=c(-0.5,3e5), las=1, xlab="Half-Sibling Pairs", main="", ylab="")

hist(Pairs_Sardine_5000_20[,1], breaks=seq(-0.5,1e6,50), xlim=c(-0.5,2500), las=1, xlab="Parent-Offspring Pairs", main="", ylab="")
hist(Pairs_Sardine_5000_20[,2], breaks=seq(-0.5,1e6,50), xlim=c(-0.5,2500), las=1, xlab="Half-Sibling Pairs", main="", ylab="")
#dev.off()

#Overlap histograms
#N5000
#tiff(paste0(wd,"/CKMRPairs_Overlap.tiff"), height=20, width=30, units='cm', compression="lzw", res=500)
par(mfrow=c(3,6), oma=c(2,2,1,1), mar=c(4,4,2.5,1))
hist(Pairs_Cod_5000_5[,1], breaks=seq(-0.5,1e6,1), xlim=c(-1,100), las=1, xlab="", main="",col=rgb(0.8,0,0,0.2))
hist(Pairs_Cod_1000_5[,1], breaks=seq(-0.5,1e6,1), add=TRUE, col=rgb(0,0.8,0,0.2))
hist(Pairs_Cod_100_5[,1], breaks=seq(-0.5,1e6,1), add=TRUE, col=rgb(0,0,0.8,0.2))
mtext(text="5yr", side=2, line=4.5, font=2)
mtext(text="POP", side=3, line=-2,font=2)
hist(Pairs_Cod_5000_5[,2], breaks=seq(-0.5,1e6,1), xlim=c(-1,100), las=1, xlab="", main="", ylab="",col=rgb(0.8,0,0,0.2))
hist(Pairs_Cod_1000_5[,2], breaks=seq(-0.5,1e6,1), add=TRUE, col=rgb(0,0.8,0,0.2))
hist(Pairs_Cod_100_5[,2], breaks=seq(-0.5,1e6,1), add=TRUE, col=rgb(0,0,0.8,0.2))
mtext(text="Cod", side=3, line=2, at=-30, font=2)
mtext(text="HSP", side=3, line=-2,font=2)

hist(Pairs_Flatfish_5000_5[,1], breaks=seq(-0.5,1e6,5e3), xlim=c(-1,2.5e5), las=1, xlab="", main="", ylab="",col=rgb(0.8,0,0,0.2))
hist(Pairs_Flatfish_1000_5[,1], breaks=seq(-0.5,1e6,5e3), add=TRUE, col=rgb(0,0.8,0,0.2))
hist(Pairs_Flatfish_100_5[,1], breaks=seq(-0.5,1e6,5e3), add=TRUE, col=rgb(0,0,0.8,0.2))
mtext(text="POP", side=3, line=-2,font=2)
hist(Pairs_Flatfish_5000_5[,2], breaks=seq(-0.5,1e6,5e3), xlim=c(-1,2.5e5), las=1, xlab="", main="", ylab="",col=rgb(0.8,0,0,0.2))
hist(Pairs_Flatfish_1000_5[,2], breaks=seq(-0.5,1e6,5e3), add=TRUE, col=rgb(0,0.8,0,0.2))
hist(Pairs_Flatfish_100_5[,2], breaks=seq(-0.5,1e6,5e3), add=TRUE, col=rgb(0,0,0.8,0.2))
mtext(text="Flatfish", side=3, line=2, at=-50000, font=2)
mtext(text="HSP", side=3, line=-2,font=2)

hist(Pairs_Sardine_5000_5[,1], breaks=seq(-0.5,1e6,50), xlim=c(-1,2200), las=1, xlab="", main="", ylab="",col=rgb(0.8,0,0,0.2))
hist(Pairs_Sardine_1000_5[,1], breaks=seq(-0.5,1e6,50), add=TRUE, col=rgb(0,0.8,0,0.2))
hist(Pairs_Sardine_100_5[,1], breaks=seq(-0.5,1e6,50), add=TRUE, col=rgb(0,0,0.8,0.2))
mtext(text="POP", side=3, line=-2,font=2)
hist(Pairs_Sardine_5000_5[,2], breaks=seq(-0.5,1e6,50), xlim=c(-1,2200), las=1, xlab="", main="", ylab="",col=rgb(0.8,0,0,0.2))
hist(Pairs_Sardine_1000_5[,2], breaks=seq(-0.5,1e6,50), add=TRUE, col=rgb(0,0.8,0,0.2))
hist(Pairs_Sardine_100_5[,2], breaks=seq(-0.5,1e6,50), add=TRUE, col=rgb(0,0,0.8,0.2))
mtext(text="Sardine", side=3, line=2, at=-600, font=2)
mtext(text="HSP", side=3, line=-2,font=2)

hist(Pairs_Cod_5000_10[,1], breaks=seq(-0.5,1e6,1), xlim=c(-1,100), las=1, xlab="", main="",col=rgb(0.8,0,0,0.2))
hist(Pairs_Cod_1000_10[,1], breaks=seq(-0.5,1e6,1), add=TRUE, col=rgb(0,0.8,0,0.2))
hist(Pairs_Cod_100_10[,1], breaks=seq(-0.5,1e6,1), add=TRUE, col=rgb(0,0,0.8,0.2))
mtext(text="10yr", side=2, line=4.5, font=2)
hist(Pairs_Cod_5000_10[,2], breaks=seq(-0.5,1e6,1), xlim=c(-1,100), las=1, xlab="", main="", ylab="",col=rgb(0.8,0,0,0.2))
hist(Pairs_Cod_1000_10[,2], breaks=seq(-0.5,1e6,1), add=TRUE, col=rgb(0,0.8,0,0.2))
hist(Pairs_Cod_100_10[,2], breaks=seq(-0.5,1e6,1), add=TRUE, col=rgb(0,0,0.8,0.2))

hist(Pairs_Flatfish_5000_10[,1], breaks=seq(-0.5,1e6,5e3), xlim=c(-1,2.5e5), las=1, xlab="", main="", ylab="",col=rgb(0.8,0,0,0.2))
hist(Pairs_Flatfish_1000_10[,1], breaks=seq(-0.5,1e6,5e3), add=TRUE, col=rgb(0,0.8,0,0.2))
hist(Pairs_Flatfish_100_10[,1], breaks=seq(-0.5,1e6,5e3), add=TRUE, col=rgb(0,0,0.8,0.2))
hist(Pairs_Flatfish_5000_10[,2], breaks=seq(-0.5,1e6,5e3), xlim=c(-1,2.5e5), las=1, xlab="", main="", ylab="",col=rgb(0.8,0,0,0.2))
hist(Pairs_Flatfish_1000_10[,2], breaks=seq(-0.5,1e6,5e3), add=TRUE, col=rgb(0,0.8,0,0.2))
hist(Pairs_Flatfish_100_10[,2], breaks=seq(-0.5,1e6,5e3), add=TRUE, col=rgb(0,0,0.8,0.2))

hist(Pairs_Sardine_5000_10[,1], breaks=seq(-0.5,1e6,50), xlim=c(-1,2200), las=1, xlab="", main="", ylab="",col=rgb(0.8,0,0,0.2))
hist(Pairs_Sardine_1000_10[,1], breaks=seq(-0.5,1e6,50), add=TRUE, col=rgb(0,0.8,0,0.2))
hist(Pairs_Sardine_100_10[,1], breaks=seq(-0.5,1e6,50), add=TRUE, col=rgb(0,0,0.8,0.2))
hist(Pairs_Sardine_5000_10[,2], breaks=seq(-0.5,1e6,50), xlim=c(-1,2200), las=1, xlab="", main="", ylab="",col=rgb(0.8,0,0,0.2))
hist(Pairs_Sardine_1000_10[,2], breaks=seq(-0.5,1e6,50), add=TRUE, col=rgb(0,0.8,0,0.2))
hist(Pairs_Sardine_100_10[,2], breaks=seq(-0.5,1e6,50), add=TRUE, col=rgb(0,0,0.8,0.2))

hist(Pairs_Cod_5000_20[,1], breaks=seq(-0.5,1e6,1), xlim=c(-1,100), las=1, xlab="Parent-Offspring Pairs", main="",col=rgb(0.8,0,0,0.2))
hist(Pairs_Cod_1000_20[,1], breaks=seq(-0.5,1e6,1), add=TRUE, col=rgb(0,0.8,0,0.2))
hist(Pairs_Cod_100_20[,1], breaks=seq(-0.5,1e6,1), add=TRUE, col=rgb(0,0,0.8,0.2))
mtext(text="20yr", side=2, line=4.5, font=2)
hist(Pairs_Cod_5000_20[,2], breaks=seq(-0.5,1e6,1), xlim=c(-1,100), las=1, xlab="Half-Sibling Pairs", main="", ylab="",col=rgb(0.8,0,0,0.2))
hist(Pairs_Cod_1000_20[,2], breaks=seq(-0.5,1e6,1), add=TRUE, col=rgb(0,0.8,0,0.2))
hist(Pairs_Cod_100_20[,2], breaks=seq(-0.5,1e6,1), add=TRUE, col=rgb(0,0,0.8,0.2))

hist(Pairs_Flatfish_5000_20[,1], breaks=seq(-0.5,1e6,5e3), xlim=c(-1,2.5e5), las=1, xlab="Parent-Offspring Pairs", main="", ylab="",col=rgb(0.8,0,0,0.2))
hist(Pairs_Flatfish_1000_20[,1], breaks=seq(-0.5,1e6,5e3), add=TRUE, col=rgb(0,0.8,0,0.2))
hist(Pairs_Flatfish_100_20[,1], breaks=seq(-0.5,1e6,5e3), add=TRUE, col=rgb(0,0,0.8,0.2))
hist(Pairs_Flatfish_5000_20[,2], breaks=seq(-0.5,1e6,5e3), xlim=c(-1,2.5e5), las=1, xlab="Half-Sibling Pairs", main="", ylab="",col=rgb(0.8,0,0,0.2))
hist(Pairs_Flatfish_1000_20[,2], breaks=seq(-0.5,1e6,5e3), add=TRUE, col=rgb(0,0.8,0,0.2))
hist(Pairs_Flatfish_100_20[,2], breaks=seq(-0.5,1e6,5e3), add=TRUE, col=rgb(0,0,0.8,0.2))

hist(Pairs_Sardine_5000_20[,1], breaks=seq(-0.5,1e6,50), xlim=c(-1,2200), las=1, xlab="Parent-Offspring Pairs", main="", ylab="",col=rgb(0.8,0,0,0.2))
hist(Pairs_Sardine_1000_20[,1], breaks=seq(-0.5,1e6,50), add=TRUE, col=rgb(0,0.8,0,0.2))
hist(Pairs_Sardine_100_20[,1], breaks=seq(-0.5,1e6,50), add=TRUE, col=rgb(0,0,0.8,0.2))
hist(Pairs_Sardine_5000_20[,2], breaks=seq(-0.5,1e6,50), xlim=c(-1,2200), las=1, xlab="Half-Sibling Pairs", main="", ylab="",col=rgb(0.8,0,0,0.2))
hist(Pairs_Sardine_1000_20[,2], breaks=seq(-0.5,1e6,50), add=TRUE, col=rgb(0,0.8,0,0.2))
hist(Pairs_Sardine_100_20[,2], breaks=seq(-0.5,1e6,50), add=TRUE, col=rgb(0,0,0.8,0.2))
#dev.off()

#Plots of Selectivity
#tiff(filename="C:/Users/fischn/Documents/GitHub/CKMR_Project/SelFec.tiff", height=23, width=15, units='cm', compression="lzw", res=500)
par(mfrow=c(3,1), mar=c(4,4,1,1), oma=c(2,2,1,1))
plot(0:25, Cod_wdat[[1]]$OM$Sel, xlab="", ylab="", las=1, type="b", pch=16, lwd=2, main="Cod", cex.axis=1.2)
points(0:25, Cod_wdat[[1]]$OM$Mat*Cod_wdat[[1]]$OM$Waa/max(Cod_wdat[[1]]$OM$Mat*Cod_wdat[[1]]$OM$Waa), col=3, pch=16, type="b")
plot(0:25,Flatfish_wdat[[1]]$OM$Sel, ylab="", xlab="", type="b", pch=16, lwd=2, las=1, main="Flatfish", cex.axis=1.2)
mtext(side=2, "Selectivity or Relative Fecundity", line=4)
points(0:25, Flatfish_wdat[[1]]$OM$Mat*Flatfish_wdat[[1]]$OM$Waa/max(Flatfish_wdat[[1]]$OM$Mat*Flatfish_wdat[[1]]$OM$Waa), col=3, pch=16, type="b")
plot(0:15,Sardine_wdat[[1]]$OM$Sel, xlab="", ylab="", las=1, type="b", pch=16, lwd=2, main="Sardine", cex.axis=1.2)
points(0:15, Sardine_wdat[[1]]$OM$Mat*Sardine_wdat[[1]]$OM$Waa/max(Sardine_wdat[[1]]$OM$Mat*Sardine_wdat[[1]]$OM$Waa), col=3, pch=16, type="b")
mtext(side=1, "Age", line=3)
legend("bottom", c("Selectivity", "Fecundity"), bty="n", lwd=2, col=c(1,3))
#dev.off()

##################################
#SCAAs without CKMR data
##################################

#N100 for 5yrs, and index sd 0.25
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N100_Ind25_5yrs_noCKMR.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N100_Ind25_5yrs_noCKMR.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N100_Ind25_5yrs_noCKMR.RData"))

Cod_wdat<-Cod_100_5
Flatfish_wdat<-Flatfish_100_5
Sardine_wdat<-Sardine_100_5

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N100, Index SD - 0.25, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N100, Index SD - 0.25, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N100, Index SD - 0.25, No CKMR", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N100_Ind25_5yrs_noCKMR<-re_SSB
RE_R0_N100_Ind25_5yrs_noCKMR<-re_R0
RE_M_N100_Ind25_5yrs_noCKMR<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N100_Ind25_5yrs_noCKMR<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N100_Ind25_5yrs_noCKMR<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N100_Ind25_5yrs_noCKMR<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N100_Ind25_5yrs_noCKMR<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N100_Ind25_5yrs_noCKMR<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N100_Ind25_5yrs_noCKMR<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N100_Ind25_5yrs_noCKMR<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N100_Ind25_5yrs_noCKMR<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N100_Ind25_5yrs_noCKMR<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N100_Ind25_5yrs_noCKMR<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N100_Ind25_5yrs_noCKMR<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N100_Ind25_5yrs_noCKMR<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N100_Ind25_5yrs_noCKMR<-CV_ssb_N100_Ind25_5yrs_noCKMR<-array(NA, dim=c(3,100,76)) 
SD_R0_N100_Ind25_5yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
SD_M_N100_Ind25_5yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N100_Ind25_5yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N100_Ind25_5yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N100_Ind25_5yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N100_Ind25_5yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N1000 for 5 yrs, sd index 0.25
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N1000_Ind25_5yrs_noCKMR.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N1000_Ind25_5yrs_noCKMR.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N1000_Ind25_5yrs_noCKMR.RData"))

Cod_wdat<-Cod_1000_5
Flatfish_wdat<-Flatfish_1000_5
Sardine_wdat<-Sardine_1000_5

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N1000|5yrs, Index SD - 0.25, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N1000|5yrs, Index SD - 0.25, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N1000|5yrs, Index SD - 0.25, No CKMR", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N1000_Ind25_5yrs_noCKMR<-re_SSB
RE_R0_N1000_Ind25_5yrs_noCKMR<-re_R0
RE_M_N1000_Ind25_5yrs_noCKMR<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N1000_Ind25_5yrs_noCKMR<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N1000_Ind25_5yrs_noCKMR<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N1000_Ind25_5yrs_noCKMR<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N1000_Ind25_5yrs_noCKMR<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N1000_Ind25_5yrs_noCKMR<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N1000_Ind25_5yrs_noCKMR<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N1000_Ind25_5yrs_noCKMR<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N1000_Ind25_5yrs_noCKMR<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N1000_Ind25_5yrs_noCKMR<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N1000_Ind25_5yrs_noCKMR<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N1000_Ind25_5yrs_noCKMR<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N1000_Ind25_5yrs_noCKMR<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N1000_Ind25_5yrs_noCKMR<-CV_ssb_N1000_Ind25_5yrs_noCKMR<-array(NA, dim=c(3,100,76)) 
SD_R0_N1000_Ind25_5yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
SD_M_N1000_Ind25_5yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N1000_Ind25_5yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N1000_Ind25_5yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N1000_Ind25_5yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N1000_Ind25_5yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N5000 for 5 yrs, sd index 0.25
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N5000_Ind25_5yrs_noCKMR.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N5000_Ind25_5yrs_noCKMR.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N5000_Ind25_5yrs_noCKMR.RData"))

Cod_wdat<-Cod_5000_5
Flatfish_wdat<-Flatfish_5000_5
Sardine_wdat<-Sardine_5000_5

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      } 
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N5000|5yrs, Index SD - 0.25, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N5000|5yrs, Index SD - 0.25, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N5000|5yrs, Index SD - 0.25, No CKMR", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N5000_Ind25_5yrs_noCKMR<-re_SSB
RE_R0_N5000_Ind25_5yrs_noCKMR<-re_R0
RE_M_N5000_Ind25_5yrs_noCKMR<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N5000_Ind25_5yrs_noCKMR<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N5000_Ind25_5yrs_noCKMR<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N5000_Ind25_5yrs_noCKMR<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N5000_Ind25_5yrs_noCKMR<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N5000_Ind25_5yrs_noCKMR<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N5000_Ind25_5yrs_noCKMR<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N5000_Ind25_5yrs_noCKMR<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N5000_Ind25_5yrs_noCKMR<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N5000_Ind25_5yrs_noCKMR<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N5000_Ind25_5yrs_noCKMR<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N5000_Ind25_5yrs_noCKMR<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N5000_Ind25_5yrs_noCKMR<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N5000_Ind25_5yrs_noCKMR<-CV_ssb_N5000_Ind25_5yrs_noCKMR<-array(NA, dim=c(3,100,76)) 
SD_R0_N5000_Ind25_5yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
SD_M_N5000_Ind25_5yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N5000_Ind25_5yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N5000_Ind25_5yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N5000_Ind25_5yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N5000_Ind25_5yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N100 for 5 yrs and index sd 0.50
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N100_Ind50_5yrs_noCKMR.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N100_Ind50_5yrs_noCKMR.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N100_Ind50_5yrs_noCKMR.RData"))

Cod_wdat<-Cod_100_5
Flatfish_wdat<-Flatfish_100_5
Sardine_wdat<-Sardine_100_5

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N100, Index SD - 0.50, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N100, Index SD - 0.50, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N100, Index SD - 0.50, No CKMR", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N100_Ind50_5yrs_noCKMR<-re_SSB
RE_R0_N100_Ind50_5yrs_noCKMR<-re_R0
RE_M_N100_Ind50_5yrs_noCKMR<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N100_Ind50_5yrs_noCKMR<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N100_Ind50_5yrs_noCKMR<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N100_Ind50_5yrs_noCKMR<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N100_Ind50_5yrs_noCKMR<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N100_Ind50_5yrs_noCKMR<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N100_Ind50_5yrs_noCKMR<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N100_Ind50_5yrs_noCKMR<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N100_Ind50_5yrs_noCKMR<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N100_Ind50_5yrs_noCKMR<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N100_Ind50_5yrs_noCKMR<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N100_Ind50_5yrs_noCKMR<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N100_Ind50_5yrs_noCKMR<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N100_Ind50_5yrs_noCKMR<-CV_ssb_N100_Ind50_5yrs_noCKMR<-array(NA, dim=c(3,100,76)) 
SD_R0_N100_Ind50_5yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
SD_M_N100_Ind50_5yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N100_Ind50_5yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N100_Ind50_5yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N100_Ind50_5yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N100_Ind50_5yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N1000 for 5 yrs, sd index 0.50
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N1000_Ind50_5yrs_noCKMR.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N1000_Ind50_5yrs_noCKMR.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N1000_Ind50_5yrs_noCKMR.RData"))

Cod_wdat<-Cod_1000_5
Flatfish_wdat<-Flatfish_1000_5
Sardine_wdat<-Sardine_1000_5

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N1000|5yrs, Index SD - 0.50, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N1000|5yrs, Index SD - 0.50, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N1000|5yrs, Index SD - 0.50, No CKMR", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N1000_Ind50_5yrs_noCKMR<-re_SSB
RE_R0_N1000_Ind50_5yrs_noCKMR<-re_R0
RE_M_N1000_Ind50_5yrs_noCKMR<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N1000_Ind50_5yrs_noCKMR<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N1000_Ind50_5yrs_noCKMR<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N1000_Ind50_5yrs_noCKMR<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N1000_Ind50_5yrs_noCKMR<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N1000_Ind50_5yrs_noCKMR<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N1000_Ind50_5yrs_noCKMR<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N1000_Ind50_5yrs_noCKMR<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N1000_Ind50_5yrs_noCKMR<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N1000_Ind50_5yrs_noCKMR<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N1000_Ind50_5yrs_noCKMR<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N1000_Ind50_5yrs_noCKMR<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N1000_Ind50_5yrs_noCKMR<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N1000_Ind50_5yrs_noCKMR<-CV_ssb_N1000_Ind50_5yrs_noCKMR<-array(NA, dim=c(3,100,76)) 
SD_R0_N1000_Ind50_5yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
SD_M_N1000_Ind50_5yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N1000_Ind50_5yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N1000_Ind50_5yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N1000_Ind50_5yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N1000_Ind50_5yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N5000 for 5 years, sd index 0.50
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N5000_Ind50_5yrs_noCKMR.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N5000_Ind50_5yrs_noCKMR.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N5000_Ind50_5yrs_noCKMR.RData"))

Cod_wdat<-Cod_5000_5
Flatfish_wdat<-Flatfish_5000_5
Sardine_wdat<-Sardine_5000_5

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N5000|5yrs, Index SD - 0.50, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N5000|5yrs, Index SD - 0.50, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N5000|5yrs, Index SD - 0.50, No CKMR", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N5000_Ind50_5yrs_noCKMR<-re_SSB
RE_R0_N5000_Ind50_5yrs_noCKMR<-re_R0
RE_M_N5000_Ind50_5yrs_noCKMR<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N5000_Ind50_5yrs_noCKMR<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N5000_Ind50_5yrs_noCKMR<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N5000_Ind50_5yrs_noCKMR<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N5000_Ind50_5yrs_noCKMR<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N5000_Ind50_5yrs_noCKMR<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N5000_Ind50_5yrs_noCKMR<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N5000_Ind50_5yrs_noCKMR<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N5000_Ind50_5yrs_noCKMR<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N5000_Ind50_5yrs_noCKMR<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N5000_Ind50_5yrs_noCKMR<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N5000_Ind50_5yrs_noCKMR<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N5000_Ind50_5yrs_noCKMR<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N5000_Ind50_5yrs_noCKMR<-CV_ssb_N5000_Ind50_5yrs_noCKMR<-array(NA, dim=c(3,100,76)) 
SD_R0_N5000_Ind50_5yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
SD_M_N5000_Ind50_5yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N5000_Ind50_5yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N5000_Ind50_5yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N5000_Ind50_5yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N5000_Ind50_5yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#########
#10 years
#########

#N100 for 10yrs, and index sd 0.25
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N100_Ind25_10yrs_noCKMR.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N100_Ind25_10yrs_noCKMR.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N100_Ind25_10yrs_noCKMR.RData"))

Cod_wdat<-Cod_100_10
Flatfish_wdat<-Flatfish_100_10
Sardine_wdat<-Sardine_100_10

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N100, Index SD - 0.25, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N100, Index SD - 0.25, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N100, Index SD - 0.25, No CKMR", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N100_Ind25_10yrs_noCKMR<-re_SSB
RE_R0_N100_Ind25_10yrs_noCKMR<-re_R0
RE_M_N100_Ind25_10yrs_noCKMR<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N100_Ind25_10yrs_noCKMR<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N100_Ind25_10yrs_noCKMR<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N100_Ind25_10yrs_noCKMR<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N100_Ind25_10yrs_noCKMR<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N100_Ind25_10yrs_noCKMR<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N100_Ind25_10yrs_noCKMR<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N100_Ind25_10yrs_noCKMR<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N100_Ind25_10yrs_noCKMR<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N100_Ind25_10yrs_noCKMR<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N100_Ind25_10yrs_noCKMR<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N100_Ind25_10yrs_noCKMR<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N100_Ind25_10yrs_noCKMR<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N100_Ind25_10yrs_noCKMR<-CV_ssb_N100_Ind25_10yrs_noCKMR<-array(NA, dim=c(3,100,76)) 
SD_R0_N100_Ind25_10yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
SD_M_N100_Ind25_10yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N100_Ind25_10yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N100_Ind25_10yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N100_Ind25_10yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N100_Ind25_10yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N1000 for 10yrs, sd index 0.25
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N1000_Ind25_10yrs_noCKMR.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N1000_Ind25_10yrs_noCKMR.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N1000_Ind25_10yrs_noCKMR.RData"))

Cod_wdat<-Cod_1000_10
Flatfish_wdat<-Flatfish_1000_10
Sardine_wdat<-Sardine_1000_10

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N1000|10yrs, Index SD - 0.25, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N1000|10yrs, Index SD - 0.25, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N1000|10yrs, Index SD - 0.25, No CKMR", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N1000_Ind25_10yrs_noCKMR<-re_SSB
RE_R0_N1000_Ind25_10yrs_noCKMR<-re_R0
RE_M_N1000_Ind25_10yrs_noCKMR<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N1000_Ind25_10yrs_noCKMR<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N1000_Ind25_10yrs_noCKMR<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N1000_Ind25_10yrs_noCKMR<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N1000_Ind25_10yrs_noCKMR<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N1000_Ind25_10yrs_noCKMR<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N1000_Ind25_10yrs_noCKMR<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N1000_Ind25_10yrs_noCKMR<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N1000_Ind25_10yrs_noCKMR<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N1000_Ind25_10yrs_noCKMR<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N1000_Ind25_10yrs_noCKMR<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N1000_Ind25_10yrs_noCKMR<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N1000_Ind25_10yrs_noCKMR<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N1000_Ind25_10yrs_noCKMR<-CV_ssb_N1000_Ind25_10yrs_noCKMR<-array(NA, dim=c(3,100,76)) 
SD_R0_N1000_Ind25_10yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
SD_M_N1000_Ind25_10yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N1000_Ind25_10yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N1000_Ind25_10yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N1000_Ind25_10yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N1000_Ind25_10yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N5000 for 10yrs, sd index 0.25
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N5000_Ind25_10yrs_noCKMR.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N5000_Ind25_10yrs_noCKMR.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N5000_Ind25_10yrs_noCKMR.RData"))

Cod_wdat<-Cod_5000_10
Flatfish_wdat<-Flatfish_5000_10
Sardine_wdat<-Sardine_5000_10

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N5000|10yrs, Index SD - 0.25, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N5000|10yrs, Index SD - 0.25, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N5000|10yrs, Index SD - 0.25, No CKMR", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N5000_Ind25_10yrs_noCKMR<-re_SSB
RE_R0_N5000_Ind25_10yrs_noCKMR<-re_R0
RE_M_N5000_Ind25_10yrs_noCKMR<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N5000_Ind25_10yrs_noCKMR<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N5000_Ind25_10yrs_noCKMR<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N5000_Ind25_10yrs_noCKMR<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N5000_Ind25_10yrs_noCKMR<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N5000_Ind25_10yrs_noCKMR<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N5000_Ind25_10yrs_noCKMR<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N5000_Ind25_10yrs_noCKMR<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N5000_Ind25_10yrs_noCKMR<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N5000_Ind25_10yrs_noCKMR<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N5000_Ind25_10yrs_noCKMR<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N5000_Ind25_10yrs_noCKMR<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N5000_Ind25_10yrs_noCKMR<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N5000_Ind25_10yrs_noCKMR<-CV_ssb_N5000_Ind25_10yrs_noCKMR<-array(NA, dim=c(3,100,76)) 
SD_R0_N5000_Ind25_10yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
SD_M_N5000_Ind25_10yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N5000_Ind25_10yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N5000_Ind25_10yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N5000_Ind25_10yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N5000_Ind25_10yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N100 for 10yrs and index sd 0.50
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N100_Ind50_10yrs_noCKMR.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N100_Ind50_10yrs_noCKMR.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N100_Ind50_10yrs_noCKMR.RData"))

Cod_wdat<-Cod_100_10
Flatfish_wdat<-Flatfish_100_10
Sardine_wdat<-Sardine_100_10

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N100, Index SD - 0.50, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N100, Index SD - 0.50, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N100, Index SD - 0.50, No CKMR", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N100_Ind50_10yrs_noCKMR<-re_SSB
RE_R0_N100_Ind50_10yrs_noCKMR<-re_R0
RE_M_N100_Ind50_10yrs_noCKMR<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N100_Ind50_10yrs_noCKMR<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N100_Ind50_10yrs_noCKMR<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N100_Ind50_10yrs_noCKMR<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N100_Ind50_10yrs_noCKMR<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N100_Ind50_10yrs_noCKMR<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N100_Ind50_10yrs_noCKMR<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N100_Ind50_10yrs_noCKMR<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N100_Ind50_10yrs_noCKMR<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N100_Ind50_10yrs_noCKMR<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N100_Ind50_10yrs_noCKMR<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N100_Ind50_10yrs_noCKMR<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N100_Ind50_10yrs_noCKMR<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N100_Ind50_10yrs_noCKMR<-CV_ssb_N100_Ind50_10yrs_noCKMR<-array(NA, dim=c(3,100,76)) 
SD_R0_N100_Ind50_10yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
SD_M_N100_Ind50_10yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N100_Ind50_10yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N100_Ind50_10yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N100_Ind50_10yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N100_Ind50_10yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N1000 for 10yrs, sd index 0.50
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N1000_Ind50_10yrs_noCKMR.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N1000_Ind50_10yrs_noCKMR.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N1000_Ind50_10yrs_noCKMR.RData"))

Cod_wdat<-Cod_1000_10
Flatfish_wdat<-Flatfish_1000_10
Sardine_wdat<-Sardine_1000_10

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N1000|10yrs, Index SD - 0.50, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N1000|10yrs, Index SD - 0.50, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N1000|10yrs, Index SD - 0.50, No CKMR", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N1000_Ind50_10yrs_noCKMR<-re_SSB
RE_R0_N1000_Ind50_10yrs_noCKMR<-re_R0
RE_M_N1000_Ind50_10yrs_noCKMR<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N1000_Ind50_10yrs_noCKMR<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N1000_Ind50_10yrs_noCKMR<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N1000_Ind50_10yrs_noCKMR<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N1000_Ind50_10yrs_noCKMR<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N1000_Ind50_10yrs_noCKMR<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N1000_Ind50_10yrs_noCKMR<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N1000_Ind50_10yrs_noCKMR<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N1000_Ind50_10yrs_noCKMR<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N1000_Ind50_10yrs_noCKMR<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N1000_Ind50_10yrs_noCKMR<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N1000_Ind50_10yrs_noCKMR<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N1000_Ind50_10yrs_noCKMR<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N1000_Ind50_10yrs_noCKMR<-CV_ssb_N1000_Ind50_10yrs_noCKMR<-array(NA, dim=c(3,100,76)) 
SD_R0_N1000_Ind50_10yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
SD_M_N1000_Ind50_10yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N1000_Ind50_10yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N1000_Ind50_10yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N1000_Ind50_10yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N1000_Ind50_10yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N5000 for 10yrs, sd index 0.50
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N5000_Ind50_10yrs_noCKMR.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N5000_Ind50_10yrs_noCKMR.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N5000_Ind50_10yrs_noCKMR.RData"))

Cod_wdat<-Cod_5000_10
Flatfish_wdat<-Flatfish_5000_10
Sardine_wdat<-Sardine_5000_10

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N5000|10yrs, Index SD - 0.50, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N5000|10yrs, Index SD - 0.50, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N5000|10yrs, Index SD - 0.50, No CKMR", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N5000_Ind50_10yrs_noCKMR<-re_SSB
RE_R0_N5000_Ind50_10yrs_noCKMR<-re_R0
RE_M_N5000_Ind50_10yrs_noCKMR<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N5000_Ind50_10yrs_noCKMR<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N5000_Ind50_10yrs_noCKMR<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N5000_Ind50_10yrs_noCKMR<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N5000_Ind50_10yrs_noCKMR<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N5000_Ind50_10yrs_noCKMR<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N5000_Ind50_10yrs_noCKMR<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N5000_Ind50_10yrs_noCKMR<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N5000_Ind50_10yrs_noCKMR<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N5000_Ind50_10yrs_noCKMR<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N5000_Ind50_10yrs_noCKMR<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N5000_Ind50_10yrs_noCKMR<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N5000_Ind50_10yrs_noCKMR<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N5000_Ind50_10yrs_noCKMR<-CV_ssb_N5000_Ind50_10yrs_noCKMR<-array(NA, dim=c(3,100,76)) 
SD_R0_N5000_Ind50_10yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
SD_M_N5000_Ind50_10yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N5000_Ind50_10yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N5000_Ind50_10yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N5000_Ind50_10yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N5000_Ind50_10yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#########
#20 years
#########

#N100 for 20yrs, and index sd 0.25
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N100_Ind25_20yrs_noCKMR.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N100_Ind25_20yrs_noCKMR.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N100_Ind25_20yrs_noCKMR.RData"))

Cod_wdat<-Cod_100_20
Flatfish_wdat<-Flatfish_100_20
Sardine_wdat<-Sardine_100_20

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N100, Index SD - 0.25, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N100, Index SD - 0.25, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N100, Index SD - 0.25, No CKMR", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N100_Ind25_20yrs_noCKMR<-re_SSB
RE_R0_N100_Ind25_20yrs_noCKMR<-re_R0
RE_M_N100_Ind25_20yrs_noCKMR<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N100_Ind25_20yrs_noCKMR<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N100_Ind25_20yrs_noCKMR<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N100_Ind25_20yrs_noCKMR<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N100_Ind25_20yrs_noCKMR<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N100_Ind25_20yrs_noCKMR<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N100_Ind25_20yrs_noCKMR<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N100_Ind25_20yrs_noCKMR<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N100_Ind25_20yrs_noCKMR<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N100_Ind25_20yrs_noCKMR<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N100_Ind25_20yrs_noCKMR<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N100_Ind25_20yrs_noCKMR<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N100_Ind25_20yrs_noCKMR<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N100_Ind25_20yrs_noCKMR<-CV_ssb_N100_Ind25_20yrs_noCKMR<-array(NA, dim=c(3,100,76)) 
SD_R0_N100_Ind25_20yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
SD_M_N100_Ind25_20yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N100_Ind25_20yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N100_Ind25_20yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N100_Ind25_20yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N100_Ind25_20yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N1000 for 20yrs, sd index 0.25
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N1000_Ind25_20yrs_noCKMR.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N1000_Ind25_20yrs_noCKMR.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N1000_Ind25_20yrs_noCKMR.RData"))

Cod_wdat<-Cod_1000_20
Flatfish_wdat<-Flatfish_1000_20
Sardine_wdat<-Sardine_1000_20

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N1000|20yrs, Index SD - 0.25, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N1000|20yrs, Index SD - 0.25, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N1000|20yrs, Index SD - 0.25, No CKMR", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N1000_Ind25_20yrs_noCKMR<-re_SSB
RE_R0_N1000_Ind25_20yrs_noCKMR<-re_R0
RE_M_N1000_Ind25_20yrs_noCKMR<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N1000_Ind25_20yrs_noCKMR<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N1000_Ind25_20yrs_noCKMR<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N1000_Ind25_20yrs_noCKMR<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N1000_Ind25_20yrs_noCKMR<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N1000_Ind25_20yrs_noCKMR<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N1000_Ind25_20yrs_noCKMR<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N1000_Ind25_20yrs_noCKMR<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N1000_Ind25_20yrs_noCKMR<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N1000_Ind25_20yrs_noCKMR<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N1000_Ind25_20yrs_noCKMR<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N1000_Ind25_20yrs_noCKMR<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N1000_Ind25_20yrs_noCKMR<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N1000_Ind25_20yrs_noCKMR<-CV_ssb_N1000_Ind25_20yrs_noCKMR<-array(NA, dim=c(3,100,76)) 
SD_R0_N1000_Ind25_20yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
SD_M_N1000_Ind25_20yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N1000_Ind25_20yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N1000_Ind25_20yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N1000_Ind25_20yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N1000_Ind25_20yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N5000 for 20yrs, sd index 0.25
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N5000_Ind25_20yrs_noCKMR.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N5000_Ind25_20yrs_noCKMR.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N5000_Ind25_20yrs_noCKMR.RData"))

Cod_wdat<-Cod_5000_20
Flatfish_wdat<-Flatfish_5000_20
Sardine_wdat<-Sardine_5000_20

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      } 
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N5000|20yrs, Index SD - 0.25, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N5000|20yrs, Index SD - 0.25, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N5000|20yrs, Index SD - 0.25, No CKMR", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N5000_Ind25_20yrs_noCKMR<-re_SSB
RE_R0_N5000_Ind25_20yrs_noCKMR<-re_R0
RE_M_N5000_Ind25_20yrs_noCKMR<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N5000_Ind25_20yrs_noCKMR<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N5000_Ind25_20yrs_noCKMR<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N5000_Ind25_20yrs_noCKMR<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N5000_Ind25_20yrs_noCKMR<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N5000_Ind25_20yrs_noCKMR<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N5000_Ind25_20yrs_noCKMR<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N5000_Ind25_20yrs_noCKMR<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N5000_Ind25_20yrs_noCKMR<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N5000_Ind25_20yrs_noCKMR<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N5000_Ind25_20yrs_noCKMR<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N5000_Ind25_20yrs_noCKMR<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N5000_Ind25_20yrs_noCKMR<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N5000_Ind25_20yrs_noCKMR<-CV_ssb_N5000_Ind25_20yrs_noCKMR<-array(NA, dim=c(3,100,76)) 
SD_R0_N5000_Ind25_20yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
SD_M_N5000_Ind25_20yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N5000_Ind25_20yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N5000_Ind25_20yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N5000_Ind25_20yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N5000_Ind25_20yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N100 for 20yrs and index sd 0.50
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N100_Ind50_20yrs_noCKMR.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N100_Ind50_20yrs_noCKMR.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N100_Ind50_20yrs_noCKMR.RData"))

Cod_wdat<-Cod_100_20
Flatfish_wdat<-Flatfish_100_20
Sardine_wdat<-Sardine_100_20

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N100, Index SD - 0.50, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N100, Index SD - 0.50, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N100, Index SD - 0.50, No CKMR", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N100_Ind50_20yrs_noCKMR<-re_SSB
RE_R0_N100_Ind50_20yrs_noCKMR<-re_R0
RE_M_N100_Ind50_20yrs_noCKMR<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N100_Ind50_20yrs_noCKMR<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N100_Ind50_20yrs_noCKMR<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N100_Ind50_20yrs_noCKMR<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N100_Ind50_20yrs_noCKMR<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N100_Ind50_20yrs_noCKMR<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N100_Ind50_20yrs_noCKMR<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N100_Ind50_20yrs_noCKMR<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N100_Ind50_20yrs_noCKMR<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N100_Ind50_20yrs_noCKMR<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N100_Ind50_20yrs_noCKMR<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N100_Ind50_20yrs_noCKMR<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N100_Ind50_20yrs_noCKMR<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N100_Ind50_20yrs_noCKMR<-CV_ssb_N100_Ind50_20yrs_noCKMR<-array(NA, dim=c(3,100,76)) 
SD_R0_N100_Ind50_20yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
SD_M_N100_Ind50_20yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N100_Ind50_20yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N100_Ind50_20yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N100_Ind50_20yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N100_Ind50_20yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N1000 for 20yrs, sd index 0.50
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N1000_Ind50_20yrs_noCKMR.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N1000_Ind50_20yrs_noCKMR.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N1000_Ind50_20yrs_noCKMR.RData"))

Cod_wdat<-Cod_1000_20
Flatfish_wdat<-Flatfish_1000_20
Sardine_wdat<-Sardine_1000_20

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N1000|20yrs, Index SD - 0.50, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N1000|20yrs, Index SD - 0.50, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N1000|20yrs, Index SD - 0.50, No CKMR", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N1000_Ind50_20yrs_noCKMR<-re_SSB
RE_R0_N1000_Ind50_20yrs_noCKMR<-re_R0
RE_M_N1000_Ind50_20yrs_noCKMR<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N1000_Ind50_20yrs_noCKMR<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N1000_Ind50_20yrs_noCKMR<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N1000_Ind50_20yrs_noCKMR<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N1000_Ind50_20yrs_noCKMR<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N1000_Ind50_20yrs_noCKMR<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N1000_Ind50_20yrs_noCKMR<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N1000_Ind50_20yrs_noCKMR<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N1000_Ind50_20yrs_noCKMR<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N1000_Ind50_20yrs_noCKMR<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N1000_Ind50_20yrs_noCKMR<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N1000_Ind50_20yrs_noCKMR<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N1000_Ind50_20yrs_noCKMR<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N1000_Ind50_20yrs_noCKMR<-CV_ssb_N1000_Ind50_20yrs_noCKMR<-array(NA, dim=c(3,100,76)) 
SD_R0_N1000_Ind50_20yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
SD_M_N1000_Ind50_20yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N1000_Ind50_20yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N1000_Ind50_20yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N1000_Ind50_20yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N1000_Ind50_20yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N5000 for 20yrs, sd index 0.50
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N5000_Ind50_20yrs_noCKMR.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N5000_Ind50_20yrs_noCKMR.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N5000_Ind50_20yrs_noCKMR.RData"))

Cod_wdat<-Cod_5000_20
Flatfish_wdat<-Flatfish_5000_20
Sardine_wdat<-Sardine_5000_20

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      } 
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N5000|20yrs, Index SD - 0.50, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N5000|20yrs, Index SD - 0.50, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N5000|20yrs, Index SD - 0.50, No CKMR", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N5000_Ind50_20yrs_noCKMR<-re_SSB
RE_R0_N5000_Ind50_20yrs_noCKMR<-re_R0
RE_M_N5000_Ind50_20yrs_noCKMR<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N5000_Ind50_20yrs_noCKMR<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N5000_Ind50_20yrs_noCKMR<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N5000_Ind50_20yrs_noCKMR<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N5000_Ind50_20yrs_noCKMR<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N5000_Ind50_20yrs_noCKMR<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N5000_Ind50_20yrs_noCKMR<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N5000_Ind50_20yrs_noCKMR<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N5000_Ind50_20yrs_noCKMR<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N5000_Ind50_20yrs_noCKMR<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N5000_Ind50_20yrs_noCKMR<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N5000_Ind50_20yrs_noCKMR<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N5000_Ind50_20yrs_noCKMR<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N5000_Ind50_20yrs_noCKMR<-CV_ssb_N5000_Ind50_20yrs_noCKMR<-array(NA, dim=c(3,100,76)) 
SD_R0_N5000_Ind50_20yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
SD_M_N5000_Ind50_20yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N5000_Ind50_20yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N5000_Ind50_20yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N5000_Ind50_20yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N5000_Ind50_20yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

###########################################
#SCAAs with No Index data and No CKMR
###########################################

#N100 for 5yrs, No Index
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N100_NoIndex_5yrs_noCKMR.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N100_NoIndex_5yrs_noCKMR.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N100_NoIndex_5yrs_noCKMR.RData"))

Cod_wdat<-Cod_100_5
Flatfish_wdat<-Flatfish_100_5
Sardine_wdat<-Sardine_100_5

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N100, No Index, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N100, No Index, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N100, No Index, No CKMR", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N100_NoIndex_5yrs_noCKMR<-re_SSB
RE_R0_N100_NoIndex_5yrs_noCKMR<-re_R0
RE_M_N100_NoIndex_5yrs_noCKMR<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N100_NoIndex_5yrs_noCKMR<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N100_NoIndex_5yrs_noCKMR<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N100_NoIndex_5yrs_noCKMR<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N100_NoIndex_5yrs_noCKMR<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N100_NoIndex_5yrs_noCKMR<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N100_NoIndex_5yrs_noCKMR<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N100_NoIndex_5yrs_noCKMR<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N100_NoIndex_5yrs_noCKMR<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N100_NoIndex_5yrs_noCKMR<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N100_NoIndex_5yrs_noCKMR<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N100_NoIndex_5yrs_noCKMR<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N100_NoIndex_5yrs_noCKMR<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N100_NoIndex_5yrs_noCKMR<-CV_ssb_N100_NoIndex_5yrs_noCKMR<-array(NA, dim=c(3,100,76)) 
SD_R0_N100_NoIndex_5yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
SD_M_N100_NoIndex_5yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N100_NoIndex_5yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N100_NoIndex_5yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N100_NoIndex_5yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N100_NoIndex_5yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N1000 for 5 yrs, No Index
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N1000_NoIndex_5yrs_noCKMR.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N1000_NoIndex_5yrs_noCKMR.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N1000_NoIndex_5yrs_noCKMR.RData"))

Cod_wdat<-Cod_1000_5
Flatfish_wdat<-Flatfish_1000_5
Sardine_wdat<-Sardine_1000_5

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      } 
    }
  }
}

par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N1000|5yrs, No Index, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N1000|5yrs, No Index, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N1000|5yrs, No Index, No CKMR", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N1000_NoIndex_5yrs_noCKMR<-re_SSB
RE_R0_N1000_NoIndex_5yrs_noCKMR<-re_R0
RE_M_N1000_NoIndex_5yrs_noCKMR<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N1000_NoIndex_5yrs_noCKMR<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N1000_NoIndex_5yrs_noCKMR<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N1000_NoIndex_5yrs_noCKMR<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N1000_NoIndex_5yrs_noCKMR<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N1000_NoIndex_5yrs_noCKMR<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N1000_NoIndex_5yrs_noCKMR<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N1000_NoIndex_5yrs_noCKMR<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N1000_NoIndex_5yrs_noCKMR<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N1000_NoIndex_5yrs_noCKMR<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N1000_NoIndex_5yrs_noCKMR<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N1000_NoIndex_5yrs_noCKMR<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N1000_NoIndex_5yrs_noCKMR<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N1000_NoIndex_5yrs_noCKMR<-CV_ssb_N1000_NoIndex_5yrs_noCKMR<-array(NA, dim=c(3,100,76)) 
SD_R0_N1000_NoIndex_5yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
SD_M_N1000_NoIndex_5yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N1000_NoIndex_5yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N1000_NoIndex_5yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N1000_NoIndex_5yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N1000_NoIndex_5yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N5000 for 5 yrs, No Index
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N5000_NoIndex_5yrs_noCKMR.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N5000_NoIndex_5yrs_noCKMR.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N5000_NoIndex_5yrs_noCKMR.RData"))

Cod_wdat<-Cod_5000_5
Flatfish_wdat<-Flatfish_5000_5
Sardine_wdat<-Sardine_5000_5

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N5000|5yrs, No Index, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N5000|5yrs, No Index, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N5000|5yrs, No Index, No CKMR", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N5000_NoIndex_5yrs_noCKMR<-re_SSB
RE_R0_N5000_NoIndex_5yrs_noCKMR<-re_R0
RE_M_N5000_NoIndex_5yrs_noCKMR<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N5000_NoIndex_5yrs_noCKMR<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N5000_NoIndex_5yrs_noCKMR<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N5000_NoIndex_5yrs_noCKMR<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N5000_NoIndex_5yrs_noCKMR<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N5000_NoIndex_5yrs_noCKMR<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N5000_NoIndex_5yrs_noCKMR<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N5000_NoIndex_5yrs_noCKMR<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N5000_NoIndex_5yrs_noCKMR<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N5000_NoIndex_5yrs_noCKMR<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N5000_NoIndex_5yrs_noCKMR<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N5000_NoIndex_5yrs_noCKMR<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N5000_NoIndex_5yrs_noCKMR<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N5000_NoIndex_5yrs_noCKMR<-CV_ssb_N5000_NoIndex_5yrs_noCKMR<-array(NA, dim=c(3,100,76)) 
SD_R0_N5000_NoIndex_5yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
SD_M_N5000_NoIndex_5yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N5000_NoIndex_5yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N5000_NoIndex_5yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N5000_NoIndex_5yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N5000_NoIndex_5yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#########
#10 years
#########

#N100 for 10yrs, and No Index
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N100_NoIndex_10yrs_noCKMR.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N100_NoIndex_10yrs_noCKMR.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N100_NoIndex_10yrs_noCKMR.RData"))

Cod_wdat<-Cod_100_10
Flatfish_wdat<-Flatfish_100_10
Sardine_wdat<-Sardine_100_10

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N100, No Index, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N100, No Index, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N100, No Index, No CKMR", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N100_NoIndex_10yrs_noCKMR<-re_SSB
RE_R0_N100_NoIndex_10yrs_noCKMR<-re_R0
RE_M_N100_NoIndex_10yrs_noCKMR<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N100_NoIndex_10yrs_noCKMR<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N100_NoIndex_10yrs_noCKMR<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N100_NoIndex_10yrs_noCKMR<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N100_NoIndex_10yrs_noCKMR<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N100_NoIndex_10yrs_noCKMR<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N100_NoIndex_10yrs_noCKMR<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N100_NoIndex_10yrs_noCKMR<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N100_NoIndex_10yrs_noCKMR<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N100_NoIndex_10yrs_noCKMR<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N100_NoIndex_10yrs_noCKMR<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N100_NoIndex_10yrs_noCKMR<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N100_NoIndex_10yrs_noCKMR<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N100_NoIndex_10yrs_noCKMR<-CV_ssb_N100_NoIndex_10yrs_noCKMR<-array(NA, dim=c(3,100,76)) 
SD_R0_N100_NoIndex_10yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
SD_M_N100_NoIndex_10yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N100_NoIndex_10yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N100_NoIndex_10yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N100_NoIndex_10yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N100_NoIndex_10yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N1000 for 10yrs, No Index
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N1000_NoIndex_10yrs_noCKMR.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N1000_NoIndex_10yrs_noCKMR.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N1000_NoIndex_10yrs_noCKMR.RData"))

Cod_wdat<-Cod_1000_10
Flatfish_wdat<-Flatfish_1000_10
Sardine_wdat<-Sardine_1000_10

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N1000|10yrs, No Index, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N1000|10yrs, No Index, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N1000|10yrs, No Index, No CKMR", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N1000_NoIndex_10yrs_noCKMR<-re_SSB
RE_R0_N1000_NoIndex_10yrs_noCKMR<-re_R0
RE_M_N1000_NoIndex_10yrs_noCKMR<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N1000_NoIndex_10yrs_noCKMR<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N1000_NoIndex_10yrs_noCKMR<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N1000_NoIndex_10yrs_noCKMR<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N1000_NoIndex_10yrs_noCKMR<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N1000_NoIndex_10yrs_noCKMR<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N1000_NoIndex_10yrs_noCKMR<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N1000_NoIndex_10yrs_noCKMR<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N1000_NoIndex_10yrs_noCKMR<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N1000_NoIndex_10yrs_noCKMR<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N1000_NoIndex_10yrs_noCKMR<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N1000_NoIndex_10yrs_noCKMR<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N1000_NoIndex_10yrs_noCKMR<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N1000_NoIndex_10yrs_noCKMR<-CV_ssb_N1000_NoIndex_10yrs_noCKMR<-array(NA, dim=c(3,100,76)) 
SD_R0_N1000_NoIndex_10yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
SD_M_N1000_NoIndex_10yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N1000_NoIndex_10yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N1000_NoIndex_10yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N1000_NoIndex_10yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N1000_NoIndex_10yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N5000 for 10yrs, No Index
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N5000_NoIndex_10yrs_noCKMR.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N5000_NoIndex_10yrs_noCKMR.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N5000_NoIndex_10yrs_noCKMR.RData"))

Cod_wdat<-Cod_5000_10
Flatfish_wdat<-Flatfish_5000_10
Sardine_wdat<-Sardine_5000_10

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N5000|10yrs, No Index, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N5000|10yrs, No Index, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N5000|10yrs, No Index, No CKMR", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N5000_NoIndex_10yrs_noCKMR<-re_SSB
RE_R0_N5000_NoIndex_10yrs_noCKMR<-re_R0
RE_M_N5000_NoIndex_10yrs_noCKMR<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N5000_NoIndex_10yrs_noCKMR<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N5000_NoIndex_10yrs_noCKMR<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N5000_NoIndex_10yrs_noCKMR<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N5000_NoIndex_10yrs_noCKMR<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N5000_NoIndex_10yrs_noCKMR<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N5000_NoIndex_10yrs_noCKMR<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N5000_NoIndex_10yrs_noCKMR<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N5000_NoIndex_10yrs_noCKMR<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N5000_NoIndex_10yrs_noCKMR<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N5000_NoIndex_10yrs_noCKMR<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N5000_NoIndex_10yrs_noCKMR<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N5000_NoIndex_10yrs_noCKMR<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N5000_NoIndex_10yrs_noCKMR<-CV_ssb_N5000_NoIndex_10yrs_noCKMR<-array(NA, dim=c(3,100,76)) 
SD_R0_N5000_NoIndex_10yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
SD_M_N5000_NoIndex_10yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N5000_NoIndex_10yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N5000_NoIndex_10yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N5000_NoIndex_10yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N5000_NoIndex_10yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N100 for 20yrs, No index
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N100_NoIndex_20yrs_noCKMR.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N100_NoIndex_20yrs_noCKMR.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N100_NoIndex_20yrs_noCKMR.RData"))

Cod_wdat<-Cod_100_20
Flatfish_wdat<-Flatfish_100_20
Sardine_wdat<-Sardine_100_20

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N100, No Index, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N100, No Index, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N100, No Index, No CKMR", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N100_NoIndex_20yrs_noCKMR<-re_SSB
RE_R0_N100_NoIndex_20yrs_noCKMR<-re_R0
RE_M_N100_NoIndex_20yrs_noCKMR<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N100_NoIndex_20yrs_noCKMR<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N100_NoIndex_20yrs_noCKMR<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N100_NoIndex_20yrs_noCKMR<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N100_NoIndex_20yrs_noCKMR<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N100_NoIndex_20yrs_noCKMR<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N100_NoIndex_20yrs_noCKMR<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N100_NoIndex_20yrs_noCKMR<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N100_NoIndex_20yrs_noCKMR<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N100_NoIndex_20yrs_noCKMR<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N100_NoIndex_20yrs_noCKMR<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N100_NoIndex_20yrs_noCKMR<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N100_NoIndex_20yrs_noCKMR<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N100_NoIndex_20yrs_noCKMR<-CV_ssb_N100_NoIndex_20yrs_noCKMR<-array(NA, dim=c(3,100,76)) 
SD_R0_N100_NoIndex_20yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
SD_M_N100_NoIndex_20yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N100_NoIndex_20yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N100_NoIndex_20yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N100_NoIndex_20yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N100_NoIndex_20yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N1000 for 20yrs, No Index
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N1000_NoIndex_20yrs_noCKMR.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N1000_NoIndex_20yrs_noCKMR.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N1000_NoIndex_20yrs_noCKMR.RData"))

Cod_wdat<-Cod_1000_20
Flatfish_wdat<-Flatfish_1000_20
Sardine_wdat<-Sardine_1000_20

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N1000|20yrs, No Index, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N1000|20yrs, No Index, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N1000|20yrs, No Index, No CKMR", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N1000_NoIndex_20yrs_noCKMR<-re_SSB
RE_R0_N1000_NoIndex_20yrs_noCKMR<-re_R0
RE_M_N1000_NoIndex_20yrs_noCKMR<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N1000_NoIndex_20yrs_noCKMR<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N1000_NoIndex_20yrs_noCKMR<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N1000_NoIndex_20yrs_noCKMR<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N1000_NoIndex_20yrs_noCKMR<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N1000_NoIndex_20yrs_noCKMR<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N1000_NoIndex_20yrs_noCKMR<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N1000_NoIndex_20yrs_noCKMR<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N1000_NoIndex_20yrs_noCKMR<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N1000_NoIndex_20yrs_noCKMR<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N1000_NoIndex_20yrs_noCKMR<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N1000_NoIndex_20yrs_noCKMR<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N1000_NoIndex_20yrs_noCKMR<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N1000_NoIndex_20yrs_noCKMR<-CV_ssb_N1000_NoIndex_20yrs_noCKMR<-array(NA, dim=c(3,100,76)) 
SD_R0_N1000_NoIndex_20yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
SD_M_N1000_NoIndex_20yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N1000_NoIndex_20yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N1000_NoIndex_20yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N1000_NoIndex_20yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N1000_NoIndex_20yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N5000 for 20yrs, No Index
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N5000_NoIndex_20yrs_noCKMR.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N5000_NoIndex_20yrs_noCKMR.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N5000_NoIndex_20yrs_noCKMR.RData"))

Cod_wdat<-Cod_5000_20
Flatfish_wdat<-Flatfish_5000_20
Sardine_wdat<-Sardine_5000_20

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N5000|20yrs, No Index, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N5000|20yrs, No Index, No CKMR", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N5000|20yrs, No Index, No CKMR", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N5000_NoIndex_20yrs_noCKMR<-re_SSB
RE_R0_N5000_NoIndex_20yrs_noCKMR<-re_R0
RE_M_N5000_NoIndex_20yrs_noCKMR<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N5000_NoIndex_20yrs_noCKMR<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N5000_NoIndex_20yrs_noCKMR<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N5000_NoIndex_20yrs_noCKMR<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N5000_NoIndex_20yrs_noCKMR<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N5000_NoIndex_20yrs_noCKMR<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N5000_NoIndex_20yrs_noCKMR<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N5000_NoIndex_20yrs_noCKMR<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N5000_NoIndex_20yrs_noCKMR<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N5000_NoIndex_20yrs_noCKMR<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N5000_NoIndex_20yrs_noCKMR<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N5000_NoIndex_20yrs_noCKMR<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N5000_NoIndex_20yrs_noCKMR<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N5000_NoIndex_20yrs_noCKMR<-CV_ssb_N5000_NoIndex_20yrs_noCKMR<-array(NA, dim=c(3,100,76)) 
SD_R0_N5000_NoIndex_20yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
SD_M_N5000_NoIndex_20yrs_noCKMR<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N5000_NoIndex_20yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N5000_NoIndex_20yrs_noCKMR[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N5000_NoIndex_20yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N5000_NoIndex_20yrs_noCKMR[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

##################################
#SCAAs with CKMR data
##################################

#N100, 5yrs CKMR data, sd index 0.25
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N100_Ind25_ckmrmultinom5.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N100_Ind25_ckmrmultinom5.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N100_Ind25_ckmrmultinom5.RData"))

load(paste0(wd,"/Cod_wdat_N100_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N100_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Sardine_wdat_N100_ckmrmultinom5_1.RData"))

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N100, Index SD - 0.25, CKMR 5yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N100, Index SD - 0.25, CKMR 5yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N100, Index SD - 0.25, CKMR 5yrs", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N100_Ind25_ckmrmultinom5<-re_SSB
RE_R0_N100_Ind25_ckmrmultinom5<-re_R0
RE_M_N100_Ind25_ckmrmultinom5<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N100_Ind25_ckmrmultinom5<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N100_Ind25_ckmrmultinom5<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N100_Ind25_ckmrmultinom5<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N100_Ind25_ckmrmultinom5<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N100_Ind25_ckmrmultinom5<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N100_Ind25_ckmrmultinom5<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N100_Ind25_ckmrmultinom5<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N100_Ind25_ckmrmultinom5<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N100_Ind25_ckmrmultinom5<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N100_Ind25_ckmrmultinom5<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N100_Ind25_ckmrmultinom5<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N100_Ind25_ckmrmultinom5<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N100_Ind25_ckmrmultinom5<-CV_ssb_N100_Ind25_ckmrmultinom5<-array(NA, dim=c(3,100,76)) 
SD_R0_N100_Ind25_ckmrmultinom5<-matrix(NA, nrow=3, ncol=100)
SD_M_N100_Ind25_ckmrmultinom5<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N100_Ind25_ckmrmultinom5[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N100_Ind25_ckmrmultinom5[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N100_Ind25_ckmrmultinom5[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N100_Ind25_ckmrmultinom5[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N1000, 5yrs CKMR data, sd index 0.25
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N1000_Ind25_ckmrmultinom5.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N1000_Ind25_ckmrmultinom5.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N1000_Ind25_ckmrmultinom5.RData"))

load(paste0(wd,"/Cod_wdat_N1000_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N1000_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Sardine_wdat_N1000_ckmrmultinom5_1.RData"))

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N1000, Index SD - 0.25, CKMR 5yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N1000, Index SD - 0.25, CKMR 5yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N1000, Index SD - 0.25, CKMR 5yrs", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N1000_Ind25_ckmrmultinom5<-re_SSB
RE_R0_N1000_Ind25_ckmrmultinom5<-re_R0
RE_M_N1000_Ind25_ckmrmultinom5<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N1000_Ind25_ckmrmultinom5<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N1000_Ind25_ckmrmultinom5<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N1000_Ind25_ckmrmultinom5<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N1000_Ind25_ckmrmultinom5<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N1000_Ind25_ckmrmultinom5<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N1000_Ind25_ckmrmultinom5<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N1000_Ind25_ckmrmultinom5<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N1000_Ind25_ckmrmultinom5<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N1000_Ind25_ckmrmultinom5<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N1000_Ind25_ckmrmultinom5<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N1000_Ind25_ckmrmultinom5<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N1000_Ind25_ckmrmultinom5<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N1000_Ind25_ckmrmultinom5<-CV_ssb_N1000_Ind25_ckmrmultinom5<-array(NA, dim=c(3,100,76)) 
SD_R0_N1000_Ind25_ckmrmultinom5<-matrix(NA, nrow=3, ncol=100)
SD_M_N1000_Ind25_ckmrmultinom5<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N1000_Ind25_ckmrmultinom5[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N1000_Ind25_ckmrmultinom5[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N1000_Ind25_ckmrmultinom5[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N1000_Ind25_ckmrmultinom5[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N5000, 5yrs CKMR data, sd index 0.25
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N5000_Ind25_ckmrmultinom5.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N5000_Ind25_ckmrmultinom5.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N5000_Ind25_ckmrmultinom5.RData"))

load(paste0(wd,"/Cod_wdat_N5000_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N5000_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Sardine_wdat_N5000_ckmrmultinom5_1.RData"))

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N5000, Index SD - 0.25, CKMR 5yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N5000, Index SD - 0.25, CKMR 5yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N5000, Index SD - 0.25, CKMR 5yrs", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N5000_Ind25_ckmrmultinom5<-re_SSB
RE_R0_N5000_Ind25_ckmrmultinom5<-re_R0
RE_M_N5000_Ind25_ckmrmultinom5<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N5000_Ind25_ckmrmultinom5<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N5000_Ind25_ckmrmultinom5<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N5000_Ind25_ckmrmultinom5<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N5000_Ind25_ckmrmultinom5<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N5000_Ind25_ckmrmultinom5<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N5000_Ind25_ckmrmultinom5<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N5000_Ind25_ckmrmultinom5<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N5000_Ind25_ckmrmultinom5<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N5000_Ind25_ckmrmultinom5<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N5000_Ind25_ckmrmultinom5<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N5000_Ind25_ckmrmultinom5<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N5000_Ind25_ckmrmultinom5<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N5000_Ind25_ckmrmultinom5<-CV_ssb_N5000_Ind25_ckmrmultinom5<-array(NA, dim=c(3,100,76)) 
SD_R0_N5000_Ind25_ckmrmultinom5<-matrix(NA, nrow=3, ncol=100)
SD_M_N5000_Ind25_ckmrmultinom5<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N5000_Ind25_ckmrmultinom5[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N5000_Ind25_ckmrmultinom5[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N5000_Ind25_ckmrmultinom5[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N5000_Ind25_ckmrmultinom5[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N100, 5yrs CKMR data, sd index 0.50
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N100_Ind50_ckmrmultinom5.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N100_Ind50_ckmrmultinom5.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N100_Ind50_ckmrmultinom5.RData"))

load(paste0(wd,"/Cod_wdat_N100_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N100_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Sardine_wdat_N100_ckmrmultinom5_1.RData"))

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N100, Index SD - 0.50, CKMR 5yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N100, Index SD - 0.50, CKMR 5yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N100, Index SD - 0.50, CKMR 5yrs", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N100_Ind50_ckmrmultinom5<-re_SSB
RE_R0_N100_Ind50_ckmrmultinom5<-re_R0
RE_M_N100_Ind50_ckmrmultinom5<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N100_Ind50_ckmrmultinom5<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N100_Ind50_ckmrmultinom5<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N100_Ind50_ckmrmultinom5<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N100_Ind50_ckmrmultinom5<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N100_Ind50_ckmrmultinom5<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N100_Ind50_ckmrmultinom5<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N100_Ind50_ckmrmultinom5<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N100_Ind50_ckmrmultinom5<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N100_Ind50_ckmrmultinom5<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N100_Ind50_ckmrmultinom5<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N100_Ind50_ckmrmultinom5<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N100_Ind50_ckmrmultinom5<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N100_Ind50_ckmrmultinom5<-CV_ssb_N100_Ind50_ckmrmultinom5<-array(NA, dim=c(3,100,76)) 
SD_R0_N100_Ind50_ckmrmultinom5<-matrix(NA, nrow=3, ncol=100)
SD_M_N100_Ind50_ckmrmultinom5<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N100_Ind50_ckmrmultinom5[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N100_Ind50_ckmrmultinom5[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N100_Ind50_ckmrmultinom5[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N100_Ind50_ckmrmultinom5[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N1000, 5yrs CKMR data, sd index 0.50
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N1000_Ind50_ckmrmultinom5.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N1000_Ind50_ckmrmultinom5.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N1000_Ind50_ckmrmultinom5.RData"))

load(paste0(wd,"/Cod_wdat_N1000_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N1000_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Sardine_wdat_N1000_ckmrmultinom5_1.RData"))

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N1000, Index SD - 0.50, CKMR 5yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N1000, Index SD - 0.50, CKMR 5yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N1000, Index SD - 0.50, CKMR 5yrs", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N1000_Ind50_ckmrmultinom5<-re_SSB
RE_R0_N1000_Ind50_ckmrmultinom5<-re_R0
RE_M_N1000_Ind50_ckmrmultinom5<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N1000_Ind50_ckmrmultinom5<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N1000_Ind50_ckmrmultinom5<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N1000_Ind50_ckmrmultinom5<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N1000_Ind50_ckmrmultinom5<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N1000_Ind50_ckmrmultinom5<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N1000_Ind50_ckmrmultinom5<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N1000_Ind50_ckmrmultinom5<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N1000_Ind50_ckmrmultinom5<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N1000_Ind50_ckmrmultinom5<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N1000_Ind50_ckmrmultinom5<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N1000_Ind50_ckmrmultinom5<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N1000_Ind50_ckmrmultinom5<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N1000_Ind50_ckmrmultinom5<-CV_ssb_N1000_Ind50_ckmrmultinom5<-array(NA, dim=c(3,100,76)) 
SD_R0_N1000_Ind50_ckmrmultinom5<-matrix(NA, nrow=3, ncol=100)
SD_M_N1000_Ind50_ckmrmultinom5<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N1000_Ind50_ckmrmultinom5[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N1000_Ind50_ckmrmultinom5[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N1000_Ind50_ckmrmultinom5[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N1000_Ind50_ckmrmultinom5[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N5000, 5yrs CKMR data, sd index 0.50
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N5000_Ind50_ckmrmultinom5.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N5000_Ind50_ckmrmultinom5.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N5000_Ind50_ckmrmultinom5.RData"))

load(paste0(wd,"/Cod_wdat_N5000_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N5000_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Sardine_wdat_N5000_ckmrmultinom5_1.RData"))

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N5000, Index SD - 0.50, CKMR 5yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N5000, Index SD - 0.50, CKMR 5yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N5000, Index SD - 0.50, CKMR 5yrs", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N5000_Ind50_ckmrmultinom5<-re_SSB
RE_R0_N5000_Ind50_ckmrmultinom5<-re_R0
RE_M_N5000_Ind50_ckmrmultinom5<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N5000_Ind50_ckmrmultinom5<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N5000_Ind50_ckmrmultinom5<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N5000_Ind50_ckmrmultinom5<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N5000_Ind50_ckmrmultinom5<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N5000_Ind50_ckmrmultinom5<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N5000_Ind50_ckmrmultinom5<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N5000_Ind50_ckmrmultinom5<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N5000_Ind50_ckmrmultinom5<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N5000_Ind50_ckmrmultinom5<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N5000_Ind50_ckmrmultinom5<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N5000_Ind50_ckmrmultinom5<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N5000_Ind50_ckmrmultinom5<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N5000_Ind50_ckmrmultinom5<-CV_ssb_N5000_Ind50_ckmrmultinom5<-array(NA, dim=c(3,100,76)) 
SD_R0_N5000_Ind50_ckmrmultinom5<-matrix(NA, nrow=3, ncol=100)
SD_M_N5000_Ind50_ckmrmultinom5<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N5000_Ind50_ckmrmultinom5[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N5000_Ind50_ckmrmultinom5[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N5000_Ind50_ckmrmultinom5[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N5000_Ind50_ckmrmultinom5[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N100, 10yrs CKMR data, sd index 0.25
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N100_Ind25_ckmrmultinom10.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N100_Ind25_ckmrmultinom10.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N100_Ind25_ckmrmultinom10.RData"))

load(paste0(wd,"/Cod_wdat_N100_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N100_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Sardine_wdat_N100_ckmrmultinom10_1.RData"))

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      } 
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N100, Index SD - 0.25, CKMR 10yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N100, Index SD - 0.25, CKMR 10yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N100, Index SD - 0.25, CKMR 10yrs", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N100_Ind25_ckmrmultinom10<-re_SSB
RE_R0_N100_Ind25_ckmrmultinom10<-re_R0
RE_M_N100_Ind25_ckmrmultinom10<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N100_Ind25_ckmrmultinom10<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N100_Ind25_ckmrmultinom10<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N100_Ind25_ckmrmultinom10<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N100_Ind25_ckmrmultinom10<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N100_Ind25_ckmrmultinom10<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N100_Ind25_ckmrmultinom10<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N100_Ind25_ckmrmultinom10<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N100_Ind25_ckmrmultinom10<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N100_Ind25_ckmrmultinom10<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N100_Ind25_ckmrmultinom10<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N100_Ind25_ckmrmultinom10<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N100_Ind25_ckmrmultinom10<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N100_Ind25_ckmrmultinom10<-CV_ssb_N100_Ind25_ckmrmultinom10<-array(NA, dim=c(3,100,76)) 
SD_R0_N100_Ind25_ckmrmultinom10<-matrix(NA, nrow=3, ncol=100)
SD_M_N100_Ind25_ckmrmultinom10<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N100_Ind25_ckmrmultinom10[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N100_Ind25_ckmrmultinom10[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N100_Ind25_ckmrmultinom10[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N100_Ind25_ckmrmultinom10[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N1000, 10yrs CKMR data, sd index 0.25
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N1000_Ind25_ckmrmultinom10.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N1000_Ind25_ckmrmultinom10.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N1000_Ind25_ckmrmultinom10.RData"))

load(paste0(wd,"/Cod_wdat_N1000_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N1000_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Sardine_wdat_N1000_ckmrmultinom10_1.RData"))

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N1000, Index SD - 0.25, CKMR 10yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N1000, Index SD - 0.25, CKMR 10yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N1000, Index SD - 0.25, CKMR 10yrs", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N1000_Ind25_ckmrmultinom10<-re_SSB
RE_R0_N1000_Ind25_ckmrmultinom10<-re_R0
RE_M_N1000_Ind25_ckmrmultinom10<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N1000_Ind25_ckmrmultinom10<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N1000_Ind25_ckmrmultinom10<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N1000_Ind25_ckmrmultinom10<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N1000_Ind25_ckmrmultinom10<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N1000_Ind25_ckmrmultinom10<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N1000_Ind25_ckmrmultinom10<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N1000_Ind25_ckmrmultinom10<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N1000_Ind25_ckmrmultinom10<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N1000_Ind25_ckmrmultinom10<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N1000_Ind25_ckmrmultinom10<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N1000_Ind25_ckmrmultinom10<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N1000_Ind25_ckmrmultinom10<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N1000_Ind25_ckmrmultinom10<-CV_ssb_N1000_Ind25_ckmrmultinom10<-array(NA, dim=c(3,100,76)) 
SD_R0_N1000_Ind25_ckmrmultinom10<-matrix(NA, nrow=3, ncol=100)
SD_M_N1000_Ind25_ckmrmultinom10<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N1000_Ind25_ckmrmultinom10[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N1000_Ind25_ckmrmultinom10[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N1000_Ind25_ckmrmultinom10[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N1000_Ind25_ckmrmultinom10[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N5000, 10yrs CKMR data, sd index 0.25
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N5000_Ind25_ckmrmultinom10.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N5000_Ind25_ckmrmultinom10.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N5000_Ind25_ckmrmultinom10.RData"))

load(paste0(wd,"/Cod_wdat_N5000_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N5000_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Sardine_wdat_N5000_ckmrmultinom10_1.RData"))

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N5000, Index SD - 0.25, CKMR 10yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N5000, Index SD - 0.25, CKMR 10yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N5000, Index SD - 0.25, CKMR 10yrs", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N5000_Ind25_ckmrmultinom10<-re_SSB
RE_R0_N5000_Ind25_ckmrmultinom10<-re_R0
RE_M_N5000_Ind25_ckmrmultinom10<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N5000_Ind25_ckmrmultinom10<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N5000_Ind25_ckmrmultinom10<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N5000_Ind25_ckmrmultinom10<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N5000_Ind25_ckmrmultinom10<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N5000_Ind25_ckmrmultinom10<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N5000_Ind25_ckmrmultinom10<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N5000_Ind25_ckmrmultinom10<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N5000_Ind25_ckmrmultinom10<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N5000_Ind25_ckmrmultinom10<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N5000_Ind25_ckmrmultinom10<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N5000_Ind25_ckmrmultinom10<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N5000_Ind25_ckmrmultinom10<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N5000_Ind25_ckmrmultinom10<-CV_ssb_N5000_Ind25_ckmrmultinom10<-array(NA, dim=c(3,100,76)) 
SD_R0_N5000_Ind25_ckmrmultinom10<-matrix(NA, nrow=3, ncol=100)
SD_M_N5000_Ind25_ckmrmultinom10<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N5000_Ind25_ckmrmultinom10[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N5000_Ind25_ckmrmultinom10[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N5000_Ind25_ckmrmultinom10[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N5000_Ind25_ckmrmultinom10[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N100, 10yrs CKMR data, sd index 0.50
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N100_Ind50_ckmrmultinom10.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N100_Ind50_ckmrmultinom10.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N100_Ind50_ckmrmultinom10.RData"))

load(paste0(wd,"/Cod_wdat_N100_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N100_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Sardine_wdat_N100_ckmrmultinom10_1.RData"))

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N100, Index SD - 0.50, CKMR 10yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N100, Index SD - 0.50, CKMR 10yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N100, Index SD - 0.50, CKMR 10yrs", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N100_Ind50_ckmrmultinom10<-re_SSB
RE_R0_N100_Ind50_ckmrmultinom10<-re_R0
RE_M_N100_Ind50_ckmrmultinom10<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N100_Ind50_ckmrmultinom10<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N100_Ind50_ckmrmultinom10<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N100_Ind50_ckmrmultinom10<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N100_Ind50_ckmrmultinom10<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N100_Ind50_ckmrmultinom10<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N100_Ind50_ckmrmultinom10<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N100_Ind50_ckmrmultinom10<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N100_Ind50_ckmrmultinom10<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N100_Ind50_ckmrmultinom10<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N100_Ind50_ckmrmultinom10<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N100_Ind50_ckmrmultinom10<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N100_Ind50_ckmrmultinom10<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N100_Ind50_ckmrmultinom10<-CV_ssb_N100_Ind50_ckmrmultinom10<-array(NA, dim=c(3,100,76)) 
SD_R0_N100_Ind50_ckmrmultinom10<-matrix(NA, nrow=3, ncol=100)
SD_M_N100_Ind50_ckmrmultinom10<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N100_Ind50_ckmrmultinom10[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N100_Ind50_ckmrmultinom10[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N100_Ind50_ckmrmultinom10[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N100_Ind50_ckmrmultinom10[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N1000, 10yrs CKMR data, sd index 0.50
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N1000_Ind50_ckmrmultinom10.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N1000_Ind50_ckmrmultinom10.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N1000_Ind50_ckmrmultinom10.RData"))

load(paste0(wd,"/Cod_wdat_N1000_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N1000_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Sardine_wdat_N1000_ckmrmultinom10_1.RData"))

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N1000, Index SD - 0.50, CKMR 10yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N1000, Index SD - 0.50, CKMR 10yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N1000, Index SD - 0.50, CKMR 10yrs", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N1000_Ind50_ckmrmultinom10<-re_SSB
RE_R0_N1000_Ind50_ckmrmultinom10<-re_R0
RE_M_N1000_Ind50_ckmrmultinom10<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N1000_Ind50_ckmrmultinom10<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N1000_Ind50_ckmrmultinom10<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N1000_Ind50_ckmrmultinom10<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N1000_Ind50_ckmrmultinom10<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N1000_Ind50_ckmrmultinom10<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N1000_Ind50_ckmrmultinom10<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N1000_Ind50_ckmrmultinom10<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N1000_Ind50_ckmrmultinom10<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N1000_Ind50_ckmrmultinom10<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N1000_Ind50_ckmrmultinom10<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N1000_Ind50_ckmrmultinom10<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N1000_Ind50_ckmrmultinom10<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N1000_Ind50_ckmrmultinom10<-CV_ssb_N1000_Ind50_ckmrmultinom10<-array(NA, dim=c(3,100,76)) 
SD_R0_N1000_Ind50_ckmrmultinom10<-matrix(NA, nrow=3, ncol=100)
SD_M_N1000_Ind50_ckmrmultinom10<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N1000_Ind50_ckmrmultinom10[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N1000_Ind50_ckmrmultinom10[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N1000_Ind50_ckmrmultinom10[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N1000_Ind50_ckmrmultinom10[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N5000, 10yrs CKMR data, sd index 0.50
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N5000_Ind50_ckmrmultinom10.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N5000_Ind50_ckmrmultinom10.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N5000_Ind50_ckmrmultinom10.RData"))

load(paste0(wd,"/Cod_wdat_N5000_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N5000_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Sardine_wdat_N5000_ckmrmultinom10_1.RData"))

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N5000, Index SD - 0.50, CKMR 10yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N5000, Index SD - 0.50, CKMR 10yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N5000, Index SD - 0.50, CKMR 10yrs", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N5000_Ind50_ckmrmultinom10<-re_SSB
RE_R0_N5000_Ind50_ckmrmultinom10<-re_R0
RE_M_N5000_Ind50_ckmrmultinom10<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N5000_Ind50_ckmrmultinom10<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N5000_Ind50_ckmrmultinom10<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N5000_Ind50_ckmrmultinom10<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N5000_Ind50_ckmrmultinom10<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N5000_Ind50_ckmrmultinom10<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N5000_Ind50_ckmrmultinom10<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N5000_Ind50_ckmrmultinom10<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N5000_Ind50_ckmrmultinom10<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N5000_Ind50_ckmrmultinom10<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N5000_Ind50_ckmrmultinom10<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N5000_Ind50_ckmrmultinom10<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N5000_Ind50_ckmrmultinom10<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N5000_Ind50_ckmrmultinom10<-CV_ssb_N5000_Ind50_ckmrmultinom10<-array(NA, dim=c(3,100,76)) 
SD_R0_N5000_Ind50_ckmrmultinom10<-matrix(NA, nrow=3, ncol=100)
SD_M_N5000_Ind50_ckmrmultinom10<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N5000_Ind50_ckmrmultinom10[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N5000_Ind50_ckmrmultinom10[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N5000_Ind50_ckmrmultinom10[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N5000_Ind50_ckmrmultinom10[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#20yrs CKMR data
#N100, 20yrs CKMR data, sd index 0.25
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N100_Ind25_ckmrmultinom20.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N100_Ind25_ckmrmultinom20.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N100_Ind25_ckmrmultinom20.RData"))

load(paste0(wd,"/Cod_wdat_N100_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N100_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Sardine_wdat_N100_ckmrmultinom20_1.RData"))

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N100, Index SD - 0.25, CKMR 20yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N100, Index SD - 0.25, CKMR 20yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N100, Index SD - 0.25, CKMR 20yrs", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N100_Ind25_ckmrmultinom20<-re_SSB
RE_R0_N100_Ind25_ckmrmultinom20<-re_R0
RE_M_N100_Ind25_ckmrmultinom20<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N100_Ind25_ckmrmultinom20<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N100_Ind25_ckmrmultinom20<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N100_Ind25_ckmrmultinom20<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N100_Ind25_ckmrmultinom20<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N100_Ind25_ckmrmultinom20<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N100_Ind25_ckmrmultinom20<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N100_Ind25_ckmrmultinom20<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N100_Ind25_ckmrmultinom20<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N100_Ind25_ckmrmultinom20<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N100_Ind25_ckmrmultinom20<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N100_Ind25_ckmrmultinom20<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N100_Ind25_ckmrmultinom20<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N100_Ind25_ckmrmultinom20<-CV_ssb_N100_Ind25_ckmrmultinom20<-array(NA, dim=c(3,100,76))
SD_R0_N100_Ind25_ckmrmultinom20<-matrix(NA, nrow=3, ncol=100)
SD_M_N100_Ind25_ckmrmultinom20<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N100_Ind25_ckmrmultinom20[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N100_Ind25_ckmrmultinom20[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N100_Ind25_ckmrmultinom20[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N100_Ind25_ckmrmultinom20[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N1000, 20yrs CKMR data, sd index 0.25
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N1000_Ind25_ckmrmultinom20.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N1000_Ind25_ckmrmultinom20.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N1000_Ind25_ckmrmultinom20.RData"))

load(paste0(wd,"/Cod_wdat_N1000_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N1000_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Sardine_wdat_N1000_ckmrmultinom20_1.RData"))

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N1000, Index SD - 0.25, CKMR 20yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N1000, Index SD - 0.25, CKMR 20yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N1000, Index SD - 0.25, CKMR 20yrs", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N1000_Ind25_ckmrmultinom20<-re_SSB
RE_R0_N1000_Ind25_ckmrmultinom20<-re_R0
RE_M_N1000_Ind25_ckmrmultinom20<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N1000_Ind25_ckmrmultinom20<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N1000_Ind25_ckmrmultinom20<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N1000_Ind25_ckmrmultinom20<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N1000_Ind25_ckmrmultinom20<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N1000_Ind25_ckmrmultinom20<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N1000_Ind25_ckmrmultinom20<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N1000_Ind25_ckmrmultinom20<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N1000_Ind25_ckmrmultinom20<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N1000_Ind25_ckmrmultinom20<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N1000_Ind25_ckmrmultinom20<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N1000_Ind25_ckmrmultinom20<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N1000_Ind25_ckmrmultinom20<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N1000_Ind25_ckmrmultinom20<-CV_ssb_N1000_Ind25_ckmrmultinom20<-array(NA, dim=c(3,100,76))
SD_R0_N1000_Ind25_ckmrmultinom20<-matrix(NA, nrow=3, ncol=100)
SD_M_N1000_Ind25_ckmrmultinom20<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N1000_Ind25_ckmrmultinom20[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N1000_Ind25_ckmrmultinom20[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N1000_Ind25_ckmrmultinom20[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N1000_Ind25_ckmrmultinom20[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N5000, 20yrs CKMR data, sd index 0.25
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N5000_Ind25_ckmrmultinom20.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N5000_Ind25_ckmrmultinom20.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N5000_Ind25_ckmrmultinom20.RData"))

load(paste0(wd,"/Cod_wdat_N5000_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N5000_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Sardine_wdat_N5000_ckmrmultinom20_1.RData"))

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N5000, Index SD - 0.25, CKMR 20yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N5000, Index SD - 0.25, CKMR 20yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N5000, Index SD - 0.25, CKMR 20yrs", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N5000_Ind25_ckmrmultinom20<-re_SSB
RE_R0_N5000_Ind25_ckmrmultinom20<-re_R0
RE_M_N5000_Ind25_ckmrmultinom20<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N5000_Ind25_ckmrmultinom20<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N5000_Ind25_ckmrmultinom20<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N5000_Ind25_ckmrmultinom20<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N5000_Ind25_ckmrmultinom20<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N5000_Ind25_ckmrmultinom20<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N5000_Ind25_ckmrmultinom20<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N5000_Ind25_ckmrmultinom20<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N5000_Ind25_ckmrmultinom20<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N5000_Ind25_ckmrmultinom20<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N5000_Ind25_ckmrmultinom20<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N5000_Ind25_ckmrmultinom20<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N5000_Ind25_ckmrmultinom20<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N5000_Ind25_ckmrmultinom20<-CV_ssb_N5000_Ind25_ckmrmultinom20<-array(NA, dim=c(3,100,76))
SD_R0_N5000_Ind25_ckmrmultinom20<-matrix(NA, nrow=3, ncol=100)
SD_M_N5000_Ind25_ckmrmultinom20<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N5000_Ind25_ckmrmultinom20[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N5000_Ind25_ckmrmultinom20[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N5000_Ind25_ckmrmultinom20[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N5000_Ind25_ckmrmultinom20[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N100, 20yrs CKMR data, sd index 0.50
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N100_Ind50_ckmrmultinom20.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N100_Ind50_ckmrmultinom20.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N100_Ind50_ckmrmultinom20.RData"))

load(paste0(wd,"/Cod_wdat_N100_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N100_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Sardine_wdat_N100_ckmrmultinom20_1.RData"))

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N100, Index SD - 0.50, CKMR 20yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N100, Index SD - 0.50, CKMR 20yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N100, Index SD - 0.50, CKMR 20yrs", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N100_Ind50_ckmrmultinom20<-re_SSB
RE_R0_N100_Ind50_ckmrmultinom20<-re_R0
RE_M_N100_Ind50_ckmrmultinom20<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N100_Ind50_ckmrmultinom20<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N100_Ind50_ckmrmultinom20<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N100_Ind50_ckmrmultinom20<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N100_Ind50_ckmrmultinom20<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N100_Ind50_ckmrmultinom20<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N100_Ind50_ckmrmultinom20<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N100_Ind50_ckmrmultinom20<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N100_Ind50_ckmrmultinom20<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N100_Ind50_ckmrmultinom20<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N100_Ind50_ckmrmultinom20<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N100_Ind50_ckmrmultinom20<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N100_Ind50_ckmrmultinom20<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N100_Ind50_ckmrmultinom20<-CV_ssb_N100_Ind50_ckmrmultinom20<-array(NA, dim=c(3,100,76))
SD_R0_N100_Ind50_ckmrmultinom20<-matrix(NA, nrow=3, ncol=100)
SD_M_N100_Ind50_ckmrmultinom20<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N100_Ind50_ckmrmultinom20[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N100_Ind50_ckmrmultinom20[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N100_Ind50_ckmrmultinom20[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N100_Ind50_ckmrmultinom20[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N1000, 20yrs CKMR data, sd index 0.50
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N1000_Ind50_ckmrmultinom20.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N1000_Ind50_ckmrmultinom20.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N1000_Ind50_ckmrmultinom20.RData"))

load(paste0(wd,"/Cod_wdat_N1000_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N1000_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Sardine_wdat_N1000_ckmrmultinom20_1.RData"))

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N1000, Index SD - 0.50, CKMR 20yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N1000, Index SD - 0.50, CKMR 20yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N1000, Index SD - 0.50, CKMR 20yrs", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N1000_Ind50_ckmrmultinom20<-re_SSB
RE_R0_N1000_Ind50_ckmrmultinom20<-re_R0
RE_M_N1000_Ind50_ckmrmultinom20<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N1000_Ind50_ckmrmultinom20<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N1000_Ind50_ckmrmultinom20<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N1000_Ind50_ckmrmultinom20<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N1000_Ind50_ckmrmultinom20<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N1000_Ind50_ckmrmultinom20<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N1000_Ind50_ckmrmultinom20<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N1000_Ind50_ckmrmultinom20<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N1000_Ind50_ckmrmultinom20<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N1000_Ind50_ckmrmultinom20<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N1000_Ind50_ckmrmultinom20<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N1000_Ind50_ckmrmultinom20<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N1000_Ind50_ckmrmultinom20<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N1000_Ind50_ckmrmultinom20<-CV_ssb_N1000_Ind50_ckmrmultinom20<-array(NA, dim=c(3,100,76))
SD_R0_N1000_Ind50_ckmrmultinom20<-matrix(NA, nrow=3, ncol=100)
SD_M_N1000_Ind50_ckmrmultinom20<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N1000_Ind50_ckmrmultinom20[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N1000_Ind50_ckmrmultinom20[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N1000_Ind50_ckmrmultinom20[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N1000_Ind50_ckmrmultinom20[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N5000, 20yrs CKMR data, sd index 0.50
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N5000_Ind50_ckmrmultinom20.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N5000_Ind50_ckmrmultinom20.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N5000_Ind50_ckmrmultinom20.RData"))

load(paste0(wd,"/Cod_wdat_N5000_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N5000_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Sardine_wdat_N5000_ckmrmultinom20_1.RData"))

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N5000, Index SD - 0.50, CKMR 20yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N5000, Index SD - 0.50, CKMR 20yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N5000, Index SD - 0.50, CKMR 20yrs", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N5000_Ind50_ckmrmultinom20<-re_SSB
RE_R0_N5000_Ind50_ckmrmultinom20<-re_R0
RE_M_N5000_Ind50_ckmrmultinom20<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N5000_Ind50_ckmrmultinom20<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N5000_Ind50_ckmrmultinom20<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N5000_Ind50_ckmrmultinom20<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N5000_Ind50_ckmrmultinom20<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N5000_Ind50_ckmrmultinom20<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N5000_Ind50_ckmrmultinom20<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N5000_Ind50_ckmrmultinom20<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N5000_Ind50_ckmrmultinom20<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N5000_Ind50_ckmrmultinom20<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N5000_Ind50_ckmrmultinom20<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N5000_Ind50_ckmrmultinom20<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N5000_Ind50_ckmrmultinom20<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N5000_Ind50_ckmrmultinom20<-CV_ssb_N5000_Ind50_ckmrmultinom20<-array(NA, dim=c(3,100,76))
SD_R0_N5000_Ind50_ckmrmultinom20<-matrix(NA, nrow=3, ncol=100)
SD_M_N5000_Ind50_ckmrmultinom20<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N5000_Ind50_ckmrmultinom20[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N5000_Ind50_ckmrmultinom20[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N5000_Ind50_ckmrmultinom20[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N5000_Ind50_ckmrmultinom20[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#######################################
#Models with NO INDEX but CKMR Data
#######################################

#N100, 5yrs CKMR data, no index
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N100_NoIndex_ckmrmultinom5.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N100_NoIndex_ckmrmultinom5.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N100_NoIndex_ckmrmultinom5.RData"))

load(paste0(wd,"/Cod_wdat_N100_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N100_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Sardine_wdat_N100_ckmrmultinom5_1.RData"))

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N100, No Index, CKMR 5yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N100, No Index, CKMR 5yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N100, No Index, CKMR 5yrs", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N100_NoIndex_ckmrmultinom5<-re_SSB
RE_R0_N100_NoIndex_ckmrmultinom5<-re_R0
RE_M_N100_NoIndex_ckmrmultinom5<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N100_NoIndex_ckmrmultinom5<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N100_NoIndex_ckmrmultinom5<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N100_NoIndex_ckmrmultinom5<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N100_NoIndex_ckmrmultinom5<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N100_NoIndex_ckmrmultinom5<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N100_NoIndex_ckmrmultinom5<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N100_NoIndex_ckmrmultinom5<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N100_NoIndex_ckmrmultinom5<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N100_NoIndex_ckmrmultinom5<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N100_NoIndex_ckmrmultinom5<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N100_NoIndex_ckmrmultinom5<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N100_NoIndex_ckmrmultinom5<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N100_NoIndex_ckmrmultinom5<-CV_ssb_N100_NoIndex_ckmrmultinom5<-array(NA, dim=c(3,100,76)) 
SD_R0_N100_NoIndex_ckmrmultinom5<-matrix(NA, nrow=3, ncol=100)
SD_M_N100_NoIndex_ckmrmultinom5<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N100_NoIndex_ckmrmultinom5[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N100_NoIndex_ckmrmultinom5[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N100_NoIndex_ckmrmultinom5[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N100_NoIndex_ckmrmultinom5[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N1000, 5yrs CKMR data, No Index
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N1000_NoIndex_ckmrmultinom5.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N1000_NoIndex_ckmrmultinom5.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N1000_NoIndex_ckmrmultinom5.RData"))

load(paste0(wd,"/Cod_wdat_N1000_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N1000_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Sardine_wdat_N1000_ckmrmultinom5_1.RData"))

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N1000, No Index, CKMR 5yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N1000, No Index, CKMR 5yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N1000, No Index, CKMR 5yrs", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N1000_NoIndex_ckmrmultinom5<-re_SSB
RE_R0_N1000_NoIndex_ckmrmultinom5<-re_R0
RE_M_N1000_NoIndex_ckmrmultinom5<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N1000_NoIndex_ckmrmultinom5<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N1000_NoIndex_ckmrmultinom5<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N1000_NoIndex_ckmrmultinom5<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N1000_NoIndex_ckmrmultinom5<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N1000_NoIndex_ckmrmultinom5<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N1000_NoIndex_ckmrmultinom5<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N1000_NoIndex_ckmrmultinom5<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N1000_NoIndex_ckmrmultinom5<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N1000_NoIndex_ckmrmultinom5<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N1000_NoIndex_ckmrmultinom5<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N1000_NoIndex_ckmrmultinom5<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N1000_NoIndex_ckmrmultinom5<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N1000_NoIndex_ckmrmultinom5<-CV_ssb_N1000_NoIndex_ckmrmultinom5<-array(NA, dim=c(3,100,76)) 
SD_R0_N1000_NoIndex_ckmrmultinom5<-matrix(NA, nrow=3, ncol=100)
SD_M_N1000_NoIndex_ckmrmultinom5<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N1000_NoIndex_ckmrmultinom5[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N1000_NoIndex_ckmrmultinom5[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N1000_NoIndex_ckmrmultinom5[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N1000_NoIndex_ckmrmultinom5[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N5000, 5yrs CKMR data, No Index
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N5000_NoIndex_ckmrmultinom5.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N5000_NoIndex_ckmrmultinom5.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N5000_NoIndex_ckmrmultinom5.RData"))

load(paste0(wd,"/Cod_wdat_N5000_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N5000_ckmrmultinom5_1.RData"))
load(paste0(wd,"/Sardine_wdat_N5000_ckmrmultinom5_1.RData"))

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N5000, No Index, CKMR 5yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N5000, No Index, CKMR 5yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N5000, No Index, CKMR 5yrs", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N5000_NoIndex_ckmrmultinom5<-re_SSB
RE_R0_N5000_NoIndex_ckmrmultinom5<-re_R0
RE_M_N5000_NoIndex_ckmrmultinom5<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N5000_NoIndex_ckmrmultinom5<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N5000_NoIndex_ckmrmultinom5<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N5000_NoIndex_ckmrmultinom5<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N5000_NoIndex_ckmrmultinom5<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N5000_NoIndex_ckmrmultinom5<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N5000_NoIndex_ckmrmultinom5<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N5000_NoIndex_ckmrmultinom5<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N5000_NoIndex_ckmrmultinom5<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N5000_NoIndex_ckmrmultinom5<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N5000_NoIndex_ckmrmultinom5<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N5000_NoIndex_ckmrmultinom5<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N5000_NoIndex_ckmrmultinom5<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N5000_NoIndex_ckmrmultinom5<-CV_ssb_N5000_NoIndex_ckmrmultinom5<-array(NA, dim=c(3,100,76)) 
SD_R0_N5000_NoIndex_ckmrmultinom5<-matrix(NA, nrow=3, ncol=100)
SD_M_N5000_NoIndex_ckmrmultinom5<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N5000_NoIndex_ckmrmultinom5[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N5000_NoIndex_ckmrmultinom5[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N5000_NoIndex_ckmrmultinom5[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N5000_NoIndex_ckmrmultinom5[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N100, 10yrs CKMR data, No Index
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N100_NoIndex_ckmrmultinom10.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N100_NoIndex_ckmrmultinom10.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N100_NoIndex_ckmrmultinom10.RData"))

load(paste0(wd,"/Cod_wdat_N100_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N100_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Sardine_wdat_N100_ckmrmultinom10_1.RData"))

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N100, No Index, CKMR 10yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N100, No Index, CKMR 10yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N100, No Index, CKMR 10yrs", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N100_NoIndex_ckmrmultinom10<-re_SSB
RE_R0_N100_NoIndex_ckmrmultinom10<-re_R0
RE_M_N100_NoIndex_ckmrmultinom10<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N100_NoIndex_ckmrmultinom10<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N100_NoIndex_ckmrmultinom10<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N100_NoIndex_ckmrmultinom10<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N100_NoIndex_ckmrmultinom10<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N100_NoIndex_ckmrmultinom10<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N100_NoIndex_ckmrmultinom10<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N100_NoIndex_ckmrmultinom10<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N100_NoIndex_ckmrmultinom10<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N100_NoIndex_ckmrmultinom10<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N100_NoIndex_ckmrmultinom10<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N100_NoIndex_ckmrmultinom10<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N100_NoIndex_ckmrmultinom10<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N100_NoIndex_ckmrmultinom10<-CV_ssb_N100_NoIndex_ckmrmultinom10<-array(NA, dim=c(3,100,76)) 
SD_R0_N100_NoIndex_ckmrmultinom10<-matrix(NA, nrow=3, ncol=100)
SD_M_N100_NoIndex_ckmrmultinom10<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N100_NoIndex_ckmrmultinom10[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N100_NoIndex_ckmrmultinom10[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N100_NoIndex_ckmrmultinom10[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N100_NoIndex_ckmrmultinom10[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N1000, 10yrs CKMR data, No Index
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N1000_NoIndex_ckmrmultinom10.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N1000_NoIndex_ckmrmultinom10.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N1000_NoIndex_ckmrmultinom10.RData"))

load(paste0(wd,"/Cod_wdat_N1000_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N1000_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Sardine_wdat_N1000_ckmrmultinom10_1.RData"))

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N1000, No Index, CKMR 10yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N1000, No Index, CKMR 10yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N1000, No Index, CKMR 10yrs", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N1000_NoIndex_ckmrmultinom10<-re_SSB
RE_R0_N1000_NoIndex_ckmrmultinom10<-re_R0
RE_M_N1000_NoIndex_ckmrmultinom10<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N1000_NoIndex_ckmrmultinom10<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N1000_NoIndex_ckmrmultinom10<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N1000_NoIndex_ckmrmultinom10<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N1000_NoIndex_ckmrmultinom10<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N1000_NoIndex_ckmrmultinom10<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N1000_NoIndex_ckmrmultinom10<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N1000_NoIndex_ckmrmultinom10<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N1000_NoIndex_ckmrmultinom10<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N1000_NoIndex_ckmrmultinom10<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N1000_NoIndex_ckmrmultinom10<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N1000_NoIndex_ckmrmultinom10<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N1000_NoIndex_ckmrmultinom10<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N1000_NoIndex_ckmrmultinom10<-CV_ssb_N1000_NoIndex_ckmrmultinom10<-array(NA, dim=c(3,100,76)) 
SD_R0_N1000_NoIndex_ckmrmultinom10<-matrix(NA, nrow=3, ncol=100)
SD_M_N1000_NoIndex_ckmrmultinom10<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N1000_NoIndex_ckmrmultinom10[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N1000_NoIndex_ckmrmultinom10[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N1000_NoIndex_ckmrmultinom10[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N1000_NoIndex_ckmrmultinom10[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N5000, 10yrs CKMR data, No Index
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N5000_NoIndex_ckmrmultinom10.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N5000_NoIndex_ckmrmultinom10.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N5000_NoIndex_ckmrmultinom10.RData"))

load(paste0(wd,"/Cod_wdat_N5000_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N5000_ckmrmultinom10_1.RData"))
load(paste0(wd,"/Sardine_wdat_N5000_ckmrmultinom10_1.RData"))

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N5000, No Index, CKMR 10yrs", ylab="RE - SSB")
abline(h=0) 
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N5000, No Index, CKMR 10yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N5000, No Index, CKMR 10yrs", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N5000_NoIndex_ckmrmultinom10<-re_SSB
RE_R0_N5000_NoIndex_ckmrmultinom10<-re_R0
RE_M_N5000_NoIndex_ckmrmultinom10<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N5000_NoIndex_ckmrmultinom10<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N5000_NoIndex_ckmrmultinom10<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N5000_NoIndex_ckmrmultinom10<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N5000_NoIndex_ckmrmultinom10<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N5000_NoIndex_ckmrmultinom10<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N5000_NoIndex_ckmrmultinom10<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N5000_NoIndex_ckmrmultinom10<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N5000_NoIndex_ckmrmultinom10<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N5000_NoIndex_ckmrmultinom10<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N5000_NoIndex_ckmrmultinom10<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N5000_NoIndex_ckmrmultinom10<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N5000_NoIndex_ckmrmultinom10<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N5000_NoIndex_ckmrmultinom10<-CV_ssb_N5000_NoIndex_ckmrmultinom10<-array(NA, dim=c(3,100,76)) 
SD_R0_N5000_NoIndex_ckmrmultinom10<-matrix(NA, nrow=3, ncol=100)
SD_M_N5000_NoIndex_ckmrmultinom10<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if (!is.null(res_list[[f]][[i]])){
      if(length(res_list[[f]][[i]])>2){
        CV_ssb_N5000_NoIndex_ckmrmultinom10[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
        SD_ssb_N5000_NoIndex_ckmrmultinom10[f,i,]<-res_list[[f]][[i]]$SD$sd
        SD_R0_N5000_NoIndex_ckmrmultinom10[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
        SD_M_N5000_NoIndex_ckmrmultinom10[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
      }
    }
  }
}

#N100, 20yrs CKMR data, No Index
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N100_NoIndex_ckmrmultinom20.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N100_NoIndex_ckmrmultinom20.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N100_NoIndex_ckmrmultinom20.RData"))

load(paste0(wd,"/Cod_wdat_N100_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N100_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Sardine_wdat_N100_ckmrmultinom20_1.RData"))

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N100, No Index, CKMR 20yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N100, No Index, CKMR 20yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N100, No Index, CKMR 20yrs", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N100_NoIndex_ckmrmultinom20<-re_SSB
RE_R0_N100_NoIndex_ckmrmultinom20<-re_R0
RE_M_N100_NoIndex_ckmrmultinom20<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N100_NoIndex_ckmrmultinom20<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N100_NoIndex_ckmrmultinom20<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N100_NoIndex_ckmrmultinom20<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N100_NoIndex_ckmrmultinom20<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N100_NoIndex_ckmrmultinom20<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N100_NoIndex_ckmrmultinom20<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N100_NoIndex_ckmrmultinom20<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N100_NoIndex_ckmrmultinom20<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N100_NoIndex_ckmrmultinom20<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N100_NoIndex_ckmrmultinom20<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N100_NoIndex_ckmrmultinom20<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N100_NoIndex_ckmrmultinom20<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N100_NoIndex_ckmrmultinom20<-CV_ssb_N100_NoIndex_ckmrmultinom20<-array(NA, dim=c(3,100,76))
SD_R0_N100_NoIndex_ckmrmultinom20<-matrix(NA, nrow=3, ncol=100)
SD_M_N100_NoIndex_ckmrmultinom20<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N100_NoIndex_ckmrmultinom20[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N100_NoIndex_ckmrmultinom20[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N100_NoIndex_ckmrmultinom20[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N100_NoIndex_ckmrmultinom20[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N1000, 20yrs CKMR data, No Index
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N1000_NoIndex_ckmrmultinom20.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N1000_NoIndex_ckmrmultinom20.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N1000_NoIndex_ckmrmultinom20.RData"))

load(paste0(wd,"/Cod_wdat_N1000_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N1000_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Sardine_wdat_N1000_ckmrmultinom20_1.RData"))

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N1000, No Index, CKMR 20yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N1000, No Index, CKMR 20yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N1000, No Index, CKMR 20yrs", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N1000_NoIndex_ckmrmultinom20<-re_SSB
RE_R0_N1000_NoIndex_ckmrmultinom20<-re_R0
RE_M_N1000_NoIndex_ckmrmultinom20<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N1000_NoIndex_ckmrmultinom20<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N1000_NoIndex_ckmrmultinom20<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N1000_NoIndex_ckmrmultinom20<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N1000_NoIndex_ckmrmultinom20<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N1000_NoIndex_ckmrmultinom20<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N1000_NoIndex_ckmrmultinom20<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N1000_NoIndex_ckmrmultinom20<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N1000_NoIndex_ckmrmultinom20<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N1000_NoIndex_ckmrmultinom20<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N1000_NoIndex_ckmrmultinom20<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N1000_NoIndex_ckmrmultinom20<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N1000_NoIndex_ckmrmultinom20<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N1000_NoIndex_ckmrmultinom20<-CV_ssb_N1000_NoIndex_ckmrmultinom20<-array(NA, dim=c(3,100,76))
SD_R0_N1000_NoIndex_ckmrmultinom20<-matrix(NA, nrow=3, ncol=100)
SD_M_N1000_NoIndex_ckmrmultinom20<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N1000_NoIndex_ckmrmultinom20[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N1000_NoIndex_ckmrmultinom20[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N1000_NoIndex_ckmrmultinom20[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N1000_NoIndex_ckmrmultinom20[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}

#N5000, 20yrs CKMR data, No Index
res_list<-list()
res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N5000_NoIndex_ckmrmultinom20.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N5000_NoIndex_ckmrmultinom20.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N5000_NoIndex_ckmrmultinom20.RData"))

load(paste0(wd,"/Cod_wdat_N5000_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Flatfish_wdat_N5000_ckmrmultinom20_1.RData"))
load(paste0(wd,"/Sardine_wdat_N5000_ckmrmultinom20_1.RData"))

re_Dep<-re_SSB<-array(NA, dim=c(3,100,76))
re_R0<-re_M<-matrix(NA, nrow=100, ncol=3)
for(f in 1:3){
  for (i in 1:100){
    if(f==1){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Cod_wdat[[i]]$OM$SSB[26:101])/Cod_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)/(Cod_wdat[[i]]$OM$SSB[26:101]/Cod_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Cod_wdat[[i]]$OM$R0)/Cod_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Cod_wdat[[i]]$OM$Mref)/Cod_wdat[[i]]$OM$Mref
      }
    }else if (f==2){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Flatfish_wdat[[i]]$OM$SSB[26:101])/Flatfish_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)/(Flatfish_wdat[[i]]$OM$SSB[26:101]/Flatfish_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Flatfish_wdat[[i]]$OM$R0)/Flatfish_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Flatfish_wdat[[i]]$OM$Mref)/Flatfish_wdat[[i]]$OM$Mref
      }
    } else if (f==3){
      if(length(res_list[[f]][[i]])>2){
        re_SSB[f,i,]<-(res_list[[f]][[i]]$SD$value-Sardine_wdat[[i]]$OM$SSB[26:101])/Sardine_wdat[[i]]$OM$SSB[26:101]
        #re_Dep[f,i,]<-(summary(res_list[[f]][[i]]$SD)[which(rownames(summary(res_list[[f]][[i]]$SD)) %in% "Depletion"),3]-Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)/(Sardine_wdat[[i]]$OM$SSB[26:101]/Sardine_wdat[[i]]$OM$SSB0)
        re_R0[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_R0"])-Sardine_wdat[[i]]$OM$R0)/Sardine_wdat[[i]]$OM$R0
        re_M[i,f]<-(exp(res_list[[f]][[i]]$SD$par.fixed["log_M"])-Sardine_wdat[[i]]$OM$Mref)/Sardine_wdat[[i]]$OM$Mref
      }
    }
  }
}

#SSB
par(mfrow=c(3,3))
boxplot(re_SSB[1,,], ylim=c(-0.25,0.25), las=1, main="Cod - N5000, No Index, CKMR 20yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[2,,], ylim=c(-0.25,0.25), las=1, main="Flatfish - N5000, No Index, CKMR 20yrs", ylab="RE - SSB")
abline(h=0)
boxplot(re_SSB[3,,], ylim=c(-0.25,0.25), las=1, main="Sardine - N5000, No Index, CKMR 20yrs", ylab="RE - SSB")
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

#Relative error for point estimates
RE_ssb_N5000_NoIndex_ckmrmultinom20<-re_SSB
RE_R0_N5000_NoIndex_ckmrmultinom20<-re_R0
RE_M_N5000_NoIndex_ckmrmultinom20<-re_M

#Interquartile Range of relative errors
IQR_RE_ssb_N5000_NoIndex_ckmrmultinom20<-apply(re_SSB,c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(re_SSB,c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_RE_R0_N5000_NoIndex_ckmrmultinom20<-apply(re_R0,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_R0,2,quantile,probs=0.25, na.rm=TRUE)
IQR_RE_M_N5000_NoIndex_ckmrmultinom20<-apply(re_M,2,quantile,probs=0.75, na.rm=TRUE)-apply(re_M,2,quantile,probs=0.25, na.rm=TRUE)

#Interquartile Range of absolute relative errors
IQR_ARE_ssb_N5000_NoIndex_ckmrmultinom20<-apply(abs(re_SSB),c(1,3),quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_SSB),c(1,3),quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_R0_N5000_NoIndex_ckmrmultinom20<-apply(abs(re_R0),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_R0),2,quantile,probs=0.25, na.rm=TRUE)
IQR_ARE_M_N5000_NoIndex_ckmrmultinom20<-apply(abs(re_M),2,quantile,probs=0.75, na.rm=TRUE)-apply(abs(re_M),2,quantile,probs=0.25, na.rm=TRUE)

#SD of relative error for point estimates
sd_RE_ssb_N5000_NoIndex_ckmrmultinom20<-apply(re_SSB,c(1,3),sd, na.rm=TRUE)
sd_RE_R0_N5000_NoIndex_ckmrmultinom20<-apply(re_R0,2,sd, na.rm=TRUE)
sd_RE_M_N5000_NoIndex_ckmrmultinom20<-apply(re_M,2,sd, na.rm=TRUE)

#SD of absolute relative error
sd_ARE_ssb_N5000_NoIndex_ckmrmultinom20<-apply(abs(re_SSB),c(1,3),sd, na.rm=TRUE)
sd_ARE_R0_N5000_NoIndex_ckmrmultinom20<-apply(abs(re_R0),2,sd, na.rm=TRUE)
sd_ARE_M_N5000_NoIndex_ckmrmultinom20<-apply(abs(re_M),2,sd, na.rm=TRUE)

#Precision within sims
SD_ssb_N5000_NoIndex_ckmrmultinom20<-CV_ssb_N5000_NoIndex_ckmrmultinom20<-array(NA, dim=c(3,100,76))
SD_R0_N5000_NoIndex_ckmrmultinom20<-matrix(NA, nrow=3, ncol=100)
SD_M_N5000_NoIndex_ckmrmultinom20<-matrix(NA, nrow=3, ncol=100)
for(f in 1:3){
  for (i in 1:100){
    if(length(res_list[[f]][[i]])>2){
      CV_ssb_N5000_NoIndex_ckmrmultinom20[f,i,]<-res_list[[f]][[i]]$SD$sd/res_list[[f]][[i]]$SD$value
      SD_ssb_N5000_NoIndex_ckmrmultinom20[f,i,]<-res_list[[f]][[i]]$SD$sd
      SD_R0_N5000_NoIndex_ckmrmultinom20[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_R0","log_R0"])
      SD_M_N5000_NoIndex_ckmrmultinom20[f,i]<-sqrt(res_list[[f]][[i]]$SD$cov.fixed["log_M","log_M"])
    }
  }
}





