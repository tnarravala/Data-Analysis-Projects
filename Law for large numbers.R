n <- 100000000
count <- 0
for(i in rnorm(n))
{
  if (i < 1 & i > -1)
  {
    count <- count+1
  }
}
exepected<-count/n*100
