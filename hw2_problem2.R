uciRoot <- "http://archive.ics.uci.edu/ml/machine-learning-databases/"
datURL <- "abalone/abalone.data"
abaloneDat <- read.table(paste0(uciRoot ,datURL),sep=",")

# naming the attributes for each column 
colnames(abaloneDat) <- c("sex","length","diameter","height","whole.weight", "shucked.weight", "viscera.weight", "shell.weight", "rings") 
#predictors are sex, length, diameter, height, whole weight, shucked weight, viscera weight, shell weight
#all 7 predictors are continuous except for sex, which is categorical with categories M, F, I
#the outcome is rings, which predicts abalone's age. Rings are in integer only.

#generating summary data 
dim(abaloneDat)
summary(abaloneDat)
#there are 9 variables and 4177 observations

#sex          length         diameter          height        whole.weight   
#F:1307   Min.   :0.075   Min.   :0.0550   Min.   :0.0000   Min.   :0.0020  
#I:1342   1st Qu.:0.450   1st Qu.:0.3500   1st Qu.:0.1150   1st Qu.:0.4415  
#M:1528   Median :0.545   Median :0.4250   Median :0.1400   Median :0.7995  
#Mean   :0.524   Mean   :0.4079   Mean   :0.1395   Mean   :0.8287  
#3rd Qu.:0.615   3rd Qu.:0.4800   3rd Qu.:0.1650   3rd Qu.:1.1530  
#Max.   :0.815   Max.   :0.6500   Max.   :1.1300   Max.   :2.8255  
#shucked.weight   viscera.weight    shell.weight        rings       
#Min.   :0.0010   Min.   :0.0005   Min.   :0.0015   Min.   : 1.000  
#1st Qu.:0.1860   1st Qu.:0.0935   1st Qu.:0.1300   1st Qu.: 8.000  
#Median :0.3360   Median :0.1710   Median :0.2340   Median : 9.000  
#Mean   :0.3594   Mean   :0.1806   Mean   :0.2388   Mean   : 9.934  
#3rd Qu.:0.5020   3rd Qu.:0.2530   3rd Qu.:0.3290   3rd Qu.:11.000  
#Max.   :1.4880   Max.   :0.7600   Max.   :1.0050   Max.   :29.000

#graphing several scatterplots
plot(abaloneDat$length, abaloneDat$length, pch =19, cex =0.7) 
plot(abaloneDat$diameter, abaloneDat$height, pch=19, cex=0.7)
plot(abaloneDat$whole.weight, abaloneDat$shucked.weight, pch=19, cex=0.7)
plot(abaloneDat$viscera.weight, abaloneDat$shell.weight, pch=19, cex=0.7, col=abaloneDat$rings)

#graphing the scatterplot matrix 
pairs(abaloneDat[2:8], pch =10, cex = 0.5, col=abaloneDat$rings)

#Here it is more difficult to tell which variable had the most distinc clustering due to the number of clusters (rings)
#and also the many related attributes (for example, whole weight is also correlated with shucked weight, visceral weight, and shell weight)
#Based on what I can see, it appears that the shucked weight is likely the best predictor because the colors/clusters are more spread out
#and distinct. Next would likely be the shell weight, as the shape of the scatterplots are similar to that of the 
#shucked weight, except the scale on the x axis is smaller.

#graphing the box plots for 10 extra points 
oldpar=par(mfrow=c(2,4))
for(i in 2:8) {
  boxplot(abaloneDat[[i]] ~ abaloneDat$sex, main=names(abaloneDat) [i], col=c("light pink", "yellow", "light blue"))
  }
par(oldpar)

#Please see attached for boxplots for 7 continuous variables categorized by sex, with Female being light pink, Infant being yellow, and Male being light blue.
#As shown in the boxplots the females appear to be slightly larger/heavier across these continuous attributes (though I'm unsure if the small difference
# is statistically significant), while infants, as expected are consistently smaller than both males and females in length and weight.
