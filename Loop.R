4 < 1
10> 20
10>10
5 == 10
5 = 5

result <- 10 == 10

result2 <- !(10==10)

r3 <- result | result2
r4 <-result & result2
r5 <- isTRUE(result2)

rm(t)
x <- rnorm(1,mean =10,sd = 1)
if(x > 10){
  t <- "Greater than 10"
}else{
  t <- "less than 10"
}


