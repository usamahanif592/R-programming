n <- 100000000
counter <- 0

for (i in rnorm(n)) {
  if(i > -1 & i < 1){
    counter <- counter +1
  }
  
}
counter/n
