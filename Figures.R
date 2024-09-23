#####################################################
#Plot combining no ageing error with ageing error
#####################################################
#SD index = 0.5
#SE of SSB within Sims
#####################################################

#Placeholder until results come out
SD_ssb_N5000_Ind50_ckmrmultinom20<-SD_ssb_N5000_Ind50_ckmrmultinom20_woAE
SD_ssb_N5000_Ind25_ckmrmultinom20<-SD_ssb_N5000_Ind25_ckmrmultinom20_woAE
SD_ssb_N5000_NoIndex_ckmrmultinom20<-SD_ssb_N5000_NoIndex_ckmrmultinom20_woAE

SD_M_N5000_Ind50_ckmrmultinom20<-SD_M_N5000_Ind50_ckmrmultinom20_woAE
SD_M_N5000_Ind25_ckmrmultinom20<-SD_M_N5000_Ind25_ckmrmultinom20_woAE
SD_M_N5000_NoIndex_ckmrmultinom20<-SD_M_N5000_NoIndex_ckmrmultinom20_woAE

SD_R0_N5000_Ind50_ckmrmultinom20<-SD_R0_N5000_Ind50_ckmrmultinom20_woAE
SD_R0_N5000_Ind25_ckmrmultinom20<-SD_R0_N5000_Ind25_ckmrmultinom20_woAE
SD_R0_N5000_NoIndex_ckmrmultinom20<-SD_R0_N5000_NoIndex_ckmrmultinom20_woAE

RE_ssb_N5000_Ind50_ckmrmultinom20<-RE_ssb_N5000_Ind50_ckmrmultinom20_woAE
RE_ssb_N5000_Ind25_ckmrmultinom20<-RE_ssb_N5000_Ind25_ckmrmultinom20_woAE
RE_ssb_N5000_NoIndex_ckmrmultinom20<-RE_ssb_N5000_NoIndex_ckmrmultinom20_woAE

RE_M_N5000_Ind50_ckmrmultinom20<-RE_M_N5000_Ind50_ckmrmultinom20_woAE
RE_M_N5000_Ind25_ckmrmultinom20<-RE_M_N5000_Ind25_ckmrmultinom20_woAE
RE_M_N5000_NoIndex_ckmrmultinom20<-RE_M_N5000_NoIndex_ckmrmultinom20_woAE

RE_R0_N5000_Ind50_ckmrmultinom20<-RE_R0_N5000_Ind50_ckmrmultinom20_woAE
RE_R0_N5000_Ind25_ckmrmultinom20<-RE_R0_N5000_Ind25_ckmrmultinom20_woAE
RE_R0_N5000_NoIndex_ckmrmultinom20<-RE_R0_N5000_NoIndex_ckmrmultinom20_woAE

IQR_RE_ssb_N5000_Ind50_ckmrmultinom20<-IQR_RE_ssb_N5000_Ind50_ckmrmultinom20_woAE
IQR_RE_ssb_N5000_Ind25_ckmrmultinom20<-IQR_RE_ssb_N5000_Ind25_ckmrmultinom20_woAE
IQR_RE_ssb_N5000_NoIndex_ckmrmultinom20<-IQR_RE_ssb_N5000_NoIndex_ckmrmultinom20_woAE

IQR_RE_M_N5000_Ind50_ckmrmultinom20<-IQR_RE_M_N5000_Ind50_ckmrmultinom20_woAE
IQR_RE_M_N5000_Ind25_ckmrmultinom20<-IQR_RE_M_N5000_Ind25_ckmrmultinom20_woAE
IQR_RE_M_N5000_NoIndex_ckmrmultinom20<-IQR_RE_M_N5000_NoIndex_ckmrmultinom20_woAE

IQR_RE_R0_N5000_Ind50_ckmrmultinom20<-IQR_RE_R0_N5000_Ind50_ckmrmultinom20_woAE
IQR_RE_R0_N5000_Ind25_ckmrmultinom20<-IQR_RE_R0_N5000_Ind25_ckmrmultinom20_woAE
IQR_RE_R0_N5000_NoIndex_ckmrmultinom20<-IQR_RE_R0_N5000_NoIndex_ckmrmultinom20_woAE

#Pairs plot
#tiff(filename="C:/Users/fischn/Documents/GitHub/CKMR_Project/Pairs_precision_050.tiff", height=23, width=18, units='cm', compression="lzw", res=500)
par(mfcol=c(3,1), mar=c(3,3,1,1), oma=c(3.5,3.5,0.5,0.5))
#Cod
plot(rowSums(Pairs_Cod_5000_20),apply(1-(SD_ssb_N5000_Ind50_ckmrmultinom20[1,,]/SD_ssb_N5000_Ind50_20yrs_noCKMR[1,,])[,67:76],1,mean) , col=3,xlab="Pairs", ylab="",xlim=c(0,100),yaxt="n", ylim=c(-0.2,1), pch=16, las=1, main="Cod", cex.axis=1.25)
axis(side=2, at=seq(-0.2,1,0.2), labels=seq(-20,100,20), las=1, cex.axis=1.25)
legend("top",c("5yrs","10yrs","20yrs"), col=c(1:3),pch=c(16), bty="n", cex=1.5)
points(rowSums(Pairs_Cod_5000_10),apply(1-(SD_ssb_N5000_Ind50_ckmrmultinom10[1,,]/SD_ssb_N5000_Ind50_10yrs_noCKMR[1,,])[,67:76],1,mean), pch=16, col=2)
points(rowSums(Pairs_Cod_5000_5),apply(1-(SD_ssb_N5000_Ind50_ckmrmultinom5[1,,]/SD_ssb_N5000_Ind50_5yrs_noCKMR[1,,])[,67:76],1,mean), col=1, pch=16)

points(rowSums(Pairs_Cod_1000_20),apply(1-(SD_ssb_N1000_Ind50_ckmrmultinom20[1,,]/SD_ssb_N1000_Ind50_20yrs_noCKMR[1,,])[,67:76],1,mean), pch=16, col=3)
points(rowSums(Pairs_Cod_1000_10),apply(1-(SD_ssb_N1000_Ind50_ckmrmultinom10[1,,]/SD_ssb_N1000_Ind50_10yrs_noCKMR[1,,])[,67:76],1,mean), pch=16, col=2)
points(rowSums(Pairs_Cod_1000_5),apply(1-(SD_ssb_N1000_Ind50_ckmrmultinom5[1,,]/SD_ssb_N1000_Ind50_5yrs_noCKMR[1,,])[,67:76],1,mean), col=1, pch=16)

points(rowSums(Pairs_Cod_100_20),apply(1-(SD_ssb_N100_Ind50_ckmrmultinom20[1,,]/SD_ssb_N100_Ind50_20yrs_noCKMR[1,,])[,67:76],1,mean), pch=16, col=3)
points(rowSums(Pairs_Cod_100_10),apply(1-(SD_ssb_N100_Ind50_ckmrmultinom10[1,,]/SD_ssb_N100_Ind50_10yrs_noCKMR[1,,])[,67:76],1,mean), pch=16, col=2)
points(rowSums(Pairs_Cod_100_5),apply(1-(SD_ssb_N100_Ind50_ckmrmultinom5[1,,]/SD_ssb_N100_Ind50_5yrs_noCKMR[1,,])[,67:76],1,mean), col=1, pch=16)
#Flatfish
plot(rowSums(Pairs_Flatfish_5000_20),apply(1-(SD_ssb_N5000_Ind50_ckmrmultinom20[2,,]/SD_ssb_N5000_Ind50_20yrs_noCKMR[2,,])[,67:76],1,mean) , col=3, xlab="Pairs", ylab="Improvement in SSBy last 10 years",yaxt="n",xlim=c(0,500000), ylim=c(-0.2,1), pch=16, las=1, main="Flatfish", cex.axis=1.25)
axis(side=2, at=seq(-0.2,1,0.2), labels=seq(-20,100,20), las=1, cex.axis=1.25)
mtext("% Improvement in SSB Precision (Final 10 years of time series)", side=2, line=4)
points(rowSums(Pairs_Flatfish_5000_10),apply(1-(SD_ssb_N5000_Ind50_ckmrmultinom10[2,,]/SD_ssb_N5000_Ind50_10yrs_noCKMR[2,,])[,67:76],1,mean), pch=16, col=2)
points(rowSums(Pairs_Flatfish_5000_5),apply(1-(SD_ssb_N5000_Ind50_ckmrmultinom5[2,,]/SD_ssb_N5000_Ind50_5yrs_noCKMR[2,,])[,67:76],1,mean), col=1, pch=16)

points(rowSums(Pairs_Flatfish_1000_20),apply(1-(SD_ssb_N1000_Ind50_ckmrmultinom20[2,,]/SD_ssb_N1000_Ind50_20yrs_noCKMR[2,,])[,67:76],1,mean), pch=16, col=3)
points(rowSums(Pairs_Flatfish_1000_10),apply(1-(SD_ssb_N1000_Ind50_ckmrmultinom10[2,,]/SD_ssb_N1000_Ind50_10yrs_noCKMR[2,,])[,67:76],1,mean), pch=16, col=2)
points(rowSums(Pairs_Flatfish_1000_5),apply(1-(SD_ssb_N1000_Ind50_ckmrmultinom5[2,,]/SD_ssb_N1000_Ind50_5yrs_noCKMR[2,,])[,67:76],1,mean), col=1, pch=16)

points(rowSums(Pairs_Flatfish_100_20),apply(1-(SD_ssb_N100_Ind50_ckmrmultinom20[2,,]/SD_ssb_N100_Ind50_20yrs_noCKMR[2,,])[,67:76],1,mean), pch=16, col=3)
points(rowSums(Pairs_Flatfish_100_10),apply(1-(SD_ssb_N100_Ind50_ckmrmultinom10[2,,]/SD_ssb_N100_Ind50_10yrs_noCKMR[2,,])[,67:76],1,mean), pch=16, col=2)
points(rowSums(Pairs_Flatfish_100_5),apply(1-(SD_ssb_N100_Ind50_ckmrmultinom5[2,,]/SD_ssb_N100_Ind50_5yrs_noCKMR[2,,])[,67:76],1,mean), col=1, pch=16)

#inset
par(fig = c(0.65,0.995,0.37,0.6), new = T)  
plot(rowSums(Pairs_Flatfish_5000_20),apply(1-(SD_ssb_N5000_Ind50_ckmrmultinom20[2,,]/SD_ssb_N5000_Ind50_20yrs_noCKMR[2,,])[,67:76],1,mean) , col=3, xlim=c(0,100), ylim=c(-0.2,1), pch=16, las=1, main="",yaxt="n", ylab="", cex.axis=1.25)
axis(side=2, at=seq(-0.2,1,0.2), labels=seq(-20,100,20), las=1, cex.axis=1.25)
points(rowSums(Pairs_Flatfish_5000_10),apply(1-(SD_ssb_N5000_Ind50_ckmrmultinom10[2,,]/SD_ssb_N5000_Ind50_10yrs_noCKMR[2,,])[,67:76],1,mean), pch=16, col=2)
points(rowSums(Pairs_Flatfish_5000_5),apply(1-(SD_ssb_N5000_Ind50_ckmrmultinom5[2,,]/SD_ssb_N5000_Ind50_5yrs_noCKMR[2,,])[,67:76],1,mean), col=1, pch=16)

points(rowSums(Pairs_Flatfish_1000_20),apply(1-(SD_ssb_N1000_Ind50_ckmrmultinom20[2,,]/SD_ssb_N1000_Ind50_20yrs_noCKMR[2,,])[,67:76],1,mean), pch=16, col=3)
points(rowSums(Pairs_Flatfish_1000_10),apply(1-(SD_ssb_N1000_Ind50_ckmrmultinom10[2,,]/SD_ssb_N1000_Ind50_10yrs_noCKMR[2,,])[,67:76],1,mean), pch=16, col=2)
points(rowSums(Pairs_Flatfish_1000_5),apply(1-(SD_ssb_N1000_Ind50_ckmrmultinom5[2,,]/SD_ssb_N1000_Ind50_5yrs_noCKMR[2,,])[,67:76],1,mean), col=1, pch=16)

points(rowSums(Pairs_Flatfish_100_20),apply(1-(SD_ssb_N100_Ind50_ckmrmultinom20[2,,]/SD_ssb_N100_Ind50_20yrs_noCKMR[2,,])[,67:76],1,mean), pch=16, col=3)
points(rowSums(Pairs_Flatfish_100_10),apply(1-(SD_ssb_N100_Ind50_ckmrmultinom10[2,,]/SD_ssb_N100_Ind50_10yrs_noCKMR[2,,])[,67:76],1,mean), pch=16, col=2)
points(rowSums(Pairs_Flatfish_100_5),apply(1-(SD_ssb_N100_Ind50_ckmrmultinom5[2,,]/SD_ssb_N100_Ind50_5yrs_noCKMR[2,,])[,67:76],1,mean), col=1, pch=16)

#Sardine
par(mfcol=c(3,1), mar=c(3,3,1,1), oma=c(4,4,1,1))
par(new=T)
par(new=T)
plot(rowSums(Pairs_Sardine_5000_20),apply(1-(SD_ssb_N5000_Ind50_ckmrmultinom20[3,,]/SD_ssb_N5000_Ind50_20yrs_noCKMR[3,,])[,67:76],1,mean) ,col=3, xlab="Pairs", ylab="Improvement in SSBy last 10 years",yaxt="n",xlim=c(0,5700), ylim=c(-0.2,1), pch=16, las=1, main="Sardine", cex.axis=1.25)
axis(side=2, at=seq(-0.2,1,0.2), labels=seq(-20,100,20), las=1, cex.axis=1.25)
points(rowSums(Pairs_Sardine_5000_10),apply(1-(SD_ssb_N5000_Ind50_ckmrmultinom10[3,,]/SD_ssb_N5000_Ind50_10yrs_noCKMR[3,,])[,67:76],1,mean), pch=16, col=2)
points(rowSums(Pairs_Sardine_5000_5),apply(1-(SD_ssb_N5000_Ind50_ckmrmultinom5[3,,]/SD_ssb_N5000_Ind50_5yrs_noCKMR[3,,])[,67:76],1,mean), col=1, pch=16)
mtext(text="Pairs Found (POP + HSP + GGP)", side=1, line=4)
points(rowSums(Pairs_Sardine_1000_20),apply(1-(SD_ssb_N1000_Ind50_ckmrmultinom20[3,,]/SD_ssb_N1000_Ind50_20yrs_noCKMR[3,,])[,67:76],1,mean), pch=16, col=3)
points(rowSums(Pairs_Sardine_1000_10),apply(1-(SD_ssb_N1000_Ind50_ckmrmultinom10[3,,]/SD_ssb_N1000_Ind50_10yrs_noCKMR[3,,])[,67:76],1,mean), pch=16, col=2)
points(rowSums(Pairs_Sardine_1000_5),apply(1-(SD_ssb_N1000_Ind50_ckmrmultinom5[3,,]/SD_ssb_N1000_Ind50_5yrs_noCKMR[3,,])[,67:76],1,mean), col=1, pch=16)

points(rowSums(Pairs_Sardine_100_20),apply(1-(SD_ssb_N100_Ind50_ckmrmultinom20[3,,]/SD_ssb_N100_Ind50_20yrs_noCKMR[3,,])[,67:76],1,mean), pch=16, col=3)
points(rowSums(Pairs_Sardine_100_10),apply(1-(SD_ssb_N100_Ind50_ckmrmultinom10[3,,]/SD_ssb_N100_Ind50_10yrs_noCKMR[3,,])[,67:76],1,mean), pch=16, col=2)
points(rowSums(Pairs_Sardine_100_5),apply(1-(SD_ssb_N100_Ind50_ckmrmultinom5[3,,]/SD_ssb_N100_Ind50_5yrs_noCKMR[3,,])[,67:76],1,mean), col=1, pch=16)

#inset
par(fig = c(0.65,0.995,0.032,0.27), new = T)  
plot(rowSums(Pairs_Sardine_5000_20),apply(1-(SD_ssb_N5000_Ind50_ckmrmultinom20[3,,]/SD_ssb_N5000_Ind50_20yrs_noCKMR[3,,])[,67:76],1,mean), col=3, xlim=c(0,100), ylim=c(-0.2,1),yaxt="n", pch=16, las=1, main="", ylab="", cex.axis=1.25)
axis(side=2, at=seq(-0.2,1,0.2), labels=seq(-20,100,20), las=1, cex.axis=1.25)
points(rowSums(Pairs_Sardine_5000_10),apply(1-(SD_ssb_N5000_Ind50_ckmrmultinom10[3,,]/SD_ssb_N5000_Ind50_10yrs_noCKMR[3,,])[,67:76],1,mean), pch=16, col=2)
points(rowSums(Pairs_Sardine_5000_5),apply(1-(SD_ssb_N5000_Ind50_ckmrmultinom5[3,,]/SD_ssb_N5000_Ind50_5yrs_noCKMR[3,,])[,67:76],1,mean), col=1, pch=16)

points(rowSums(Pairs_Sardine_1000_20),apply(1-(SD_ssb_N1000_Ind50_ckmrmultinom20[3,,]/SD_ssb_N1000_Ind50_20yrs_noCKMR[3,,])[,67:76],1,mean), pch=16, col=3)
points(rowSums(Pairs_Sardine_1000_10),apply(1-(SD_ssb_N1000_Ind50_ckmrmultinom10[3,,]/SD_ssb_N1000_Ind50_10yrs_noCKMR[3,,])[,67:76],1,mean), pch=16, col=2)
points(rowSums(Pairs_Sardine_1000_5),apply(1-(SD_ssb_N1000_Ind50_ckmrmultinom5[3,,]/SD_ssb_N1000_Ind50_5yrs_noCKMR[3,,])[,67:76],1,mean), col=1, pch=16)

points(rowSums(Pairs_Sardine_100_20),apply(1-(SD_ssb_N100_Ind50_ckmrmultinom20[3,,]/SD_ssb_N100_Ind50_20yrs_noCKMR[3,,])[,67:76],1,mean), pch=16, col=3)
points(rowSums(Pairs_Sardine_100_10),apply(1-(SD_ssb_N100_Ind50_ckmrmultinom10[3,,]/SD_ssb_N100_Ind50_10yrs_noCKMR[3,,])[,67:76],1,mean), pch=16, col=2)
points(rowSums(Pairs_Sardine_100_5),apply(1-(SD_ssb_N100_Ind50_ckmrmultinom5[3,,]/SD_ssb_N100_Ind50_5yrs_noCKMR[3,,])[,67:76],1,mean), col=1, pch=16)
#dev.off()


#########################
#Precision within sims
#########################

#tiff(filename="C:/Users/fischn/Documents/GitHub/CKMR_Project/SE_SSB_050.tiff", height=25, width=35, units='cm', compression="lzw", res=500)
par(mfrow=c(3,3), mar=c(1,1,1.25,0.5), oma=c(3.5,4.5,1.5,1))
#Cod
#100
plot(1:76,1-apply(SD_ssb_N100_Ind50_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N100_Ind50_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,], pch=16,col=1, las=1, ylim=c(-0.1,1), ylab="", xlab="",yaxt="n", main="100 CKMR Samples",xaxt="n", xlim=c(0,250),bty="[", cex.axis=1.3, cex.main=1.5)
axis(side=2, at=seq(0,1,0.2), labels=seq(0,100,20), las=1, cex.axis=1.3)
lines(67:76,rep(mean((c(1-apply(SD_ssb_N100_Ind50_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N100_Ind50_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,])[67:76])),10), lwd=4, col=4)
points(86:161,(1-apply(SD_ssb_N100_Ind50_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N100_Ind50_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,]), pch=16 , col=2)
lines(152:161,rep(mean((c(1-apply(SD_ssb_N100_Ind50_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N100_Ind50_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,])[67:76])),10), lwd=4, col=4)
points(171:246,(1-apply(SD_ssb_N100_Ind50_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N100_Ind50_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,]), pch=16 , col=3)
lines(237:246,rep(mean((c(1-apply(SD_ssb_N100_Ind50_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N100_Ind50_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,])[67:76])),10), lwd=4, col=4)
abline(h=0, lty=2)

#1000
plot(1:76,1-apply(SD_ssb_N1000_Ind50_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N1000_Ind50_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,], pch=16, col=1,las=1, ylim=c(-0.1,1), ylab="", xlab="", main="1,000 CKMR Samples",xaxt="n",  xlim=c(0,250),yaxt="n",bty="n", cex.main=1.5)
mtext(side=3, text="Cod", line=-2, font=2, cex=1.35)
axis(side=1,lwd.ticks = 0, labels=FALSE)
axis(side=3,lwd.ticks = 0, labels=FALSE)
legend(x=60,y=0.8,c("5yrs","10yrs","20yrs","Mean of last 10 years"), lty=c(NA,NA,NA,1), lwd=c(NA,NA,NA,4),col=c(1:4),pch=c(16,16,16,NA), bty="n", cex=1.5)
mtext(text="  SD of Abundance Index = 0.5", side=3, line=-13)
lines(67:76,rep(mean((c(1-apply(SD_ssb_N1000_Ind50_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N1000_Ind50_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,])[67:76])),10), lwd=4, col=4)
points(86:161,(1-apply(SD_ssb_N1000_Ind50_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N1000_Ind50_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,]), pch=16 , col=2)
lines(152:161,rep(mean((c(1-apply(SD_ssb_N1000_Ind50_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N1000_Ind50_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,])[67:76])),10), lwd=4, col=4)
points(171:246,(1-apply(SD_ssb_N1000_Ind50_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N1000_Ind50_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,]), pch=16 , col=3)
lines(237:246,rep(mean((c(1-apply(SD_ssb_N1000_Ind50_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N1000_Ind50_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,])[67:76])),10), lwd=4, col=4)
abline(h=0, lty=2)

#5000
plot(1:76,1-apply(SD_ssb_N5000_Ind50_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N5000_Ind50_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,], pch=16, col=1,las=1, ylim=c(-0.1,1), ylab="", xlab="", main="5,000 CKMR Samples",xaxt="n",  xlim=c(0,250),yaxt="n",bty="]", cex.main=1.5)
lines(67:76,rep(mean((c(1-apply(SD_ssb_N5000_Ind50_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N5000_Ind50_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,])[67:76])),10), lwd=4, col=4)
points(86:161,(1-apply(SD_ssb_N5000_Ind50_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N5000_Ind50_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,]), pch=16 , col=2)
lines(152:161,rep(mean((c(1-apply(SD_ssb_N5000_Ind50_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N5000_Ind50_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,])[67:76])),10), lwd=4, col=4)
points(171:246,(1-apply(SD_ssb_N5000_Ind50_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N5000_Ind50_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,]), pch=16 , col=3)
lines(237:246,rep(mean((c(1-apply(SD_ssb_N5000_Ind50_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N5000_Ind50_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,])[67:76])),10), lwd=4, col=4)
abline(h=0, lty=2)

#Flatfish
#100
plot(1:76,1-apply(SD_ssb_N100_Ind50_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N100_Ind50_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,], pch=16, las=1, col=1,ylim=c(-0.1,1),yaxt="n", ylab="", xlab="", main="",xaxt="n", xlim=c(0,250),bty="[", cex.axis=1.3, cex.main=1.2)
axis(side=2, at=seq(0,1,0.2), labels=seq(0,100,20), las=1, cex.axis=1.3)
lines(67:76,rep(mean((c(1-apply(SD_ssb_N100_Ind50_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N100_Ind50_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,])[67:76])),10), lwd=4, col=4)
points(86:161,(1-apply(SD_ssb_N100_Ind50_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N100_Ind50_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,]), pch=16 , col=2)
lines(152:161,rep(mean((c(1-apply(SD_ssb_N100_Ind50_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N100_Ind50_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,])[67:76])),10), lwd=4, col=4)
points(171:246,(1-apply(SD_ssb_N100_Ind50_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N100_Ind50_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,]), pch=16 , col=3)
lines(237:246,rep(mean((c(1-apply(SD_ssb_N100_Ind50_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N100_Ind50_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,])[67:76])),10), lwd=4, col=4)
mtext(side=2, text="% Improvement = 100(1 - SSB SE with CKMR/SSB SE No CKMR)", line=3.5, cex=1.1)
abline(h=0, lty=2)

#1000
plot(1:76,1-apply(SD_ssb_N1000_Ind50_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N1000_Ind50_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,], pch=16, col=1,las=1, ylim=c(-0.1,1), ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="n")
mtext(side=3, text="Flatfish", line=-2, font=2, cex=1.35)
axis(side=1,lwd.ticks = 0, labels=FALSE)
axis(side=3,lwd.ticks = 0, labels=FALSE)
lines(67:76,rep(mean((c(1-apply(SD_ssb_N1000_Ind50_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N1000_Ind50_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,])[67:76])),10), lwd=4, col=4)
points(86:161,(1-apply(SD_ssb_N1000_Ind50_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N1000_Ind50_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,]), pch=16 , col=2)
lines(152:161,rep(mean((c(1-apply(SD_ssb_N1000_Ind50_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N1000_Ind50_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,])[67:76])),10), lwd=4, col=4)
points(171:246,(1-apply(SD_ssb_N1000_Ind50_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N1000_Ind50_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,]), pch=16 , col=3)
lines(237:246,rep(mean((c(1-apply(SD_ssb_N1000_Ind50_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N1000_Ind50_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,])[67:76])),10), lwd=4, col=4)
abline(h=0, lty=2)

#5000
plot(1:76,1-apply(SD_ssb_N5000_Ind50_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N5000_Ind50_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,], pch=16, col=1,las=1, ylim=c(-0.1,1), ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="]")
lines(67:76,rep(mean((c(1-apply(SD_ssb_N5000_Ind50_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N5000_Ind50_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,])[67:76])),10), lwd=4, col=4)
points(86:161,(1-apply(SD_ssb_N5000_Ind50_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N5000_Ind50_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,]), pch=16 , col=2)
lines(152:161,rep(mean((c(1-apply(SD_ssb_N5000_Ind50_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N5000_Ind50_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,])[67:76])),10), lwd=4, col=4)
points(171:246,(1-apply(SD_ssb_N5000_Ind50_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N5000_Ind50_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,]), pch=16 , col=3)
lines(237:246,rep(mean((c(1-apply(SD_ssb_N5000_Ind50_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N5000_Ind50_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,])[67:76])),10), lwd=4, col=4)
abline(h=0, lty=2)

#Sardine
#100
plot(1:76,1-apply(SD_ssb_N100_Ind50_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N100_Ind50_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,], pch=16, las=1,col=1, ylim=c(-0.1,1), ylab="",yaxt="n", xlab="", main="",xaxt="n", xlim=c(0,250), bty="[", cex.axis=1.3, cex.main=1.2)
axis(side=2, at=seq(0,1,0.2), labels=seq(0,100,20), las=1, cex.axis=1.3)
abline(h=0, lty=2)
axis(side=1, at=c(40,127,211), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.3)
lines(67:76,rep(mean((c(1-apply(SD_ssb_N100_Ind50_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N100_Ind50_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,])[67:76])),10), lwd=4, col=4)
points(86:161,(1-apply(SD_ssb_N100_Ind50_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N100_Ind50_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,]), pch=16 , col=2)
lines(152:161,rep(mean((c(1-apply(SD_ssb_N100_Ind50_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N100_Ind50_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,])[67:76])),10), lwd=4, col=4)
points(171:246,(1-apply(SD_ssb_N100_Ind50_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N100_Ind50_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,]), pch=16 , col=3)
lines(237:246,rep(mean((c(1-apply(SD_ssb_N100_Ind50_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N100_Ind50_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,])[67:76])),10), lwd=4, col=4)
abline(h=0, lty=2)

#1000
plot(1:76,1-apply(SD_ssb_N1000_Ind50_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N1000_Ind50_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,], pch=16, col=1,las=1, ylim=c(-0.1,1), cex.axis=1.3, ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="n")
axis(side=1, at=c(40,127,211), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.3)
mtext(side=3, text="Sardine", line=-2, font=2, cex=1.35)
mtext(side=1, text="Number of Years of CKMR Collection", line=3.25, cex=1.2)
axis(side=1,lwd.ticks = 0, labels=FALSE)
axis(side=3,lwd.ticks = 0, labels=FALSE)
lines(67:76,rep(mean((c(1-apply(SD_ssb_N1000_Ind50_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N1000_Ind50_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,])[67:76])),10), lwd=4, col=4)
points(86:161,(1-apply(SD_ssb_N1000_Ind50_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N1000_Ind50_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,]), pch=16 , col=2)
lines(152:161,rep(mean((c(1-apply(SD_ssb_N1000_Ind50_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N1000_Ind50_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,])[67:76])),10), lwd=4, col=4)
points(171:246,(1-apply(SD_ssb_N1000_Ind50_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N1000_Ind50_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,]), pch=16 , col=3)
lines(237:246,rep(mean((c(1-apply(SD_ssb_N1000_Ind50_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N1000_Ind50_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,])[67:76])),10), lwd=4, col=4)
abline(h=0, lty=2)

#5000
plot(1:76,1-apply(SD_ssb_N5000_Ind50_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N5000_Ind50_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,], pch=16, col=1,las=1, ylim=c(-0.1,1), cex.axis=1.3, ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="]")
axis(side=1, at=c(40,127,211), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.3)
lines(67:76,rep(mean((c(1-apply(SD_ssb_N5000_Ind50_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N5000_Ind50_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,])[67:76])),10), lwd=4, col=4)
points(86:161,(1-apply(SD_ssb_N5000_Ind50_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N5000_Ind50_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,]), pch=16 , col=2)
lines(152:161,rep(mean((c(1-apply(SD_ssb_N5000_Ind50_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N5000_Ind50_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,])[67:76])),10), lwd=4, col=4)
points(171:246,(1-apply(SD_ssb_N5000_Ind50_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N5000_Ind50_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,]), pch=16 , col=3)
lines(237:246,rep(mean((c(1-apply(SD_ssb_N5000_Ind50_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N5000_Ind50_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,])[67:76])),10), lwd=4, col=4)
abline(h=0, lty=2)
#dev.off()


