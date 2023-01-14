
movies <- read.csv(file.choose())
head(movies)
colnames(movies) <- c("Film", "Genre", "CriticRating", "AudienceRating", "BudgetMillions", "Years")
head(movies)
tail(movies)
str(movies)
summary(movies)
factor(movies$Years)
movies$Years <- factor(movies$Years)
summary(movies)
str(movies)
library(ggplot2)
?qplot
