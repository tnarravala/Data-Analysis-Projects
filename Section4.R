?matplot


matplot(t(FieldGoals/Games),type = "b",pch = 15:18,col=c(1:4,6))
legend("bottomleft",inset = 0.01,legend=Players,col =c(1:4,6),pch = 15:18,horiz = F)

matplot(t(FieldGoals/FieldGoalAttempts),type = "b",pch = 15:18,col=c(1:4,6))
legend("bottomleft",inset = 0.01,legend=Players,col =c(1:4,6),pch = 15:18,horiz = F)

#subsetting

Games[1:3,6:10]
Games[c(1,10),]
Games[,c("2008","2009")]
Games[1,]
Games[1,5]
is.matrix(Games[1,])
is.vector(Games[1,])

Games[1,,drop=F]
Games[1,5,drop=F]


#Visualizing the subsets
data <- MinutesPlayed[1,,drop = F]
data
matplot(t(data),type = "b",pch = 15:18,col=c(1:4,6))
legend("bottomleft",inset = 0.01,legend=Players[1],col =c(1:4,6),pch = 15:18,horiz = F)

?legend
#creating function

myplot <- function(data=MinutesPlayed ,rows = 1:10){
  data <- data[rows,,drop = F]
matplot(t(data),type = "b",pch = 15:18,col=c(1:4,6))
legend("bottomright",inset = 0.01,legend=Players[rows],col =c(1:4,6),pch = 15:18,horiz = F)
}

myplot(Points,10)

#Basketball Insights

myplot(Salary)
myplot(Salary/Games)
myplot(Salary/FieldGoals)

#In-game metric
myplot(MinutesPlayed)
myplot(Points)

#In-game metrics Normalized
myplot(FieldGoals/Games)
myplot(FieldGoals/FieldGoalAttempts)
myplot(FieldGoalAttempts/Games)
myplot(Points/Games)

#Interesting Observations
myplot(MinutesPlayed/Games)
myplot(Games)

#Time is valuable 
myplot(FieldGoals/MinutesPlayed)

#Player style
myplot(Points/FieldGoals)

colnames(Points)





