############
#M & R0
############
#tiff(filename="C:/Users/fischn/Documents/GitHub/CKMR_Project/SE_M_R0_050.tiff", height=30, width=20, units='cm', compression="lzw", res=500)
par(mfcol=c(3,1), mar=c(2.25,1,0.25,0.5), oma=c(4,4,1.5,1))
#Index 0.5###################
#Median SEs of M and R0
#Cod
plot(0.75,1-apply(SD_M_N100_Ind50_ckmrmultinom5,1,median,na.rm=TRUE)[1]/apply(SD_M_N100_Ind50_5yrs_noCKMR,1,median,na.rm=TRUE)[1], ylim=c(-0.1,0.8), las=1, ylab="", yaxt="n", xaxt="n", pch=16, main="", xlab="",xlim=c(0.65,3.35),cex=1.25, col=4, cex.axis=1.35)
axis(side=2, at=seq(0,0.8,0.2), labels=seq(0,80,20), las=1, cex.axis=1.35)
mtext(side=3, text="Cod", line=-2, font=2, cex=1.35)
legend(x=1.65,0.6, y=, c("Natural Mortality", "Unfished Recruitment"), pch=16, col=c(4,2), bty="n", cex=1.35)
mtext(text="  SD of Abundance Index = 0.5", side=3, line=-12)
abline(h=0, lty=2)
points(1,1-apply(SD_M_N100_Ind50_ckmrmultinom10,1,median,na.rm=TRUE)[1]/apply(SD_M_N100_Ind50_10yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
points(1.25,1-apply(SD_M_N100_Ind50_ckmrmultinom20,1,median,na.rm=TRUE)[1]/apply(SD_M_N100_Ind50_20yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
points(1.75,1-apply(SD_M_N1000_Ind50_ckmrmultinom5,1,median,na.rm=TRUE)[1]/apply(SD_M_N1000_Ind50_5yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, cex=1.25, col=4)
points(2,1-apply(SD_M_N1000_Ind50_ckmrmultinom10,1,median,na.rm=TRUE)[1]/apply(SD_M_N1000_Ind50_10yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
points(2.25,1-apply(SD_M_N1000_Ind50_ckmrmultinom20,1,median,na.rm=TRUE)[1]/apply(SD_M_N1000_Ind50_20yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
points(2.75,1-apply(SD_M_N5000_Ind50_ckmrmultinom5,1,median,na.rm=TRUE)[1]/apply(SD_M_N5000_Ind50_5yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, cex=1.25,col=4)
points(3,1-apply(SD_M_N5000_Ind50_ckmrmultinom10,1,median,na.rm=TRUE)[1]/apply(SD_M_N5000_Ind50_10yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
points(3.25,1-apply(SD_M_N5000_Ind50_ckmrmultinom20,1,median,na.rm=TRUE)[1]/apply(SD_M_N5000_Ind50_20yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
mtext(side=3, at=1, line=0, text="100 CKMR Samples")
mtext(side=3, line=0, text="1,000 CKMR Samples")
mtext(side=3, at=3, line=0, text="5,000 CKMR Samples")
#R0
points(0.8,1-apply(SD_R0_N100_Ind50_ckmrmultinom5,1,median,na.rm=TRUE)[1]/apply(SD_R0_N100_Ind50_5yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, cex=1.25, col=2)
points(1.05,1-apply(SD_R0_N100_Ind50_ckmrmultinom10,1,median,na.rm=TRUE)[1]/apply(SD_R0_N100_Ind50_10yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(1.3,1-apply(SD_R0_N100_Ind50_ckmrmultinom20,1,median,na.rm=TRUE)[1]/apply(SD_R0_N100_Ind50_20yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(1.8,1-apply(SD_R0_N1000_Ind50_ckmrmultinom5,1,median,na.rm=TRUE)[1]/apply(SD_R0_N1000_Ind50_5yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, cex=1.25,col=2)
points(2.05,1-apply(SD_R0_N1000_Ind50_ckmrmultinom10,1,median,na.rm=TRUE)[1]/apply(SD_R0_N1000_Ind50_10yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(2.3,1-apply(SD_R0_N1000_Ind50_ckmrmultinom20,1,median,na.rm=TRUE)[1]/apply(SD_R0_N1000_Ind50_20yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(2.8,1-apply(SD_R0_N5000_Ind50_ckmrmultinom5,1,median,na.rm=TRUE)[1]/apply(SD_R0_N5000_Ind50_5yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(3.05,1-apply(SD_R0_N5000_Ind50_ckmrmultinom10,1,median,na.rm=TRUE)[1]/apply(SD_R0_N5000_Ind50_10yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(3.3,1-apply(SD_R0_N5000_Ind50_ckmrmultinom20,1,median,na.rm=TRUE)[1]/apply(SD_R0_N5000_Ind50_20yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)

#Flatfish
plot(0.75,1-apply(SD_M_N100_Ind50_ckmrmultinom5,1,median,na.rm=TRUE)[2]/apply(SD_M_N100_Ind50_5yrs_noCKMR,1,median,na.rm=TRUE)[2], ylim=c(-0.1,0.8), col=4,las=1, ylab="",yaxt="n", xaxt="n", pch=16, main="", xlab="",xlim=c(0.65,3.35),cex=1.25, cex.axis=1.35)
axis(side=2, at=seq(0,0.8,0.2), labels=seq(0,80,20), las=1, cex.axis=1.35)
mtext(side=2, text="% Improvement = 100(1 - SE with CKMR/SE No CKMR)", line=3.5)
mtext(side=3, text="Flatfish", line=-2, font=2, cex=1.35)
abline(h=0, lty=2)
points(1,1-apply(SD_M_N100_Ind50_ckmrmultinom10,1,median,na.rm=TRUE)[2]/apply(SD_M_N100_Ind50_10yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
points(1.25,1-apply(SD_M_N100_Ind50_ckmrmultinom20,1,median,na.rm=TRUE)[2]/apply(SD_M_N100_Ind50_20yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
points(1.75,1-apply(SD_M_N1000_Ind50_ckmrmultinom5,1,median,na.rm=TRUE)[2]/apply(SD_M_N1000_Ind50_5yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, cex=1.25, col=4)
points(2,1-apply(SD_M_N1000_Ind50_ckmrmultinom10,1,median,na.rm=TRUE)[2]/apply(SD_M_N1000_Ind50_10yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
points(2.25,1-apply(SD_M_N1000_Ind50_ckmrmultinom20,1,median,na.rm=TRUE)[2]/apply(SD_M_N1000_Ind50_20yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
points(2.75,1-apply(SD_M_N5000_Ind50_ckmrmultinom5,1,median,na.rm=TRUE)[2]/apply(SD_M_N5000_Ind50_5yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, cex=1.25,col=4)
points(3,1-apply(SD_M_N5000_Ind50_ckmrmultinom10,1,median,na.rm=TRUE)[2]/apply(SD_M_N5000_Ind50_10yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
points(3.25,1-apply(SD_M_N5000_Ind50_ckmrmultinom20,1,median,na.rm=TRUE)[2]/apply(SD_M_N5000_Ind50_20yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
#R0
points(0.8,1-apply(SD_R0_N100_Ind50_ckmrmultinom5,1,median,na.rm=TRUE)[2]/apply(SD_R0_N100_Ind50_5yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, cex=1.25, col=2)
points(1.05,1-apply(SD_R0_N100_Ind50_ckmrmultinom10,1,median,na.rm=TRUE)[2]/apply(SD_R0_N100_Ind50_10yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(1.3,1-apply(SD_R0_N100_Ind50_ckmrmultinom20,1,median,na.rm=TRUE)[2]/apply(SD_R0_N100_Ind50_20yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(1.8,1-apply(SD_R0_N1000_Ind50_ckmrmultinom5,1,median,na.rm=TRUE)[2]/apply(SD_R0_N1000_Ind50_5yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, cex=1.25,col=2)
points(2.05,1-apply(SD_R0_N1000_Ind50_ckmrmultinom10,1,median,na.rm=TRUE)[2]/apply(SD_R0_N1000_Ind50_10yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(2.3,1-apply(SD_R0_N1000_Ind50_ckmrmultinom20,1,median,na.rm=TRUE)[2]/apply(SD_R0_N1000_Ind50_20yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(2.8,1-apply(SD_R0_N5000_Ind50_ckmrmultinom5,1,median,na.rm=TRUE)[2]/apply(SD_R0_N5000_Ind50_5yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(3.05,1-apply(SD_R0_N5000_Ind50_ckmrmultinom10,1,median,na.rm=TRUE)[2]/apply(SD_R0_N5000_Ind50_10yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(3.3,1-apply(SD_R0_N5000_Ind50_ckmrmultinom20,1,median,na.rm=TRUE)[2]/apply(SD_R0_N5000_Ind50_20yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)

#Sardine
plot(0.75,1-apply(SD_M_N100_Ind50_ckmrmultinom5,1,median,na.rm=TRUE)[3]/apply(SD_M_N100_Ind50_5yrs_noCKMR,1,median,na.rm=TRUE)[3], ylim=c(-0.1,0.8), col=4, las=1, ylab="",yaxt="n", xaxt="n", pch=16, main="", xlab="",xlim=c(0.65,3.35),cex=1.25, cex.axis=1.35)
axis(side=2, at=seq(0,0.8,0.2), labels=seq(0,80,20), las=1, cex.axis=1.35)
axis(side=1, at=c(0.775,1.025,1.275), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.35)
axis(side=1, at=c(1.775,2.025,2.275), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.35)
axis(side=1, at=c(2.775,3.025,3.275), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.35)
mtext(side=3, text="Sardine", line=-2, font=2, cex=1.35)
abline(h=0, lty=2)
points(1,1-apply(SD_M_N100_Ind50_ckmrmultinom10,1,median,na.rm=TRUE)[3]/apply(SD_M_N100_Ind50_10yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
points(1.25,1-apply(SD_M_N100_Ind50_ckmrmultinom20,1,median,na.rm=TRUE)[3]/apply(SD_M_N100_Ind50_20yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
points(1.75,1-apply(SD_M_N1000_Ind50_ckmrmultinom5,1,median,na.rm=TRUE)[3]/apply(SD_M_N1000_Ind50_5yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, cex=1.25, col=4)
points(2.,1-apply(SD_M_N1000_Ind50_ckmrmultinom10,1,median,na.rm=TRUE)[3]/apply(SD_M_N1000_Ind50_10yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
points(2.25,1-apply(SD_M_N1000_Ind50_ckmrmultinom20,1,median,na.rm=TRUE)[3]/apply(SD_M_N1000_Ind50_20yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
points(2.75,1-apply(SD_M_N5000_Ind50_ckmrmultinom5,1,median,na.rm=TRUE)[3]/apply(SD_M_N5000_Ind50_5yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, cex=1.25,col=4)
points(3.,1-apply(SD_M_N5000_Ind50_ckmrmultinom10,1,median,na.rm=TRUE)[3]/apply(SD_M_N5000_Ind50_10yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
points(3.25,1-apply(SD_M_N5000_Ind50_ckmrmultinom20,1,median,na.rm=TRUE)[3]/apply(SD_M_N5000_Ind50_20yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
#R0
points(0.8,1-apply(SD_R0_N100_Ind50_ckmrmultinom5,1,median,na.rm=TRUE)[3]/apply(SD_R0_N100_Ind50_5yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, cex=1.25, col=2)
points(1.05,1-apply(SD_R0_N100_Ind50_ckmrmultinom10,1,median,na.rm=TRUE)[3]/apply(SD_R0_N100_Ind50_10yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
points(1.3,1-apply(SD_R0_N100_Ind50_ckmrmultinom20,1,median,na.rm=TRUE)[3]/apply(SD_R0_N100_Ind50_20yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
points(1.8,1-apply(SD_R0_N1000_Ind50_ckmrmultinom5,1,median,na.rm=TRUE)[3]/apply(SD_R0_N1000_Ind50_5yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, cex=1.25,col=2)
points(2.05,1-apply(SD_R0_N1000_Ind50_ckmrmultinom10,1,median,na.rm=TRUE)[3]/apply(SD_R0_N1000_Ind50_10yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
points(2.3,1-apply(SD_R0_N1000_Ind50_ckmrmultinom20,1,median,na.rm=TRUE)[3]/apply(SD_R0_N1000_Ind50_20yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
points(2.8,1-apply(SD_R0_N5000_Ind50_ckmrmultinom5,1,median,na.rm=TRUE)[3]/apply(SD_R0_N5000_Ind50_5yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
points(3.05,1-apply(SD_R0_N5000_Ind50_ckmrmultinom10,1,median,na.rm=TRUE)[3]/apply(SD_R0_N5000_Ind50_10yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
mtext(side=1, text="Number of Years of CKMR Collection", line=3.5, cex=1.2)
points(3.3,1-apply(SD_R0_N5000_Ind50_ckmrmultinom20,1,median,na.rm=TRUE)[3]/apply(SD_R0_N5000_Ind50_20yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
#dev.off()


#####################
#Median ARE SSB
#####################
#tiff(filename="C:/Users/fischn/Documents/GitHub/CKMR_Project/ARE_SSB_050.tiff", height=25, width=35, units='cm', compression="lzw", res=500)
par(mfrow=c(3,3), mar=c(1,1,1.25,0.5), oma=c(3.5,4.5,1.5,1))
#Cod
#100
plot(1:76,1-apply(abs(RE_ssb_N100_Ind50_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N100_Ind50_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,],yaxt="n", pch=16,col=2, las=1, ylim=c(-0.25,1), ylab="", xlab="", main="100 CKMR Samples",xaxt="n", xlim=c(0,250),bty="[", cex.axis=1.3, cex.main=1.5)
axis(side=2, at=seq(-0.2,1,0.2), labels=seq(-20,100,20), las=1, cex.axis=1.3)
lines(67:76,rep(mean(c(1-apply(abs(RE_ssb_N100_Ind50_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N100_Ind50_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,])[67:76]),10), lwd=4, col=4)
points(86:161,1-apply(abs(RE_ssb_N100_Ind50_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N100_Ind50_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,], pch=16, col=2)
lines(152:161,rep(mean(c(1-apply(abs(RE_ssb_N100_Ind50_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N100_Ind50_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,])[67:76]),10), lwd=4, col=4)
points(171:246,1-apply(abs(RE_ssb_N100_Ind50_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N100_Ind50_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,], pch=16, col=2)
lines(237:246,rep(mean(c(1-apply(abs(RE_ssb_N100_Ind50_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N100_Ind50_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,])[67:76]),10), lwd=4, col=4)
abline(h=0, lty=2)

#1000
plot(1:76,1-apply(abs(RE_ssb_N1000_Ind50_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N1000_Ind50_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,], pch=16, col=2,las=1, ylim=c(-0.25,1), ylab="", xlab="", main="1,000 CKMR Samples",xaxt="n",  xlim=c(0,250),yaxt="n",bty="n", cex.main=1.5)
lines(67:76,rep(mean(c(1-apply(abs(RE_ssb_N1000_Ind50_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N1000_Ind50_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,])[67:76]),10), lwd=4, col=4)
points(86:161,1-apply(abs(RE_ssb_N1000_Ind50_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N1000_Ind50_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,], pch=16, col=2)
lines(152:161,rep(mean(c(1-apply(abs(RE_ssb_N1000_Ind50_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N1000_Ind50_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,])[67:76]),10), lwd=4, col=4)
points(171:246,1-apply(abs(RE_ssb_N1000_Ind50_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N1000_Ind50_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,], pch=16, col=2)
lines(237:246,rep(mean(c(1-apply(abs(RE_ssb_N1000_Ind50_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N1000_Ind50_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,])[67:76]),10), lwd=4, col=4)
mtext(side=3, text="Cod", line=-2, font=2, cex=1.35)
axis(side=1,lwd.ticks = 0, labels=FALSE)
axis(side=3,lwd.ticks = 0, labels=FALSE)
legend(x=60,y=0.7,c("Mean of last 10 years"), lty=c(1), lwd=c(4),col=c(4), bty="n", cex=1.5)
mtext(text="        SD of Abundance Index = 0.5", side=3, line=-10)
abline(h=0, lty=2)

#5000
plot(1:76,1-apply(abs(RE_ssb_N5000_Ind50_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N5000_Ind50_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,], pch=16, col=2,las=1, ylim=c(-0.25,1), ylab="", xlab="", main="5,000 CKMR Samples",xaxt="n",  xlim=c(0,250),yaxt="n",bty="]", cex.main=1.5)
lines(67:76,rep(mean(c(1-apply(abs(RE_ssb_N5000_Ind50_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N5000_Ind50_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,])[67:76]),10), lwd=4, col=4)
points(86:161,1-apply(abs(RE_ssb_N5000_Ind50_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N5000_Ind50_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,], pch=16, col=2)
lines(152:161,rep(mean(c(1-apply(abs(RE_ssb_N5000_Ind50_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N5000_Ind50_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,])[67:76]),10), lwd=4, col=4)
points(171:246,1-apply(abs(RE_ssb_N5000_Ind50_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N5000_Ind50_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,], pch=16, col=2)
lines(237:246,rep(mean(c(1-apply(abs(RE_ssb_N5000_Ind50_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N5000_Ind50_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,])[67:76]),10), lwd=4, col=4)
abline(h=0, lty=2)

#Flatfish
#100
plot(1:76,1-apply(abs(RE_ssb_N100_Ind50_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N100_Ind50_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,],yaxt="n", pch=16, las=1, col=2,ylim=c(-0.25,1), ylab="", xlab="", main="",xaxt="n", xlim=c(0,250),bty="[", cex.axis=1.3, cex.main=1.2)
axis(side=2, at=seq(-0.2,1,0.2), labels=seq(-20,100,20), las=1, cex.axis=1.3)
lines(67:76,rep(mean(c(1-apply(abs(RE_ssb_N100_Ind50_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N100_Ind50_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,])[67:76]),10), lwd=4, col=4)
points(86:161,1-apply(abs(RE_ssb_N100_Ind50_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N100_Ind50_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,], pch=16, col=2)
lines(152:161,rep(mean(c(1-apply(abs(RE_ssb_N100_Ind50_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N100_Ind50_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,])[67:76]),10), lwd=4, col=4)
points(171:246,1-apply(abs(RE_ssb_N100_Ind50_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N100_Ind50_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,], pch=16, col=2)
lines(237:246,rep(mean(c(1-apply(abs(RE_ssb_N100_Ind50_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N100_Ind50_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,])[67:76]),10), lwd=4, col=4)
mtext(side=2, text="% Improvement = 100(1 - MARE with CKMR/MARE No CKMR)", line=3.5, cex=1.1)
abline(h=0, lty=2)

#1000
plot(1:76,1-apply(abs(RE_ssb_N1000_Ind50_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N1000_Ind50_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,], pch=16, col=2,las=1, ylim=c(-0.25,1), ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="n")
lines(67:76,rep(mean(c(1-apply(abs(RE_ssb_N1000_Ind50_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N1000_Ind50_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,])[67:76]),10), lwd=4, col=4)
points(86:161,1-apply(abs(RE_ssb_N1000_Ind50_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N1000_Ind50_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,], pch=16, col=2)
lines(152:161,rep(mean(c(1-apply(abs(RE_ssb_N1000_Ind50_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N1000_Ind50_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,])[67:76]),10), lwd=4, col=4)
points(171:246,1-apply(abs(RE_ssb_N1000_Ind50_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N1000_Ind50_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,], pch=16, col=2)
lines(237:246,rep(mean(c(1-apply(abs(RE_ssb_N1000_Ind50_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N1000_Ind50_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,])[67:76]),10), lwd=4, col=4)
mtext(side=3, text="Flatfish", line=-2, font=2, cex=1.35)
axis(side=1,lwd.ticks = 0, labels=FALSE)
axis(side=3,lwd.ticks = 0, labels=FALSE)
abline(h=0, lty=2)

#5000
plot(1:76,1-apply(abs(RE_ssb_N5000_Ind50_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N5000_Ind50_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,], pch=16, col=2,las=1, ylim=c(-0.25,1), ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="]")
lines(67:76,rep(mean(c(1-apply(abs(RE_ssb_N5000_Ind50_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N5000_Ind50_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,])[67:76]),10), lwd=4, col=4)
points(86:161,1-apply(abs(RE_ssb_N5000_Ind50_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N5000_Ind50_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,], pch=16, col=2)
lines(152:161,rep(mean(c(1-apply(abs(RE_ssb_N5000_Ind50_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N5000_Ind50_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,])[67:76]),10), lwd=4, col=4)
points(171:246,1-apply(abs(RE_ssb_N5000_Ind50_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N5000_Ind50_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,], pch=16, col=2)
lines(237:246,rep(mean(c(1-apply(abs(RE_ssb_N5000_Ind50_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N5000_Ind50_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,])[67:76]),10), lwd=4, col=4)
abline(h=0, lty=2)

#Sardine
#100
plot(1:76,1-apply(abs(RE_ssb_N100_Ind50_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N100_Ind50_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,],yaxt="n", pch=16, las=1,col=2, ylim=c(-0.25,1), ylab="", xlab="", main="",xaxt="n", xlim=c(0,250), bty="[", cex.axis=1.3, cex.main=1.2)
axis(side=2, at=seq(-0.2,1,0.2), labels=seq(-20,100,20), las=1, cex.axis=1.3)
lines(67:76,rep(mean(c(1-apply(abs(RE_ssb_N100_Ind50_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N100_Ind50_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,])[67:76]),10), lwd=4, col=4)
points(86:161,1-apply(abs(RE_ssb_N100_Ind50_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N100_Ind50_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,], pch=16, col=2)
lines(152:161,rep(mean(c(1-apply(abs(RE_ssb_N100_Ind50_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N100_Ind50_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,])[67:76]),10), lwd=4, col=4)
points(171:246,1-apply(abs(RE_ssb_N100_Ind50_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N100_Ind50_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,], pch=16, col=2)
lines(237:246,rep(mean(c(1-apply(abs(RE_ssb_N100_Ind50_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N100_Ind50_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,])[67:76]),10), lwd=4, col=4)
axis(side=1, at=c(40,127,211), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.3)
abline(h=0, lty=2)

#1000
plot(1:76,1-apply(abs(RE_ssb_N1000_Ind50_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N1000_Ind50_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,], pch=16, col=2,las=1, ylim=c(-0.25,1), cex.axis=1.3, ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="n")
lines(67:76,rep(mean(c(1-apply(abs(RE_ssb_N1000_Ind50_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N1000_Ind50_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,])[67:76]),10), lwd=4, col=4)
points(86:161,1-apply(abs(RE_ssb_N1000_Ind50_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N1000_Ind50_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,], pch=16, col=2)
lines(152:161,rep(mean(c(1-apply(abs(RE_ssb_N1000_Ind50_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N1000_Ind50_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,])[67:76]),10), lwd=4, col=4)
points(171:246,1-apply(abs(RE_ssb_N1000_Ind50_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N1000_Ind50_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,], pch=16, col=2)
lines(237:246,rep(mean(c(1-apply(abs(RE_ssb_N1000_Ind50_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N1000_Ind50_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,])[67:76]),10), lwd=4, col=4)
axis(side=1, at=c(40,127,211), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.3)
mtext(side=3, text="Sardine", line=-2, font=2, cex=1.35)
mtext(side=1, text="Number of Years of CKMR Collection", line=3.25, cex=1.2)
axis(side=1,lwd.ticks = 0, labels=FALSE)
axis(side=3,lwd.ticks = 0, labels=FALSE)
abline(h=0, lty=2)

#5000
plot(1:76,1-apply(abs(RE_ssb_N5000_Ind50_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N5000_Ind50_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,], pch=16, col=2,las=1, ylim=c(-0.25,1), cex.axis=1.3, ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="]")
lines(67:76,rep(mean(c(1-apply(abs(RE_ssb_N5000_Ind50_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N5000_Ind50_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,])[67:76]),10), lwd=4, col=4)
points(86:161,1-apply(abs(RE_ssb_N5000_Ind50_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N5000_Ind50_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,], pch=16, col=2)
lines(152:161,rep(mean(c(1-apply(abs(RE_ssb_N5000_Ind50_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N5000_Ind50_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,])[67:76]),10), lwd=4, col=4)
points(171:246,1-apply(abs(RE_ssb_N5000_Ind50_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N5000_Ind50_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,], pch=16, col=2)
lines(237:246,rep(mean(c(1-apply(abs(RE_ssb_N5000_Ind50_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N5000_Ind50_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,])[67:76]),10), lwd=4, col=4)
axis(side=1, at=c(40,127,211), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.3)
abline(h=0, lty=2)
#dev.off()


############
#M & R0
############
#tiff(filename="C:/Users/fischn/Documents/GitHub/CKMR_Project/ARE_M_R0_050.tiff", height=30, width=20, units='cm', compression="lzw", res=500)
par(mfcol=c(3,1), mar=c(2.25,1,0.25,0.5), oma=c(4,4,1.5,1))
#Index 0.5###################
#Median SEs of M and R0
#Cod
plot(0.75,1-apply(abs(RE_M_N100_Ind50_ckmrmultinom5),2,median,na.rm=TRUE)[1]/apply(abs(RE_M_N100_Ind50_5yrs_noCKMR),2,median,na.rm=TRUE)[1],  yaxt="n",ylim=c(-0.2,0.8),yaxt="n", las=1, ylab="", xaxt="n", pch=16, main="", xlab="",xlim=c(0.65,3.35),cex=1.25, col=4, cex.axis=1.35)
axis(side=2, at=seq(-0.2,0.8,0.2), labels=seq(-20,80,20), las=1, cex.axis=1.35)
mtext(side=3, text="Cod", line=-2, font=2, cex=1.35)
legend(x=1.65,0.6, y=, c("Natural Mortality", "Unfished Recruitment"), pch=16, col=c(4,2), bty="n", cex=1.35)
mtext(text="  SD of Abundance Index = 0.5", side=3, line=-12)
abline(h=0, lty=2)
points(1,1-apply(abs(RE_M_N100_Ind50_ckmrmultinom10),2,median,na.rm=TRUE)[1]/apply(abs(RE_M_N100_Ind50_10yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
points(1.25,1-apply(abs(RE_M_N100_Ind50_ckmrmultinom20),2,median,na.rm=TRUE)[1]/apply(abs(RE_M_N100_Ind50_20yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
points(1.75,1-apply(abs(RE_M_N1000_Ind50_ckmrmultinom5),2,median,na.rm=TRUE)[1]/apply(abs(RE_M_N1000_Ind50_5yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, cex=1.25, col=4)
points(2,1-apply(abs(RE_M_N1000_Ind50_ckmrmultinom10),2,median,na.rm=TRUE)[1]/apply(abs(RE_M_N1000_Ind50_10yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
points(2.25,1-apply(abs(RE_M_N1000_Ind50_ckmrmultinom20),2,median,na.rm=TRUE)[1]/apply(abs(RE_M_N1000_Ind50_20yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
points(2.75,1-apply(abs(RE_M_N5000_Ind50_ckmrmultinom5),2,median,na.rm=TRUE)[1]/apply(abs(RE_M_N5000_Ind50_5yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, cex=1.25,col=4)
points(3,1-apply(abs(RE_M_N5000_Ind50_ckmrmultinom10),2,median,na.rm=TRUE)[1]/apply(abs(RE_M_N5000_Ind50_10yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
points(3.25,1-apply(abs(RE_M_N5000_Ind50_ckmrmultinom20),2,median,na.rm=TRUE)[1]/apply(abs(RE_M_N5000_Ind50_20yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
mtext(side=3, at=1, line=0, text="100 CKMR Samples")
mtext(side=3, line=0, text="1,000 CKMR Samples")
mtext(side=3, at=3, line=0, text="5,000 CKMR Samples")
#R0
points(0.8,1-apply(abs(RE_R0_N100_Ind50_ckmrmultinom5),2,median,na.rm=TRUE)[1]/apply(abs(RE_R0_N100_Ind50_5yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, cex=1.25, col=2)
points(1.05,1-apply(abs(RE_R0_N100_Ind50_ckmrmultinom10),2,median,na.rm=TRUE)[1]/apply(abs(RE_R0_N100_Ind50_10yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(1.3,1-apply(abs(RE_R0_N100_Ind50_ckmrmultinom20),2,median,na.rm=TRUE)[1]/apply(abs(RE_R0_N100_Ind50_20yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(1.8,1-apply(abs(RE_R0_N1000_Ind50_ckmrmultinom5),2,median,na.rm=TRUE)[1]/apply(abs(RE_R0_N1000_Ind50_5yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, cex=1.25,col=2)
points(2.05,1-apply(abs(RE_R0_N1000_Ind50_ckmrmultinom10),2,median,na.rm=TRUE)[1]/apply(abs(RE_R0_N1000_Ind50_10yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(2.3,1-apply(abs(RE_R0_N1000_Ind50_ckmrmultinom20),2,median,na.rm=TRUE)[1]/apply(abs(RE_R0_N1000_Ind50_20yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(2.8,1-apply(abs(RE_R0_N5000_Ind50_ckmrmultinom5),2,median,na.rm=TRUE)[1]/apply(abs(RE_R0_N5000_Ind50_5yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(3.05,1-apply(abs(RE_R0_N5000_Ind50_ckmrmultinom10),2,median,na.rm=TRUE)[1]/apply(abs(RE_R0_N5000_Ind50_10yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(3.3,1-apply(abs(RE_R0_N5000_Ind50_ckmrmultinom20),2,median,na.rm=TRUE)[1]/apply(abs(RE_R0_N5000_Ind50_20yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)

#Flatfish
plot(0.75,1-apply(abs(RE_M_N100_Ind50_ckmrmultinom5),2,median,na.rm=TRUE)[2]/apply(abs(RE_M_N100_Ind50_5yrs_noCKMR),2,median,na.rm=TRUE)[2],  yaxt="n",ylim=c(-0.2,0.8),yaxt="n", col=4,las=1, ylab="", xaxt="n", pch=16, main="", xlab="",xlim=c(0.65,3.35),cex=1.25, cex.axis=1.35)
axis(side=2, at=seq(-0.2,0.8,0.2), labels=seq(-20,80,20), las=1, cex.axis=1.35)
mtext(side=2, text="% Improvement = 100(1 - MARE with CKMR/MARE No CKMR)", line=3.5)
mtext(side=3, text="Flatfish", line=-2, font=2, cex=1.35)
abline(h=0, lty=2)
points(1,1-apply(abs(RE_M_N100_Ind50_ckmrmultinom10),2,median,na.rm=TRUE)[2]/apply(abs(RE_M_N100_Ind50_10yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
points(1.25,1-apply(abs(RE_M_N100_Ind50_ckmrmultinom20),2,median,na.rm=TRUE)[2]/apply(abs(RE_M_N100_Ind50_20yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
points(1.75,1-apply(abs(RE_M_N1000_Ind50_ckmrmultinom5),2,median,na.rm=TRUE)[2]/apply(abs(RE_M_N1000_Ind50_5yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, cex=1.25, col=4)
points(2,1-apply(abs(RE_M_N1000_Ind50_ckmrmultinom10),2,median,na.rm=TRUE)[2]/apply(abs(RE_M_N1000_Ind50_10yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
points(2.25,1-apply(abs(RE_M_N1000_Ind50_ckmrmultinom20),2,median,na.rm=TRUE)[2]/apply(abs(RE_M_N1000_Ind50_20yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
points(2.75,1-apply(abs(RE_M_N5000_Ind50_ckmrmultinom5),2,median,na.rm=TRUE)[2]/apply(abs(RE_M_N5000_Ind50_5yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, cex=1.25,col=4)
points(3,1-apply(abs(RE_M_N5000_Ind50_ckmrmultinom10),2,median,na.rm=TRUE)[2]/apply(abs(RE_M_N5000_Ind50_10yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
points(3.25,1-apply(abs(RE_M_N5000_Ind50_ckmrmultinom20),2,median,na.rm=TRUE)[2]/apply(abs(RE_M_N5000_Ind50_20yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
#R0
points(0.8,1-apply(abs(RE_R0_N100_Ind50_ckmrmultinom5),2,median,na.rm=TRUE)[2]/apply(abs(RE_R0_N100_Ind50_5yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, cex=1.25, col=2)
points(1.05,1-apply(abs(RE_R0_N100_Ind50_ckmrmultinom10),2,median,na.rm=TRUE)[2]/apply(abs(RE_R0_N100_Ind50_10yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(1.3,1-apply(abs(RE_R0_N100_Ind50_ckmrmultinom20),2,median,na.rm=TRUE)[2]/apply(abs(RE_R0_N100_Ind50_20yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(1.8,1-apply(abs(RE_R0_N1000_Ind50_ckmrmultinom5),2,median,na.rm=TRUE)[2]/apply(abs(RE_R0_N1000_Ind50_5yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, cex=1.25,col=2)
points(2.05,1-apply(abs(RE_R0_N1000_Ind50_ckmrmultinom10),2,median,na.rm=TRUE)[2]/apply(abs(RE_R0_N1000_Ind50_10yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(2.3,1-apply(abs(RE_R0_N1000_Ind50_ckmrmultinom20),2,median,na.rm=TRUE)[2]/apply(abs(RE_R0_N1000_Ind50_20yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(2.8,1-apply(abs(RE_R0_N5000_Ind50_ckmrmultinom5),2,median,na.rm=TRUE)[2]/apply(abs(RE_R0_N5000_Ind50_5yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(3.05,1-apply(abs(RE_R0_N5000_Ind50_ckmrmultinom10),2,median,na.rm=TRUE)[2]/apply(abs(RE_R0_N5000_Ind50_10yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(3.3,1-apply(abs(RE_R0_N5000_Ind50_ckmrmultinom20),2,median,na.rm=TRUE)[2]/apply(abs(RE_R0_N5000_Ind50_20yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)

#Sardine
plot(0.75,1-apply(abs(RE_M_N100_Ind50_ckmrmultinom5),2,median,na.rm=TRUE)[3]/apply(abs(RE_M_N100_Ind50_5yrs_noCKMR),2,median,na.rm=TRUE)[3],  yaxt="n",ylim=c(-0.2,0.8),yaxt="n", col=4, las=1, ylab="", xaxt="n", pch=16, main="", xlab="",xlim=c(0.65,3.35),cex=1.25, cex.axis=1.35)
axis(side=2, at=seq(-0.2,0.8,0.2), labels=seq(-20,80,20), las=1, cex.axis=1.35)
axis(side=1, at=c(0.775,1.025,1.275), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.35)
axis(side=1, at=c(1.775,2.025,2.275), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.35)
axis(side=1, at=c(2.775,3.025,3.275), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.35)
mtext(side=3, text="Sardine", line=-2, font=2, cex=1.35)
abline(h=0, lty=2)
points(1,1-apply(abs(RE_M_N100_Ind50_ckmrmultinom10),2,median,na.rm=TRUE)[3]/apply(abs(RE_M_N100_Ind50_10yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
points(1.25,1-apply(abs(RE_M_N100_Ind50_ckmrmultinom20),2,median,na.rm=TRUE)[3]/apply(abs(RE_M_N100_Ind50_20yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
points(1.75,1-apply(abs(RE_M_N1000_Ind50_ckmrmultinom5),2,median,na.rm=TRUE)[3]/apply(abs(RE_M_N1000_Ind50_5yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, cex=1.25, col=4)
points(2.,1-apply(abs(RE_M_N1000_Ind50_ckmrmultinom10),2,median,na.rm=TRUE)[3]/apply(abs(RE_M_N1000_Ind50_10yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
points(2.25,1-apply(abs(RE_M_N1000_Ind50_ckmrmultinom20),2,median,na.rm=TRUE)[3]/apply(abs(RE_M_N1000_Ind50_20yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
points(2.75,1-apply(abs(RE_M_N5000_Ind50_ckmrmultinom5),2,median,na.rm=TRUE)[3]/apply(abs(RE_M_N5000_Ind50_5yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, cex=1.25,col=4)
points(3.,1-apply(abs(RE_M_N5000_Ind50_ckmrmultinom10),2,median,na.rm=TRUE)[3]/apply(abs(RE_M_N5000_Ind50_10yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
points(3.25,1-apply(abs(RE_M_N5000_Ind50_ckmrmultinom20),2,median,na.rm=TRUE)[3]/apply(abs(RE_M_N5000_Ind50_20yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
#R0
points(0.8,1-apply(abs(RE_R0_N100_Ind50_ckmrmultinom5),2,median,na.rm=TRUE)[3]/apply(abs(RE_R0_N100_Ind50_5yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, cex=1.25, col=2)
points(1.05,1-apply(abs(RE_R0_N100_Ind50_ckmrmultinom10),2,median,na.rm=TRUE)[3]/apply(abs(RE_R0_N100_Ind50_10yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
points(1.3,1-apply(abs(RE_R0_N100_Ind50_ckmrmultinom20),2,median,na.rm=TRUE)[3]/apply(abs(RE_R0_N100_Ind50_20yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
points(1.8,1-apply(abs(RE_R0_N1000_Ind50_ckmrmultinom5),2,median,na.rm=TRUE)[3]/apply(abs(RE_R0_N1000_Ind50_5yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, cex=1.25,col=2)
points(2.05,1-apply(abs(RE_R0_N1000_Ind50_ckmrmultinom10),2,median,na.rm=TRUE)[3]/apply(abs(RE_R0_N1000_Ind50_10yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
points(2.3,1-apply(abs(RE_R0_N1000_Ind50_ckmrmultinom20),2,median,na.rm=TRUE)[3]/apply(abs(RE_R0_N1000_Ind50_20yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
points(2.8,1-apply(abs(RE_R0_N5000_Ind50_ckmrmultinom5),2,median,na.rm=TRUE)[3]/apply(abs(RE_R0_N5000_Ind50_5yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
points(3.05,1-apply(abs(RE_R0_N5000_Ind50_ckmrmultinom10),2,median,na.rm=TRUE)[3]/apply(abs(RE_R0_N5000_Ind50_10yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
mtext(side=1, text="Number of Years of CKMR Collection", line=3.5, cex=1.2)
points(3.3,1-apply(abs(RE_R0_N5000_Ind50_ckmrmultinom20),2,median,na.rm=TRUE)[3]/apply(abs(RE_R0_N5000_Ind50_20yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
#dev.off()


########################################
#IQR of SSB RE Precision between
########################################
#tiff(filename="C:/Users/fischn/Documents/GitHub/CKMR_Project/IQR_SSB_050.tiff", height=25, width=35, units='cm', compression="lzw", res=500)
par(mfrow=c(3,3), mar=c(1,1,1.25,0.5), oma=c(3.5,4.5,1.5,1))
#Cod
#100
plot(1:76,1-IQR_RE_ssb_N100_Ind50_ckmrmultinom5[1,]/IQR_RE_ssb_N100_Ind50_5yrs_noCKMR[1,], pch=16,col=2, las=1, ylim=c(-0.25,1), ylab="", xlab="", main="100 CKMR Samples",xaxt="n", xlim=c(0,250),bty="[", cex.axis=1.3, cex.main=1.5)
lines(67:76,rep(mean(c(1-IQR_RE_ssb_N100_Ind50_ckmrmultinom5[1,]/IQR_RE_ssb_N100_Ind50_5yrs_noCKMR[1,])[67:76]),10), lwd=4, col=4)
points(86:161,1-IQR_RE_ssb_N100_Ind50_ckmrmultinom10[1,]/IQR_RE_ssb_N100_Ind50_10yrs_noCKMR[1,], pch=16, col=2)
lines(152:161,rep(mean(c(1-IQR_RE_ssb_N100_Ind50_ckmrmultinom10[1,]/IQR_RE_ssb_N100_Ind50_10yrs_noCKMR[1,])[67:76]),10), lwd=4, col=4)
points(171:246,1-IQR_RE_ssb_N100_Ind50_ckmrmultinom20[1,]/IQR_RE_ssb_N100_Ind50_20yrs_noCKMR[1,], pch=16, col=2)
lines(237:246,rep(mean(c(1-IQR_RE_ssb_N100_Ind50_ckmrmultinom20[1,]/IQR_RE_ssb_N100_Ind50_20yrs_noCKMR[1,])[67:76]),10), lwd=4, col=4)
abline(h=0, lty=2)

#1000
plot(1:76,1-IQR_RE_ssb_N1000_Ind50_ckmrmultinom5[1,]/IQR_RE_ssb_N1000_Ind50_5yrs_noCKMR[1,], pch=16, col=2,las=1, ylim=c(-0.25,1), ylab="", xlab="", main="1,000 CKMR Samples",xaxt="n",  xlim=c(0,250),yaxt="n",bty="n", cex.main=1.5)
lines(67:76,rep(mean(c(1-IQR_RE_ssb_N1000_Ind50_ckmrmultinom5[1,]/IQR_RE_ssb_N1000_Ind50_5yrs_noCKMR[1,])[67:76]),10), lwd=4, col=4)
points(86:161,1-IQR_RE_ssb_N1000_Ind50_ckmrmultinom10[1,]/IQR_RE_ssb_N1000_Ind50_10yrs_noCKMR[1,], pch=16, col=2)
lines(152:161,rep(mean(c(1-IQR_RE_ssb_N1000_Ind50_ckmrmultinom10[1,]/IQR_RE_ssb_N1000_Ind50_10yrs_noCKMR[1,])[67:76]),10), lwd=4, col=4)
points(171:246,1-IQR_RE_ssb_N1000_Ind50_ckmrmultinom20[1,]/IQR_RE_ssb_N1000_Ind50_20yrs_noCKMR[1,], pch=16, col=2)
lines(237:246,rep(mean(c(1-IQR_RE_ssb_N1000_Ind50_ckmrmultinom20[1,]/IQR_RE_ssb_N1000_Ind50_20yrs_noCKMR[1,])[67:76]),10), lwd=4, col=4)
mtext(side=3, text="Cod", line=-2, font=2, cex=1.35)
axis(side=1,lwd.ticks = 0, labels=FALSE)
axis(side=3,lwd.ticks = 0, labels=FALSE)
legend(x=60,y=0.7,c("Mean of last 10 years"), lty=c(1), lwd=c(4),col=c(4), bty="n", cex=1.5)
mtext(text="        SD of Abundance Index = 0.5", side=3, line=-10)
abline(h=0, lty=2)

#5000
plot(1:76,1-IQR_RE_ssb_N5000_Ind50_ckmrmultinom5[1,]/IQR_RE_ssb_N5000_Ind50_5yrs_noCKMR[1,], pch=16, col=2,las=1, ylim=c(-0.25,1), ylab="", xlab="", main="5,000 CKMR Samples",xaxt="n",  xlim=c(0,250),yaxt="n",bty="]", cex.main=1.5)
lines(67:76,rep(mean(c(1-IQR_RE_ssb_N5000_Ind50_ckmrmultinom5[1,]/IQR_RE_ssb_N5000_Ind50_5yrs_noCKMR[1,])[67:76]),10), lwd=4, col=4)
points(86:161,1-IQR_RE_ssb_N5000_Ind50_ckmrmultinom10[1,]/IQR_RE_ssb_N5000_Ind50_10yrs_noCKMR[1,], pch=16, col=2)
lines(152:161,rep(mean(c(1-IQR_RE_ssb_N5000_Ind50_ckmrmultinom10[1,]/IQR_RE_ssb_N5000_Ind50_10yrs_noCKMR[1,])[67:76]),10), lwd=4, col=4)
points(171:246,1-IQR_RE_ssb_N5000_Ind50_ckmrmultinom20[1,]/IQR_RE_ssb_N5000_Ind50_20yrs_noCKMR[1,], pch=16, col=2)
lines(237:246,rep(mean(c(1-IQR_RE_ssb_N5000_Ind50_ckmrmultinom20[1,]/IQR_RE_ssb_N5000_Ind50_20yrs_noCKMR[1,])[67:76]),10), lwd=4, col=4)
abline(h=0, lty=2)

#Flatfish
#100
plot(1:76,1-IQR_RE_ssb_N100_Ind50_ckmrmultinom5[2,]/IQR_RE_ssb_N100_Ind50_5yrs_noCKMR[2,], pch=16, las=1, col=2,ylim=c(-0.25,1), ylab="", xlab="", main="",xaxt="n", xlim=c(0,250),bty="[", cex.axis=1.3, cex.main=1.2)
lines(67:76,rep(mean(c(1-IQR_RE_ssb_N100_Ind50_ckmrmultinom5[2,]/IQR_RE_ssb_N100_Ind50_5yrs_noCKMR[2,])[67:76]),10), lwd=4, col=4)
points(86:161,1-IQR_RE_ssb_N100_Ind50_ckmrmultinom10[2,]/IQR_RE_ssb_N100_Ind50_10yrs_noCKMR[2,], pch=16, col=2)
lines(152:161,rep(mean(c(1-IQR_RE_ssb_N100_Ind50_ckmrmultinom10[2,]/IQR_RE_ssb_N100_Ind50_10yrs_noCKMR[2,])[67:76]),10), lwd=4, col=4)
points(171:246,1-IQR_RE_ssb_N100_Ind50_ckmrmultinom20[2,]/IQR_RE_ssb_N100_Ind50_20yrs_noCKMR[2,], pch=16, col=2)
lines(237:246,rep(mean(c(1-IQR_RE_ssb_N100_Ind50_ckmrmultinom20[2,]/IQR_RE_ssb_N100_Ind50_20yrs_noCKMR[2,])[67:76]),10), lwd=4, col=4)
mtext(side=2, text="% Improvement = 100(1 - IQR SSB RE with CKMR/IQR SSB RE No CKMR)", line=3.5, cex=1.1)
abline(h=0, lty=2)

#1000
plot(1:76,1-IQR_RE_ssb_N1000_Ind50_ckmrmultinom5[2,]/IQR_RE_ssb_N1000_Ind50_5yrs_noCKMR[2,], pch=16, col=2,las=1, ylim=c(-0.25,1), ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="n")
lines(67:76,rep(mean(c(1-IQR_RE_ssb_N1000_Ind50_ckmrmultinom5[2,]/IQR_RE_ssb_N1000_Ind50_5yrs_noCKMR[2,])[67:76]),10), lwd=4, col=4)
points(86:161,1-IQR_RE_ssb_N1000_Ind50_ckmrmultinom10[2,]/IQR_RE_ssb_N1000_Ind50_10yrs_noCKMR[2,], pch=16, col=2)
lines(152:161,rep(mean(c(1-IQR_RE_ssb_N1000_Ind50_ckmrmultinom10[2,]/IQR_RE_ssb_N1000_Ind50_10yrs_noCKMR[2,])[67:76]),10), lwd=4, col=4)
points(171:246,1-IQR_RE_ssb_N1000_Ind50_ckmrmultinom20[2,]/IQR_RE_ssb_N1000_Ind50_20yrs_noCKMR[2,], pch=16, col=2)
lines(237:246,rep(mean(c(1-IQR_RE_ssb_N1000_Ind50_ckmrmultinom20[2,]/IQR_RE_ssb_N1000_Ind50_20yrs_noCKMR[2,])[67:76]),10), lwd=4, col=4)
mtext(side=3, text="Flatfish", line=-2, font=2, cex=1.35)
axis(side=1,lwd.ticks = 0, labels=FALSE)
axis(side=3,lwd.ticks = 0, labels=FALSE)
abline(h=0, lty=2)

#5000
plot(1:76,1-IQR_RE_ssb_N5000_Ind50_ckmrmultinom5[2,]/IQR_RE_ssb_N5000_Ind50_5yrs_noCKMR[2,], pch=16, col=2,las=1, ylim=c(-0.25,1), ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="]")
lines(67:76,rep(mean(c(1-IQR_RE_ssb_N5000_Ind50_ckmrmultinom5[2,]/IQR_RE_ssb_N5000_Ind50_5yrs_noCKMR[2,])[67:76]),10), lwd=4, col=4)
points(86:161,1-IQR_RE_ssb_N5000_Ind50_ckmrmultinom10[2,]/IQR_RE_ssb_N5000_Ind50_10yrs_noCKMR[2,], pch=16, col=2)
lines(152:161,rep(mean(c(1-IQR_RE_ssb_N5000_Ind50_ckmrmultinom10[2,]/IQR_RE_ssb_N5000_Ind50_10yrs_noCKMR[2,])[67:76]),10), lwd=4, col=4)
points(171:246,1-IQR_RE_ssb_N5000_Ind50_ckmrmultinom20[2,]/IQR_RE_ssb_N5000_Ind50_20yrs_noCKMR[2,], pch=16, col=2)
lines(237:246,rep(mean(c(1-IQR_RE_ssb_N5000_Ind50_ckmrmultinom20[2,]/IQR_RE_ssb_N5000_Ind50_20yrs_noCKMR[2,])[67:76]),10), lwd=4, col=4)
abline(h=0, lty=2)

#Sardine
#100
plot(1:76,1-IQR_RE_ssb_N100_Ind50_ckmrmultinom5[3,]/IQR_RE_ssb_N100_Ind50_5yrs_noCKMR[3,], pch=16, las=1,col=2, ylim=c(-0.25,1), ylab="", xlab="", main="",xaxt="n", xlim=c(0,250), bty="[", cex.axis=1.3, cex.main=1.2)
lines(67:76,rep(mean(c(1-IQR_RE_ssb_N100_Ind50_ckmrmultinom5[3,]/IQR_RE_ssb_N100_Ind50_5yrs_noCKMR[3,])[67:76]),10), lwd=4, col=4)
points(86:161,1-IQR_RE_ssb_N100_Ind50_ckmrmultinom10[3,]/IQR_RE_ssb_N100_Ind50_10yrs_noCKMR[3,], pch=16, col=2)
lines(152:161,rep(mean(c(1-IQR_RE_ssb_N100_Ind50_ckmrmultinom10[3,]/IQR_RE_ssb_N100_Ind50_10yrs_noCKMR[3,])[67:76]),10), lwd=4, col=4)
points(171:246,1-IQR_RE_ssb_N100_Ind50_ckmrmultinom20[3,]/IQR_RE_ssb_N100_Ind50_20yrs_noCKMR[3,], pch=16, col=2)
lines(237:246,rep(mean(c(1-IQR_RE_ssb_N100_Ind50_ckmrmultinom20[3,]/IQR_RE_ssb_N100_Ind50_20yrs_noCKMR[3,])[67:76]),10), lwd=4, col=4)
axis(side=1, at=c(40,127,211), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.3)
abline(h=0, lty=2)

#1000
plot(1:76,1-IQR_RE_ssb_N1000_Ind50_ckmrmultinom5[3,]/IQR_RE_ssb_N1000_Ind50_5yrs_noCKMR[3,], pch=16, col=2,las=1, ylim=c(-0.25,1), cex.axis=1.3, ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="n")
lines(67:76,rep(mean(c(1-IQR_RE_ssb_N1000_Ind50_ckmrmultinom5[3,]/IQR_RE_ssb_N1000_Ind50_5yrs_noCKMR[3,])[67:76]),10), lwd=4, col=4)
points(86:161,1-IQR_RE_ssb_N1000_Ind50_ckmrmultinom10[3,]/IQR_RE_ssb_N1000_Ind50_10yrs_noCKMR[3,], pch=16, col=2)
lines(152:161,rep(mean(c(1-IQR_RE_ssb_N1000_Ind50_ckmrmultinom10[3,]/IQR_RE_ssb_N1000_Ind50_10yrs_noCKMR[3,])[67:76]),10), lwd=4, col=4)
points(171:246,1-IQR_RE_ssb_N1000_Ind50_ckmrmultinom20[3,]/IQR_RE_ssb_N1000_Ind50_20yrs_noCKMR[3,], pch=16, col=2)
lines(237:246,rep(mean(c(1-IQR_RE_ssb_N1000_Ind50_ckmrmultinom20[3,]/IQR_RE_ssb_N1000_Ind50_20yrs_noCKMR[3,])[67:76]),10), lwd=4, col=4)
axis(side=1, at=c(40,127,211), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.3)
mtext(side=3, text="Sardine", line=-2, font=2, cex=1.35)
mtext(side=1, text="Number of Years of CKMR Collection", line=3.25, cex=1.2)
axis(side=1,lwd.ticks = 0, labels=FALSE)
axis(side=3,lwd.ticks = 0, labels=FALSE)
abline(h=0, lty=2)

#5000
plot(1:76,1-IQR_RE_ssb_N5000_Ind50_ckmrmultinom5[3,]/IQR_RE_ssb_N5000_Ind50_5yrs_noCKMR[3,], pch=16, col=2,las=1, ylim=c(-0.25,1), cex.axis=1.3, ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="]")
lines(67:76,rep(mean(c(1-IQR_RE_ssb_N5000_Ind50_ckmrmultinom5[3,]/IQR_RE_ssb_N5000_Ind50_5yrs_noCKMR[3,])[67:76]),10), lwd=4, col=4)
points(86:161,1-IQR_RE_ssb_N5000_Ind50_ckmrmultinom10[3,]/IQR_RE_ssb_N5000_Ind50_10yrs_noCKMR[3,], pch=16, col=2)
lines(152:161,rep(mean(c(1-IQR_RE_ssb_N5000_Ind50_ckmrmultinom10[3,]/IQR_RE_ssb_N5000_Ind50_10yrs_noCKMR[3,])[67:76]),10), lwd=4, col=4)
points(171:246,1-IQR_RE_ssb_N5000_Ind50_ckmrmultinom20[3,]/IQR_RE_ssb_N5000_Ind50_20yrs_noCKMR[3,], pch=16, col=2)
lines(237:246,rep(mean(c(1-IQR_RE_ssb_N5000_Ind50_ckmrmultinom20[3,]/IQR_RE_ssb_N5000_Ind50_20yrs_noCKMR[3,])[67:76]),10), lwd=4, col=4)
axis(side=1, at=c(40,127,211), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.3)
abline(h=0, lty=2)
#dev.off()

#################################
#M and R0
#################################
#tiff(filename="C:/Users/fischn/Documents/GitHub/CKMR_Project/IQR_M_R0_050.tiff", height=30, width=20, units='cm', compression="lzw", res=500)
par(mfcol=c(3,1), mar=c(2.25,1,0.25,0.5), oma=c(4,4,1.5,1))
#Index 0.5###################
#Median SEs of M and R0
#Cod
plot(0.75,1-IQR_RE_M_N100_Ind50_ckmrmultinom5[1]/IQR_RE_M_N100_Ind50_5yrs_noCKMR[1], ylim=c(-0.2,0.8), las=1, ylab="", xaxt="n", pch=16, main="",  yaxt="n",xlab="",xlim=c(0.65,3.35),cex=1.25, col=4, cex.axis=1.35)
mtext(side=3, text="Cod", line=-2, font=2, cex=1.35)
legend(x=1.65,0.6, y=, c("Natural Mortality", "Unfished Recruitment"), pch=16, col=c(4,2), bty="n", cex=1.35)
mtext(text="  SD of Abundance Index = 0.5", side=3, line=-12)
abline(h=0, lty=2)
points(1,1-IQR_RE_M_N100_Ind50_ckmrmultinom10[1]/IQR_RE_M_N100_Ind50_10yrs_noCKMR[1], pch=16, col=4,cex=1.25)
points(1.25,1-IQR_RE_M_N100_Ind50_ckmrmultinom20[1]/IQR_RE_M_N100_Ind50_20yrs_noCKMR[1], pch=16, col=4,cex=1.25)
points(1.75,1-IQR_RE_M_N1000_Ind50_ckmrmultinom5[1]/IQR_RE_M_N1000_Ind50_5yrs_noCKMR[1], pch=16, cex=1.25, col=4)
points(2,1-IQR_RE_M_N1000_Ind50_ckmrmultinom10[1]/IQR_RE_M_N1000_Ind50_10yrs_noCKMR[1], pch=16, col=4,cex=1.25)
points(2.25,1-IQR_RE_M_N1000_Ind50_ckmrmultinom20[1]/IQR_RE_M_N1000_Ind50_20yrs_noCKMR[1], pch=16, col=4,cex=1.25)
points(2.75,1-IQR_RE_M_N5000_Ind50_ckmrmultinom5[1]/IQR_RE_M_N5000_Ind50_5yrs_noCKMR[1], pch=16, cex=1.25,col=4)
points(3,1-IQR_RE_M_N5000_Ind50_ckmrmultinom10[1]/IQR_RE_M_N5000_Ind50_10yrs_noCKMR[1], pch=16, col=4,cex=1.25)
points(3.25,1-IQR_RE_M_N5000_Ind50_ckmrmultinom20[1]/IQR_RE_M_N5000_Ind50_20yrs_noCKMR[1], pch=16, col=4,cex=1.25)
#R0
points(0.8,1-IQR_RE_R0_N100_Ind50_ckmrmultinom5[1]/IQR_RE_R0_N100_Ind50_5yrs_noCKMR[1], pch=16, cex=1.25, col=2)
points(1.05,1-IQR_RE_R0_N100_Ind50_ckmrmultinom10[1]/IQR_RE_R0_N100_Ind50_10yrs_noCKMR[1], pch=16, col=2,cex=1.25)
points(1.3,1-IQR_RE_R0_N100_Ind50_ckmrmultinom20[1]/IQR_RE_R0_N100_Ind50_20yrs_noCKMR[1], pch=16, col=2,cex=1.25)
points(1.8,1-IQR_RE_R0_N1000_Ind50_ckmrmultinom5[1]/IQR_RE_R0_N1000_Ind50_5yrs_noCKMR[1], pch=16, cex=1.25,col=2)
points(2.05,1-IQR_RE_R0_N1000_Ind50_ckmrmultinom10[1]/IQR_RE_R0_N1000_Ind50_10yrs_noCKMR[1], pch=16, col=2,cex=1.25)
points(2.3,1-IQR_RE_R0_N1000_Ind50_ckmrmultinom20[1]/IQR_RE_R0_N1000_Ind50_20yrs_noCKMR[1], pch=16, col=2,cex=1.25)
points(2.8,1-IQR_RE_R0_N5000_Ind50_ckmrmultinom5[1]/IQR_RE_R0_N5000_Ind50_5yrs_noCKMR[1], pch=16, col=2,cex=1.25)
points(3.05,1-IQR_RE_R0_N5000_Ind50_ckmrmultinom10[1]/IQR_RE_R0_N5000_Ind50_10yrs_noCKMR[1], pch=16, col=2,cex=1.25)
points(3.3,1-IQR_RE_R0_N5000_Ind50_ckmrmultinom20[1]/IQR_RE_R0_N5000_Ind50_20yrs_noCKMR[1], pch=16, col=2,cex=1.25)

#Flatfish
plot(0.75,1-IQR_RE_M_N100_Ind50_ckmrmultinom5[2]/IQR_RE_M_N100_Ind50_5yrs_noCKMR[2], ylim=c(-0.2,0.8), col=4,las=1, ylab="", xaxt="n", pch=16,  yaxt="n",main="", xlab="",xlim=c(0.65,3.35),cex=1.25, cex.axis=1.35)
mtext(side=2, text="% Improvement = 100(1 - IQR RE with CKMR / IQR RE No CKMR)", line=3.5)
mtext(side=3, text="Flatfish", line=-2, font=2, cex=1.35)
abline(h=0, lty=2)
points(1,1-IQR_RE_M_N100_Ind50_ckmrmultinom10[2]/IQR_RE_M_N100_Ind50_10yrs_noCKMR[2], pch=16, col=4,cex=1.25)
points(1.25,1-IQR_RE_M_N100_Ind50_ckmrmultinom20[2]/IQR_RE_M_N100_Ind50_20yrs_noCKMR[2], pch=16, col=4,cex=1.25)
points(1.75,1-IQR_RE_M_N1000_Ind50_ckmrmultinom5[2]/IQR_RE_M_N1000_Ind50_5yrs_noCKMR[2], pch=16, cex=1.25, col=4)
points(2,1-IQR_RE_M_N1000_Ind50_ckmrmultinom10[2]/IQR_RE_M_N1000_Ind50_10yrs_noCKMR[2], pch=16, col=4,cex=1.25)
points(2.25,1-IQR_RE_M_N1000_Ind50_ckmrmultinom20[2]/IQR_RE_M_N1000_Ind50_20yrs_noCKMR[2], pch=16, col=4,cex=1.25)
points(2.75,1-IQR_RE_M_N5000_Ind50_ckmrmultinom5[2]/IQR_RE_M_N5000_Ind50_5yrs_noCKMR[2], pch=16, cex=1.25,col=4)
points(3,1-IQR_RE_M_N5000_Ind50_ckmrmultinom10[2]/IQR_RE_M_N5000_Ind50_10yrs_noCKMR[2], pch=16, col=4,cex=1.25)
points(3.25,1-IQR_RE_M_N5000_Ind50_ckmrmultinom20[2]/IQR_RE_M_N5000_Ind50_20yrs_noCKMR[2], pch=16, col=4,cex=1.25)
#R0
points(0.8,1-IQR_RE_R0_N100_Ind50_ckmrmultinom5[2]/IQR_RE_R0_N100_Ind50_5yrs_noCKMR[2], pch=16, cex=1.25, col=2)
points(1.05,1-IQR_RE_R0_N100_Ind50_ckmrmultinom10[2]/IQR_RE_R0_N100_Ind50_10yrs_noCKMR[2], pch=16, col=2,cex=1.25)
points(1.3,1-IQR_RE_R0_N100_Ind50_ckmrmultinom20[2]/IQR_RE_R0_N100_Ind50_20yrs_noCKMR[2], pch=16, col=2,cex=1.25)
points(1.8,1-IQR_RE_R0_N1000_Ind50_ckmrmultinom5[2]/IQR_RE_R0_N1000_Ind50_5yrs_noCKMR[2], pch=16, cex=1.25,col=2)
points(2.05,1-IQR_RE_R0_N1000_Ind50_ckmrmultinom10[2]/IQR_RE_R0_N1000_Ind50_10yrs_noCKMR[2], pch=16, col=2,cex=1.25)
points(2.3,1-IQR_RE_R0_N1000_Ind50_ckmrmultinom20[2]/IQR_RE_R0_N1000_Ind50_20yrs_noCKMR[2], pch=16, col=2,cex=1.25)
points(2.8,1-IQR_RE_R0_N5000_Ind50_ckmrmultinom5[2]/IQR_RE_R0_N5000_Ind50_5yrs_noCKMR[2], pch=16, col=2,cex=1.25)
points(3.05,1-IQR_RE_R0_N5000_Ind50_ckmrmultinom10[2]/IQR_RE_R0_N5000_Ind50_10yrs_noCKMR[2], pch=16, col=2,cex=1.25)
points(3.3,1-IQR_RE_R0_N5000_Ind50_ckmrmultinom20[2]/IQR_RE_R0_N5000_Ind50_20yrs_noCKMR[2], pch=16, col=2,cex=1.25)
#Sardine
plot(0.75,1-IQR_RE_M_N100_Ind50_ckmrmultinom5[3]/IQR_RE_M_N100_Ind50_5yrs_noCKMR[3], ylim=c(-0.2,0.8), col=4, las=1, ylab="", xaxt="n", pch=16,  yaxt="n",main="", xlab="",xlim=c(0.65,3.35),cex=1.25, cex.axis=1.35)
axis(side=1, at=c(0.775,1.025,1.275), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.35)
axis(side=1, at=c(1.775,2.025,2.275), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.35)
axis(side=1, at=c(2.775,3.025,3.275), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.35)
mtext(side=3, text="Sardine", line=-2, font=2, cex=1.35)
abline(h=0, lty=2)
points(1,1-IQR_RE_M_N100_Ind50_ckmrmultinom10[3]/IQR_RE_M_N100_Ind50_10yrs_noCKMR[3], pch=16, col=4,cex=1.25)
points(1.25,1-IQR_RE_M_N100_Ind50_ckmrmultinom20[3]/IQR_RE_M_N100_Ind50_20yrs_noCKMR[3], pch=16, col=4,cex=1.25)
points(1.75,1-IQR_RE_M_N1000_Ind50_ckmrmultinom5[3]/IQR_RE_M_N1000_Ind50_5yrs_noCKMR[3], pch=16, cex=1.25, col=4)
points(2.,1-IQR_RE_M_N1000_Ind50_ckmrmultinom10[3]/IQR_RE_M_N1000_Ind50_10yrs_noCKMR[3], pch=16, col=4,cex=1.25)
points(2.25,1-IQR_RE_M_N1000_Ind50_ckmrmultinom20[3]/IQR_RE_M_N1000_Ind50_20yrs_noCKMR[3], pch=16, col=4,cex=1.25)
points(2.75,1-IQR_RE_M_N5000_Ind50_ckmrmultinom5[3]/IQR_RE_M_N5000_Ind50_5yrs_noCKMR[3], pch=16, cex=1.25,col=4)
points(3.,1-IQR_RE_M_N5000_Ind50_ckmrmultinom10[3]/IQR_RE_M_N5000_Ind50_10yrs_noCKMR[3], pch=16, col=4,cex=1.25)
points(3.25,1-IQR_RE_M_N5000_Ind50_ckmrmultinom20[3]/IQR_RE_M_N5000_Ind50_20yrs_noCKMR[3], pch=16, col=4,cex=1.25)
#R0
points(0.8,1-IQR_RE_R0_N100_Ind50_ckmrmultinom5[3]/IQR_RE_R0_N100_Ind50_5yrs_noCKMR[3], pch=16, cex=1.25, col=2)
points(1.05,1-IQR_RE_R0_N100_Ind50_ckmrmultinom10[3]/IQR_RE_R0_N100_Ind50_10yrs_noCKMR[3], pch=16, col=2,cex=1.25)
points(1.3,1-IQR_RE_R0_N100_Ind50_ckmrmultinom20[3]/IQR_RE_R0_N100_Ind50_20yrs_noCKMR[3], pch=16, col=2,cex=1.25)
points(1.8,1-IQR_RE_R0_N1000_Ind50_ckmrmultinom5[3]/IQR_RE_R0_N1000_Ind50_5yrs_noCKMR[3], pch=16, cex=1.25,col=2)
points(2.05,1-IQR_RE_R0_N1000_Ind50_ckmrmultinom10[3]/IQR_RE_R0_N1000_Ind50_10yrs_noCKMR[3], pch=16, col=2,cex=1.25)
points(2.3,1-IQR_RE_R0_N1000_Ind50_ckmrmultinom20[3]/IQR_RE_R0_N1000_Ind50_20yrs_noCKMR[3], pch=16, col=2,cex=1.25)
points(2.8,1-IQR_RE_R0_N5000_Ind50_ckmrmultinom5[3]/IQR_RE_R0_N5000_Ind50_5yrs_noCKMR[3], pch=16, col=2,cex=1.25)
points(3.05,1-IQR_RE_R0_N5000_Ind50_ckmrmultinom10[3]/IQR_RE_R0_N5000_Ind50_10yrs_noCKMR[3], pch=16, col=2,cex=1.25)
mtext(side=1, text="Number of Years of CKMR Collection", line=3.5, cex=1.2)
points(3.3,1-IQR_RE_R0_N5000_Ind50_ckmrmultinom20[3]/IQR_RE_R0_N5000_Ind50_20yrs_noCKMR[3], pch=16, col=2,cex=1.25)
#dev.off()


##########################################################################
#
#SD Index = 0.25
#
##########################################################################

#tiff(filename="C:/Users/fischn/Documents/GitHub/CKMR_Project/SE_SSB_025.tiff", height=25, width=35, units='cm', compression="lzw", res=500)
par(mfrow=c(3,3), mar=c(1,1,1.25,0.5), oma=c(3.5,4.5,1.5,1))
#Cod
#100
plot(1:76,1-apply(SD_ssb_N100_Ind25_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N100_Ind25_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,], yaxt="n", pch=16,col=2, las=1, ylim=c(-0.1,1), ylab="", xlab="", main="100 CKMR Samples",xaxt="n", xlim=c(0,250),bty="[", cex.axis=1.3, cex.main=1.5)
axis(side=2, at=seq(0,1,0.2), labels=seq(0,100,20), las=1, cex.axis=1.3)
lines(67:76,rep(mean((c(1-apply(SD_ssb_N100_Ind25_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N100_Ind25_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,])[67:76])),10), lwd=4, col=4)
points(86:161,(1-apply(SD_ssb_N100_Ind25_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N100_Ind25_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,]), pch=16 , col=2)
lines(152:161,rep(mean((c(1-apply(SD_ssb_N100_Ind25_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N100_Ind25_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,])[67:76])),10), lwd=4, col=4)
points(171:246,(1-apply(SD_ssb_N100_Ind25_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N100_Ind25_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,]), pch=16 , col=2)
lines(237:246,rep(mean((c(1-apply(SD_ssb_N100_Ind25_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N100_Ind25_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,])[67:76])),10), lwd=4, col=4)
abline(h=0, lty=2)

#1000
plot(1:76,1-apply(SD_ssb_N1000_Ind25_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N1000_Ind25_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,], pch=16, col=2,las=1, ylim=c(-0.1,1), ylab="", xlab="", main="1,000 CKMR Samples",xaxt="n",  xlim=c(0,250),yaxt="n",bty="n", cex.main=1.5)
mtext(side=3, text="Cod", line=-2, font=2, cex=1.35)
axis(side=1,lwd.ticks = 0, labels=FALSE)
axis(side=3,lwd.ticks = 0, labels=FALSE)
legend(x=60,y=0.7,c("Mean of last 10 years"), lty=c(1), lwd=c(4),col=c(4), bty="n", cex=1.5)
mtext(text="        SD of Abundance Index = 0.25", side=3, line=-11)
lines(67:76,rep(mean((c(1-apply(SD_ssb_N1000_Ind25_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N1000_Ind25_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,])[67:76])),10), lwd=4, col=4)
points(86:161,(1-apply(SD_ssb_N1000_Ind25_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N1000_Ind25_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,]), pch=16 , col=2)
lines(152:161,rep(mean((c(1-apply(SD_ssb_N1000_Ind25_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N1000_Ind25_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,])[67:76])),10), lwd=4, col=4)
points(171:246,(1-apply(SD_ssb_N1000_Ind25_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N1000_Ind25_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,]), pch=16 , col=2)
lines(237:246,rep(mean((c(1-apply(SD_ssb_N1000_Ind25_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N1000_Ind25_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,])[67:76])),10), lwd=4, col=4)
abline(h=0, lty=2)

#5000
plot(1:76,1-apply(SD_ssb_N5000_Ind25_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N5000_Ind25_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,], pch=16, col=2,las=1, ylim=c(-0.1,1), ylab="", xlab="", main="5,000 CKMR Samples",xaxt="n",  xlim=c(0,250),yaxt="n",bty="]", cex.main=1.5)
lines(67:76,rep(mean((c(1-apply(SD_ssb_N5000_Ind25_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N5000_Ind25_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,])[67:76])),10), lwd=4, col=4)
points(86:161,(1-apply(SD_ssb_N5000_Ind25_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N5000_Ind25_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,]), pch=16 , col=2)
lines(152:161,rep(mean((c(1-apply(SD_ssb_N5000_Ind25_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N5000_Ind25_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,])[67:76])),10), lwd=4, col=4)
points(171:246,(1-apply(SD_ssb_N5000_Ind25_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N5000_Ind25_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,]), pch=16 , col=2)
lines(237:246,rep(mean((c(1-apply(SD_ssb_N5000_Ind25_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N5000_Ind25_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,])[67:76])),10), lwd=4, col=4)
abline(h=0, lty=2)

#Flatfish
#100
plot(1:76,1-apply(SD_ssb_N100_Ind25_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N100_Ind25_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,], yaxt="n", pch=16, las=1, col=2,ylim=c(-0.1,1), ylab="", xlab="", main="",xaxt="n", xlim=c(0,250),bty="[", cex.axis=1.3, cex.main=1.2)
axis(side=2, at=seq(0,1,0.2), labels=seq(0,100,20), las=1, cex.axis=1.3)
lines(67:76,rep(mean((c(1-apply(SD_ssb_N100_Ind25_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N100_Ind25_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,])[67:76])),10), lwd=4, col=4)
points(86:161,(1-apply(SD_ssb_N100_Ind25_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N100_Ind25_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,]), pch=16 , col=2)
lines(152:161,rep(mean((c(1-apply(SD_ssb_N100_Ind25_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N100_Ind25_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,])[67:76])),10), lwd=4, col=4)
points(171:246,(1-apply(SD_ssb_N100_Ind25_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N100_Ind25_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,]), pch=16 , col=2)
lines(237:246,rep(mean((c(1-apply(SD_ssb_N100_Ind25_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N100_Ind25_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,])[67:76])),10), lwd=4, col=4)
mtext(side=2, text="% Improvement = 100(1 - SSB SE with CKMR/SSB SE No CKMR)", line=3.5, cex=1.1)
abline(h=0, lty=2)

#1000
plot(1:76,1-apply(SD_ssb_N1000_Ind25_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N1000_Ind25_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,], pch=16, col=2,las=1, ylim=c(-0.1,1), ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="n")
mtext(side=3, text="Flatfish", line=-2, font=2, cex=1.35)
axis(side=1,lwd.ticks = 0, labels=FALSE)
axis(side=3,lwd.ticks = 0, labels=FALSE)
lines(67:76,rep(mean((c(1-apply(SD_ssb_N1000_Ind25_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N1000_Ind25_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,])[67:76])),10), lwd=4, col=4)
points(86:161,(1-apply(SD_ssb_N1000_Ind25_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N1000_Ind25_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,]), pch=16 , col=2)
lines(152:161,rep(mean((c(1-apply(SD_ssb_N1000_Ind25_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N1000_Ind25_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,])[67:76])),10), lwd=4, col=4)
points(171:246,(1-apply(SD_ssb_N1000_Ind25_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N1000_Ind25_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,]), pch=16 , col=2)
lines(237:246,rep(mean((c(1-apply(SD_ssb_N1000_Ind25_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N1000_Ind25_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,])[67:76])),10), lwd=4, col=4)
abline(h=0, lty=2)

#5000
plot(1:76,1-apply(SD_ssb_N5000_Ind25_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N5000_Ind25_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,], pch=16, col=2,las=1, ylim=c(-0.1,1), ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="]")
lines(67:76,rep(mean((c(1-apply(SD_ssb_N5000_Ind25_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N5000_Ind25_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,])[67:76])),10), lwd=4, col=4)
points(86:161,(1-apply(SD_ssb_N5000_Ind25_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N5000_Ind25_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,]), pch=16 , col=2)
lines(152:161,rep(mean((c(1-apply(SD_ssb_N5000_Ind25_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N5000_Ind25_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,])[67:76])),10), lwd=4, col=4)
points(171:246,(1-apply(SD_ssb_N5000_Ind25_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N5000_Ind25_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,]), pch=16 , col=2)
lines(237:246,rep(mean((c(1-apply(SD_ssb_N5000_Ind25_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N5000_Ind25_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,])[67:76])),10), lwd=4, col=4)
abline(h=0, lty=2)

#Sardine
#100
plot(1:76,1-apply(SD_ssb_N100_Ind25_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N100_Ind25_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,],  yaxt="n",pch=16, las=1,col=2, ylim=c(-0.1,1), ylab="", xlab="", main="",xaxt="n", xlim=c(0,250), bty="[", cex.axis=1.3, cex.main=1.2)
axis(side=2, at=seq(0,1,0.2), labels=seq(0,100,20), las=1, cex.axis=1.3)
abline(h=0, lty=2)
axis(side=1, at=c(40,127,211), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.3)
lines(67:76,rep(mean((c(1-apply(SD_ssb_N100_Ind25_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N100_Ind25_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,])[67:76])),10), lwd=4, col=4)
points(86:161,(1-apply(SD_ssb_N100_Ind25_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N100_Ind25_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,]), pch=16 , col=2)
lines(152:161,rep(mean((c(1-apply(SD_ssb_N100_Ind25_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N100_Ind25_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,])[67:76])),10), lwd=4, col=4)
points(171:246,(1-apply(SD_ssb_N100_Ind25_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N100_Ind25_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,]), pch=16 , col=2)
lines(237:246,rep(mean((c(1-apply(SD_ssb_N100_Ind25_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N100_Ind25_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,])[67:76])),10), lwd=4, col=4)
abline(h=0, lty=2)

#1000
plot(1:76,1-apply(SD_ssb_N1000_Ind25_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N1000_Ind25_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,], pch=16, col=2,las=1, ylim=c(-0.1,1), cex.axis=1.3, ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="n")
axis(side=1, at=c(40,127,211), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.3)
mtext(side=3, text="Sardine", line=-2, font=2, cex=1.35)
mtext(side=1, text="Number of Years of CKMR Collection", line=3.25, cex=1.2)
axis(side=1,lwd.ticks = 0, labels=FALSE)
axis(side=3,lwd.ticks = 0, labels=FALSE)
lines(67:76,rep(mean((c(1-apply(SD_ssb_N1000_Ind25_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N1000_Ind25_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,])[67:76])),10), lwd=4, col=4)
points(86:161,(1-apply(SD_ssb_N1000_Ind25_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N1000_Ind25_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,]), pch=16 , col=2)
lines(152:161,rep(mean((c(1-apply(SD_ssb_N1000_Ind25_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N1000_Ind25_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,])[67:76])),10), lwd=4, col=4)
points(171:246,(1-apply(SD_ssb_N1000_Ind25_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N1000_Ind25_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,]), pch=16 , col=2)
lines(237:246,rep(mean((c(1-apply(SD_ssb_N1000_Ind25_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N1000_Ind25_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,])[67:76])),10), lwd=4, col=4)
abline(h=0, lty=2)

#5000
plot(1:76,1-apply(SD_ssb_N5000_Ind25_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N5000_Ind25_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,], pch=16, col=2,las=1, ylim=c(-0.1,1), cex.axis=1.3, ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="]")
axis(side=1, at=c(40,127,211), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.3)
lines(67:76,rep(mean((c(1-apply(SD_ssb_N5000_Ind25_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N5000_Ind25_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,])[67:76])),10), lwd=4, col=4)
points(86:161,(1-apply(SD_ssb_N5000_Ind25_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N5000_Ind25_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,]), pch=16 , col=2)
lines(152:161,rep(mean((c(1-apply(SD_ssb_N5000_Ind25_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N5000_Ind25_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,])[67:76])),10), lwd=4, col=4)
points(171:246,(1-apply(SD_ssb_N5000_Ind25_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N5000_Ind25_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,]), pch=16 , col=2)
lines(237:246,rep(mean((c(1-apply(SD_ssb_N5000_Ind25_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N5000_Ind25_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,])[67:76])),10), lwd=4, col=4)
abline(h=0, lty=2)
#dev.off()


############
#M & R0
############
#tiff(filename="C:/Users/fischn/Documents/GitHub/CKMR_Project/SE_M_R0_025.tiff", height=30, width=20, units='cm', compression="lzw", res=500)
par(mfcol=c(3,1), mar=c(2.25,1,0.25,0.5), oma=c(4,4,1.5,1))
#Index 0.5###################
#Median SEs of M and R0
#Cod
plot(0.75,1-apply(SD_M_N100_Ind25_ckmrmultinom5,1,median,na.rm=TRUE)[1]/apply(SD_M_N100_Ind25_5yrs_noCKMR,1,median,na.rm=TRUE)[1], ylim=c(-0.1,0.8), yaxt="n", las=1, ylab="", xaxt="n", pch=16, main="", xlab="",xlim=c(0.65,3.35),cex=1.25, col=4, cex.axis=1.35)
axis(side=2, at=seq(0,0.8,0.2), labels=seq(0,80,20), las=1, cex.axis=1.3)
mtext(side=3, text="Cod", line=-2, font=2, cex=1.35)
legend(x=1.65,0.6, y=, c("Natural Mortality", "Unfished Recruitment"), pch=16, col=c(4,2), bty="n", cex=1.35)
mtext(text="  SD of Abundance Index = 0.25", side=3, line=-12)
abline(h=0, lty=2)
points(1,1-apply(SD_M_N100_Ind25_ckmrmultinom10,1,median,na.rm=TRUE)[1]/apply(SD_M_N100_Ind25_10yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
points(1.25,1-apply(SD_M_N100_Ind25_ckmrmultinom20,1,median,na.rm=TRUE)[1]/apply(SD_M_N100_Ind25_20yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
points(1.75,1-apply(SD_M_N1000_Ind25_ckmrmultinom5,1,median,na.rm=TRUE)[1]/apply(SD_M_N1000_Ind25_5yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, cex=1.25, col=4)
points(2,1-apply(SD_M_N1000_Ind25_ckmrmultinom10,1,median,na.rm=TRUE)[1]/apply(SD_M_N1000_Ind25_10yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
points(2.25,1-apply(SD_M_N1000_Ind25_ckmrmultinom20,1,median,na.rm=TRUE)[1]/apply(SD_M_N1000_Ind25_20yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
points(2.75,1-apply(SD_M_N5000_Ind25_ckmrmultinom5,1,median,na.rm=TRUE)[1]/apply(SD_M_N5000_Ind25_5yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, cex=1.25,col=4)
points(3,1-apply(SD_M_N5000_Ind25_ckmrmultinom10,1,median,na.rm=TRUE)[1]/apply(SD_M_N5000_Ind25_10yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
points(3.25,1-apply(SD_M_N5000_Ind25_ckmrmultinom20,1,median,na.rm=TRUE)[1]/apply(SD_M_N5000_Ind25_20yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
mtext(side=3, at=1, line=0, text="100 CKMR Samples")
mtext(side=3, line=0, text="1,000 CKMR Samples")
mtext(side=3, at=3, line=0, text="5,000 CKMR Samples")
#R0
points(0.8,1-apply(SD_R0_N100_Ind25_ckmrmultinom5,1,median,na.rm=TRUE)[1]/apply(SD_R0_N100_Ind25_5yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, cex=1.25, col=2)
points(1.05,1-apply(SD_R0_N100_Ind25_ckmrmultinom10,1,median,na.rm=TRUE)[1]/apply(SD_R0_N100_Ind25_10yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(1.3,1-apply(SD_R0_N100_Ind25_ckmrmultinom20,1,median,na.rm=TRUE)[1]/apply(SD_R0_N100_Ind25_20yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(1.8,1-apply(SD_R0_N1000_Ind25_ckmrmultinom5,1,median,na.rm=TRUE)[1]/apply(SD_R0_N1000_Ind25_5yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, cex=1.25,col=2)
points(2.05,1-apply(SD_R0_N1000_Ind25_ckmrmultinom10,1,median,na.rm=TRUE)[1]/apply(SD_R0_N1000_Ind25_10yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(2.3,1-apply(SD_R0_N1000_Ind25_ckmrmultinom20,1,median,na.rm=TRUE)[1]/apply(SD_R0_N1000_Ind25_20yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(2.8,1-apply(SD_R0_N5000_Ind25_ckmrmultinom5,1,median,na.rm=TRUE)[1]/apply(SD_R0_N5000_Ind25_5yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(3.05,1-apply(SD_R0_N5000_Ind25_ckmrmultinom10,1,median,na.rm=TRUE)[1]/apply(SD_R0_N5000_Ind25_10yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(3.3,1-apply(SD_R0_N5000_Ind25_ckmrmultinom20,1,median,na.rm=TRUE)[1]/apply(SD_R0_N5000_Ind25_20yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)

#Flatfish
plot(0.75,1-apply(SD_M_N100_Ind25_ckmrmultinom5,1,median,na.rm=TRUE)[2]/apply(SD_M_N100_Ind25_5yrs_noCKMR,1,median,na.rm=TRUE)[2], ylim=c(-0.1,0.8), yaxt="n", col=4,las=1, ylab="", xaxt="n", pch=16, main="", xlab="",xlim=c(0.65,3.35),cex=1.25, cex.axis=1.35)
axis(side=2, at=seq(0,0.8,0.2), labels=seq(0,80,20), las=1, cex.axis=1.3)
mtext(side=2, text="% Improvement = 100(1 - SE with CKMR/SE No CKMR)", line=3.5)
mtext(side=3, text="Flatfish", line=-2, font=2, cex=1.35)
abline(h=0, lty=2)
points(1,1-apply(SD_M_N100_Ind25_ckmrmultinom10,1,median,na.rm=TRUE)[2]/apply(SD_M_N100_Ind25_10yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
points(1.25,1-apply(SD_M_N100_Ind25_ckmrmultinom20,1,median,na.rm=TRUE)[2]/apply(SD_M_N100_Ind25_20yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
points(1.75,1-apply(SD_M_N1000_Ind25_ckmrmultinom5,1,median,na.rm=TRUE)[2]/apply(SD_M_N1000_Ind25_5yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, cex=1.25, col=4)
points(2,1-apply(SD_M_N1000_Ind25_ckmrmultinom10,1,median,na.rm=TRUE)[2]/apply(SD_M_N1000_Ind25_10yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
points(2.25,1-apply(SD_M_N1000_Ind25_ckmrmultinom20,1,median,na.rm=TRUE)[2]/apply(SD_M_N1000_Ind25_20yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
points(2.75,1-apply(SD_M_N5000_Ind25_ckmrmultinom5,1,median,na.rm=TRUE)[2]/apply(SD_M_N5000_Ind25_5yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, cex=1.25,col=4)
points(3,1-apply(SD_M_N5000_Ind25_ckmrmultinom10,1,median,na.rm=TRUE)[2]/apply(SD_M_N5000_Ind25_10yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
points(3.25,1-apply(SD_M_N5000_Ind25_ckmrmultinom20,1,median,na.rm=TRUE)[2]/apply(SD_M_N5000_Ind25_20yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
#R0
points(0.8,1-apply(SD_R0_N100_Ind25_ckmrmultinom5,1,median,na.rm=TRUE)[2]/apply(SD_R0_N100_Ind25_5yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, cex=1.25, col=2)
points(1.05,1-apply(SD_R0_N100_Ind25_ckmrmultinom10,1,median,na.rm=TRUE)[2]/apply(SD_R0_N100_Ind25_10yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(1.3,1-apply(SD_R0_N100_Ind25_ckmrmultinom20,1,median,na.rm=TRUE)[2]/apply(SD_R0_N100_Ind25_20yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(1.8,1-apply(SD_R0_N1000_Ind25_ckmrmultinom5,1,median,na.rm=TRUE)[2]/apply(SD_R0_N1000_Ind25_5yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, cex=1.25,col=2)
points(2.05,1-apply(SD_R0_N1000_Ind25_ckmrmultinom10,1,median,na.rm=TRUE)[2]/apply(SD_R0_N1000_Ind25_10yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(2.3,1-apply(SD_R0_N1000_Ind25_ckmrmultinom20,1,median,na.rm=TRUE)[2]/apply(SD_R0_N1000_Ind25_20yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(2.8,1-apply(SD_R0_N5000_Ind25_ckmrmultinom5,1,median,na.rm=TRUE)[2]/apply(SD_R0_N5000_Ind25_5yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(3.05,1-apply(SD_R0_N5000_Ind25_ckmrmultinom10,1,median,na.rm=TRUE)[2]/apply(SD_R0_N5000_Ind25_10yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(3.3,1-apply(SD_R0_N5000_Ind25_ckmrmultinom20,1,median,na.rm=TRUE)[2]/apply(SD_R0_N5000_Ind25_20yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)

#Sardine
plot(0.75,1-apply(SD_M_N100_Ind25_ckmrmultinom5,1,median,na.rm=TRUE)[3]/apply(SD_M_N100_Ind25_5yrs_noCKMR,1,median,na.rm=TRUE)[3], ylim=c(-0.1,0.8), yaxt="n", col=4, las=1, ylab="", xaxt="n", pch=16, main="", xlab="",xlim=c(0.65,3.35),cex=1.25, cex.axis=1.35)
axis(side=2, at=seq(0,0.8,0.2), labels=seq(0,80,20), las=1, cex.axis=1.3)
axis(side=1, at=c(0.775,1.025,1.275), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.35)
axis(side=1, at=c(1.775,2.025,2.275), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.35)
axis(side=1, at=c(2.775,3.025,3.275), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.35)
mtext(side=3, text="Sardine", line=-2, font=2, cex=1.35)
abline(h=0, lty=2)
points(1,1-apply(SD_M_N100_Ind25_ckmrmultinom10,1,median,na.rm=TRUE)[3]/apply(SD_M_N100_Ind25_10yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
points(1.25,1-apply(SD_M_N100_Ind25_ckmrmultinom20,1,median,na.rm=TRUE)[3]/apply(SD_M_N100_Ind25_20yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
points(1.75,1-apply(SD_M_N1000_Ind25_ckmrmultinom5,1,median,na.rm=TRUE)[3]/apply(SD_M_N1000_Ind25_5yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, cex=1.25, col=4)
points(2.,1-apply(SD_M_N1000_Ind25_ckmrmultinom10,1,median,na.rm=TRUE)[3]/apply(SD_M_N1000_Ind25_10yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
points(2.25,1-apply(SD_M_N1000_Ind25_ckmrmultinom20,1,median,na.rm=TRUE)[3]/apply(SD_M_N1000_Ind25_20yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
points(2.75,1-apply(SD_M_N5000_Ind25_ckmrmultinom5,1,median,na.rm=TRUE)[3]/apply(SD_M_N5000_Ind25_5yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, cex=1.25,col=4)
points(3.,1-apply(SD_M_N5000_Ind25_ckmrmultinom10,1,median,na.rm=TRUE)[3]/apply(SD_M_N5000_Ind25_10yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
points(3.25,1-apply(SD_M_N5000_Ind25_ckmrmultinom20,1,median,na.rm=TRUE)[3]/apply(SD_M_N5000_Ind25_20yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
#R0
points(0.8,1-apply(SD_R0_N100_Ind25_ckmrmultinom5,1,median,na.rm=TRUE)[3]/apply(SD_R0_N100_Ind25_5yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, cex=1.25, col=2)
points(1.05,1-apply(SD_R0_N100_Ind25_ckmrmultinom10,1,median,na.rm=TRUE)[3]/apply(SD_R0_N100_Ind25_10yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
points(1.3,1-apply(SD_R0_N100_Ind25_ckmrmultinom20,1,median,na.rm=TRUE)[3]/apply(SD_R0_N100_Ind25_20yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
points(1.8,1-apply(SD_R0_N1000_Ind25_ckmrmultinom5,1,median,na.rm=TRUE)[3]/apply(SD_R0_N1000_Ind25_5yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, cex=1.25,col=2)
points(2.05,1-apply(SD_R0_N1000_Ind25_ckmrmultinom10,1,median,na.rm=TRUE)[3]/apply(SD_R0_N1000_Ind25_10yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
points(2.3,1-apply(SD_R0_N1000_Ind25_ckmrmultinom20,1,median,na.rm=TRUE)[3]/apply(SD_R0_N1000_Ind25_20yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
points(2.8,1-apply(SD_R0_N5000_Ind25_ckmrmultinom5,1,median,na.rm=TRUE)[3]/apply(SD_R0_N5000_Ind25_5yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
points(3.05,1-apply(SD_R0_N5000_Ind25_ckmrmultinom10,1,median,na.rm=TRUE)[3]/apply(SD_R0_N5000_Ind25_10yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
mtext(side=1, text="Number of Years of CKMR Collection", line=3.5, cex=1.2)
points(3.3,1-apply(SD_R0_N5000_Ind25_ckmrmultinom20,1,median,na.rm=TRUE)[3]/apply(SD_R0_N5000_Ind25_20yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
#dev.off()


#####################
#Median ARE SSB
#####################
#tiff(filename="C:/Users/fischn/Documents/GitHub/CKMR_Project/ARE_SSB_025.tiff", height=25, width=35, units='cm', compression="lzw", res=500)
par(mfrow=c(3,3), mar=c(1,1,1.25,0.5), oma=c(3.5,4.5,1.5,1))
#Cod
#100
plot(1:76,1-apply(abs(RE_ssb_N100_Ind25_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N100_Ind25_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,], yaxt="n", pch=16,col=2, las=1, ylim=c(-0.25,1), ylab="", xlab="", main="100 CKMR Samples",xaxt="n", xlim=c(0,250),bty="[", cex.axis=1.3, cex.main=1.5)
axis(side=2, at=seq(-0.2,1,0.2), labels=seq(-20,100,20), las=1, cex.axis=1.3)
lines(67:76,rep(mean(c(1-apply(abs(RE_ssb_N100_Ind25_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N100_Ind25_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,])[67:76]),10), lwd=4, col=4)
points(86:161,1-apply(abs(RE_ssb_N100_Ind25_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N100_Ind25_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,], pch=16, col=2)
lines(152:161,rep(mean(c(1-apply(abs(RE_ssb_N100_Ind25_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N100_Ind25_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,])[67:76]),10), lwd=4, col=4)
points(171:246,1-apply(abs(RE_ssb_N100_Ind25_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N100_Ind25_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,], pch=16, col=2)
lines(237:246,rep(mean(c(1-apply(abs(RE_ssb_N100_Ind25_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N100_Ind25_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,])[67:76]),10), lwd=4, col=4)
abline(h=0, lty=2)

#1000
plot(1:76,1-apply(abs(RE_ssb_N1000_Ind25_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N1000_Ind25_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,], pch=16, col=2,las=1, ylim=c(-0.25,1), ylab="", xlab="", main="1,000 CKMR Samples",xaxt="n",  xlim=c(0,250),yaxt="n",bty="n", cex.main=1.5)
lines(67:76,rep(mean(c(1-apply(abs(RE_ssb_N1000_Ind25_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N1000_Ind25_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,])[67:76]),10), lwd=4, col=4)
points(86:161,1-apply(abs(RE_ssb_N1000_Ind25_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N1000_Ind25_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,], pch=16, col=2)
lines(152:161,rep(mean(c(1-apply(abs(RE_ssb_N1000_Ind25_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N1000_Ind25_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,])[67:76]),10), lwd=4, col=4)
points(171:246,1-apply(abs(RE_ssb_N1000_Ind25_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N1000_Ind25_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,], pch=16, col=2)
lines(237:246,rep(mean(c(1-apply(abs(RE_ssb_N1000_Ind25_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N1000_Ind25_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,])[67:76]),10), lwd=4, col=4)
mtext(side=3, text="Cod", line=-2, font=2, cex=1.35)
axis(side=1,lwd.ticks = 0, labels=FALSE)
axis(side=3,lwd.ticks = 0, labels=FALSE)
legend(x=60,y=0.7,c("Mean of last 10 years"), lty=c(1), lwd=c(4),col=c(4), bty="n", cex=1.5)
mtext(text="        SD of Abundance Index = 0.25", side=3, line=-10)
abline(h=0, lty=2)

#5000
plot(1:76,1-apply(abs(RE_ssb_N5000_Ind25_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N5000_Ind25_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,], pch=16, col=2,las=1, ylim=c(-0.25,1), ylab="", xlab="", main="5,000 CKMR Samples",xaxt="n",  xlim=c(0,250),yaxt="n",bty="]", cex.main=1.5)
lines(67:76,rep(mean(c(1-apply(abs(RE_ssb_N5000_Ind25_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N5000_Ind25_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,])[67:76]),10), lwd=4, col=4)
points(86:161,1-apply(abs(RE_ssb_N5000_Ind25_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N5000_Ind25_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,], pch=16, col=2)
lines(152:161,rep(mean(c(1-apply(abs(RE_ssb_N5000_Ind25_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N5000_Ind25_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,])[67:76]),10), lwd=4, col=4)
points(171:246,1-apply(abs(RE_ssb_N5000_Ind25_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N5000_Ind25_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,], pch=16, col=2)
lines(237:246,rep(mean(c(1-apply(abs(RE_ssb_N5000_Ind25_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N5000_Ind25_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,])[67:76]),10), lwd=4, col=4)
abline(h=0, lty=2)

#Flatfish
#100
plot(1:76,1-apply(abs(RE_ssb_N100_Ind25_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N100_Ind25_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,], yaxt="n", pch=16, las=1, col=2,ylim=c(-0.25,1), ylab="", xlab="", main="",xaxt="n", xlim=c(0,250),bty="[", cex.axis=1.3, cex.main=1.2)
axis(side=2, at=seq(-0.2,1,0.2), labels=seq(-20,100,20), las=1, cex.axis=1.3)
lines(67:76,rep(mean(c(1-apply(abs(RE_ssb_N100_Ind25_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N100_Ind25_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,])[67:76]),10), lwd=4, col=4)
points(86:161,1-apply(abs(RE_ssb_N100_Ind25_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N100_Ind25_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,], pch=16, col=2)
lines(152:161,rep(mean(c(1-apply(abs(RE_ssb_N100_Ind25_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N100_Ind25_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,])[67:76]),10), lwd=4, col=4)
points(171:246,1-apply(abs(RE_ssb_N100_Ind25_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N100_Ind25_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,], pch=16, col=2)
lines(237:246,rep(mean(c(1-apply(abs(RE_ssb_N100_Ind25_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N100_Ind25_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,])[67:76]),10), lwd=4, col=4)
mtext(side=2, text="% Improvement = 100(1 - MARE with CKMR/MARE No CKMR)", line=3.5, cex=1.1)
abline(h=0, lty=2)

#1000
plot(1:76,1-apply(abs(RE_ssb_N1000_Ind25_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N1000_Ind25_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,], pch=16, col=2,las=1, ylim=c(-0.25,1), ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="n")
lines(67:76,rep(mean(c(1-apply(abs(RE_ssb_N1000_Ind25_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N1000_Ind25_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,])[67:76]),10), lwd=4, col=4)
points(86:161,1-apply(abs(RE_ssb_N1000_Ind25_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N1000_Ind25_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,], pch=16, col=2)
lines(152:161,rep(mean(c(1-apply(abs(RE_ssb_N1000_Ind25_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N1000_Ind25_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,])[67:76]),10), lwd=4, col=4)
points(171:246,1-apply(abs(RE_ssb_N1000_Ind25_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N1000_Ind25_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,], pch=16, col=2)
lines(237:246,rep(mean(c(1-apply(abs(RE_ssb_N1000_Ind25_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N1000_Ind25_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,])[67:76]),10), lwd=4, col=4)
mtext(side=3, text="Flatfish", line=-2, font=2, cex=1.35)
axis(side=1,lwd.ticks = 0, labels=FALSE)
axis(side=3,lwd.ticks = 0, labels=FALSE)
abline(h=0, lty=2)

#5000
plot(1:76,1-apply(abs(RE_ssb_N5000_Ind25_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N5000_Ind25_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,],  pch=16, col=2,las=1, ylim=c(-0.25,1), ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="]")
lines(67:76,rep(mean(c(1-apply(abs(RE_ssb_N5000_Ind25_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N5000_Ind25_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,])[67:76]),10), lwd=4, col=4)
points(86:161,1-apply(abs(RE_ssb_N5000_Ind25_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N5000_Ind25_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,], pch=16, col=2)
lines(152:161,rep(mean(c(1-apply(abs(RE_ssb_N5000_Ind25_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N5000_Ind25_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,])[67:76]),10), lwd=4, col=4)
points(171:246,1-apply(abs(RE_ssb_N5000_Ind25_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N5000_Ind25_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,], pch=16, col=2)
lines(237:246,rep(mean(c(1-apply(abs(RE_ssb_N5000_Ind25_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N5000_Ind25_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,])[67:76]),10), lwd=4, col=4)
abline(h=0, lty=2)

#Sardine
#100
plot(1:76,1-apply(abs(RE_ssb_N100_Ind25_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N100_Ind25_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,], yaxt="n", pch=16, las=1,col=2, ylim=c(-0.25,1), ylab="", xlab="", main="",xaxt="n", xlim=c(0,250), bty="[", cex.axis=1.3, cex.main=1.2)
axis(side=2, at=seq(-0.2,1,0.2), labels=seq(-20,100,20), las=1, cex.axis=1.3)
lines(67:76,rep(mean(c(1-apply(abs(RE_ssb_N100_Ind25_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N100_Ind25_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,])[67:76]),10), lwd=4, col=4)
points(86:161,1-apply(abs(RE_ssb_N100_Ind25_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N100_Ind25_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,], pch=16, col=2)
lines(152:161,rep(mean(c(1-apply(abs(RE_ssb_N100_Ind25_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N100_Ind25_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,])[67:76]),10), lwd=4, col=4)
points(171:246,1-apply(abs(RE_ssb_N100_Ind25_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N100_Ind25_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,], pch=16, col=2)
lines(237:246,rep(mean(c(1-apply(abs(RE_ssb_N100_Ind25_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N100_Ind25_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,])[67:76]),10), lwd=4, col=4)
axis(side=1, at=c(40,127,211), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.3)
abline(h=0, lty=2)

#1000
plot(1:76,1-apply(abs(RE_ssb_N1000_Ind25_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N1000_Ind25_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,], pch=16, col=2,las=1, ylim=c(-0.25,1), cex.axis=1.3, ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="n")
lines(67:76,rep(mean(c(1-apply(abs(RE_ssb_N1000_Ind25_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N1000_Ind25_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,])[67:76]),10), lwd=4, col=4)
points(86:161,1-apply(abs(RE_ssb_N1000_Ind25_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N1000_Ind25_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,], pch=16, col=2)
lines(152:161,rep(mean(c(1-apply(abs(RE_ssb_N1000_Ind25_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N1000_Ind25_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,])[67:76]),10), lwd=4, col=4)
points(171:246,1-apply(abs(RE_ssb_N1000_Ind25_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N1000_Ind25_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,], pch=16, col=2)
lines(237:246,rep(mean(c(1-apply(abs(RE_ssb_N1000_Ind25_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N1000_Ind25_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,])[67:76]),10), lwd=4, col=4)
axis(side=1, at=c(40,127,211), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.3)
mtext(side=3, text="Sardine", line=-2, font=2, cex=1.35)
mtext(side=1, text="Number of Years of CKMR Collection", line=3.25, cex=1.2)
axis(side=1,lwd.ticks = 0, labels=FALSE)
axis(side=3,lwd.ticks = 0, labels=FALSE)
abline(h=0, lty=2)

#5000
plot(1:76,1-apply(abs(RE_ssb_N5000_Ind25_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N5000_Ind25_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,], pch=16, col=2,las=1, ylim=c(-0.25,1), cex.axis=1.3, ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="]")
lines(67:76,rep(mean(c(1-apply(abs(RE_ssb_N5000_Ind25_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N5000_Ind25_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,])[67:76]),10), lwd=4, col=4)
points(86:161,1-apply(abs(RE_ssb_N5000_Ind25_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N5000_Ind25_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,], pch=16, col=2)
lines(152:161,rep(mean(c(1-apply(abs(RE_ssb_N5000_Ind25_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N5000_Ind25_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,])[67:76]),10), lwd=4, col=4)
points(171:246,1-apply(abs(RE_ssb_N5000_Ind25_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N5000_Ind25_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,], pch=16, col=2)
lines(237:246,rep(mean(c(1-apply(abs(RE_ssb_N5000_Ind25_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N5000_Ind25_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,])[67:76]),10), lwd=4, col=4)
axis(side=1, at=c(40,127,211), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.3)
abline(h=0, lty=2)
#dev.off()


############
#M & R0
############
#tiff(filename="C:/Users/fischn/Documents/GitHub/CKMR_Project/ARE_M_R0_025.tiff", height=30, width=20, units='cm', compression="lzw", res=500)
par(mfcol=c(3,1), mar=c(2.25,1,0.25,0.5), oma=c(4,4,1.5,1))
#Index 0.5###################
#Median SEs of M and R0
#Cod
plot(0.75,1-apply(abs(RE_M_N100_Ind25_ckmrmultinom5),2,median,na.rm=TRUE)[1]/apply(abs(RE_M_N100_Ind25_5yrs_noCKMR),2,median,na.rm=TRUE)[1],  yaxt="n",ylim=c(-0.2,0.8), las=1, ylab="", xaxt="n", pch=16, main="", xlab="",xlim=c(0.65,3.35),cex=1.25, col=4, cex.axis=1.35)
axis(side=2, at=seq(-0.2,0.8,0.2), labels=seq(-20,80,20), las=1, cex.axis=1.3)
mtext(side=3, text="Cod", line=-2, font=2, cex=1.35)
legend(x=1.65,0.6, y=, c("Natural Mortality", "Unfished Recruitment"), pch=16, col=c(4,2), bty="n", cex=1.35)
mtext(text="  SD of Abundance Index = 0.25", side=3, line=-12)
abline(h=0, lty=2)
points(1,1-apply(abs(RE_M_N100_Ind25_ckmrmultinom10),2,median,na.rm=TRUE)[1]/apply(abs(RE_M_N100_Ind25_10yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
points(1.25,1-apply(abs(RE_M_N100_Ind25_ckmrmultinom20),2,median,na.rm=TRUE)[1]/apply(abs(RE_M_N100_Ind25_20yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
points(1.75,1-apply(abs(RE_M_N1000_Ind25_ckmrmultinom5),2,median,na.rm=TRUE)[1]/apply(abs(RE_M_N1000_Ind25_5yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, cex=1.25, col=4)
points(2,1-apply(abs(RE_M_N1000_Ind25_ckmrmultinom10),2,median,na.rm=TRUE)[1]/apply(abs(RE_M_N1000_Ind25_10yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
points(2.25,1-apply(abs(RE_M_N1000_Ind25_ckmrmultinom20),2,median,na.rm=TRUE)[1]/apply(abs(RE_M_N1000_Ind25_20yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
points(2.75,1-apply(abs(RE_M_N5000_Ind25_ckmrmultinom5),2,median,na.rm=TRUE)[1]/apply(abs(RE_M_N5000_Ind25_5yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, cex=1.25,col=4)
points(3,1-apply(abs(RE_M_N5000_Ind25_ckmrmultinom10),2,median,na.rm=TRUE)[1]/apply(abs(RE_M_N5000_Ind25_10yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
points(3.25,1-apply(abs(RE_M_N5000_Ind25_ckmrmultinom20),2,median,na.rm=TRUE)[1]/apply(abs(RE_M_N5000_Ind25_20yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
mtext(side=3, at=1, line=0, text="100 CKMR Samples")
mtext(side=3, line=0, text="1,000 CKMR Samples")
mtext(side=3, at=3, line=0, text="5,000 CKMR Samples")
#R0
points(0.8,1-apply(abs(RE_R0_N100_Ind25_ckmrmultinom5),2,median,na.rm=TRUE)[1]/apply(abs(RE_R0_N100_Ind25_5yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, cex=1.25, col=2)
points(1.05,1-apply(abs(RE_R0_N100_Ind25_ckmrmultinom10),2,median,na.rm=TRUE)[1]/apply(abs(RE_R0_N100_Ind25_10yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(1.3,1-apply(abs(RE_R0_N100_Ind25_ckmrmultinom20),2,median,na.rm=TRUE)[1]/apply(abs(RE_R0_N100_Ind25_20yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(1.8,1-apply(abs(RE_R0_N1000_Ind25_ckmrmultinom5),2,median,na.rm=TRUE)[1]/apply(abs(RE_R0_N1000_Ind25_5yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, cex=1.25,col=2)
points(2.05,1-apply(abs(RE_R0_N1000_Ind25_ckmrmultinom10),2,median,na.rm=TRUE)[1]/apply(abs(RE_R0_N1000_Ind25_10yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(2.3,1-apply(abs(RE_R0_N1000_Ind25_ckmrmultinom20),2,median,na.rm=TRUE)[1]/apply(abs(RE_R0_N1000_Ind25_20yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(2.8,1-apply(abs(RE_R0_N5000_Ind25_ckmrmultinom5),2,median,na.rm=TRUE)[1]/apply(abs(RE_R0_N5000_Ind25_5yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(3.05,1-apply(abs(RE_R0_N5000_Ind25_ckmrmultinom10),2,median,na.rm=TRUE)[1]/apply(abs(RE_R0_N5000_Ind25_10yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(3.3,1-apply(abs(RE_R0_N5000_Ind25_ckmrmultinom20),2,median,na.rm=TRUE)[1]/apply(abs(RE_R0_N5000_Ind25_20yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)

#Flatfish
plot(0.75,1-apply(abs(RE_M_N100_Ind25_ckmrmultinom5),2,median,na.rm=TRUE)[2]/apply(abs(RE_M_N100_Ind25_5yrs_noCKMR),2,median,na.rm=TRUE)[2], yaxt="n", ylim=c(-0.2,0.8), col=4,las=1, ylab="", xaxt="n", pch=16, main="", xlab="",xlim=c(0.65,3.35),cex=1.25, cex.axis=1.35)
axis(side=2, at=seq(-0.2,0.8,0.2), labels=seq(-20,80,20), las=1, cex.axis=1.3)
mtext(side=2, text="% Improvement = 100(1 - MARE with CKMR/MARE No CKMR)", line=3.5)
mtext(side=3, text="Flatfish", line=-2, font=2, cex=1.35)
abline(h=0, lty=2)
points(1,1-apply(abs(RE_M_N100_Ind25_ckmrmultinom10),2,median,na.rm=TRUE)[2]/apply(abs(RE_M_N100_Ind25_10yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
points(1.25,1-apply(abs(RE_M_N100_Ind25_ckmrmultinom20),2,median,na.rm=TRUE)[2]/apply(abs(RE_M_N100_Ind25_20yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
points(1.75,1-apply(abs(RE_M_N1000_Ind25_ckmrmultinom5),2,median,na.rm=TRUE)[2]/apply(abs(RE_M_N1000_Ind25_5yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, cex=1.25, col=4)
points(2,1-apply(abs(RE_M_N1000_Ind25_ckmrmultinom10),2,median,na.rm=TRUE)[2]/apply(abs(RE_M_N1000_Ind25_10yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
points(2.25,1-apply(abs(RE_M_N1000_Ind25_ckmrmultinom20),2,median,na.rm=TRUE)[2]/apply(abs(RE_M_N1000_Ind25_20yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
points(2.75,1-apply(abs(RE_M_N5000_Ind25_ckmrmultinom5),2,median,na.rm=TRUE)[2]/apply(abs(RE_M_N5000_Ind25_5yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, cex=1.25,col=4)
points(3,1-apply(abs(RE_M_N5000_Ind25_ckmrmultinom10),2,median,na.rm=TRUE)[2]/apply(abs(RE_M_N5000_Ind25_10yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
points(3.25,1-apply(abs(RE_M_N5000_Ind25_ckmrmultinom20),2,median,na.rm=TRUE)[2]/apply(abs(RE_M_N5000_Ind25_20yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
#R0
points(0.8,1-apply(abs(RE_R0_N100_Ind25_ckmrmultinom5),2,median,na.rm=TRUE)[2]/apply(abs(RE_R0_N100_Ind25_5yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, cex=1.25, col=2)
points(1.05,1-apply(abs(RE_R0_N100_Ind25_ckmrmultinom10),2,median,na.rm=TRUE)[2]/apply(abs(RE_R0_N100_Ind25_10yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(1.3,1-apply(abs(RE_R0_N100_Ind25_ckmrmultinom20),2,median,na.rm=TRUE)[2]/apply(abs(RE_R0_N100_Ind25_20yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(1.8,1-apply(abs(RE_R0_N1000_Ind25_ckmrmultinom5),2,median,na.rm=TRUE)[2]/apply(abs(RE_R0_N1000_Ind25_5yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, cex=1.25,col=2)
points(2.05,1-apply(abs(RE_R0_N1000_Ind25_ckmrmultinom10),2,median,na.rm=TRUE)[2]/apply(abs(RE_R0_N1000_Ind25_10yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(2.3,1-apply(abs(RE_R0_N1000_Ind25_ckmrmultinom20),2,median,na.rm=TRUE)[2]/apply(abs(RE_R0_N1000_Ind25_20yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(2.8,1-apply(abs(RE_R0_N5000_Ind25_ckmrmultinom5),2,median,na.rm=TRUE)[2]/apply(abs(RE_R0_N5000_Ind25_5yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(3.05,1-apply(abs(RE_R0_N5000_Ind25_ckmrmultinom10),2,median,na.rm=TRUE)[2]/apply(abs(RE_R0_N5000_Ind25_10yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(3.3,1-apply(abs(RE_R0_N5000_Ind25_ckmrmultinom20),2,median,na.rm=TRUE)[2]/apply(abs(RE_R0_N5000_Ind25_20yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)

#Sardine
plot(0.75,1-apply(abs(RE_M_N100_Ind25_ckmrmultinom5),2,median,na.rm=TRUE)[3]/apply(abs(RE_M_N100_Ind25_5yrs_noCKMR),2,median,na.rm=TRUE)[3],  yaxt="n",ylim=c(-0.2,0.8), col=4, las=1, ylab="", xaxt="n", pch=16, main="", xlab="",xlim=c(0.65,3.35),cex=1.25, cex.axis=1.35)
axis(side=2, at=seq(-0.2,0.8,0.2), labels=seq(-20,80,20), las=1, cex.axis=1.3)
axis(side=1, at=c(0.775,1.025,1.275), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.35)
axis(side=1, at=c(1.775,2.025,2.275), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.35)
axis(side=1, at=c(2.775,3.025,3.275), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.35)
mtext(side=3, text="Sardine", line=-2, font=2, cex=1.35)
abline(h=0, lty=2)
points(1,1-apply(abs(RE_M_N100_Ind25_ckmrmultinom10),2,median,na.rm=TRUE)[3]/apply(abs(RE_M_N100_Ind25_10yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
points(1.25,1-apply(abs(RE_M_N100_Ind25_ckmrmultinom20),2,median,na.rm=TRUE)[3]/apply(abs(RE_M_N100_Ind25_20yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
points(1.75,1-apply(abs(RE_M_N1000_Ind25_ckmrmultinom5),2,median,na.rm=TRUE)[3]/apply(abs(RE_M_N1000_Ind25_5yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, cex=1.25, col=4)
points(2.,1-apply(abs(RE_M_N1000_Ind25_ckmrmultinom10),2,median,na.rm=TRUE)[3]/apply(abs(RE_M_N1000_Ind25_10yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
points(2.25,1-apply(abs(RE_M_N1000_Ind25_ckmrmultinom20),2,median,na.rm=TRUE)[3]/apply(abs(RE_M_N1000_Ind25_20yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
points(2.75,1-apply(abs(RE_M_N5000_Ind25_ckmrmultinom5),2,median,na.rm=TRUE)[3]/apply(abs(RE_M_N5000_Ind25_5yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, cex=1.25,col=4)
points(3.,1-apply(abs(RE_M_N5000_Ind25_ckmrmultinom10),2,median,na.rm=TRUE)[3]/apply(abs(RE_M_N5000_Ind25_10yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
points(3.25,1-apply(abs(RE_M_N5000_Ind25_ckmrmultinom20),2,median,na.rm=TRUE)[3]/apply(abs(RE_M_N5000_Ind25_20yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
#R0
points(0.8,1-apply(abs(RE_R0_N100_Ind25_ckmrmultinom5),2,median,na.rm=TRUE)[3]/apply(abs(RE_R0_N100_Ind25_5yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, cex=1.25, col=2)
points(1.05,1-apply(abs(RE_R0_N100_Ind25_ckmrmultinom10),2,median,na.rm=TRUE)[3]/apply(abs(RE_R0_N100_Ind25_10yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
points(1.3,1-apply(abs(RE_R0_N100_Ind25_ckmrmultinom20),2,median,na.rm=TRUE)[3]/apply(abs(RE_R0_N100_Ind25_20yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
points(1.8,1-apply(abs(RE_R0_N1000_Ind25_ckmrmultinom5),2,median,na.rm=TRUE)[3]/apply(abs(RE_R0_N1000_Ind25_5yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, cex=1.25,col=2)
points(2.05,1-apply(abs(RE_R0_N1000_Ind25_ckmrmultinom10),2,median,na.rm=TRUE)[3]/apply(abs(RE_R0_N1000_Ind25_10yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
points(2.3,1-apply(abs(RE_R0_N1000_Ind25_ckmrmultinom20),2,median,na.rm=TRUE)[3]/apply(abs(RE_R0_N1000_Ind25_20yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
points(2.8,1-apply(abs(RE_R0_N5000_Ind25_ckmrmultinom5),2,median,na.rm=TRUE)[3]/apply(abs(RE_R0_N5000_Ind25_5yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
points(3.05,1-apply(abs(RE_R0_N5000_Ind25_ckmrmultinom10),2,median,na.rm=TRUE)[3]/apply(abs(RE_R0_N5000_Ind25_10yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
mtext(side=1, text="Number of Years of CKMR Collection", line=3.5, cex=1.2)
points(3.3,1-apply(abs(RE_R0_N5000_Ind25_ckmrmultinom20),2,median,na.rm=TRUE)[3]/apply(abs(RE_R0_N5000_Ind25_20yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
#dev.off()


########################################
#IQR of SSB RE Precision between
########################################
#tiff(filename="C:/Users/fischn/Documents/GitHub/CKMR_Project/IQR_SSB_025.tiff", height=25, width=35, units='cm', compression="lzw", res=500)
par(mfrow=c(3,3), mar=c(1,1,1.25,0.5), oma=c(3.5,4.5,1.5,1))
#Cod
#100
plot(1:76,1-IQR_RE_ssb_N100_Ind25_ckmrmultinom5[1,]/IQR_RE_ssb_N100_Ind25_5yrs_noCKMR[1,], pch=16,col=2, las=1, ylim=c(-0.25,1), ylab="", xlab="", main="100 CKMR Samples",xaxt="n", xlim=c(0,250),bty="[", cex.axis=1.3, cex.main=1.5)
lines(67:76,rep(mean(c(1-IQR_RE_ssb_N100_Ind25_ckmrmultinom5[1,]/IQR_RE_ssb_N100_Ind25_5yrs_noCKMR[1,])[67:76]),10), lwd=4, col=4)
points(86:161,1-IQR_RE_ssb_N100_Ind25_ckmrmultinom10[1,]/IQR_RE_ssb_N100_Ind25_10yrs_noCKMR[1,], pch=16, col=2)
lines(152:161,rep(mean(c(1-IQR_RE_ssb_N100_Ind25_ckmrmultinom10[1,]/IQR_RE_ssb_N100_Ind25_10yrs_noCKMR[1,])[67:76]),10), lwd=4, col=4)
points(171:246,1-IQR_RE_ssb_N100_Ind25_ckmrmultinom20[1,]/IQR_RE_ssb_N100_Ind25_20yrs_noCKMR[1,], pch=16, col=2)
lines(237:246,rep(mean(c(1-IQR_RE_ssb_N100_Ind25_ckmrmultinom20[1,]/IQR_RE_ssb_N100_Ind25_20yrs_noCKMR[1,])[67:76]),10), lwd=4, col=4)
abline(h=0, lty=2)

#1000
plot(1:76,1-IQR_RE_ssb_N1000_Ind25_ckmrmultinom5[1,]/IQR_RE_ssb_N1000_Ind25_5yrs_noCKMR[1,], pch=16, col=2,las=1, ylim=c(-0.25,1), ylab="", xlab="", main="1,000 CKMR Samples",xaxt="n",  xlim=c(0,250),yaxt="n",bty="n", cex.main=1.5)
lines(67:76,rep(mean(c(1-IQR_RE_ssb_N1000_Ind25_ckmrmultinom5[1,]/IQR_RE_ssb_N1000_Ind25_5yrs_noCKMR[1,])[67:76]),10), lwd=4, col=4)
points(86:161,1-IQR_RE_ssb_N1000_Ind25_ckmrmultinom10[1,]/IQR_RE_ssb_N1000_Ind25_10yrs_noCKMR[1,], pch=16, col=2)
lines(152:161,rep(mean(c(1-IQR_RE_ssb_N1000_Ind25_ckmrmultinom10[1,]/IQR_RE_ssb_N1000_Ind25_10yrs_noCKMR[1,])[67:76]),10), lwd=4, col=4)
points(171:246,1-IQR_RE_ssb_N1000_Ind25_ckmrmultinom20[1,]/IQR_RE_ssb_N1000_Ind25_20yrs_noCKMR[1,], pch=16, col=2)
lines(237:246,rep(mean(c(1-IQR_RE_ssb_N1000_Ind25_ckmrmultinom20[1,]/IQR_RE_ssb_N1000_Ind25_20yrs_noCKMR[1,])[67:76]),10), lwd=4, col=4)
mtext(side=3, text="Cod", line=-2, font=2, cex=1.35)
axis(side=1,lwd.ticks = 0, labels=FALSE)
axis(side=3,lwd.ticks = 0, labels=FALSE)
legend(x=60,y=0.7,c("Mean of last 10 years"), lty=c(1), lwd=c(4),col=c(4), bty="n", cex=1.5)
mtext(text="        SD of Abundance Index = 0.25", side=3, line=-10)
abline(h=0, lty=2)

#5000
plot(1:76,1-IQR_RE_ssb_N5000_Ind25_ckmrmultinom5[1,]/IQR_RE_ssb_N5000_Ind25_5yrs_noCKMR[1,], pch=16, col=2,las=1, ylim=c(-0.25,1), ylab="", xlab="", main="5,000 CKMR Samples",xaxt="n",  xlim=c(0,250),yaxt="n",bty="]", cex.main=1.5)
lines(67:76,rep(mean(c(1-IQR_RE_ssb_N5000_Ind25_ckmrmultinom5[1,]/IQR_RE_ssb_N5000_Ind25_5yrs_noCKMR[1,])[67:76]),10), lwd=4, col=4)
points(86:161,1-IQR_RE_ssb_N5000_Ind25_ckmrmultinom10[1,]/IQR_RE_ssb_N5000_Ind25_10yrs_noCKMR[1,], pch=16, col=2)
lines(152:161,rep(mean(c(1-IQR_RE_ssb_N5000_Ind25_ckmrmultinom10[1,]/IQR_RE_ssb_N5000_Ind25_10yrs_noCKMR[1,])[67:76]),10), lwd=4, col=4)
points(171:246,1-IQR_RE_ssb_N5000_Ind25_ckmrmultinom20[1,]/IQR_RE_ssb_N5000_Ind25_20yrs_noCKMR[1,], pch=16, col=2)
lines(237:246,rep(mean(c(1-IQR_RE_ssb_N5000_Ind25_ckmrmultinom20[1,]/IQR_RE_ssb_N5000_Ind25_20yrs_noCKMR[1,])[67:76]),10), lwd=4, col=4)
abline(h=0, lty=2)

#Flatfish
#100
plot(1:76,1-IQR_RE_ssb_N100_Ind25_ckmrmultinom5[2,]/IQR_RE_ssb_N100_Ind25_5yrs_noCKMR[2,], pch=16, las=1, col=2,ylim=c(-0.25,1), ylab="", xlab="", main="",xaxt="n", xlim=c(0,250),bty="[", cex.axis=1.3, cex.main=1.2)
lines(67:76,rep(mean(c(1-IQR_RE_ssb_N100_Ind25_ckmrmultinom5[2,]/IQR_RE_ssb_N100_Ind25_5yrs_noCKMR[2,])[67:76]),10), lwd=4, col=4)
points(86:161,1-IQR_RE_ssb_N100_Ind25_ckmrmultinom10[2,]/IQR_RE_ssb_N100_Ind25_10yrs_noCKMR[2,], pch=16, col=2)
lines(152:161,rep(mean(c(1-IQR_RE_ssb_N100_Ind25_ckmrmultinom10[2,]/IQR_RE_ssb_N100_Ind25_10yrs_noCKMR[2,])[67:76]),10), lwd=4, col=4)
points(171:246,1-IQR_RE_ssb_N100_Ind25_ckmrmultinom20[2,]/IQR_RE_ssb_N100_Ind25_20yrs_noCKMR[2,], pch=16, col=2)
lines(237:246,rep(mean(c(1-IQR_RE_ssb_N100_Ind25_ckmrmultinom20[2,]/IQR_RE_ssb_N100_Ind25_20yrs_noCKMR[2,])[67:76]),10), lwd=4, col=4)
mtext(side=2, text="% Improvement = 100(1 - IQR SSB RE with CKMR/IQR SSB RE No CKMR)", line=3.5, cex=1.1)
abline(h=0, lty=2)

#1000
plot(1:76,1-IQR_RE_ssb_N1000_Ind25_ckmrmultinom5[2,]/IQR_RE_ssb_N1000_Ind25_5yrs_noCKMR[2,], pch=16, col=2,las=1, ylim=c(-0.25,1), ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="n")
lines(67:76,rep(mean(c(1-IQR_RE_ssb_N1000_Ind25_ckmrmultinom5[2,]/IQR_RE_ssb_N1000_Ind25_5yrs_noCKMR[2,])[67:76]),10), lwd=4, col=4)
points(86:161,1-IQR_RE_ssb_N1000_Ind25_ckmrmultinom10[2,]/IQR_RE_ssb_N1000_Ind25_10yrs_noCKMR[2,], pch=16, col=2)
lines(152:161,rep(mean(c(1-IQR_RE_ssb_N1000_Ind25_ckmrmultinom10[2,]/IQR_RE_ssb_N1000_Ind25_10yrs_noCKMR[2,])[67:76]),10), lwd=4, col=4)
points(171:246,1-IQR_RE_ssb_N1000_Ind25_ckmrmultinom20[2,]/IQR_RE_ssb_N1000_Ind25_20yrs_noCKMR[2,], pch=16, col=2)
lines(237:246,rep(mean(c(1-IQR_RE_ssb_N1000_Ind25_ckmrmultinom20[2,]/IQR_RE_ssb_N1000_Ind25_20yrs_noCKMR[2,])[67:76]),10), lwd=4, col=4)
mtext(side=3, text="Flatfish", line=-2, font=2, cex=1.35)
axis(side=1,lwd.ticks = 0, labels=FALSE)
axis(side=3,lwd.ticks = 0, labels=FALSE)
abline(h=0, lty=2)

#5000
plot(1:76,1-IQR_RE_ssb_N5000_Ind25_ckmrmultinom5[2,]/IQR_RE_ssb_N5000_Ind25_5yrs_noCKMR[2,], pch=16, col=2,las=1, ylim=c(-0.25,1), ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="]")
lines(67:76,rep(mean(c(1-IQR_RE_ssb_N5000_Ind25_ckmrmultinom5[2,]/IQR_RE_ssb_N5000_Ind25_5yrs_noCKMR[2,])[67:76]),10), lwd=4, col=4)
points(86:161,1-IQR_RE_ssb_N5000_Ind25_ckmrmultinom10[2,]/IQR_RE_ssb_N5000_Ind25_10yrs_noCKMR[2,], pch=16, col=2)
lines(152:161,rep(mean(c(1-IQR_RE_ssb_N5000_Ind25_ckmrmultinom10[2,]/IQR_RE_ssb_N5000_Ind25_10yrs_noCKMR[2,])[67:76]),10), lwd=4, col=4)
points(171:246,1-IQR_RE_ssb_N5000_Ind25_ckmrmultinom20[2,]/IQR_RE_ssb_N5000_Ind25_20yrs_noCKMR[2,], pch=16, col=2)
lines(237:246,rep(mean(c(1-IQR_RE_ssb_N5000_Ind25_ckmrmultinom20[2,]/IQR_RE_ssb_N5000_Ind25_20yrs_noCKMR[2,])[67:76]),10), lwd=4, col=4)
abline(h=0, lty=2)

#Sardine
#100
plot(1:76,1-IQR_RE_ssb_N100_Ind25_ckmrmultinom5[3,]/IQR_RE_ssb_N100_Ind25_5yrs_noCKMR[3,], pch=16, las=1,col=2, ylim=c(-0.25,1), ylab="", xlab="", main="",xaxt="n", xlim=c(0,250), bty="[", cex.axis=1.3, cex.main=1.2)
lines(67:76,rep(mean(c(1-IQR_RE_ssb_N100_Ind25_ckmrmultinom5[3,]/IQR_RE_ssb_N100_Ind25_5yrs_noCKMR[3,])[67:76]),10), lwd=4, col=4)
points(86:161,1-IQR_RE_ssb_N100_Ind25_ckmrmultinom10[3,]/IQR_RE_ssb_N100_Ind25_10yrs_noCKMR[3,], pch=16, col=2)
lines(152:161,rep(mean(c(1-IQR_RE_ssb_N100_Ind25_ckmrmultinom10[3,]/IQR_RE_ssb_N100_Ind25_10yrs_noCKMR[3,])[67:76]),10), lwd=4, col=4)
points(171:246,1-IQR_RE_ssb_N100_Ind25_ckmrmultinom20[3,]/IQR_RE_ssb_N100_Ind25_20yrs_noCKMR[3,], pch=16, col=2)
lines(237:246,rep(mean(c(1-IQR_RE_ssb_N100_Ind25_ckmrmultinom20[3,]/IQR_RE_ssb_N100_Ind25_20yrs_noCKMR[3,])[67:76]),10), lwd=4, col=4)
axis(side=1, at=c(40,127,211), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.3)
abline(h=0, lty=2)

#1000
plot(1:76,1-IQR_RE_ssb_N1000_Ind25_ckmrmultinom5[3,]/IQR_RE_ssb_N1000_Ind25_5yrs_noCKMR[3,], pch=16, col=2,las=1, ylim=c(-0.25,1), cex.axis=1.3, ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="n")
lines(67:76,rep(mean(c(1-IQR_RE_ssb_N1000_Ind25_ckmrmultinom5[3,]/IQR_RE_ssb_N1000_Ind25_5yrs_noCKMR[3,])[67:76]),10), lwd=4, col=4)
points(86:161,1-IQR_RE_ssb_N1000_Ind25_ckmrmultinom10[3,]/IQR_RE_ssb_N1000_Ind25_10yrs_noCKMR[3,], pch=16, col=2)
lines(152:161,rep(mean(c(1-IQR_RE_ssb_N1000_Ind25_ckmrmultinom10[3,]/IQR_RE_ssb_N1000_Ind25_10yrs_noCKMR[3,])[67:76]),10), lwd=4, col=4)
points(171:246,1-IQR_RE_ssb_N1000_Ind25_ckmrmultinom20[3,]/IQR_RE_ssb_N1000_Ind25_20yrs_noCKMR[3,], pch=16, col=2)
lines(237:246,rep(mean(c(1-IQR_RE_ssb_N1000_Ind25_ckmrmultinom20[3,]/IQR_RE_ssb_N1000_Ind25_20yrs_noCKMR[3,])[67:76]),10), lwd=4, col=4)
axis(side=1, at=c(40,127,211), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.3)
mtext(side=3, text="Sardine", line=-2, font=2, cex=1.35)
mtext(side=1, text="Number of Years of CKMR Collection", line=3.25, cex=1.2)
axis(side=1,lwd.ticks = 0, labels=FALSE)
axis(side=3,lwd.ticks = 0, labels=FALSE)
abline(h=0, lty=2)

#5000
plot(1:76,1-IQR_RE_ssb_N5000_Ind25_ckmrmultinom5[3,]/IQR_RE_ssb_N5000_Ind25_5yrs_noCKMR[3,], pch=16, col=2,las=1, ylim=c(-0.25,1), cex.axis=1.3, ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="]")
lines(67:76,rep(mean(c(1-IQR_RE_ssb_N5000_Ind25_ckmrmultinom5[3,]/IQR_RE_ssb_N5000_Ind25_5yrs_noCKMR[3,])[67:76]),10), lwd=4, col=4)
points(86:161,1-IQR_RE_ssb_N5000_Ind25_ckmrmultinom10[3,]/IQR_RE_ssb_N5000_Ind25_10yrs_noCKMR[3,], pch=16, col=2)
lines(152:161,rep(mean(c(1-IQR_RE_ssb_N5000_Ind25_ckmrmultinom10[3,]/IQR_RE_ssb_N5000_Ind25_10yrs_noCKMR[3,])[67:76]),10), lwd=4, col=4)
points(171:246,1-IQR_RE_ssb_N5000_Ind25_ckmrmultinom20[3,]/IQR_RE_ssb_N5000_Ind25_20yrs_noCKMR[3,], pch=16, col=2)
lines(237:246,rep(mean(c(1-IQR_RE_ssb_N5000_Ind25_ckmrmultinom20[3,]/IQR_RE_ssb_N5000_Ind25_20yrs_noCKMR[3,])[67:76]),10), lwd=4, col=4)
axis(side=1, at=c(40,127,211), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.3)
abline(h=0, lty=2)
#dev.off()

#################################
#M and R0
#################################
#tiff(filename="C:/Users/fischn/Documents/GitHub/CKMR_Project/IQR_M_R0_025.tiff", height=30, width=20, units='cm', compression="lzw", res=500)
par(mfcol=c(3,1), mar=c(2.25,1,0.25,0.5), oma=c(4,4,1.5,1))
#Index 0.5###################
#Median SEs of M and R0
#Cod
plot(0.75,1-IQR_RE_M_N100_Ind25_ckmrmultinom5[1]/IQR_RE_M_N100_Ind25_5yrs_noCKMR[1], ylim=c(-0.2,0.8), las=1, ylab="", xaxt="n", pch=16, main="", xlab="",xlim=c(0.65,3.35),cex=1.25, col=4, cex.axis=1.35)
mtext(side=3, text="Cod", line=-2, font=2, cex=1.35)
legend(x=1.65,0.6, y=, c("Natural Mortality", "Unfished Recruitment"), pch=16, col=c(4,2), bty="n", cex=1.35)
mtext(text="  SD of Abundance Index = 0.25", side=3, line=-12)
abline(h=0, lty=2)
points(1,1-IQR_RE_M_N100_Ind25_ckmrmultinom10[1]/IQR_RE_M_N100_Ind25_10yrs_noCKMR[1], pch=16, col=4,cex=1.25)
points(1.25,1-IQR_RE_M_N100_Ind25_ckmrmultinom20[1]/IQR_RE_M_N100_Ind25_20yrs_noCKMR[1], pch=16, col=4,cex=1.25)
points(1.75,1-IQR_RE_M_N1000_Ind25_ckmrmultinom5[1]/IQR_RE_M_N1000_Ind25_5yrs_noCKMR[1], pch=16, cex=1.25, col=4)
points(2,1-IQR_RE_M_N1000_Ind25_ckmrmultinom10[1]/IQR_RE_M_N1000_Ind25_10yrs_noCKMR[1], pch=16, col=4,cex=1.25)
points(2.25,1-IQR_RE_M_N1000_Ind25_ckmrmultinom20[1]/IQR_RE_M_N1000_Ind25_20yrs_noCKMR[1], pch=16, col=4,cex=1.25)
points(2.75,1-IQR_RE_M_N5000_Ind25_ckmrmultinom5[1]/IQR_RE_M_N5000_Ind25_5yrs_noCKMR[1], pch=16, cex=1.25,col=4)
points(3,1-IQR_RE_M_N5000_Ind25_ckmrmultinom10[1]/IQR_RE_M_N5000_Ind25_10yrs_noCKMR[1], pch=16, col=4,cex=1.25)
points(3.25,1-IQR_RE_M_N5000_Ind25_ckmrmultinom20[1]/IQR_RE_M_N5000_Ind25_20yrs_noCKMR[1], pch=16, col=4,cex=1.25)
#R0
points(0.8,1-IQR_RE_R0_N100_Ind25_ckmrmultinom5[1]/IQR_RE_R0_N100_Ind25_5yrs_noCKMR[1], pch=16, cex=1.25, col=2)
points(1.05,1-IQR_RE_R0_N100_Ind25_ckmrmultinom10[1]/IQR_RE_R0_N100_Ind25_10yrs_noCKMR[1], pch=16, col=2,cex=1.25)
points(1.3,1-IQR_RE_R0_N100_Ind25_ckmrmultinom20[1]/IQR_RE_R0_N100_Ind25_20yrs_noCKMR[1], pch=16, col=2,cex=1.25)
points(1.8,1-IQR_RE_R0_N1000_Ind25_ckmrmultinom5[1]/IQR_RE_R0_N1000_Ind25_5yrs_noCKMR[1], pch=16, cex=1.25,col=2)
points(2.05,1-IQR_RE_R0_N1000_Ind25_ckmrmultinom10[1]/IQR_RE_R0_N1000_Ind25_10yrs_noCKMR[1], pch=16, col=2,cex=1.25)
points(2.3,1-IQR_RE_R0_N1000_Ind25_ckmrmultinom20[1]/IQR_RE_R0_N1000_Ind25_20yrs_noCKMR[1], pch=16, col=2,cex=1.25)
points(2.8,1-IQR_RE_R0_N5000_Ind25_ckmrmultinom5[1]/IQR_RE_R0_N5000_Ind25_5yrs_noCKMR[1], pch=16, col=2,cex=1.25)
points(3.05,1-IQR_RE_R0_N5000_Ind25_ckmrmultinom10[1]/IQR_RE_R0_N5000_Ind25_10yrs_noCKMR[1], pch=16, col=2,cex=1.25)
points(3.3,1-IQR_RE_R0_N5000_Ind25_ckmrmultinom20[1]/IQR_RE_R0_N5000_Ind25_20yrs_noCKMR[1], pch=16, col=2,cex=1.25)

#Flatfish
plot(0.75,1-IQR_RE_M_N100_Ind25_ckmrmultinom5[2]/IQR_RE_M_N100_Ind25_5yrs_noCKMR[2], ylim=c(-0.2,0.8), col=4,las=1, ylab="", xaxt="n", pch=16, main="", xlab="",xlim=c(0.65,3.35),cex=1.25, cex.axis=1.35)
mtext(side=2, text="% Improvement = 100(1 - IQR RE with CKMR/IQR RE No CKMR)", line=3.5)
mtext(side=3, text="Flatfish", line=-2, font=2, cex=1.35)
abline(h=0, lty=2)
points(1,1-IQR_RE_M_N100_Ind25_ckmrmultinom10[2]/IQR_RE_M_N100_Ind25_10yrs_noCKMR[2], pch=16, col=4,cex=1.25)
points(1.25,1-IQR_RE_M_N100_Ind25_ckmrmultinom20[2]/IQR_RE_M_N100_Ind25_20yrs_noCKMR[2], pch=16, col=4,cex=1.25)
points(1.75,1-IQR_RE_M_N1000_Ind25_ckmrmultinom5[2]/IQR_RE_M_N1000_Ind25_5yrs_noCKMR[2], pch=16, cex=1.25, col=4)
points(2,1-IQR_RE_M_N1000_Ind25_ckmrmultinom10[2]/IQR_RE_M_N1000_Ind25_10yrs_noCKMR[2], pch=16, col=4,cex=1.25)
points(2.25,1-IQR_RE_M_N1000_Ind25_ckmrmultinom20[2]/IQR_RE_M_N1000_Ind25_20yrs_noCKMR[2], pch=16, col=4,cex=1.25)
points(2.75,1-IQR_RE_M_N5000_Ind25_ckmrmultinom5[2]/IQR_RE_M_N5000_Ind25_5yrs_noCKMR[2], pch=16, cex=1.25,col=4)
points(3,1-IQR_RE_M_N5000_Ind25_ckmrmultinom10[2]/IQR_RE_M_N5000_Ind25_10yrs_noCKMR[2], pch=16, col=4,cex=1.25)
points(3.25,1-IQR_RE_M_N5000_Ind25_ckmrmultinom20[2]/IQR_RE_M_N5000_Ind25_20yrs_noCKMR[2], pch=16, col=4,cex=1.25)
#R0
points(0.8,1-IQR_RE_R0_N100_Ind25_ckmrmultinom5[2]/IQR_RE_R0_N100_Ind25_5yrs_noCKMR[2], pch=16, cex=1.25, col=2)
points(1.05,1-IQR_RE_R0_N100_Ind25_ckmrmultinom10[2]/IQR_RE_R0_N100_Ind25_10yrs_noCKMR[2], pch=16, col=2,cex=1.25)
points(1.3,1-IQR_RE_R0_N100_Ind25_ckmrmultinom20[2]/IQR_RE_R0_N100_Ind25_20yrs_noCKMR[2], pch=16, col=2,cex=1.25)
points(1.8,1-IQR_RE_R0_N1000_Ind25_ckmrmultinom5[2]/IQR_RE_R0_N1000_Ind25_5yrs_noCKMR[2], pch=16, cex=1.25,col=2)
points(2.05,1-IQR_RE_R0_N1000_Ind25_ckmrmultinom10[2]/IQR_RE_R0_N1000_Ind25_10yrs_noCKMR[2], pch=16, col=2,cex=1.25)
points(2.3,1-IQR_RE_R0_N1000_Ind25_ckmrmultinom20[2]/IQR_RE_R0_N1000_Ind25_20yrs_noCKMR[2], pch=16, col=2,cex=1.25)
points(2.8,1-IQR_RE_R0_N5000_Ind25_ckmrmultinom5[2]/IQR_RE_R0_N5000_Ind25_5yrs_noCKMR[2], pch=16, col=2,cex=1.25)
points(3.05,1-IQR_RE_R0_N5000_Ind25_ckmrmultinom10[2]/IQR_RE_R0_N5000_Ind25_10yrs_noCKMR[2], pch=16, col=2,cex=1.25)
points(3.3,1-IQR_RE_R0_N5000_Ind25_ckmrmultinom20[2]/IQR_RE_R0_N5000_Ind25_20yrs_noCKMR[2], pch=16, col=2,cex=1.25)
#Sardine
plot(0.75,1-IQR_RE_M_N100_Ind25_ckmrmultinom5[3]/IQR_RE_M_N100_Ind25_5yrs_noCKMR[3], ylim=c(-0.2,0.8), col=4, las=1, ylab="", xaxt="n", pch=16, main="", xlab="",xlim=c(0.65,3.35),cex=1.25, cex.axis=1.35)
axis(side=1, at=c(0.775,1.025,1.275), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.35)
axis(side=1, at=c(1.775,2.025,2.275), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.35)
axis(side=1, at=c(2.775,3.025,3.275), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.35)
mtext(side=3, text="Sardine", line=-2, font=2, cex=1.35)
abline(h=0, lty=2)
points(1,1-IQR_RE_M_N100_Ind25_ckmrmultinom10[3]/IQR_RE_M_N100_Ind25_10yrs_noCKMR[3], pch=16, col=4,cex=1.25)
points(1.25,1-IQR_RE_M_N100_Ind25_ckmrmultinom20[3]/IQR_RE_M_N100_Ind25_20yrs_noCKMR[3], pch=16, col=4,cex=1.25)
points(1.75,1-IQR_RE_M_N1000_Ind25_ckmrmultinom5[3]/IQR_RE_M_N1000_Ind25_5yrs_noCKMR[3], pch=16, cex=1.25, col=4)
points(2.,1-IQR_RE_M_N1000_Ind25_ckmrmultinom10[3]/IQR_RE_M_N1000_Ind25_10yrs_noCKMR[3], pch=16, col=4,cex=1.25)
points(2.25,1-IQR_RE_M_N1000_Ind25_ckmrmultinom20[3]/IQR_RE_M_N1000_Ind25_20yrs_noCKMR[3], pch=16, col=4,cex=1.25)
points(2.75,1-IQR_RE_M_N5000_Ind25_ckmrmultinom5[3]/IQR_RE_M_N5000_Ind25_5yrs_noCKMR[3], pch=16, cex=1.25,col=4)
points(3.,1-IQR_RE_M_N5000_Ind25_ckmrmultinom10[3]/IQR_RE_M_N5000_Ind25_10yrs_noCKMR[3], pch=16, col=4,cex=1.25)
points(3.25,1-IQR_RE_M_N5000_Ind25_ckmrmultinom20[3]/IQR_RE_M_N5000_Ind25_20yrs_noCKMR[3], pch=16, col=4,cex=1.25)
#R0
points(0.8,1-IQR_RE_R0_N100_Ind25_ckmrmultinom5[3]/IQR_RE_R0_N100_Ind25_5yrs_noCKMR[3], pch=16, cex=1.25, col=2)
points(1.05,1-IQR_RE_R0_N100_Ind25_ckmrmultinom10[3]/IQR_RE_R0_N100_Ind25_10yrs_noCKMR[3], pch=16, col=2,cex=1.25)
points(1.3,1-IQR_RE_R0_N100_Ind25_ckmrmultinom20[3]/IQR_RE_R0_N100_Ind25_20yrs_noCKMR[3], pch=16, col=2,cex=1.25)
points(1.8,1-IQR_RE_R0_N1000_Ind25_ckmrmultinom5[3]/IQR_RE_R0_N1000_Ind25_5yrs_noCKMR[3], pch=16, cex=1.25,col=2)
points(2.05,1-IQR_RE_R0_N1000_Ind25_ckmrmultinom10[3]/IQR_RE_R0_N1000_Ind25_10yrs_noCKMR[3], pch=16, col=2,cex=1.25)
points(2.3,1-IQR_RE_R0_N1000_Ind25_ckmrmultinom20[3]/IQR_RE_R0_N1000_Ind25_20yrs_noCKMR[3], pch=16, col=2,cex=1.25)
points(2.8,1-IQR_RE_R0_N5000_Ind25_ckmrmultinom5[3]/IQR_RE_R0_N5000_Ind25_5yrs_noCKMR[3], pch=16, col=2,cex=1.25)
points(3.05,1-IQR_RE_R0_N5000_Ind25_ckmrmultinom10[3]/IQR_RE_R0_N5000_Ind25_10yrs_noCKMR[3], pch=16, col=2,cex=1.25)
mtext(side=1, text="Number of Years of CKMR Collection", line=3.5, cex=1.2)
points(3.3,1-IQR_RE_R0_N5000_Ind25_ckmrmultinom20[3]/IQR_RE_R0_N5000_Ind25_20yrs_noCKMR[3], pch=16, col=2,cex=1.25)
#dev.off()


##########################################################################
#
#No Index
#
##########################################################################

#tiff(filename="C:/Users/fischn/Documents/GitHub/CKMR_Project/SE_SSB_NoIndex.tiff", height=25, width=35, units='cm', compression="lzw", res=500)
par(mfrow=c(3,3), mar=c(1,1,1.25,0.5), oma=c(3.5,4.5,1.5,1))
#Cod
#100
plot(1:76,1-apply(SD_ssb_N100_NoIndex_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N100_NoIndex_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,], yaxt="n", pch=16,col=2, las=1, ylim=c(-0.1,1), ylab="", xlab="", main="100 CKMR Samples",xaxt="n", xlim=c(0,250),bty="[", cex.axis=1.3, cex.main=1.5)
axis(side=2, at=seq(0,1,0.2), labels=seq(0,100,20), las=1, cex.axis=1.3)
lines(67:76,rep(mean((c(1-apply(SD_ssb_N100_NoIndex_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N100_NoIndex_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,])[67:76])),10), lwd=4, col=4)
points(86:161,(1-apply(SD_ssb_N100_NoIndex_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N100_NoIndex_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,]), pch=16 , col=2)
lines(152:161,rep(mean((c(1-apply(SD_ssb_N100_NoIndex_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N100_NoIndex_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,])[67:76])),10), lwd=4, col=4)
points(171:246,(1-apply(SD_ssb_N100_NoIndex_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N100_NoIndex_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,]), pch=16 , col=2)
lines(237:246,rep(mean((c(1-apply(SD_ssb_N100_NoIndex_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N100_NoIndex_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,])[67:76])),10), lwd=4, col=4)
abline(h=0, lty=2)

#1000
plot(1:76,1-apply(SD_ssb_N1000_NoIndex_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N1000_NoIndex_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,], pch=16, col=2,las=1, ylim=c(-0.1,1), ylab="", xlab="", main="1,000 CKMR Samples",xaxt="n",  xlim=c(0,250),yaxt="n",bty="n", cex.main=1.5)
mtext(side=3, text="Cod", line=-2, font=2, cex=1.35)
axis(side=1,lwd.ticks = 0, labels=FALSE)
axis(side=3,lwd.ticks = 0, labels=FALSE)
legend(x=60,y=0.7,c("Mean of last 10 years"), lty=c(1), lwd=c(4),col=c(4), bty="n", cex=1.5)
mtext(text="        No Abundance Index", side=3, line=-11)
lines(67:76,rep(mean((c(1-apply(SD_ssb_N1000_NoIndex_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N1000_NoIndex_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,])[67:76])),10), lwd=4, col=4)
points(86:161,(1-apply(SD_ssb_N1000_NoIndex_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N1000_NoIndex_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,]), pch=16 , col=2)
lines(152:161,rep(mean((c(1-apply(SD_ssb_N1000_NoIndex_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N1000_NoIndex_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,])[67:76])),10), lwd=4, col=4)
points(171:246,(1-apply(SD_ssb_N1000_NoIndex_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N1000_NoIndex_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,]), pch=16 , col=2)
lines(237:246,rep(mean((c(1-apply(SD_ssb_N1000_NoIndex_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N1000_NoIndex_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,])[67:76])),10), lwd=4, col=4)
abline(h=0, lty=2)

#5000
plot(1:76,1-apply(SD_ssb_N5000_NoIndex_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N5000_NoIndex_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,], pch=16, col=2,las=1, ylim=c(-0.1,1), ylab="", xlab="", main="5,000 CKMR Samples",xaxt="n",  xlim=c(0,250),yaxt="n",bty="]", cex.main=1.5)
lines(67:76,rep(mean((c(1-apply(SD_ssb_N5000_NoIndex_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N5000_NoIndex_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,])[67:76])),10), lwd=4, col=4)
points(86:161,(1-apply(SD_ssb_N5000_NoIndex_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N5000_NoIndex_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,]), pch=16 , col=2)
lines(152:161,rep(mean((c(1-apply(SD_ssb_N5000_NoIndex_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N5000_NoIndex_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,])[67:76])),10), lwd=4, col=4)
points(171:246,(1-apply(SD_ssb_N5000_NoIndex_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N5000_NoIndex_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,]), pch=16 , col=2)
lines(237:246,rep(mean((c(1-apply(SD_ssb_N5000_NoIndex_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[1,]/apply(SD_ssb_N5000_NoIndex_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[1,])[67:76])),10), lwd=4, col=4)
abline(h=0, lty=2)

#Flatfish
#100
plot(1:76,1-apply(SD_ssb_N100_NoIndex_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N100_NoIndex_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,], yaxt="n", pch=16, las=1, col=2,ylim=c(-0.1,1), ylab="", xlab="", main="",xaxt="n", xlim=c(0,250),bty="[", cex.axis=1.3, cex.main=1.2)
axis(side=2, at=seq(0,1,0.2), labels=seq(0,100,20), las=1, cex.axis=1.3)
lines(67:76,rep(mean((c(1-apply(SD_ssb_N100_NoIndex_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N100_NoIndex_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,])[67:76])),10), lwd=4, col=4)
points(86:161,(1-apply(SD_ssb_N100_NoIndex_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N100_NoIndex_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,]), pch=16 , col=2)
lines(152:161,rep(mean((c(1-apply(SD_ssb_N100_NoIndex_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N100_NoIndex_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,])[67:76])),10), lwd=4, col=4)
points(171:246,(1-apply(SD_ssb_N100_NoIndex_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N100_NoIndex_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,]), pch=16 , col=2)
lines(237:246,rep(mean((c(1-apply(SD_ssb_N100_NoIndex_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N100_NoIndex_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,])[67:76])),10), lwd=4, col=4)
mtext(side=2, text="% Improvement = 100(1 - SSB SE with CKMR/SSB SE No CKMR)", line=3.5, cex=1.1)
abline(h=0, lty=2)

#1000
plot(1:76,1-apply(SD_ssb_N1000_NoIndex_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N1000_NoIndex_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,], pch=16, col=2,las=1, ylim=c(-0.1,1), ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="n")
mtext(side=3, text="Flatfish", line=-2, font=2, cex=1.35)
axis(side=1,lwd.ticks = 0, labels=FALSE)
axis(side=3,lwd.ticks = 0, labels=FALSE)
lines(67:76,rep(mean((c(1-apply(SD_ssb_N1000_NoIndex_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N1000_NoIndex_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,])[67:76])),10), lwd=4, col=4)
points(86:161,(1-apply(SD_ssb_N1000_NoIndex_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N1000_NoIndex_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,]), pch=16 , col=2)
lines(152:161,rep(mean((c(1-apply(SD_ssb_N1000_NoIndex_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N1000_NoIndex_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,])[67:76])),10), lwd=4, col=4)
points(171:246,(1-apply(SD_ssb_N1000_NoIndex_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N1000_NoIndex_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,]), pch=16 , col=2)
lines(237:246,rep(mean((c(1-apply(SD_ssb_N1000_NoIndex_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N1000_NoIndex_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,])[67:76])),10), lwd=4, col=4)
abline(h=0, lty=2)

#5000
plot(1:76,1-apply(SD_ssb_N5000_NoIndex_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N5000_NoIndex_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,], pch=16, col=2,las=1, ylim=c(-0.1,1), ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="]")
lines(67:76,rep(mean((c(1-apply(SD_ssb_N5000_NoIndex_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N5000_NoIndex_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,])[67:76])),10), lwd=4, col=4)
points(86:161,(1-apply(SD_ssb_N5000_NoIndex_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N5000_NoIndex_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,]), pch=16 , col=2)
lines(152:161,rep(mean((c(1-apply(SD_ssb_N5000_NoIndex_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N5000_NoIndex_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,])[67:76])),10), lwd=4, col=4)
points(171:246,(1-apply(SD_ssb_N5000_NoIndex_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N5000_NoIndex_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,]), pch=16 , col=2)
lines(237:246,rep(mean((c(1-apply(SD_ssb_N5000_NoIndex_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[2,]/apply(SD_ssb_N5000_NoIndex_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[2,])[67:76])),10), lwd=4, col=4)
abline(h=0, lty=2)

#Sardine
#100
plot(1:76,1-apply(SD_ssb_N100_NoIndex_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N100_NoIndex_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,],  yaxt="n",pch=16, las=1,col=2, ylim=c(-0.1,1), ylab="", xlab="", main="",xaxt="n", xlim=c(0,250), bty="[", cex.axis=1.3, cex.main=1.2)
axis(side=2, at=seq(0,1,0.2), labels=seq(0,100,20), las=1, cex.axis=1.3)
abline(h=0, lty=2)
axis(side=1, at=c(40,127,211), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.3)
lines(67:76,rep(mean((c(1-apply(SD_ssb_N100_NoIndex_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N100_NoIndex_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,])[67:76])),10), lwd=4, col=4)
points(86:161,(1-apply(SD_ssb_N100_NoIndex_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N100_NoIndex_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,]), pch=16 , col=2)
lines(152:161,rep(mean((c(1-apply(SD_ssb_N100_NoIndex_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N100_NoIndex_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,])[67:76])),10), lwd=4, col=4)
points(171:246,(1-apply(SD_ssb_N100_NoIndex_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N100_NoIndex_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,]), pch=16 , col=2)
lines(237:246,rep(mean((c(1-apply(SD_ssb_N100_NoIndex_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N100_NoIndex_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,])[67:76])),10), lwd=4, col=4)
abline(h=0, lty=2)

#1000
plot(1:76,1-apply(SD_ssb_N1000_NoIndex_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N1000_NoIndex_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,], pch=16, col=2,las=1, ylim=c(-0.1,1), cex.axis=1.3, ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="n")
axis(side=1, at=c(40,127,211), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.3)
mtext(side=3, text="Sardine", line=-2, font=2, cex=1.35)
mtext(side=1, text="Number of Years of CKMR Collection", line=3.25, cex=1.2)
axis(side=1,lwd.ticks = 0, labels=FALSE)
axis(side=3,lwd.ticks = 0, labels=FALSE)
lines(67:76,rep(mean((c(1-apply(SD_ssb_N1000_NoIndex_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N1000_NoIndex_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,])[67:76])),10), lwd=4, col=4)
points(86:161,(1-apply(SD_ssb_N1000_NoIndex_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N1000_NoIndex_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,]), pch=16 , col=2)
lines(152:161,rep(mean((c(1-apply(SD_ssb_N1000_NoIndex_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N1000_NoIndex_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,])[67:76])),10), lwd=4, col=4)
points(171:246,(1-apply(SD_ssb_N1000_NoIndex_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N1000_NoIndex_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,]), pch=16 , col=2)
lines(237:246,rep(mean((c(1-apply(SD_ssb_N1000_NoIndex_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N1000_NoIndex_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,])[67:76])),10), lwd=4, col=4)
abline(h=0, lty=2)

#5000
plot(1:76,1-apply(SD_ssb_N5000_NoIndex_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N5000_NoIndex_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,], pch=16, col=2,las=1, ylim=c(-0.1,1), cex.axis=1.3, ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="]")
axis(side=1, at=c(40,127,211), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.3)
lines(67:76,rep(mean((c(1-apply(SD_ssb_N5000_NoIndex_ckmrmultinom5,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N5000_NoIndex_5yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,])[67:76])),10), lwd=4, col=4)
points(86:161,(1-apply(SD_ssb_N5000_NoIndex_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N5000_NoIndex_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,]), pch=16 , col=2)
lines(152:161,rep(mean((c(1-apply(SD_ssb_N5000_NoIndex_ckmrmultinom10,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N5000_NoIndex_10yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,])[67:76])),10), lwd=4, col=4)
points(171:246,(1-apply(SD_ssb_N5000_NoIndex_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N5000_NoIndex_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,]), pch=16 , col=2)
lines(237:246,rep(mean((c(1-apply(SD_ssb_N5000_NoIndex_ckmrmultinom20,c(1,3),median,na.rm=TRUE)[3,]/apply(SD_ssb_N5000_NoIndex_20yrs_noCKMR,c(1,3),median,na.rm=TRUE)[3,])[67:76])),10), lwd=4, col=4)
abline(h=0, lty=2)
#dev.off()


############
#M & R0
############
#tiff(filename="C:/Users/fischn/Documents/GitHub/CKMR_Project/SE_M_R0_NoIndex.tiff", height=30, width=20, units='cm', compression="lzw", res=500)
par(mfcol=c(3,1), mar=c(2.25,1,0.25,0.5), oma=c(4,4,1.5,1))
#Index 0.5###################
#Median SEs of M and R0
#Cod
plot(0.75,1-apply(SD_M_N100_NoIndex_ckmrmultinom5,1,median,na.rm=TRUE)[1]/apply(SD_M_N100_NoIndex_5yrs_noCKMR,1,median,na.rm=TRUE)[1],  yaxt="n",ylim=c(-0.1,0.8), las=1, ylab="", xaxt="n", pch=16, main="", xlab="",xlim=c(0.65,3.35),cex=1.25, col=4, cex.axis=1.35)
axis(side=2, at=seq(0,0.8,0.2), labels=seq(0,80,20), las=1, cex.axis=1.3)
mtext(side=3, text="Cod", line=-2, font=2, cex=1.35)
legend(x=1.65,0.6, y=, c("Natural Mortality", "Unfished Recruitment"), pch=16, col=c(4,2), bty="n", cex=1.35)
mtext(text="  No Abundance Index", side=3, line=-12)
abline(h=0, lty=2)
points(1,1-apply(SD_M_N100_NoIndex_ckmrmultinom10,1,median,na.rm=TRUE)[1]/apply(SD_M_N100_NoIndex_10yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
points(1.25,1-apply(SD_M_N100_NoIndex_ckmrmultinom20,1,median,na.rm=TRUE)[1]/apply(SD_M_N100_NoIndex_20yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
points(1.75,1-apply(SD_M_N1000_NoIndex_ckmrmultinom5,1,median,na.rm=TRUE)[1]/apply(SD_M_N1000_NoIndex_5yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, cex=1.25, col=4)
points(2,1-apply(SD_M_N1000_NoIndex_ckmrmultinom10,1,median,na.rm=TRUE)[1]/apply(SD_M_N1000_NoIndex_10yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
points(2.25,1-apply(SD_M_N1000_NoIndex_ckmrmultinom20,1,median,na.rm=TRUE)[1]/apply(SD_M_N1000_NoIndex_20yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
points(2.75,1-apply(SD_M_N5000_NoIndex_ckmrmultinom5,1,median,na.rm=TRUE)[1]/apply(SD_M_N5000_NoIndex_5yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, cex=1.25,col=4)
points(3,1-apply(SD_M_N5000_NoIndex_ckmrmultinom10,1,median,na.rm=TRUE)[1]/apply(SD_M_N5000_NoIndex_10yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
points(3.25,1-apply(SD_M_N5000_NoIndex_ckmrmultinom20,1,median,na.rm=TRUE)[1]/apply(SD_M_N5000_NoIndex_20yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
mtext(side=3, at=1, line=0, text="100 CKMR Samples")
mtext(side=3, line=0, text="1,000 CKMR Samples")
mtext(side=3, at=3, line=0, text="5,000 CKMR Samples")
#R0
points(0.8,1-apply(SD_R0_N100_NoIndex_ckmrmultinom5,1,median,na.rm=TRUE)[1]/apply(SD_R0_N100_NoIndex_5yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, cex=1.25, col=2)
points(1.05,1-apply(SD_R0_N100_NoIndex_ckmrmultinom10,1,median,na.rm=TRUE)[1]/apply(SD_R0_N100_NoIndex_10yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(1.3,1-apply(SD_R0_N100_NoIndex_ckmrmultinom20,1,median,na.rm=TRUE)[1]/apply(SD_R0_N100_NoIndex_20yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(1.8,1-apply(SD_R0_N1000_NoIndex_ckmrmultinom5,1,median,na.rm=TRUE)[1]/apply(SD_R0_N1000_NoIndex_5yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, cex=1.25,col=2)
points(2.05,1-apply(SD_R0_N1000_NoIndex_ckmrmultinom10,1,median,na.rm=TRUE)[1]/apply(SD_R0_N1000_NoIndex_10yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(2.3,1-apply(SD_R0_N1000_NoIndex_ckmrmultinom20,1,median,na.rm=TRUE)[1]/apply(SD_R0_N1000_NoIndex_20yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(2.8,1-apply(SD_R0_N5000_NoIndex_ckmrmultinom5,1,median,na.rm=TRUE)[1]/apply(SD_R0_N5000_NoIndex_5yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(3.05,1-apply(SD_R0_N5000_NoIndex_ckmrmultinom10,1,median,na.rm=TRUE)[1]/apply(SD_R0_N5000_NoIndex_10yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(3.3,1-apply(SD_R0_N5000_NoIndex_ckmrmultinom20,1,median,na.rm=TRUE)[1]/apply(SD_R0_N5000_NoIndex_20yrs_noCKMR,1,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)

#Flatfish
plot(0.75,1-apply(SD_M_N100_NoIndex_ckmrmultinom5,1,median,na.rm=TRUE)[2]/apply(SD_M_N100_NoIndex_5yrs_noCKMR,1,median,na.rm=TRUE)[2], ylim=c(-0.1,0.8),  yaxt="n",col=4,las=1, ylab="", xaxt="n", pch=16, main="", xlab="",xlim=c(0.65,3.35),cex=1.25, cex.axis=1.35)
axis(side=2, at=seq(0,0.8,0.2), labels=seq(0,80,20), las=1, cex.axis=1.3)
mtext(side=2, text="% Improvement = 100(1 - SE with CKMR/SE No CKMR)", line=3.5)
mtext(side=3, text="Flatfish", line=-2, font=2, cex=1.35)
abline(h=0, lty=2)
points(1,1-apply(SD_M_N100_NoIndex_ckmrmultinom10,1,median,na.rm=TRUE)[2]/apply(SD_M_N100_NoIndex_10yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
points(1.25,1-apply(SD_M_N100_NoIndex_ckmrmultinom20,1,median,na.rm=TRUE)[2]/apply(SD_M_N100_NoIndex_20yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
points(1.75,1-apply(SD_M_N1000_NoIndex_ckmrmultinom5,1,median,na.rm=TRUE)[2]/apply(SD_M_N1000_NoIndex_5yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, cex=1.25, col=4)
points(2,1-apply(SD_M_N1000_NoIndex_ckmrmultinom10,1,median,na.rm=TRUE)[2]/apply(SD_M_N1000_NoIndex_10yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
points(2.25,1-apply(SD_M_N1000_NoIndex_ckmrmultinom20,1,median,na.rm=TRUE)[2]/apply(SD_M_N1000_NoIndex_20yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
points(2.75,1-apply(SD_M_N5000_NoIndex_ckmrmultinom5,1,median,na.rm=TRUE)[2]/apply(SD_M_N5000_NoIndex_5yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, cex=1.25,col=4)
points(3,1-apply(SD_M_N5000_NoIndex_ckmrmultinom10,1,median,na.rm=TRUE)[2]/apply(SD_M_N5000_NoIndex_10yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
points(3.25,1-apply(SD_M_N5000_NoIndex_ckmrmultinom20,1,median,na.rm=TRUE)[2]/apply(SD_M_N5000_NoIndex_20yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
#R0
points(0.8,1-apply(SD_R0_N100_NoIndex_ckmrmultinom5,1,median,na.rm=TRUE)[2]/apply(SD_R0_N100_NoIndex_5yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, cex=1.25, col=2)
points(1.05,1-apply(SD_R0_N100_NoIndex_ckmrmultinom10,1,median,na.rm=TRUE)[2]/apply(SD_R0_N100_NoIndex_10yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(1.3,1-apply(SD_R0_N100_NoIndex_ckmrmultinom20,1,median,na.rm=TRUE)[2]/apply(SD_R0_N100_NoIndex_20yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(1.8,1-apply(SD_R0_N1000_NoIndex_ckmrmultinom5,1,median,na.rm=TRUE)[2]/apply(SD_R0_N1000_NoIndex_5yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, cex=1.25,col=2)
points(2.05,1-apply(SD_R0_N1000_NoIndex_ckmrmultinom10,1,median,na.rm=TRUE)[2]/apply(SD_R0_N1000_NoIndex_10yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(2.3,1-apply(SD_R0_N1000_NoIndex_ckmrmultinom20,1,median,na.rm=TRUE)[2]/apply(SD_R0_N1000_NoIndex_20yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(2.8,1-apply(SD_R0_N5000_NoIndex_ckmrmultinom5,1,median,na.rm=TRUE)[2]/apply(SD_R0_N5000_NoIndex_5yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(3.05,1-apply(SD_R0_N5000_NoIndex_ckmrmultinom10,1,median,na.rm=TRUE)[2]/apply(SD_R0_N5000_NoIndex_10yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(3.3,1-apply(SD_R0_N5000_NoIndex_ckmrmultinom20,1,median,na.rm=TRUE)[2]/apply(SD_R0_N5000_NoIndex_20yrs_noCKMR,1,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)

#Sardine
plot(0.75,1-apply(SD_M_N100_NoIndex_ckmrmultinom5,1,median,na.rm=TRUE)[3]/apply(SD_M_N100_NoIndex_5yrs_noCKMR,1,median,na.rm=TRUE)[3], ylim=c(-0.1,0.8), yaxt="n", col=4, las=1, ylab="", xaxt="n", pch=16, main="", xlab="",xlim=c(0.65,3.35),cex=1.25, cex.axis=1.35)
axis(side=2, at=seq(0,0.8,0.2), labels=seq(0,80,20), las=1, cex.axis=1.3)
axis(side=1, at=c(0.775,1.025,1.275), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.35)
axis(side=1, at=c(1.775,2.025,2.275), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.35)
axis(side=1, at=c(2.775,3.025,3.275), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.35)
mtext(side=3, text="Sardine", line=-2, font=2, cex=1.35)
abline(h=0, lty=2)
points(1,1-apply(SD_M_N100_NoIndex_ckmrmultinom10,1,median,na.rm=TRUE)[3]/apply(SD_M_N100_NoIndex_10yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
points(1.25,1-apply(SD_M_N100_NoIndex_ckmrmultinom20,1,median,na.rm=TRUE)[3]/apply(SD_M_N100_NoIndex_20yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
points(1.75,1-apply(SD_M_N1000_NoIndex_ckmrmultinom5,1,median,na.rm=TRUE)[3]/apply(SD_M_N1000_NoIndex_5yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, cex=1.25, col=4)
points(2.,1-apply(SD_M_N1000_NoIndex_ckmrmultinom10,1,median,na.rm=TRUE)[3]/apply(SD_M_N1000_NoIndex_10yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
points(2.25,1-apply(SD_M_N1000_NoIndex_ckmrmultinom20,1,median,na.rm=TRUE)[3]/apply(SD_M_N1000_NoIndex_20yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
points(2.75,1-apply(SD_M_N5000_NoIndex_ckmrmultinom5,1,median,na.rm=TRUE)[3]/apply(SD_M_N5000_NoIndex_5yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, cex=1.25,col=4)
points(3.,1-apply(SD_M_N5000_NoIndex_ckmrmultinom10,1,median,na.rm=TRUE)[3]/apply(SD_M_N5000_NoIndex_10yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
points(3.25,1-apply(SD_M_N5000_NoIndex_ckmrmultinom20,1,median,na.rm=TRUE)[3]/apply(SD_M_N5000_NoIndex_20yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
#R0
points(0.8,1-apply(SD_R0_N100_NoIndex_ckmrmultinom5,1,median,na.rm=TRUE)[3]/apply(SD_R0_N100_NoIndex_5yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, cex=1.25, col=2)
points(1.05,1-apply(SD_R0_N100_NoIndex_ckmrmultinom10,1,median,na.rm=TRUE)[3]/apply(SD_R0_N100_NoIndex_10yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
points(1.3,1-apply(SD_R0_N100_NoIndex_ckmrmultinom20,1,median,na.rm=TRUE)[3]/apply(SD_R0_N100_NoIndex_20yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
points(1.8,1-apply(SD_R0_N1000_NoIndex_ckmrmultinom5,1,median,na.rm=TRUE)[3]/apply(SD_R0_N1000_NoIndex_5yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, cex=1.25,col=2)
points(2.05,1-apply(SD_R0_N1000_NoIndex_ckmrmultinom10,1,median,na.rm=TRUE)[3]/apply(SD_R0_N1000_NoIndex_10yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
points(2.3,1-apply(SD_R0_N1000_NoIndex_ckmrmultinom20,1,median,na.rm=TRUE)[3]/apply(SD_R0_N1000_NoIndex_20yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
points(2.8,1-apply(SD_R0_N5000_NoIndex_ckmrmultinom5,1,median,na.rm=TRUE)[3]/apply(SD_R0_N5000_NoIndex_5yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
points(3.05,1-apply(SD_R0_N5000_NoIndex_ckmrmultinom10,1,median,na.rm=TRUE)[3]/apply(SD_R0_N5000_NoIndex_10yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
mtext(side=1, text="Number of Years of CKMR Collection", line=3.5, cex=1.2)
points(3.3,1-apply(SD_R0_N5000_NoIndex_ckmrmultinom20,1,median,na.rm=TRUE)[3]/apply(SD_R0_N5000_NoIndex_20yrs_noCKMR,1,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
#dev.off()


#####################
#Median ARE SSB
#####################
#tiff(filename="C:/Users/fischn/Documents/GitHub/CKMR_Project/ARE_SSB_NoIndex.tiff", height=25, width=35, units='cm', compression="lzw", res=500)
par(mfrow=c(3,3), mar=c(1,1,1.25,0.5), oma=c(3.5,4.5,1.5,1))
#Cod
#100
plot(1:76,1-apply(abs(RE_ssb_N100_NoIndex_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N100_NoIndex_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,], yaxt="n", pch=16,col=2, las=1, ylim=c(-0.25,1), ylab="", xlab="", main="100 CKMR Samples",xaxt="n", xlim=c(0,250),bty="[", cex.axis=1.3, cex.main=1.5)
axis(side=2, at=seq(-0.2,1,0.2), labels=seq(-20,100,20), las=1, cex.axis=1.3)
lines(67:76,rep(mean(c(1-apply(abs(RE_ssb_N100_NoIndex_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N100_NoIndex_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,])[67:76]),10), lwd=4, col=4)
points(86:161,1-apply(abs(RE_ssb_N100_NoIndex_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N100_NoIndex_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,], pch=16, col=2)
lines(152:161,rep(mean(c(1-apply(abs(RE_ssb_N100_NoIndex_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N100_NoIndex_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,])[67:76]),10), lwd=4, col=4)
points(171:246,1-apply(abs(RE_ssb_N100_NoIndex_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N100_NoIndex_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,], pch=16, col=2)
lines(237:246,rep(mean(c(1-apply(abs(RE_ssb_N100_NoIndex_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N100_NoIndex_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,])[67:76]),10), lwd=4, col=4)
abline(h=0, lty=2)

#1000
plot(1:76,1-apply(abs(RE_ssb_N1000_NoIndex_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N1000_NoIndex_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,], pch=16, col=2,las=1, ylim=c(-0.25,1), ylab="", xlab="", main="1,000 CKMR Samples",xaxt="n",  xlim=c(0,250),yaxt="n",bty="n", cex.main=1.5)
lines(67:76,rep(mean(c(1-apply(abs(RE_ssb_N1000_NoIndex_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N1000_NoIndex_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,])[67:76]),10), lwd=4, col=4)
points(86:161,1-apply(abs(RE_ssb_N1000_NoIndex_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N1000_NoIndex_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,], pch=16, col=2)
lines(152:161,rep(mean(c(1-apply(abs(RE_ssb_N1000_NoIndex_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N1000_NoIndex_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,])[67:76]),10), lwd=4, col=4)
points(171:246,1-apply(abs(RE_ssb_N1000_NoIndex_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N1000_NoIndex_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,], pch=16, col=2)
lines(237:246,rep(mean(c(1-apply(abs(RE_ssb_N1000_NoIndex_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N1000_NoIndex_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,])[67:76]),10), lwd=4, col=4)
mtext(side=3, text="Cod", line=-2, font=2, cex=1.35)
axis(side=1,lwd.ticks = 0, labels=FALSE)
axis(side=3,lwd.ticks = 0, labels=FALSE)
legend(x=60,y=0.7,c("Mean of last 10 years"), lty=c(1), lwd=c(4),col=c(4), bty="n", cex=1.5)
mtext(text="        No Abundance Index", side=3, line=-10)
abline(h=0, lty=2)

#5000
plot(1:76,1-apply(abs(RE_ssb_N5000_NoIndex_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N5000_NoIndex_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,], pch=16, col=2,las=1, ylim=c(-0.25,1), ylab="", xlab="", main="5,000 CKMR Samples",xaxt="n",  xlim=c(0,250),yaxt="n",bty="]", cex.main=1.5)
lines(67:76,rep(mean(c(1-apply(abs(RE_ssb_N5000_NoIndex_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N5000_NoIndex_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,])[67:76]),10), lwd=4, col=4)
points(86:161,1-apply(abs(RE_ssb_N5000_NoIndex_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N5000_NoIndex_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,], pch=16, col=2)
lines(152:161,rep(mean(c(1-apply(abs(RE_ssb_N5000_NoIndex_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N5000_NoIndex_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,])[67:76]),10), lwd=4, col=4)
points(171:246,1-apply(abs(RE_ssb_N5000_NoIndex_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N5000_NoIndex_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,], pch=16, col=2)
lines(237:246,rep(mean(c(1-apply(abs(RE_ssb_N5000_NoIndex_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[1,]/apply(abs(RE_ssb_N5000_NoIndex_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[1,])[67:76]),10), lwd=4, col=4)
abline(h=0, lty=2)

#Flatfish
#100
plot(1:76,1-apply(abs(RE_ssb_N100_NoIndex_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N100_NoIndex_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,], yaxt="n", pch=16, las=1, col=2,ylim=c(-0.25,1), ylab="", xlab="", main="",xaxt="n", xlim=c(0,250),bty="[", cex.axis=1.3, cex.main=1.2)
axis(side=2, at=seq(-0.2,1,0.2), labels=seq(-20,100,20), las=1, cex.axis=1.3)
lines(67:76,rep(mean(c(1-apply(abs(RE_ssb_N100_NoIndex_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N100_NoIndex_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,])[67:76]),10), lwd=4, col=4)
points(86:161,1-apply(abs(RE_ssb_N100_NoIndex_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N100_NoIndex_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,], pch=16, col=2)
lines(152:161,rep(mean(c(1-apply(abs(RE_ssb_N100_NoIndex_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N100_NoIndex_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,])[67:76]),10), lwd=4, col=4)
points(171:246,1-apply(abs(RE_ssb_N100_NoIndex_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N100_NoIndex_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,], pch=16, col=2)
lines(237:246,rep(mean(c(1-apply(abs(RE_ssb_N100_NoIndex_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N100_NoIndex_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,])[67:76]),10), lwd=4, col=4)
mtext(side=2, text="% Improvement = 100(1 - MARE with CKMR/MARE No CKMR)", line=3.5, cex=1.1)
abline(h=0, lty=2)

#1000
plot(1:76,1-apply(abs(RE_ssb_N1000_NoIndex_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N1000_NoIndex_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,], pch=16, col=2,las=1, ylim=c(-0.25,1), ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="n")
lines(67:76,rep(mean(c(1-apply(abs(RE_ssb_N1000_NoIndex_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N1000_NoIndex_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,])[67:76]),10), lwd=4, col=4)
points(86:161,1-apply(abs(RE_ssb_N1000_NoIndex_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N1000_NoIndex_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,], pch=16, col=2)
lines(152:161,rep(mean(c(1-apply(abs(RE_ssb_N1000_NoIndex_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N1000_NoIndex_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,])[67:76]),10), lwd=4, col=4)
points(171:246,1-apply(abs(RE_ssb_N1000_NoIndex_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N1000_NoIndex_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,], pch=16, col=2)
lines(237:246,rep(mean(c(1-apply(abs(RE_ssb_N1000_NoIndex_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N1000_NoIndex_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,])[67:76]),10), lwd=4, col=4)
mtext(side=3, text="Flatfish", line=-2, font=2, cex=1.35)
axis(side=1,lwd.ticks = 0, labels=FALSE)
axis(side=3,lwd.ticks = 0, labels=FALSE)
abline(h=0, lty=2)

#5000
plot(1:76,1-apply(abs(RE_ssb_N5000_NoIndex_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N5000_NoIndex_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,], pch=16, col=2,las=1, ylim=c(-0.25,1), ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="]")
lines(67:76,rep(mean(c(1-apply(abs(RE_ssb_N5000_NoIndex_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N5000_NoIndex_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,])[67:76]),10), lwd=4, col=4)
points(86:161,1-apply(abs(RE_ssb_N5000_NoIndex_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N5000_NoIndex_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,], pch=16, col=2)
lines(152:161,rep(mean(c(1-apply(abs(RE_ssb_N5000_NoIndex_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N5000_NoIndex_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,])[67:76]),10), lwd=4, col=4)
points(171:246,1-apply(abs(RE_ssb_N5000_NoIndex_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N5000_NoIndex_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,], pch=16, col=2)
lines(237:246,rep(mean(c(1-apply(abs(RE_ssb_N5000_NoIndex_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[2,]/apply(abs(RE_ssb_N5000_NoIndex_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[2,])[67:76]),10), lwd=4, col=4)
abline(h=0, lty=2)

#Sardine
#100
plot(1:76,1-apply(abs(RE_ssb_N100_NoIndex_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N100_NoIndex_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,], yaxt="n",pch=16, las=1,col=2, ylim=c(-0.25,1), ylab="", xlab="", main="",xaxt="n", xlim=c(0,250), bty="[", cex.axis=1.3, cex.main=1.2)
axis(side=2, at=seq(-0.2,1,0.2), labels=seq(-20,100,20), las=1, cex.axis=1.3)
lines(67:76,rep(mean(c(1-apply(abs(RE_ssb_N100_NoIndex_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N100_NoIndex_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,])[67:76]),10), lwd=4, col=4)
points(86:161,1-apply(abs(RE_ssb_N100_NoIndex_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N100_NoIndex_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,], pch=16, col=2)
lines(152:161,rep(mean(c(1-apply(abs(RE_ssb_N100_NoIndex_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N100_NoIndex_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,])[67:76]),10), lwd=4, col=4)
points(171:246,1-apply(abs(RE_ssb_N100_NoIndex_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N100_NoIndex_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,], pch=16, col=2)
lines(237:246,rep(mean(c(1-apply(abs(RE_ssb_N100_NoIndex_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N100_NoIndex_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,])[67:76]),10), lwd=4, col=4)
axis(side=1, at=c(40,127,211), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.3)
abline(h=0, lty=2)

#1000
plot(1:76,1-apply(abs(RE_ssb_N1000_NoIndex_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N1000_NoIndex_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,], pch=16, col=2,las=1, ylim=c(-0.25,1), cex.axis=1.3, ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="n")
lines(67:76,rep(mean(c(1-apply(abs(RE_ssb_N1000_NoIndex_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N1000_NoIndex_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,])[67:76]),10), lwd=4, col=4)
points(86:161,1-apply(abs(RE_ssb_N1000_NoIndex_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N1000_NoIndex_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,], pch=16, col=2)
lines(152:161,rep(mean(c(1-apply(abs(RE_ssb_N1000_NoIndex_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N1000_NoIndex_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,])[67:76]),10), lwd=4, col=4)
points(171:246,1-apply(abs(RE_ssb_N1000_NoIndex_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N1000_NoIndex_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,], pch=16, col=2)
lines(237:246,rep(mean(c(1-apply(abs(RE_ssb_N1000_NoIndex_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N1000_NoIndex_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,])[67:76]),10), lwd=4, col=4)
axis(side=1, at=c(40,127,211), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.3)
mtext(side=3, text="Sardine", line=-2, font=2, cex=1.35)
mtext(side=1, text="Number of Years of CKMR Collection", line=3.25, cex=1.2)
axis(side=1,lwd.ticks = 0, labels=FALSE)
axis(side=3,lwd.ticks = 0, labels=FALSE)
abline(h=0, lty=2)

#5000
plot(1:76,1-apply(abs(RE_ssb_N5000_NoIndex_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N5000_NoIndex_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,], pch=16, col=2,las=1, ylim=c(-0.25,1), cex.axis=1.3, ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="]")
lines(67:76,rep(mean(c(1-apply(abs(RE_ssb_N5000_NoIndex_ckmrmultinom5),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N5000_NoIndex_5yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,])[67:76]),10), lwd=4, col=4)
points(86:161,1-apply(abs(RE_ssb_N5000_NoIndex_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N5000_NoIndex_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,], pch=16, col=2)
lines(152:161,rep(mean(c(1-apply(abs(RE_ssb_N5000_NoIndex_ckmrmultinom10),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N5000_NoIndex_10yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,])[67:76]),10), lwd=4, col=4)
points(171:246,1-apply(abs(RE_ssb_N5000_NoIndex_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N5000_NoIndex_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,], pch=16, col=2)
lines(237:246,rep(mean(c(1-apply(abs(RE_ssb_N5000_NoIndex_ckmrmultinom20),c(1,3),median,na.rm=TRUE)[3,]/apply(abs(RE_ssb_N5000_NoIndex_20yrs_noCKMR),c(1,3),median,na.rm=TRUE)[3,])[67:76]),10), lwd=4, col=4)
axis(side=1, at=c(40,127,211), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.3)
abline(h=0, lty=2)
#dev.off()


############
#M & R0
############
#tiff(filename="C:/Users/fischn/Documents/GitHub/CKMR_Project/ARE_M_R0_NoIndex.tiff", height=30, width=20, units='cm', compression="lzw", res=500)
par(mfcol=c(3,1), mar=c(2.25,1,0.25,0.5), oma=c(4,4,1.5,1))
#Index 0.5###################
#Median SEs of M and R0
#Cod
plot(0.75,1-apply(abs(RE_M_N100_NoIndex_ckmrmultinom5),2,median,na.rm=TRUE)[1]/apply(abs(RE_M_N100_NoIndex_5yrs_noCKMR),2,median,na.rm=TRUE)[1],  yaxt="n",ylim=c(-0.2,0.8), las=1, ylab="", xaxt="n", pch=16, main="", xlab="",xlim=c(0.65,3.35),cex=1.25, col=4, cex.axis=1.35)
axis(side=2, at=seq(-0.2,0.8,0.2), labels=seq(-20,80,20), las=1, cex.axis=1.3)
mtext(side=3, text="Cod", line=-2, font=2, cex=1.35)
legend(x=1.65,0.6, y=, c("Natural Mortality", "Unfished Recruitment"), pch=16, col=c(4,2), bty="n", cex=1.35)
mtext(text="  No Abundance Index", side=3, line=-12)
abline(h=0, lty=2)
points(1,1-apply(abs(RE_M_N100_NoIndex_ckmrmultinom10),2,median,na.rm=TRUE)[1]/apply(abs(RE_M_N100_NoIndex_10yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
points(1.25,1-apply(abs(RE_M_N100_NoIndex_ckmrmultinom20),2,median,na.rm=TRUE)[1]/apply(abs(RE_M_N100_NoIndex_20yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
points(1.75,1-apply(abs(RE_M_N1000_NoIndex_ckmrmultinom5),2,median,na.rm=TRUE)[1]/apply(abs(RE_M_N1000_NoIndex_5yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, cex=1.25, col=4)
points(2,1-apply(abs(RE_M_N1000_NoIndex_ckmrmultinom10),2,median,na.rm=TRUE)[1]/apply(abs(RE_M_N1000_NoIndex_10yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
points(2.25,1-apply(abs(RE_M_N1000_NoIndex_ckmrmultinom20),2,median,na.rm=TRUE)[1]/apply(abs(RE_M_N1000_NoIndex_20yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
points(2.75,1-apply(abs(RE_M_N5000_NoIndex_ckmrmultinom5),2,median,na.rm=TRUE)[1]/apply(abs(RE_M_N5000_NoIndex_5yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, cex=1.25,col=4)
points(3,1-apply(abs(RE_M_N5000_NoIndex_ckmrmultinom10),2,median,na.rm=TRUE)[1]/apply(abs(RE_M_N5000_NoIndex_10yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
points(3.25,1-apply(abs(RE_M_N5000_NoIndex_ckmrmultinom20),2,median,na.rm=TRUE)[1]/apply(abs(RE_M_N5000_NoIndex_20yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=4,cex=1.25)
mtext(side=3, at=1, line=0, text="100 CKMR Samples")
mtext(side=3, line=0, text="1,000 CKMR Samples")
mtext(side=3, at=3, line=0, text="5,000 CKMR Samples")
#R0
points(0.8,1-apply(abs(RE_R0_N100_NoIndex_ckmrmultinom5),2,median,na.rm=TRUE)[1]/apply(abs(RE_R0_N100_NoIndex_5yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, cex=1.25, col=2)
points(1.05,1-apply(abs(RE_R0_N100_NoIndex_ckmrmultinom10),2,median,na.rm=TRUE)[1]/apply(abs(RE_R0_N100_NoIndex_10yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(1.3,1-apply(abs(RE_R0_N100_NoIndex_ckmrmultinom20),2,median,na.rm=TRUE)[1]/apply(abs(RE_R0_N100_NoIndex_20yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(1.8,1-apply(abs(RE_R0_N1000_NoIndex_ckmrmultinom5),2,median,na.rm=TRUE)[1]/apply(abs(RE_R0_N1000_NoIndex_5yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, cex=1.25,col=2)
points(2.05,1-apply(abs(RE_R0_N1000_NoIndex_ckmrmultinom10),2,median,na.rm=TRUE)[1]/apply(abs(RE_R0_N1000_NoIndex_10yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(2.3,1-apply(abs(RE_R0_N1000_NoIndex_ckmrmultinom20),2,median,na.rm=TRUE)[1]/apply(abs(RE_R0_N1000_NoIndex_20yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(2.8,1-apply(abs(RE_R0_N5000_NoIndex_ckmrmultinom5),2,median,na.rm=TRUE)[1]/apply(abs(RE_R0_N5000_NoIndex_5yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(3.05,1-apply(abs(RE_R0_N5000_NoIndex_ckmrmultinom10),2,median,na.rm=TRUE)[1]/apply(abs(RE_R0_N5000_NoIndex_10yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)
points(3.3,1-apply(abs(RE_R0_N5000_NoIndex_ckmrmultinom20),2,median,na.rm=TRUE)[1]/apply(abs(RE_R0_N5000_NoIndex_20yrs_noCKMR),2,median,na.rm=TRUE)[1], pch=16, col=2,cex=1.25)

#Flatfish
plot(0.75,1-apply(abs(RE_M_N100_NoIndex_ckmrmultinom5),2,median,na.rm=TRUE)[2]/apply(abs(RE_M_N100_NoIndex_5yrs_noCKMR),2,median,na.rm=TRUE)[2],  yaxt="n",ylim=c(-0.2,0.8), col=4,las=1, ylab="", xaxt="n", pch=16, main="", xlab="",xlim=c(0.65,3.35),cex=1.25, cex.axis=1.35)
axis(side=2, at=seq(-0.2,0.8,0.2), labels=seq(-20,80,20), las=1, cex.axis=1.3)
mtext(side=2, text="% Improvement = 100(1 - MARE with CKMR/MARE No CKMR)", line=3.5)
mtext(side=3, text="Flatfish", line=-2, font=2, cex=1.35)
abline(h=0, lty=2)
points(1,1-apply(abs(RE_M_N100_NoIndex_ckmrmultinom10),2,median,na.rm=TRUE)[2]/apply(abs(RE_M_N100_NoIndex_10yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
points(1.25,1-apply(abs(RE_M_N100_NoIndex_ckmrmultinom20),2,median,na.rm=TRUE)[2]/apply(abs(RE_M_N100_NoIndex_20yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
points(1.75,1-apply(abs(RE_M_N1000_NoIndex_ckmrmultinom5),2,median,na.rm=TRUE)[2]/apply(abs(RE_M_N1000_NoIndex_5yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, cex=1.25, col=4)
points(2,1-apply(abs(RE_M_N1000_NoIndex_ckmrmultinom10),2,median,na.rm=TRUE)[2]/apply(abs(RE_M_N1000_NoIndex_10yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
points(2.25,1-apply(abs(RE_M_N1000_NoIndex_ckmrmultinom20),2,median,na.rm=TRUE)[2]/apply(abs(RE_M_N1000_NoIndex_20yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
points(2.75,1-apply(abs(RE_M_N5000_NoIndex_ckmrmultinom5),2,median,na.rm=TRUE)[2]/apply(abs(RE_M_N5000_NoIndex_5yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, cex=1.25,col=4)
points(3,1-apply(abs(RE_M_N5000_NoIndex_ckmrmultinom10),2,median,na.rm=TRUE)[2]/apply(abs(RE_M_N5000_NoIndex_10yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
points(3.25,1-apply(abs(RE_M_N5000_NoIndex_ckmrmultinom20),2,median,na.rm=TRUE)[2]/apply(abs(RE_M_N5000_NoIndex_20yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=4,cex=1.25)
#R0
points(0.8,1-apply(abs(RE_R0_N100_NoIndex_ckmrmultinom5),2,median,na.rm=TRUE)[2]/apply(abs(RE_R0_N100_NoIndex_5yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, cex=1.25, col=2)
points(1.05,1-apply(abs(RE_R0_N100_NoIndex_ckmrmultinom10),2,median,na.rm=TRUE)[2]/apply(abs(RE_R0_N100_NoIndex_10yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(1.3,1-apply(abs(RE_R0_N100_NoIndex_ckmrmultinom20),2,median,na.rm=TRUE)[2]/apply(abs(RE_R0_N100_NoIndex_20yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(1.8,1-apply(abs(RE_R0_N1000_NoIndex_ckmrmultinom5),2,median,na.rm=TRUE)[2]/apply(abs(RE_R0_N1000_NoIndex_5yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, cex=1.25,col=2)
points(2.05,1-apply(abs(RE_R0_N1000_NoIndex_ckmrmultinom10),2,median,na.rm=TRUE)[2]/apply(abs(RE_R0_N1000_NoIndex_10yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(2.3,1-apply(abs(RE_R0_N1000_NoIndex_ckmrmultinom20),2,median,na.rm=TRUE)[2]/apply(abs(RE_R0_N1000_NoIndex_20yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(2.8,1-apply(abs(RE_R0_N5000_NoIndex_ckmrmultinom5),2,median,na.rm=TRUE)[2]/apply(abs(RE_R0_N5000_NoIndex_5yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(3.05,1-apply(abs(RE_R0_N5000_NoIndex_ckmrmultinom10),2,median,na.rm=TRUE)[2]/apply(abs(RE_R0_N5000_NoIndex_10yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)
points(3.3,1-apply(abs(RE_R0_N5000_NoIndex_ckmrmultinom20),2,median,na.rm=TRUE)[2]/apply(abs(RE_R0_N5000_NoIndex_20yrs_noCKMR),2,median,na.rm=TRUE)[2], pch=16, col=2,cex=1.25)

#Sardine
plot(0.75,1-apply(abs(RE_M_N100_NoIndex_ckmrmultinom5),2,median,na.rm=TRUE)[3]/apply(abs(RE_M_N100_NoIndex_5yrs_noCKMR),2,median,na.rm=TRUE)[3], yaxt="n",ylim=c(-0.2,0.8), col=4, las=1, ylab="", xaxt="n", pch=16, main="", xlab="",xlim=c(0.65,3.35),cex=1.25, cex.axis=1.35)
axis(side=2, at=seq(-0.2,0.8,0.2), labels=seq(-20,80,20), las=1, cex.axis=1.3)
axis(side=1, at=c(0.775,1.025,1.275), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.35)
axis(side=1, at=c(1.775,2.025,2.275), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.35)
axis(side=1, at=c(2.775,3.025,3.275), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.35)
mtext(side=3, text="Sardine", line=-2, font=2, cex=1.35)
abline(h=0, lty=2)
points(1,1-apply(abs(RE_M_N100_NoIndex_ckmrmultinom10),2,median,na.rm=TRUE)[3]/apply(abs(RE_M_N100_NoIndex_10yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
points(1.25,1-apply(abs(RE_M_N100_NoIndex_ckmrmultinom20),2,median,na.rm=TRUE)[3]/apply(abs(RE_M_N100_NoIndex_20yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
points(1.75,1-apply(abs(RE_M_N1000_NoIndex_ckmrmultinom5),2,median,na.rm=TRUE)[3]/apply(abs(RE_M_N1000_NoIndex_5yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, cex=1.25, col=4)
points(2.,1-apply(abs(RE_M_N1000_NoIndex_ckmrmultinom10),2,median,na.rm=TRUE)[3]/apply(abs(RE_M_N1000_NoIndex_10yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
points(2.25,1-apply(abs(RE_M_N1000_NoIndex_ckmrmultinom20),2,median,na.rm=TRUE)[3]/apply(abs(RE_M_N1000_NoIndex_20yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
points(2.75,1-apply(abs(RE_M_N5000_NoIndex_ckmrmultinom5),2,median,na.rm=TRUE)[3]/apply(abs(RE_M_N5000_NoIndex_5yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, cex=1.25,col=4)
points(3.,1-apply(abs(RE_M_N5000_NoIndex_ckmrmultinom10),2,median,na.rm=TRUE)[3]/apply(abs(RE_M_N5000_NoIndex_10yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
points(3.25,1-apply(abs(RE_M_N5000_NoIndex_ckmrmultinom20),2,median,na.rm=TRUE)[3]/apply(abs(RE_M_N5000_NoIndex_20yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=4,cex=1.25)
#R0
points(0.8,1-apply(abs(RE_R0_N100_NoIndex_ckmrmultinom5),2,median,na.rm=TRUE)[3]/apply(abs(RE_R0_N100_NoIndex_5yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, cex=1.25, col=2)
points(1.05,1-apply(abs(RE_R0_N100_NoIndex_ckmrmultinom10),2,median,na.rm=TRUE)[3]/apply(abs(RE_R0_N100_NoIndex_10yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
points(1.3,1-apply(abs(RE_R0_N100_NoIndex_ckmrmultinom20),2,median,na.rm=TRUE)[3]/apply(abs(RE_R0_N100_NoIndex_20yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
points(1.8,1-apply(abs(RE_R0_N1000_NoIndex_ckmrmultinom5),2,median,na.rm=TRUE)[3]/apply(abs(RE_R0_N1000_NoIndex_5yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, cex=1.25,col=2)
points(2.05,1-apply(abs(RE_R0_N1000_NoIndex_ckmrmultinom10),2,median,na.rm=TRUE)[3]/apply(abs(RE_R0_N1000_NoIndex_10yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
points(2.3,1-apply(abs(RE_R0_N1000_NoIndex_ckmrmultinom20),2,median,na.rm=TRUE)[3]/apply(abs(RE_R0_N1000_NoIndex_20yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
points(2.8,1-apply(abs(RE_R0_N5000_NoIndex_ckmrmultinom5),2,median,na.rm=TRUE)[3]/apply(abs(RE_R0_N5000_NoIndex_5yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
points(3.05,1-apply(abs(RE_R0_N5000_NoIndex_ckmrmultinom10),2,median,na.rm=TRUE)[3]/apply(abs(RE_R0_N5000_NoIndex_10yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
mtext(side=1, text="Number of Years of CKMR Collection", line=3.5, cex=1.2)
points(3.3,1-apply(abs(RE_R0_N5000_NoIndex_ckmrmultinom20),2,median,na.rm=TRUE)[3]/apply(abs(RE_R0_N5000_NoIndex_20yrs_noCKMR),2,median,na.rm=TRUE)[3], pch=16, col=2,cex=1.25)
#dev.off()


########################################
#IQR of SSB RE Precision between
########################################
#tiff(filename="C:/Users/fischn/Documents/GitHub/CKMR_Project/IQR_SSB_NoIndex.tiff", height=25, width=35, units='cm', compression="lzw", res=500)
par(mfrow=c(3,3), mar=c(1,1,1.25,0.5), oma=c(3.5,4.5,1.5,1))
#Cod
#100
plot(1:76,1-IQR_RE_ssb_N100_NoIndex_ckmrmultinom5[1,]/IQR_RE_ssb_N100_NoIndex_5yrs_noCKMR[1,], pch=16,col=2, las=1, ylim=c(-0.25,1), ylab="", xlab="", main="100 CKMR Samples",xaxt="n", xlim=c(0,250),bty="[", cex.axis=1.3, cex.main=1.5)
lines(67:76,rep(mean(c(1-IQR_RE_ssb_N100_NoIndex_ckmrmultinom5[1,]/IQR_RE_ssb_N100_NoIndex_5yrs_noCKMR[1,])[67:76]),10), lwd=4, col=4)
points(86:161,1-IQR_RE_ssb_N100_NoIndex_ckmrmultinom10[1,]/IQR_RE_ssb_N100_NoIndex_10yrs_noCKMR[1,], pch=16, col=2)
lines(152:161,rep(mean(c(1-IQR_RE_ssb_N100_NoIndex_ckmrmultinom10[1,]/IQR_RE_ssb_N100_NoIndex_10yrs_noCKMR[1,])[67:76]),10), lwd=4, col=4)
points(171:246,1-IQR_RE_ssb_N100_NoIndex_ckmrmultinom20[1,]/IQR_RE_ssb_N100_NoIndex_20yrs_noCKMR[1,], pch=16, col=2)
lines(237:246,rep(mean(c(1-IQR_RE_ssb_N100_NoIndex_ckmrmultinom20[1,]/IQR_RE_ssb_N100_NoIndex_20yrs_noCKMR[1,])[67:76]),10), lwd=4, col=4)
abline(h=0, lty=2)

#1000
plot(1:76,1-IQR_RE_ssb_N1000_NoIndex_ckmrmultinom5[1,]/IQR_RE_ssb_N1000_NoIndex_5yrs_noCKMR[1,], pch=16, col=2,las=1, ylim=c(-0.25,1), ylab="", xlab="", main="1,000 CKMR Samples",xaxt="n",  xlim=c(0,250),yaxt="n",bty="n", cex.main=1.5)
lines(67:76,rep(mean(c(1-IQR_RE_ssb_N1000_NoIndex_ckmrmultinom5[1,]/IQR_RE_ssb_N1000_NoIndex_5yrs_noCKMR[1,])[67:76]),10), lwd=4, col=4)
points(86:161,1-IQR_RE_ssb_N1000_NoIndex_ckmrmultinom10[1,]/IQR_RE_ssb_N1000_NoIndex_10yrs_noCKMR[1,], pch=16, col=2)
lines(152:161,rep(mean(c(1-IQR_RE_ssb_N1000_NoIndex_ckmrmultinom10[1,]/IQR_RE_ssb_N1000_NoIndex_10yrs_noCKMR[1,])[67:76]),10), lwd=4, col=4)
points(171:246,1-IQR_RE_ssb_N1000_NoIndex_ckmrmultinom20[1,]/IQR_RE_ssb_N1000_NoIndex_20yrs_noCKMR[1,], pch=16, col=2)
lines(237:246,rep(mean(c(1-IQR_RE_ssb_N1000_NoIndex_ckmrmultinom20[1,]/IQR_RE_ssb_N1000_NoIndex_20yrs_noCKMR[1,])[67:76]),10), lwd=4, col=4)
mtext(side=3, text="Cod", line=-2, font=2, cex=1.35)
axis(side=1,lwd.ticks = 0, labels=FALSE)
axis(side=3,lwd.ticks = 0, labels=FALSE)
legend(x=60,y=0.7,c("Mean of last 10 years"), lty=c(1), lwd=c(4),col=c(4), bty="n", cex=1.5)
mtext(text="        No Abundance Index", side=3, line=-10)
abline(h=0, lty=2)

#5000
plot(1:76,1-IQR_RE_ssb_N5000_NoIndex_ckmrmultinom5[1,]/IQR_RE_ssb_N5000_NoIndex_5yrs_noCKMR[1,], pch=16, col=2,las=1, ylim=c(-0.25,1), ylab="", xlab="", main="5,000 CKMR Samples",xaxt="n",  xlim=c(0,250),yaxt="n",bty="]", cex.main=1.5)
lines(67:76,rep(mean(c(1-IQR_RE_ssb_N5000_NoIndex_ckmrmultinom5[1,]/IQR_RE_ssb_N5000_NoIndex_5yrs_noCKMR[1,])[67:76]),10), lwd=4, col=4)
points(86:161,1-IQR_RE_ssb_N5000_NoIndex_ckmrmultinom10[1,]/IQR_RE_ssb_N5000_NoIndex_10yrs_noCKMR[1,], pch=16, col=2)
lines(152:161,rep(mean(c(1-IQR_RE_ssb_N5000_NoIndex_ckmrmultinom10[1,]/IQR_RE_ssb_N5000_NoIndex_10yrs_noCKMR[1,])[67:76]),10), lwd=4, col=4)
points(171:246,1-IQR_RE_ssb_N5000_NoIndex_ckmrmultinom20[1,]/IQR_RE_ssb_N5000_NoIndex_20yrs_noCKMR[1,], pch=16, col=2)
lines(237:246,rep(mean(c(1-IQR_RE_ssb_N5000_NoIndex_ckmrmultinom20[1,]/IQR_RE_ssb_N5000_NoIndex_20yrs_noCKMR[1,])[67:76]),10), lwd=4, col=4)
abline(h=0, lty=2)

#Flatfish
#100
plot(1:76,1-IQR_RE_ssb_N100_NoIndex_ckmrmultinom5[2,]/IQR_RE_ssb_N100_NoIndex_5yrs_noCKMR[2,], pch=16, las=1, col=2,ylim=c(-0.25,1), ylab="", xlab="", main="",xaxt="n", xlim=c(0,250),bty="[", cex.axis=1.3, cex.main=1.2)
lines(67:76,rep(mean(c(1-IQR_RE_ssb_N100_NoIndex_ckmrmultinom5[2,]/IQR_RE_ssb_N100_NoIndex_5yrs_noCKMR[2,])[67:76]),10), lwd=4, col=4)
points(86:161,1-IQR_RE_ssb_N100_NoIndex_ckmrmultinom10[2,]/IQR_RE_ssb_N100_NoIndex_10yrs_noCKMR[2,], pch=16, col=2)
lines(152:161,rep(mean(c(1-IQR_RE_ssb_N100_NoIndex_ckmrmultinom10[2,]/IQR_RE_ssb_N100_NoIndex_10yrs_noCKMR[2,])[67:76]),10), lwd=4, col=4)
points(171:246,1-IQR_RE_ssb_N100_NoIndex_ckmrmultinom20[2,]/IQR_RE_ssb_N100_NoIndex_20yrs_noCKMR[2,], pch=16, col=2)
lines(237:246,rep(mean(c(1-IQR_RE_ssb_N100_NoIndex_ckmrmultinom20[2,]/IQR_RE_ssb_N100_NoIndex_20yrs_noCKMR[2,])[67:76]),10), lwd=4, col=4)
mtext(side=2, text="% Improvement = 100(1 - IQR SSB RE with CKMR/IQR SSB RE No CKMR)", line=3.5, cex=1.1)
abline(h=0, lty=2)

#1000
plot(1:76,1-IQR_RE_ssb_N1000_NoIndex_ckmrmultinom5[2,]/IQR_RE_ssb_N1000_NoIndex_5yrs_noCKMR[2,], pch=16, col=2,las=1, ylim=c(-0.25,1), ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="n")
lines(67:76,rep(mean(c(1-IQR_RE_ssb_N1000_NoIndex_ckmrmultinom5[2,]/IQR_RE_ssb_N1000_NoIndex_5yrs_noCKMR[2,])[67:76]),10), lwd=4, col=4)
points(86:161,1-IQR_RE_ssb_N1000_NoIndex_ckmrmultinom10[2,]/IQR_RE_ssb_N1000_NoIndex_10yrs_noCKMR[2,], pch=16, col=2)
lines(152:161,rep(mean(c(1-IQR_RE_ssb_N1000_NoIndex_ckmrmultinom10[2,]/IQR_RE_ssb_N1000_NoIndex_10yrs_noCKMR[2,])[67:76]),10), lwd=4, col=4)
points(171:246,1-IQR_RE_ssb_N1000_NoIndex_ckmrmultinom20[2,]/IQR_RE_ssb_N1000_NoIndex_20yrs_noCKMR[2,], pch=16, col=2)
lines(237:246,rep(mean(c(1-IQR_RE_ssb_N1000_NoIndex_ckmrmultinom20[2,]/IQR_RE_ssb_N1000_NoIndex_20yrs_noCKMR[2,])[67:76]),10), lwd=4, col=4)
mtext(side=3, text="Flatfish", line=-2, font=2, cex=1.35)
axis(side=1,lwd.ticks = 0, labels=FALSE)
axis(side=3,lwd.ticks = 0, labels=FALSE)
abline(h=0, lty=2)

#5000
plot(1:76,1-IQR_RE_ssb_N5000_NoIndex_ckmrmultinom5[2,]/IQR_RE_ssb_N5000_NoIndex_5yrs_noCKMR[2,], pch=16, col=2,las=1, ylim=c(-0.25,1), ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="]")
lines(67:76,rep(mean(c(1-IQR_RE_ssb_N5000_NoIndex_ckmrmultinom5[2,]/IQR_RE_ssb_N5000_NoIndex_5yrs_noCKMR[2,])[67:76]),10), lwd=4, col=4)
points(86:161,1-IQR_RE_ssb_N5000_NoIndex_ckmrmultinom10[2,]/IQR_RE_ssb_N5000_NoIndex_10yrs_noCKMR[2,], pch=16, col=2)
lines(152:161,rep(mean(c(1-IQR_RE_ssb_N5000_NoIndex_ckmrmultinom10[2,]/IQR_RE_ssb_N5000_NoIndex_10yrs_noCKMR[2,])[67:76]),10), lwd=4, col=4)
points(171:246,1-IQR_RE_ssb_N5000_NoIndex_ckmrmultinom20[2,]/IQR_RE_ssb_N5000_NoIndex_20yrs_noCKMR[2,], pch=16, col=2)
lines(237:246,rep(mean(c(1-IQR_RE_ssb_N5000_NoIndex_ckmrmultinom20[2,]/IQR_RE_ssb_N5000_NoIndex_20yrs_noCKMR[2,])[67:76]),10), lwd=4, col=4)
abline(h=0, lty=2)

#Sardine
#100
plot(1:76,1-IQR_RE_ssb_N100_NoIndex_ckmrmultinom5[3,]/IQR_RE_ssb_N100_NoIndex_5yrs_noCKMR[3,], pch=16, las=1,col=2, ylim=c(-0.25,1), ylab="", xlab="", main="",xaxt="n", xlim=c(0,250), bty="[", cex.axis=1.3, cex.main=1.2)
lines(67:76,rep(mean(c(1-IQR_RE_ssb_N100_NoIndex_ckmrmultinom5[3,]/IQR_RE_ssb_N100_NoIndex_5yrs_noCKMR[3,])[67:76]),10), lwd=4, col=4)
points(86:161,1-IQR_RE_ssb_N100_NoIndex_ckmrmultinom10[3,]/IQR_RE_ssb_N100_NoIndex_10yrs_noCKMR[3,], pch=16, col=2)
lines(152:161,rep(mean(c(1-IQR_RE_ssb_N100_NoIndex_ckmrmultinom10[3,]/IQR_RE_ssb_N100_NoIndex_10yrs_noCKMR[3,])[67:76]),10), lwd=4, col=4)
points(171:246,1-IQR_RE_ssb_N100_NoIndex_ckmrmultinom20[3,]/IQR_RE_ssb_N100_NoIndex_20yrs_noCKMR[3,], pch=16, col=2)
lines(237:246,rep(mean(c(1-IQR_RE_ssb_N100_NoIndex_ckmrmultinom20[3,]/IQR_RE_ssb_N100_NoIndex_20yrs_noCKMR[3,])[67:76]),10), lwd=4, col=4)
axis(side=1, at=c(40,127,211), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.3)
abline(h=0, lty=2)

#1000
plot(1:76,1-IQR_RE_ssb_N1000_NoIndex_ckmrmultinom5[3,]/IQR_RE_ssb_N1000_NoIndex_5yrs_noCKMR[3,], pch=16, col=2,las=1, ylim=c(-0.25,1), cex.axis=1.3, ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="n")
lines(67:76,rep(mean(c(1-IQR_RE_ssb_N1000_NoIndex_ckmrmultinom5[3,]/IQR_RE_ssb_N1000_NoIndex_5yrs_noCKMR[3,])[67:76]),10), lwd=4, col=4)
points(86:161,1-IQR_RE_ssb_N1000_NoIndex_ckmrmultinom10[3,]/IQR_RE_ssb_N1000_NoIndex_10yrs_noCKMR[3,], pch=16, col=2)
lines(152:161,rep(mean(c(1-IQR_RE_ssb_N1000_NoIndex_ckmrmultinom10[3,]/IQR_RE_ssb_N1000_NoIndex_10yrs_noCKMR[3,])[67:76]),10), lwd=4, col=4)
points(171:246,1-IQR_RE_ssb_N1000_NoIndex_ckmrmultinom20[3,]/IQR_RE_ssb_N1000_NoIndex_20yrs_noCKMR[3,], pch=16, col=2)
lines(237:246,rep(mean(c(1-IQR_RE_ssb_N1000_NoIndex_ckmrmultinom20[3,]/IQR_RE_ssb_N1000_NoIndex_20yrs_noCKMR[3,])[67:76]),10), lwd=4, col=4)
axis(side=1, at=c(40,127,211), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.3)
mtext(side=3, text="Sardine", line=-2, font=2, cex=1.35)
mtext(side=1, text="Number of Years of CKMR Collection", line=3.25, cex=1.2)
axis(side=1,lwd.ticks = 0, labels=FALSE)
axis(side=3,lwd.ticks = 0, labels=FALSE)
abline(h=0, lty=2)

#5000
plot(1:76,1-IQR_RE_ssb_N5000_NoIndex_ckmrmultinom5[3,]/IQR_RE_ssb_N5000_NoIndex_5yrs_noCKMR[3,], pch=16, col=2,las=1, ylim=c(-0.25,1), cex.axis=1.3, ylab="", xlab="", main="",xaxt="n",  xlim=c(0,250),yaxt="n",bty="]")
lines(67:76,rep(mean(c(1-IQR_RE_ssb_N5000_NoIndex_ckmrmultinom5[3,]/IQR_RE_ssb_N5000_NoIndex_5yrs_noCKMR[3,])[67:76]),10), lwd=4, col=4)
points(86:161,1-IQR_RE_ssb_N5000_NoIndex_ckmrmultinom10[3,]/IQR_RE_ssb_N5000_NoIndex_10yrs_noCKMR[3,], pch=16, col=2)
lines(152:161,rep(mean(c(1-IQR_RE_ssb_N5000_NoIndex_ckmrmultinom10[3,]/IQR_RE_ssb_N5000_NoIndex_10yrs_noCKMR[3,])[67:76]),10), lwd=4, col=4)
points(171:246,1-IQR_RE_ssb_N5000_NoIndex_ckmrmultinom20[3,]/IQR_RE_ssb_N5000_NoIndex_20yrs_noCKMR[3,], pch=16, col=2)
lines(237:246,rep(mean(c(1-IQR_RE_ssb_N5000_NoIndex_ckmrmultinom20[3,]/IQR_RE_ssb_N5000_NoIndex_20yrs_noCKMR[3,])[67:76]),10), lwd=4, col=4)
axis(side=1, at=c(40,127,211), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.3)
abline(h=0, lty=2)
#dev.off()

#################################
#M and R0
#################################
#tiff(filename="C:/Users/fischn/Documents/GitHub/CKMR_Project/IQR_M_R0_NoIndex.tiff", height=30, width=20, units='cm', compression="lzw", res=500)
par(mfcol=c(3,1), mar=c(2.25,1,0.25,0.5), oma=c(4,4,1.5,1))
#Index 0.5###################
#Median SEs of M and R0
#Cod
plot(0.75,1-IQR_RE_M_N100_NoIndex_ckmrmultinom5[1]/IQR_RE_M_N100_NoIndex_5yrs_noCKMR[1], ylim=c(-0.2,0.8), las=1, ylab="", xaxt="n", pch=16, main="", xlab="",xlim=c(0.65,3.35),cex=1.25, col=4, cex.axis=1.35)
mtext(side=3, text="Cod", line=-2, font=2, cex=1.35)
legend(x=1.65,0.6, y=, c("Natural Mortality", "Unfished Recruitment"), pch=16, col=c(4,2), bty="n", cex=1.35)
mtext(text="  No Abundance Index", side=3, line=-12)
abline(h=0, lty=2)
points(1,1-IQR_RE_M_N100_NoIndex_ckmrmultinom10[1]/IQR_RE_M_N100_NoIndex_10yrs_noCKMR[1], pch=16, col=4,cex=1.25)
points(1.25,1-IQR_RE_M_N100_NoIndex_ckmrmultinom20[1]/IQR_RE_M_N100_NoIndex_20yrs_noCKMR[1], pch=16, col=4,cex=1.25)
points(1.75,1-IQR_RE_M_N1000_NoIndex_ckmrmultinom5[1]/IQR_RE_M_N1000_NoIndex_5yrs_noCKMR[1], pch=16, cex=1.25, col=4)
points(2,1-IQR_RE_M_N1000_NoIndex_ckmrmultinom10[1]/IQR_RE_M_N1000_NoIndex_10yrs_noCKMR[1], pch=16, col=4,cex=1.25)
points(2.25,1-IQR_RE_M_N1000_NoIndex_ckmrmultinom20[1]/IQR_RE_M_N1000_NoIndex_20yrs_noCKMR[1], pch=16, col=4,cex=1.25)
points(2.75,1-IQR_RE_M_N5000_NoIndex_ckmrmultinom5[1]/IQR_RE_M_N5000_NoIndex_5yrs_noCKMR[1], pch=16, cex=1.25,col=4)
points(3,1-IQR_RE_M_N5000_NoIndex_ckmrmultinom10[1]/IQR_RE_M_N5000_NoIndex_10yrs_noCKMR[1], pch=16, col=4,cex=1.25)
points(3.25,1-IQR_RE_M_N5000_NoIndex_ckmrmultinom20[1]/IQR_RE_M_N5000_NoIndex_20yrs_noCKMR[1], pch=16, col=4,cex=1.25)
#R0
points(0.8,1-IQR_RE_R0_N100_NoIndex_ckmrmultinom5[1]/IQR_RE_R0_N100_NoIndex_5yrs_noCKMR[1], pch=16, cex=1.25, col=2)
points(1.05,1-IQR_RE_R0_N100_NoIndex_ckmrmultinom10[1]/IQR_RE_R0_N100_NoIndex_10yrs_noCKMR[1], pch=16, col=2,cex=1.25)
points(1.3,1-IQR_RE_R0_N100_NoIndex_ckmrmultinom20[1]/IQR_RE_R0_N100_NoIndex_20yrs_noCKMR[1], pch=16, col=2,cex=1.25)
points(1.8,1-IQR_RE_R0_N1000_NoIndex_ckmrmultinom5[1]/IQR_RE_R0_N1000_NoIndex_5yrs_noCKMR[1], pch=16, cex=1.25,col=2)
points(2.05,1-IQR_RE_R0_N1000_NoIndex_ckmrmultinom10[1]/IQR_RE_R0_N1000_NoIndex_10yrs_noCKMR[1], pch=16, col=2,cex=1.25)
points(2.3,1-IQR_RE_R0_N1000_NoIndex_ckmrmultinom20[1]/IQR_RE_R0_N1000_NoIndex_20yrs_noCKMR[1], pch=16, col=2,cex=1.25)
points(2.8,1-IQR_RE_R0_N5000_NoIndex_ckmrmultinom5[1]/IQR_RE_R0_N5000_NoIndex_5yrs_noCKMR[1], pch=16, col=2,cex=1.25)
points(3.05,1-IQR_RE_R0_N5000_NoIndex_ckmrmultinom10[1]/IQR_RE_R0_N5000_NoIndex_10yrs_noCKMR[1], pch=16, col=2,cex=1.25)
points(3.3,1-IQR_RE_R0_N5000_NoIndex_ckmrmultinom20[1]/IQR_RE_R0_N5000_NoIndex_20yrs_noCKMR[1], pch=16, col=2,cex=1.25)

#Flatfish
plot(0.75,1-IQR_RE_M_N100_NoIndex_ckmrmultinom5[2]/IQR_RE_M_N100_NoIndex_5yrs_noCKMR[2], ylim=c(-0.2,0.8), col=4,las=1, ylab="", xaxt="n", pch=16, main="", xlab="",xlim=c(0.65,3.35),cex=1.25, cex.axis=1.35)
mtext(side=2, text="% Improvement = 100(1 - IQR RE with CKMR/IQR RE No CKMR)", line=3.5)
mtext(side=3, text="Flatfish", line=-2, font=2, cex=1.35)
abline(h=0, lty=2)
points(1,1-IQR_RE_M_N100_NoIndex_ckmrmultinom10[2]/IQR_RE_M_N100_NoIndex_10yrs_noCKMR[2], pch=16, col=4,cex=1.25)
points(1.25,1-IQR_RE_M_N100_NoIndex_ckmrmultinom20[2]/IQR_RE_M_N100_NoIndex_20yrs_noCKMR[2], pch=16, col=4,cex=1.25)
points(1.75,1-IQR_RE_M_N1000_NoIndex_ckmrmultinom5[2]/IQR_RE_M_N1000_NoIndex_5yrs_noCKMR[2], pch=16, cex=1.25, col=4)
points(2,1-IQR_RE_M_N1000_NoIndex_ckmrmultinom10[2]/IQR_RE_M_N1000_NoIndex_10yrs_noCKMR[2], pch=16, col=4,cex=1.25)
points(2.25,1-IQR_RE_M_N1000_NoIndex_ckmrmultinom20[2]/IQR_RE_M_N1000_NoIndex_20yrs_noCKMR[2], pch=16, col=4,cex=1.25)
points(2.75,1-IQR_RE_M_N5000_NoIndex_ckmrmultinom5[2]/IQR_RE_M_N5000_NoIndex_5yrs_noCKMR[2], pch=16, cex=1.25,col=4)
points(3,1-IQR_RE_M_N5000_NoIndex_ckmrmultinom10[2]/IQR_RE_M_N5000_NoIndex_10yrs_noCKMR[2], pch=16, col=4,cex=1.25)
points(3.25,1-IQR_RE_M_N5000_NoIndex_ckmrmultinom20[2]/IQR_RE_M_N5000_NoIndex_20yrs_noCKMR[2], pch=16, col=4,cex=1.25)
#R0
points(0.8,1-IQR_RE_R0_N100_NoIndex_ckmrmultinom5[2]/IQR_RE_R0_N100_NoIndex_5yrs_noCKMR[2], pch=16, cex=1.25, col=2)
points(1.05,1-IQR_RE_R0_N100_NoIndex_ckmrmultinom10[2]/IQR_RE_R0_N100_NoIndex_10yrs_noCKMR[2], pch=16, col=2,cex=1.25)
points(1.3,1-IQR_RE_R0_N100_NoIndex_ckmrmultinom20[2]/IQR_RE_R0_N100_NoIndex_20yrs_noCKMR[2], pch=16, col=2,cex=1.25)
points(1.8,1-IQR_RE_R0_N1000_NoIndex_ckmrmultinom5[2]/IQR_RE_R0_N1000_NoIndex_5yrs_noCKMR[2], pch=16, cex=1.25,col=2)
points(2.05,1-IQR_RE_R0_N1000_NoIndex_ckmrmultinom10[2]/IQR_RE_R0_N1000_NoIndex_10yrs_noCKMR[2], pch=16, col=2,cex=1.25)
points(2.3,1-IQR_RE_R0_N1000_NoIndex_ckmrmultinom20[2]/IQR_RE_R0_N1000_NoIndex_20yrs_noCKMR[2], pch=16, col=2,cex=1.25)
points(2.8,1-IQR_RE_R0_N5000_NoIndex_ckmrmultinom5[2]/IQR_RE_R0_N5000_NoIndex_5yrs_noCKMR[2], pch=16, col=2,cex=1.25)
points(3.05,1-IQR_RE_R0_N5000_NoIndex_ckmrmultinom10[2]/IQR_RE_R0_N5000_NoIndex_10yrs_noCKMR[2], pch=16, col=2,cex=1.25)
points(3.3,1-IQR_RE_R0_N5000_NoIndex_ckmrmultinom20[2]/IQR_RE_R0_N5000_NoIndex_20yrs_noCKMR[2], pch=16, col=2,cex=1.25)
#Sardine
plot(0.75,1-IQR_RE_M_N100_NoIndex_ckmrmultinom5[3]/IQR_RE_M_N100_NoIndex_5yrs_noCKMR[3], ylim=c(-0.2,0.8), col=4, las=1, ylab="", xaxt="n", pch=16, main="", xlab="",xlim=c(0.65,3.35),cex=1.25, cex.axis=1.35)
axis(side=1, at=c(0.775,1.025,1.275), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.35)
axis(side=1, at=c(1.775,2.025,2.275), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.35)
axis(side=1, at=c(2.775,3.025,3.275), labels=c("5yrs", "10yrs", "20yrs"), cex.axis=1.35)
mtext(side=3, text="Sardine", line=-2, font=2, cex=1.35)
abline(h=0, lty=2)
points(1,1-IQR_RE_M_N100_NoIndex_ckmrmultinom10[3]/IQR_RE_M_N100_NoIndex_10yrs_noCKMR[3], pch=16, col=4,cex=1.25)
points(1.25,1-IQR_RE_M_N100_NoIndex_ckmrmultinom20[3]/IQR_RE_M_N100_NoIndex_20yrs_noCKMR[3], pch=16, col=4,cex=1.25)
points(1.75,1-IQR_RE_M_N1000_NoIndex_ckmrmultinom5[3]/IQR_RE_M_N1000_NoIndex_5yrs_noCKMR[3], pch=16, cex=1.25, col=4)
points(2.,1-IQR_RE_M_N1000_NoIndex_ckmrmultinom10[3]/IQR_RE_M_N1000_NoIndex_10yrs_noCKMR[3], pch=16, col=4,cex=1.25)
points(2.25,1-IQR_RE_M_N1000_NoIndex_ckmrmultinom20[3]/IQR_RE_M_N1000_NoIndex_20yrs_noCKMR[3], pch=16, col=4,cex=1.25)
points(2.75,1-IQR_RE_M_N5000_NoIndex_ckmrmultinom5[3]/IQR_RE_M_N5000_NoIndex_5yrs_noCKMR[3], pch=16, cex=1.25,col=4)
points(3.,1-IQR_RE_M_N5000_NoIndex_ckmrmultinom10[3]/IQR_RE_M_N5000_NoIndex_10yrs_noCKMR[3], pch=16, col=4,cex=1.25)
points(3.25,1-IQR_RE_M_N5000_NoIndex_ckmrmultinom20[3]/IQR_RE_M_N5000_NoIndex_20yrs_noCKMR[3], pch=16, col=4,cex=1.25)
#R0
points(0.8,1-IQR_RE_R0_N100_NoIndex_ckmrmultinom5[3]/IQR_RE_R0_N100_NoIndex_5yrs_noCKMR[3], pch=16, cex=1.25, col=2)
points(1.05,1-IQR_RE_R0_N100_NoIndex_ckmrmultinom10[3]/IQR_RE_R0_N100_NoIndex_10yrs_noCKMR[3], pch=16, col=2,cex=1.25)
points(1.3,1-IQR_RE_R0_N100_NoIndex_ckmrmultinom20[3]/IQR_RE_R0_N100_NoIndex_20yrs_noCKMR[3], pch=16, col=2,cex=1.25)
points(1.8,1-IQR_RE_R0_N1000_NoIndex_ckmrmultinom5[3]/IQR_RE_R0_N1000_NoIndex_5yrs_noCKMR[3], pch=16, cex=1.25,col=2)
points(2.05,1-IQR_RE_R0_N1000_NoIndex_ckmrmultinom10[3]/IQR_RE_R0_N1000_NoIndex_10yrs_noCKMR[3], pch=16, col=2,cex=1.25)
points(2.3,1-IQR_RE_R0_N1000_NoIndex_ckmrmultinom20[3]/IQR_RE_R0_N1000_NoIndex_20yrs_noCKMR[3], pch=16, col=2,cex=1.25)
points(2.8,1-IQR_RE_R0_N5000_NoIndex_ckmrmultinom5[3]/IQR_RE_R0_N5000_NoIndex_5yrs_noCKMR[3], pch=16, col=2,cex=1.25)
points(3.05,1-IQR_RE_R0_N5000_NoIndex_ckmrmultinom10[3]/IQR_RE_R0_N5000_NoIndex_10yrs_noCKMR[3], pch=16, col=2,cex=1.25)
mtext(side=1, text="Number of Years of CKMR Collection", line=3.5, cex=1.2)
points(3.3,1-IQR_RE_R0_N5000_NoIndex_ckmrmultinom20[3]/IQR_RE_R0_N5000_NoIndex_20yrs_noCKMR[3], pch=16, col=2,cex=1.25)
#dev.off()


