movies <- read.csv(file.choose())
str(movies) 

library(ggplot2)
qplot(data = movies,x=Film, y = Budget..million...,size = I(0.1))

getwd()
setwd("/Users/thejeswar/Google Drive/UDEMY/R for Data Science")
getwd()

movies <- read.csv("P2-Movie-Ratings.csv")
head(movies)
colnames(movies) <- c("Film","Genre","Rotten.ratings","Audience.rating","Budget","Year.of.release")
str(movies)
movies$Film<-as.factor(movies$Film)
movies$Genre<-as.factor(movies$Genre)
summary(movies)
movies$Year.of.release<-as.factor(movies$Year.of.release)

#--------------Aesthetics

library(ggplot2)
#add geometry
ggplot(data = movies,aes(x = Rotten.ratings,y = Audience.rating)) +
  geom_point()

#add color

ggplot(data = movies,aes(x = Rotten.ratings,y = Audience.rating,colour = Genre,size = Budget
                         )) +
  geom_point()


#--------Plotting with layers

p<-ggplot(data = movies,aes(x = Rotten.ratings,y = Audience.rating,colour = Genre,size = Budget
))

p
#points
p + geom_point()

#lines

p+ geom_line()

#muliple layers

p+ geom_point()+geom_line()

p+ geom_line() + geom_point()

#------------overiding aesthetics

p+ geom_point(aes(size = Rotten.ratings))
p+ geom_point(aes(color = Budget))


q + geom_point(aes(x = Budget)) + 
   xlab("Budget")


p + geom_line(size = 1) + geom_point()


#--------------mapping vs setting

q <- ggplot(data = movies,aes(x = Budget,y = Audience.rating,colour = Genre,size = Budget
)) 
q +geom_point()


r <- ggplot(data = movies,aes(x = Rotten.ratings,y = Audience.rating
))

r
#mapping

r + geom_point(aes(color = Genre))
#setting
r + geom_point(colour = "Dark green")
#error
r + geom_point(aes(colour = "Dark green"))


#mapping
r + geom_point(aes(size = Budget))
#setting
r + geom_point(size = 10)
#error
r + geom_point(aes(size = 10))


#------------Histogram and  density charts

s<-ggplot(data = movies, aes(x = Budget))
s
s+geom_histogram(binwidth = 5)
#add color(Mapping)

s+geom_histogram(binwidth = 10,aes(fill = Genre),color = "black")

#---------density charts

s+geom_density(aes(fill = Genre))

s+geom_density(aes(fill = Genre),position = "stack")

#-----------starting layer tips

t<- ggplot(data = movies,aes(x = Audience.rating))
t  
t+geom_histogram(binwidth = 10,color = "blue",fill = "white")  
  
  # another way

y<- ggplot(data = movies)
y
y+geom_histogram(binwidth = 10,color = "blue",fill = "white",aes(x = Audience.rating)) 
y+geom_histogram(binwidth = 10,color = "blue",fill = "white",aes(x = Rotten.ratings))   

z<- ggplot()  
z  
#-------------statistical transformation

?geom_smooth

u<- ggplot(data = movies,aes(x = Rotten.ratings,y = Audience.rating,color = Genre))
u+ geom_point() + geom_smooth(fill = NA)


#------------boxplots

u<- ggplot(data = movies,aes(x = Genre,y = Audience.rating,color = Genre))
u+ geom_boxplot()
u+ geom_boxplot(size = 0.5)
u+ geom_boxplot(size = 0.5) + geom_point()

#tip / hack
u+ geom_boxplot(size = 0.5) + geom_jitter()
#another way
u+  geom_jitter() +geom_boxplot(size = 0.5,alpha = 0.5) 
#------mini challenge
u<- ggplot(data = movies,aes(x = Genre,y = Rotten.ratings,color = Genre))
u+ geom_boxplot()
u+ geom_boxplot(size = 0.5)
u+ geom_boxplot(size = 0.5) + geom_point()

#tip / hack
u+ geom_boxplot(size = 0.5) + geom_jitter()
#another way
u+  geom_jitter() +geom_boxplot(size = 0.5,alpha = 0.5) 

#---------using facets
v<- ggplot(data = movies,aes(x = Budget))
v + geom_histogram(binwidth = 10,color = "Black",aes(fill = Genre 
                                                    ))
#facets

v + geom_histogram(binwidth = 10,color = "Black",
                   aes(fill = Genre)) + facet_grid(Genre~.,scale="free")
#scatterplots

w <-  ggplot(data=movies,aes(x = Rotten.ratings,y = Audience.rating,color = Genre))
w + geom_point()

#facets

w + geom_point() +facet_grid(Genre~.)

w + geom_point() +facet_grid(.~Year.of.release)

w + geom_point() +facet_grid(Genre~Year.of.release)

w + geom_point(aes(size = Budget),size = 0.3) +geom_smooth()+facet_grid(Genre~Year.of.release)
#------------coordinates

g <-  ggplot(data=movies,aes(x = Rotten.ratings,y = Audience.rating,color = Genre,size = Budget))
g+geom_point()

g+geom_point() + xlim(50,100) + ylim(50,100)

#wont work well always
n<-ggplot(data = movies,aes(x = Budget))
n  + geom_histogram(binwidth = 10,aes(fill = Genre),color = "Black")
n  + geom_histogram(binwidth = 10,aes(fill = Genre),color = "Black")+ylim(0,50)

#instead -zoom

n  + geom_histogram(binwidth = 10,aes(fill = Genre),
                    color = "Black") + coord_cartesian(ylim
                                                       = c(0,50))

w + geom_point(aes(size = Budget),size = 0.3) +
  geom_smooth()+facet_grid(Genre~Year.of.release)+
  coord_cartesian(ylim = c(0,100))

#-----------theme

o <- ggplot(data = movies, aes(x = Budget))
h<-o + geom_histogram(binwidth = 10,aes(fill = Genre),color = "Black")

#axes label

h + xlab("Money axis")

h + xlab("Money axis") +ylab("Number of Movies")
h + xlab("Money axis") +ylab("Number of Movies")+
  theme(axis.title.x = element_text(color = "DarkGreen",
                                    size = 10),
        axis.title.y = element_text(color = "Red",
                                    size = 10) )
#tick mark formatting

h + xlab("Money axis") +ylab("Number of Movies")+
  theme(axis.title.x = element_text(color = "DarkGreen",
                                    size = 10),
        axis.title.y = element_text(color = "Red",
                                    size = 10),
        axis.text.x =element_text(size = 15),
        axis.text.y =element_text(size = 15))
#legend formatting

h + xlab("Money axis") +ylab("Number of Movies")+
  theme(axis.title.x = element_text(color = "DarkGreen",
                                    size = 10),
        axis.title.y = element_text(color = "Red",
                                    size = 10),
        axis.text.x =element_text(size = 15),
        axis.text.y =element_text(size = 15),
        legend.title = element_text(size=10),
        legend.text = element_text(size=10),
        legend.position = c(1,1),
        legend.justification = c(1,1))

#title

h + xlab("Money axis") +ylab("Number of Movies")+ggtitle("Movie Budget Distribution")+
  theme(axis.title.x = element_text(color = "DarkGreen",
                                    size = 10),
        axis.title.y = element_text(color = "Red",
                                    size = 10),
        axis.text.x =element_text(size = 15),
        axis.text.y =element_text(size = 15),
        legend.title = element_text(size=10),
        legend.text = element_text(size=10),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        plot.title = element_text(color = "DarkBlue",size = 20,family = "Courier") )
?theme  
  









