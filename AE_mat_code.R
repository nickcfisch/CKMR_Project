
############################################################
#Getting Ageing error matrices for each life history type
############################################################

#From Figure 6.2.1.4 and 6.2.1.1 of "Report of the Workshop on Age Reading of North Sea Cod (WKARNSC)". The average is about 0.25 for CV
Feb_CV<-c(NA,NA,0.22,0.18,0.15,0.16,0)
Mar_CV<-c(NA,0.6,0.29,0.22,0.35,0,NA)

Feb_SD<-c(NA,NA,0.58,0.54,0.61,0.76,0.77)
Mar_SD<-c(NA,1.2,0.7,0.6,1.25,1.35,NA)

plot(0:6, Feb_CV, pch=16, ylim=c(0,0.75), ylab="CV", xlab="Age", xlim=c(0,25), las=1)
points(0:6,Mar_CV, pch=16, col=2)

dat<-data.frame(x=c(0:6,0:6), y=c(Feb_CV,Mar_CV))
fit<-nls(y ~ a * exp(-S * x), data=dat,  start = list(a = 0.5, S = 0.1))
points(0:25,predict(fit, newdata=data.frame(x=0:25)), points=3)

Cod_age<-0:25
Cod_CV<-c(predict(fit, newdata=data.frame(x=0:6)), rep(predict(fit, newdata=data.frame(x=7)),length(7:25)))
#Cod_CV<-rep(0.25,length(Cod_age))
#Cod_SD<-0.023+0.072*0:25 #From 2022 AFSC Pcod assessment

AE_mat<-matrix(NA, nrow=length(Cod_age), ncol=length(Cod_age))
for (i in 1:nrow(AE_mat)) {
  for(j in 1:nrow(AE_mat)){
    if(j==1){                      #if age=0 then integrate from 0.5 to 0
      AE_mat[i,j]<-pnorm(Cod_age[j]+0.5, mean = Cod_age[i], sd = Cod_CV[i]*Cod_age[i])
    }else if (j %in% 2:(nrow(AE_mat)-1)){        #integrate from age+0.5 to age-0.5
      AE_mat[i,j]<-pnorm(Cod_age[j]+0.5, mean = Cod_age[i], sd = Cod_CV[i]*Cod_age[i])-pnorm(Cod_age[j]-0.5, mean = Cod_age[i], sd = Cod_CV[i]*Cod_age[i])
    }else if (j==nrow(AE_mat)){    # if you are in plus group integrate from age-0.5 to infinity
      AE_mat[i,j]<-1-pnorm(Cod_age[j]-0.5, mean = Cod_age[i], sd = Cod_CV[i]*Cod_age[i])
    }
  }
}

round(AE_mat,3)
AE_mat_Cod<-AE_mat

##############################
#Flatfish
##############################

#Will use DFO Petrale SDs
Flatfish_SD<-c(0, 0.142,	0.142,	0.243,	0.344,	0.446,	0.548,	0.651,	0.754,	0.859,	0.963,	1.07,	1.17,	1.28,	1.39,	1.5, 1.6, 1.71,	1.82,	1.93,	2.04,	2.15,	2.27,	2.38,	2.38,	2.38)
Flatfish_age<-0:25

AE_mat<-matrix(NA, nrow=length(Flatfish_age), ncol=length(Flatfish_age))
for (i in 1:nrow(AE_mat)) {
  for(j in 1:nrow(AE_mat)){
    if(j==1){                      #if age=0 then integrate from 0.5 to 0
      AE_mat[i,j]<-pnorm(Flatfish_age[j]+0.5, mean = Flatfish_age[i], sd = Flatfish_SD[i])
    }else if (j %in% 2:(nrow(AE_mat)-1)){        #integrate from age+0.5 to age-0.5
      AE_mat[i,j]<-pnorm(Flatfish_age[j]+0.5, mean = Flatfish_age[i], sd = Flatfish_SD[i])-pnorm(Flatfish_age[j]-0.5, mean = Flatfish_age[i], sd = Flatfish_SD[i])
    }else if (j==nrow(AE_mat)){    # if you are in plus group integrate from age-0.5 to infinity
      AE_mat[i,j]<-1-pnorm(Flatfish_age[j]-0.5, mean = Flatfish_age[i], sd = Flatfish_SD[i])
    }
  }
}

round(AE_mat,3)
AE_mat_Flatfish<-AE_mat

#From Table 13.1 of https://repository.library.noaa.gov/view/noaa/61071
Sardine_age<-0:15
Sardine_SD<-c(0.14,0.14,0.41,0.51,0.55,0.56,0.57,0.57,0.57,0.57,0.57,0.57,0.57,0.57,0.57,0.57)

AE_mat<-matrix(NA, nrow=length(Sardine_age), ncol=length(Sardine_age))
for (i in 1:nrow(AE_mat)) {
  for(j in 1:nrow(AE_mat)){
    if(j==1){                      #if age=0 then integrate from 0.5 to 0
      AE_mat[i,j]<-pnorm(Sardine_age[j]+0.5, mean = Sardine_age[i], sd = Sardine_SD[i])
    }else if (j %in% 2:(nrow(AE_mat)-1)){        #integrate from age+0.5 to age-0.5
      AE_mat[i,j]<-pnorm(Sardine_age[j]+0.5, mean = Sardine_age[i], sd = Sardine_SD[i])-pnorm(Sardine_age[j]-0.5, mean = Sardine_age[i], sd = Sardine_SD[i])
    }else if (j==nrow(AE_mat)){    # if you are in plus group integrate from age-0.5 to infinity
      AE_mat[i,j]<-1-pnorm(Sardine_age[j]-0.5, mean = Sardine_age[i], sd = Sardine_SD[i])
    }
  }
}

round(AE_mat,3)
AE_mat_Sardine<-AE_mat

#Cod 1, Flatfish 2, Sardine 3. 
AE_mat_list<-list(AE_mat_Cod, AE_mat_Flatfish, AE_mat_Sardine)
#saveRDS(AE_mat_list, file="C:/Users/fischn/Documents/GitHub/CKMR_Project/AE_mat_list.RData")

par(mfrow=c(2,3))
plot(0:25,Cod_CV, main="Cod", ylab="CV", pch=16, las=1, ylim=c(0,1), xlab="")
plot(0:25,Flatfish_SD, main="Flatfish", ylab="SD", pch=16, las=1, ylim=c(0,2.5), xlab="Age")
plot(0:15,Sardine_SD, main="Sardine", ylab="SD", pch=16, las=1, ylim=c(0,0.75), xlab="")
library(PBSmodelling)
plotBubbles(t(AE_mat_Cod), xaxt="n", yaxt="n", ylab="Coded Age", xlab="True Age", size=0.15)
axis(side=1, at=1:26, labels=0:25, las=1)
axis(side=2, at=1:26, labels=0:25, las=1)
plotBubbles(t(AE_mat_Flatfish), xaxt="n", yaxt="n", ylab="Coded Age", xlab="True Age", size=0.15)
axis(side=1, at=1:26, labels=0:25, las=1)
axis(side=2, at=1:26, labels=0:25, las=1)
plotBubbles(t(AE_mat_Sardine), xaxt="n", yaxt="n", ylab="Coded Age", xlab="True Age", size=0.15)
axis(side=1, at=1:16, labels=0:15, las=1)
axis(side=2, at=1:16, labels=0:15, las=1)
