uciRoot <- "http://archive.ics.uci.edu/ml/machine-learning-databases/"
datURL <- "00267/data_banknote_authentication.txt"
bankDat <- read.table(paste0(uciRoot ,datURL),sep=",")

# naming the attributes for each column 
colnames(bankDat) <- c("varianceOfWavelet","SkewnessOfWavelet","curtosisOfWavelet","entropyOfImage","class") 
bankDat$class = as.factor(bankDat$class)
#here the predictors are: varianceOfWavelet, SkewnessOfWavelet, 
#curtosisOfWavelet, and entropyOfImage. 
#the outcome is class, with 0,1 representing either fake or authentic bank notes

#determining number of variables
dim(bankDat)
#there are 5 variables total, and 1372 observations in the dataset

#summarizing the data
summary(bankDat)
#varianceOfWavelet SkewnessOfWavelet curtosisOfWavelet entropyOfImage    class  
#Min.   :-7.0421   Min.   :-13.773   Min.   :-5.2861   Min.   :-8.5482   0:762  
#1st Qu.:-1.7730   1st Qu.: -1.708   1st Qu.:-1.5750   1st Qu.:-2.4135   1:610  
#Median : 0.4962   Median :  2.320   Median : 0.6166   Median :-0.5867          
#Mean   : 0.4337   Mean   :  1.922   Mean   : 1.3976   Mean   :-1.1917          
#3rd Qu.: 2.8215   3rd Qu.:  6.815   3rd Qu.: 3.1793   3rd Qu.: 0.3948          
#Max.   : 6.8248   Max.   : 12.952   Max.   :17.9274   Max.   : 2.4495   

#graphing scatterplots
plot(bankDat$varianceOfWavelet, bankDat$SkewnessOfWavelet, pch =19, cex =0.7)
plot(bankDat$curtosisOfWavelet, bankDat$entropyOfImage, pch=19, cex=0.7, col=bankDat$class)
#graphing the scatterplot matrix
pairs(bankDat[1:4], pch =10, cex = 0.5, col=bankDat$class)

#Here I generated pairwise XY scatterplots of each pair of continuous predictors 
#and utilized two different colors to indicate each level of class, the outcome 
#Based on my observations the Variance of Wavelet graphs showed the distinct clusters between
#fake and authentic notes, therefore it appears to be the best predictor.
#Next I see the skewness of wavelet also showed somewhat distinct clusters of red and 
#black dots, therefore it would could be the second best predictor in 
#this case. It's difficult to tell much difference between curtosis
#of wavelet and entropy of image.  

#Looking at the variance of wavelet scatterplots, it seems clear that the fake
#bank note cluster does overlap with the real cluster, though not by a lot.
#Based on this it shouldn't be too difficult to solve this problem.
#However due to the sizeable overlap, it seems that there will be cases 
#where it is difficult to tell which notes are fake and which notes are real
#as they may fall in the overlapping region where either prediction
#could make sense. 
#In the case of counterfeit money, being overly vigilent and misclassifying real money as counterfeit
#not only ruins customer relations (if reported during a business transaction), but also destroys consumer
#confidence in the authenticity of currency.  Because of this I believe most counterfeit money likely goes
#undetected.  If the data set provided here is an indication of the percentage of money that is counterfeit,
#this is very alarming.  Summary of the class attribute shows that 0: 762 and 1: 610, while we're not given explicitly
#which is authentic vs counterfeit (0 vs 1), it appears that the frequency of counterfeit money is at least nearly as high as that of 
#authentic money. This could be due to underreporting of counterfeit money as I speculated above.
#Nevertheless, I doubt the actual frequency in circulation is qutie as large as that in the sample size.
#If the frequency were this high, our economy likely would have collapsed as users of counterfeit money
#would essentially be receiving goods and services without paying.
#However it is reasonable to suspect there's quite a a bit of underreporting both due to lack of training
#and due to desire to preserve customer relations. 


#graphing ggplot (this part wasn't needed but I kept it to refer back to the code later) 
ggplot(bankDat,aes(x=entropyOfImage,y=varianceOfWavelet,colour=class,shape=class)) + geom_point() + facet_wrap(~class) 
