#Looking at results

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

res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N100_Ind25.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N100_Ind25.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N100_Ind25.RData"))

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


res_list[[1]]<-readRDS(paste0(wd,"/SCAAfit_Cod_N100_Ind50.RData"))
res_list[[2]]<-readRDS(paste0(wd,"/SCAAfit_Flatfish_N100_Ind50.RData"))
res_list[[3]]<-readRDS(paste0(wd,"/SCAAfit_Sardine_N100_Ind50.RData"))

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



