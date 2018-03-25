library(dplyr)
library(tidyr)
library(ggplot2)

# Reading random datas

set.seed(1234)
par(mar=c(0,0,0,0))
x<- rnorm(12, mean = rep(1:3, each=4), sd=0.2)
y<- rnorm(12,mean = rep(1:3, each=4), sd=0.4)
#plot(x,y, col='blue', pch=19, cex=2)
#text(x+0.05, y+0.05, labels = as.character(1:12))

# Clustering of data

data_frame <- data_frame(x=x, y=y)
dist_xy <- dist(data_frame)
hclustering<-hclust(dist_xy)
plot(hclustering)

#Heat Map

#data_matrix <- as.matrix(data_frame)[sample(1:12)]
#heatmap(data_matrix)

image(1:10,161)
