

chicago <- read.csv(choose.files(),row.names = 1, stringsAsFactors = T, na.strings = c(""))
chicago
NewYork <- read.csv(choose.files(),row.names = 1, stringsAsFactors = T, na.strings = c(""))
Houston <- read.csv(choose.files(),row.names = 1, stringsAsFactors = T, na.strings = c(""))
SanFrancisco <- read.csv(choose.files(),row.names = 1, stringsAsFactors = T, na.strings = c(""))
NewYork
Houston
SanFrancisco

is.data.frame(chicago)
chicago <- as.matrix(chicago)
NewYork <- as.matrix(NewYork)
Houston <- as.matrix(Houston)
SanFrancisco <- as.matrix(SanFrancisco)

is.matrix(chicago)

weather <- list(chicago=chicago, NewYork=NewYork, Houston=Houston, SanFrancisco=SanFrancisco)
weather[3]
weather[[3]]

apply(chicago,1, mean)
apply(chicago,1,max)
apply(chicago,1,min)
apply(NewYork,1, mean)
apply(Houston,1, mean)
apply(SanFrancisco,1, mean)
output <- NULL
for (i in 1:5) {
  output[i] <- mean(chicago[i,])
}
output 
names(output) <- rownames(chicago)
lapply(weather, t)
lapply(weather,"[",3,)
lapply(weather, function(x) x[1,]-x[2,])
