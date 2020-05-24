install.packages("ggplot2")
library(ggplot2)
data1<-mpg
data1<-as.data.frame(data1)
library(dplyr)
data1$cyl<-factor(data1$cyl , levels = c("4","5","6","8"), ordered = TRUE)
str(data1)
#str function clearly shows that cyl is and ordered data

#1.b
data1$trans<-substr(data1$trans, 1,4)
data1$trans<-factor(data1$trans)
str(data1)
#1.c
data1$drv<-factor(data1$drv , levels = c("f","r","4"), ordered = TRUE)
str(data1)

#1.d
data1$fl<-factor(data1$fl , levels = c("p","d","e","c","r"),labels = c("gasoline","deisel","other","other","other")) 
str(data1)

#1.e
data1$class<-factor(data1$class , levels = c("2seater", "subcompact","compact", "midsize" , "suv", "minivan", "pickup"), ordered = TRUE)
str(data1)

#1.f
Country<- factor(data1$manufacturer, levels = c("audi","chevrolet","dodge","ford","honda","hyundai","jeep","land rover",
                                 "lincoln","mercury","nissan","pontiac","subaru","toyota","volkswagen"),
               labels = c("Germany","United States","United States","United States","Japan","South Korea","United States","Great Britain","United States","United States","Japan","United States","Japan","Japan","Germany"))

data1<-cbind(data1,Country)
data1$Country<-as.character(data1$Country)
str(data1)

#2a

bar.data <- as.matrix(sort(table(Country),decreasing = FALSE))
heights1=c(101,70,45,14,4)
barplot(heights1, main="Number of cars in Countries ", names.arg=c("united states", "Japan" , "Germany","South Korea","Great Britain"), ylab=" Number of cars ", xlab="Countries",  
        cex.names=0.8, col=c("darkblue","red"))
#2b
data3<-filter(data1, Country =="United States")
data3<-data3[,c(3,5,6,7,10,11)]
table(data3)
#2c

data5<-filter(data1, Country =="United States")
data5<-data5[,c(8,9)]
data5<-cbind(data5,(data5[,1]+data5[,2])/2)

data7<-filter(data1, Country =="Japan")
data7<-data7[,c(8,9)]
data7<-cbind(data7,(data7[,1]+data7[,2])/2)

boxplot(data5)
boxplot(data7)
mean(data7$`(data7[, 1] + data7[, 2])/2`)
median(data7$`(data7[, 1] + data7[, 2])/2`)
IQR(data7$`(data7[, 1] + data7[, 2])/2`)
sd(data7$`(data7[, 1] + data7[, 2])/2`)

mean(data5$`(data5[, 1] + data5[, 2])/2`)
median(data5$`(data5[, 1] + data5[, 2])/2`)
IQR(data5$`(data5[, 1] + data5[, 2])/2`)
sd(data5$`(data5[, 1] + data5[, 2])/2`)

#2d
data6<-filter(data1, Country =="United States")
data6<-data6[,3]

data8<-filter(data1, Country =="Japan")
data8<-data8[,3]

hist(data6)
#normal distribution
hist(data8)
#skewed right
