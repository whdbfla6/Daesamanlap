library(ggfortify)
library(factoextra)
library(corrplot)
library(tidyverse)
library(cluster)
library(NbClust)

train<- read.table("merged_train.csv", header=TRUE, sep=",")
data=b10[ , c(3:9)]

boxplot(data,main="USCrime", ylab="number of crimes")

sdata= scale(data)

summary(sdata)

boxplot(sdata, notch=TRUE, col=c("gold","darkgreen"),main="USCrime", ylab="number of crimes")

set.seed(2016171017)
nc <- NbClust(sdata, min.nc=2, max.nc=15, method="kmeans")
par(mfrow=c(1,1))
barplot(table(nc$Best.n[1,]),
        xlab="Numer of Clusters", ylab="Number of Criteria",
        main="Number of Clusters Chosen_scaled data")


wssplot=function(sdata,nc=15,seed=1234,plot=TRUE){
  wss <- (nrow(data)-1)*sum(apply(data,2,var))
  
  for( i in 2:nc){
    set.seed(seed)
    wss[i]<-sum(kmeans(data,centers=i)$withinss)
  }
  if(plot) plot(1:nc,wss,type="b",xlab="Number of Clusters",ylab="Within group sum of squares")
  wss
}

wssplot(sdata)

set.seed(2016171017)

# k = 3

km<- kmeans(sdata, 3) 

km$cluster

fviz_cluster(km, data = sdata) # autoplot(km, data = data, label = TRUE, label.size = 3)

annotation <- data.frame(
  x = c(-2,0,3),
  y = c(0,-1,0),
  label = c("low crime rate & high violence", "high property crime", "high crime rate")
)

win.graph()
fviz_cluster(km, data = sdata) + geom_label(data=annotation, aes( x=x, y=y, label=label),                 , 
                                            color=c("red", "blue","darkgreen"), size=4, angle=45, fontface="bold" )

# k = 2, k = 4

km2<- kmeans(sdata, 2) #rownames(data)<-b10[,10]

fviz_cluster(km2, data = sdata) # autoplot(km, data = data, label = TRUE, label.size = 3)

annotation <- data.frame(
  x = c(-2,2),
  y = c(0,0),
  label = c("low crime rate", "high crime rate")
)

win.graph()

fviz_cluster(km2, data = sdata) + geom_label(data=annotation, aes( x=x, y=y, label=label),                 , 
                                             color=c("red", "blue"), size=3 , angle=45, fontface="bold" )


km4<- kmeans(sdata, 4)

win.graph()

fviz_cluster(km4, data = sdata)


# PCA와 결과를 비교하기 위해서 FA도 해보았습니다. 

factor0 = factanal(data, factor = 2, scores = 'regression', 
                   rotation = 'promax') 

print(factor0, cutoff = 0)

win.graph()

corrplot(factor0$loadings[1:7,])

fa <- autoplot(factor0, label = TRUE, label.size = 1,
               loadings = TRUE, loadings.label = TRUE, 
               loadings.label.size= 3)
fa+annotate('text', factor0$scores[,1], factor0$scores[,2], label=b10[,10])
# 둘다 상관계수 기반이라서 PCA와 해석하는 바가 크게 달라질 거 같지는 않아요
# 이럴 때는 무엇과 함께 보는 것이 좋은 것일까?
# => 해석이 더 잘되는 것으로 사용!

##################################
# 2. Exercise 14.7, 4th Edition. #

# Use the Fisher’s linear discrimination function on the WAIS data set 
# and evaluate the results 
# by re-substitution the probabilities of misclassification.

library(MASS)

wais <- read.table("WAIS-data-Table22-12.csv", header=TRUE, sep=",")

wdata = wais[,-2]


win.graph() # dev.off()
corrplot(cor(wdata[,-1]))

boxplot(wdata[,-1], notch=TRUE, col=c("gold","darkgreen"),main="WAIS", xlab="Intelligence") 

sdata= scale(wdata[,-1])

win.graph()
boxplot(sdata, notch=TRUE, col=c("gold","darkgreen"),main="WAIS_scaled", xlab="Intelligence") 


# LDA 해보자

x= as.data.frame(sdata)   # log(wdata[,2:5]+1)는 안하는걸로...

x

y= wdata[,"IGROUP"]

r<-lda(formula =y~., data=x)

r

lda.values <- predict(r, x)
lda.class <- predict(r)$class
lda.values
lda.class

table(y, predict(r)$class)


win.graph()
#create a scatterplot of the discriminant function values
plot(lda.values$x[,1], type="n", xlim=c(0,50), ylab=c("LDA 1: Senile Factor"), xlab= "data", main= "Predict Result")
text(lda.values$x[,1],  col= c(as.numeric(lda.class)+10))

win.graph()
#create a scatterplot of the discriminant function values
plot(lda.values$x[,1], type="n", xlim=c(0,50), ylab=c("LDA 1: Senile Factor"), xlab= "data", main= "Original Group")
text(lda.values$x[,1],  col= c(as.numeric(y)+10))

win.graph()
plot(r, col= c('skyblue'))


# 추가 : PCA

pca_prcomp=prcomp(wdata[,c(2:5)], scale.=TRUE)
pca_prcomp

win.graph()
corrplot(pca_prcomp$rotation[, c(1:2)], method='circle')

pc1_score= pca_prcomp$x[,1]
pc2_score= pca_prcomp$x[,2]
colo=rep(c('orange', 'hotpink'), c(12,37))

win.graph()
autoplot(pca_prcomp,data= wdata,loadings=TRUE,
         loadings.label=TRUE)+annotate('text',pc1_score/11, pc2_score/11,
                                       label=wdata[,1], col= colo)



