
states <- read.csv(file.choose())
states
states$Internet.users[4]
levels(states$Income.Group)
states[117,]
states[states$Country.Name == "Malta",]

library(ggplot2)
qplot(data=states, x=Internet.users)
qplot(data=states, x=Internet.users, y=Birth.rate)
qplot(data=states, x=Internet.users, y=Birth.rate,
      colour=Income.Group, size=I(5))
mydf <- data.frame(Countries_2012_Dataset, Codes_2012_Dataset, Regions_2012_Dataset)
head(mydf)
colnames(mydf) <- c("country", "code", "region")
head(mydf)
merged <- merge(states, mydf, by.x = "Country.Code", by.y = "code")
head(merged)
