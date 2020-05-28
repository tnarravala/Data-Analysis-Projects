myFirstVector <- c(3L,645L,23L,1L,5L)
myFirstVector
is.numeric(myFirstVector)
is.integer(myFirstVector)
is.double(myFirstVector)

v3 <- c("de","sd","sd1",7)
is.numeric(v3)
is.integer(v3)
is.double(v3)
is.character(v3)

seq(1,100,10)
rep(10,10)

rep("f",10)
rep(myFirstVector,5)

new <- myFirstVector[-4]
new1 <- myFirstVector[c(1,3)]
new2 <- myFirstVector[c(-1,-3)]
new3 <- myFirstVector[c(-1:-3)]

?rnorm()
rep(1:3,length.out = 10)
