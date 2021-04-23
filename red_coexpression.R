library(minet)
mydata <- read.csv("dge_normalizado.csv", header=FALSE)
df1 <- data.frame(mydata)
df1 <- data.frame(df1[,-1], row.names = df1[,1])
datos<-t(df1)
datos.data<-data.frame(datos)
mim_r <- build.mim(datos.data,estimator="spearman")
net_r <- aracne(mim_r, eps=0)
otro_mim <- mim_r
otra_cosita <- otro_mim < 0.7122843 # Valor proveniente de la matriz randomizada 99.9%
otro_mim[otra_cosita] <- 0
nueva_net3 <- aracne(otro_mim)
write.table(nueva_net3, file="Prueba3.csv", sep=",")