rm(stats)
#method1
stats <- read.csv(file.choose())
stats
stats$Income.Group <- as.factor(stats$Income.Group)
str(stats)
levels(stats$Income.Group)
#method2
getwd()
setwd("/users/thejeswar/GoogleDrive/")
setwd()


nrow(stats)
ncol(stats)
head(stats)
tail(stats)
head(stats,n=10)
str(stats) #str stands for structure 
#runif random variables distributed uniformly
summary(stats)

stats$Country.Name
stats$Country.Name[2]
stats
#---------------Basic Operations with Dataframe

stats[1:10,] #subsetting
stats[3:9,]
stats[c(4,100),]

is.data.frame(stats[1,]) #no need for drop=F
is.data.frame(stats[,1])
is.data.frame(stats[,1,drop=F])
#multiply columns
head(stats)
stats$Birth.rate * stats$Internet.users
stats$myCal <- stats$Birth.rate * stats$Internet.users
head(stats)

stats$xyz <- 1:5
head(stats)
stats$xyz <- NULL
stats$myCal <- NULL


#filtering data frames

head(stats)
filter<-stats$Internet.users <2
filter
stats[filter,]
stats[stats$Birth.rate > 40,]
stats[stats$Birth.rate > 40 & stats$Internet.users < 2,]
stats[stats$Income.Group == "High income",]
levels(stats$Income.Group)

stats[stats$Country.Name == "Malta",]

#---------------------Introduction to qplot
?qplot
library(ggplot2)
qplot(data = stats, x = Income.Group,y = Birth.rate,
      size =I(3),color = I("blue"),geom = "boxplot")

#---------------------Visualization with qplot   
qplot(data = stats, x =Internet.users,y = Birth.rate,size = I(4),color = Income.Group)


#-----------------Creating data frames

mydf <- data.frame(Countries_2012_Dataset,Codes_2012_Dataset,Regions_2012_Dataset)
head(mydf)
colnames(mydf)<- c("Country","Code","Region")
rm(mydf)
mydf <- data.frame(Country = Countries_2012_Dataset,Code = Codes_2012_Dataset,Region = Regions_2012_Dataset)

newdf<- cbind(Country = Countries_2012_Dataset,Code = Codes_2012_Dataset,Region = Regions_2012_Dataset)
head(newdf,n =1)


#--------------------Merging DataFrames

stats
mydf

merged<- merge(stats,mydf,by.x = "Country.Code",by.y = "Code")
head(merged)
merged$Country <- NULL
str(merged)

#--------------------visulizing with Qplot
qplot(data = merged, x =Internet.users,y = Birth.rate,
      size = I(1),color = Region,shape=I(1))
#trannspancy

qplot(data = merged, x =Internet.users,y = Birth.rate,
      size = I(1),color = Region,shape=I(1),alpha = I(0.5))
#title

qplot(data = merged, x =Internet.users,y = Birth.rate,
      size = I(1),color = Region,shape=I(1),alpha = I(0.5),main = "Birth.rate vs Internet.user")









