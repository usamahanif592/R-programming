util <- read.csv(choose.files(), stringsAsFactors = T, na.strings = c(""))
str(util)
summary(util)
util$Utilization = 1- util$Percent.Idle
head(util, 12)
util$PosixTime <- as.POSIXct(util$Timestamp, format="%d/%m/%Y %H:%M")
head(util, 12)
util$Timestamp <- NULL
head(util, 12)
util <- util[,c(4,1,2,3)]
head(util, 12)

summary(util)
RL1 <- util[util$Machine=="RL1",]
summary(RL1)
RL1$Machine <- factor(RL1$Machine)
summary(RL1)
list_stat_rl1 <- c(min(RL1$Utilization, na.rm = T),
                   mean(RL1$Utilization, na.rm = T),
                   max(RL1$Utilization, na.rm = T))
list_stat_rl1
which(RL1$Utilization<0.9)
util_under_90 <- length(which(RL1$Utilization<0.9)) >0
util_under_90
list_rl1 <- list("RL1", list_stat_rl1, util_under_90)
list_rl1
names(list_rl1) <- c("Machine", "Stats", "Low Threshold")
list_rl1
list_rl1[[2]][3]
 library(ggplot2)
p <- ggplot(data=util)
p + geom_line(aes(x=PosixTime, y=Utilization,
              colour=Machine), size=0.7) +
  facet_grid(Machine~.)+
  geom_hline(yintercept = 0.9, colour ="Gray",size=1.5,
             linetype =3)
my_plot <- p + geom_line(aes(x=PosixTime, y=Utilization,
                             colour=Machine), size=0.7) +
  facet_grid(Machine~.)+
  geom_hline(yintercept = 0.9, colour ="Gray",size=1.5,
             linetype =3)
list_rl1$Plot <- my_plot
list_rl1
