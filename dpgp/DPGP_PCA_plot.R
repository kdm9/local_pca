setwd("~/Documents/Drosophila/Chr3L")
c=as.matrix(read.table("cov_data_for_all_samples_seqs_both_low_NAs_Chr3L.txt"))
PCA=eigen(c)
Vec=PCA$vectors
lam=PCA$values
PC1=Vec[,1]
PC2=Vec[,2]
PC3=Vec[,3]
PC1=as.matrix(PC1)
PC2=as.matrix(PC2)
PC3=as.matrix(PC3)
origin=colnames(c) 
origin1=substring(origin,1,2)
countrys=as.matrix(read.table("population_country.txt"))
for(i in 1:nrow(countrys)){origin1[which(origin1==countrys[i,1])]=countrys[i,2]}
rownames(PC1)=origin1
rownames(PC2)=origin1
rownames(PC3)=origin1
pdf(file="pca_plots_for_all_samples_Chr3L_legend12.pdf")
group=as.numeric(as.factor(origin1))
par(mar=c(5,4,4,8),xpd=TRUE)
plot(PC1,PC2,pch=group,col=rainbow(16)[group])
legend(0.06,0.05,pch=1:16,col=rainbow(16),legend=levels(factor(origin1)))
dev.off()
PC=cbind(PC1,PC2,PC3)
pdf(file="pca_plots_for_all_samples_Chr3L_legend123.pdf")
group=as.numeric(as.factor(origin1))
pairs(PC,pch=group,col=rainbow(16)[group])
dev.off()
