getwd()
setwd("C:\\Users\\FS232QR\\OneDrive - EY\\Desktop\\Clients\\Learnings\\Data Science\\R language")
getwd()
fin <- read.csv("P3-Future-500-The-Dataset.csv", stringsAsFactors = T, na.strings = c(""))
fin
head(fin)
tail(fin)
str(fin)
summary(fin)
factor(fin$ID)
summary(fin)
str(fin)
fin$Inception <- factor(fin$Inception)
str(fin)
summary(fin)
head(fin)
str(fin)
#fin$Profit <- factor(fin$Profit)
str(fin)
head(fin)
fin$Expenses <- gsub("Dollars", "", fin$Expenses)
fin$Expenses <- gsub(",", "", fin$Expenses)
head(fin)
fin$Revenue <- gsub("\\$", "", fin$Revenue)
head(fin)
fin$Revenue <- gsub(",", "", fin$Revenue)
fin$Growth <- gsub("%", "", fin$Growth)
head(fin)
fin$Expenses <- as.numeric(fin$Expenses)
fin$Revenue <- as.numeric(fin$Revenue)
fin$Growth <- as.numeric(fin$Growth)
fin$Profit <- as.numeric(fin$Profit)
str(fin)
summary(fin)
head(fin, 24)
fin[!complete.cases(fin),]
str(fin)

is.na(fin$Expenses)
fin[is.na(fin$Expenses),]
fin_backup <- fin
fin[!complete.cases(fin),]
fin[is.na(fin$Industry),]
fin[!is.na(fin$Industry),]
fin <- fin[!is.na(fin$Industry),]
fin
fin[!complete.cases(fin),]
rownames(fin) <- 1:nrow(fin)
tail(fin)
fin[!complete.cases(fin$State),]
fin[is.na(fin$State),]
fin[is.na(fin$State) & fin$City=="New York",]
fin[is.na(fin$State) & fin$City=="New York","State"] <- "NY"
fin[c(11,377),]
fin[!complete.cases(fin$State),]
fin[is.na(fin$State),]
fin[is.na(fin$State) & fin$City=="San Francisco",]
fin[is.na(fin$State) & fin$City=="San Francisco","State"] <- "CA"
fin[c(84,265),]
med_emp_retail <- median(fin[fin$Industry=="Retail", "Employees"], na.rm = T)
med_emp_retail
fin[is.na(fin$Employees)& fin$Industry=="Retail",]
fin[is.na(fin$Employees)& fin$Industry=="Retail","Employees"] <- med_emp_retail
med_emp_retail
fin[!complete.cases(fin$Employees),]

med_emp_Fin <- median(fin[fin$Industry=="Financial Services", "Employees"], na.rm=T)
med_emp_Fin
fin[is.na(fin$Employees)&fin$Industry=="Financial Services", "Employees"] <- med_emp_Fin
fin[330,]
fin[!complete.cases(fin$Growth),]
med_Growth_Cons <- median(fin[fin$Industry=="Construction", "Growth"], na.rm=T)
med_Growth_Cons
fin[is.na(fin$Growth) & fin$Industry=="Construction", "Growth"] <- med_Growth_Cons
fin[8,]
fin[!complete.cases(fin),]

med_rev_Cons <- median(fin[fin$Industry=="Construction", "Revenue"], na.rm=T)
med_rev_Cons
fin[is.na(fin$Revenue) & fin$Industry=="Construction", "Revenue"] <- med_rev_Cons
fin[8,]

med_exp_Cons <- median(fin[fin$Industry=="Construction", "Expenses"], na.rm=T)
med_exp_Cons
fin[is.na(fin$Expenses) & fin$Industry=="Construction", "Expenses"] <- med_exp_Cons
fin[8,]
fin[!complete.cases(fin),]
med_exp_Cons <- median(fin[fin$Industry=="Construction", "Expenses"], na.rm=T)
med_exp_Cons
fin[is.na(fin$Expenses) & fin$Industry=="Construction", "Expenses"] <- med_exp_Cons
fin[8,]

library(ggplot2)
p <- ggplot(data=fin)
p + geom_point(aes(x=Revenue, y=Expenses,
                   colour=Industry, size=Profit))
d <- ggplot(data=fin,aes(x=Revenue, y=Expenses,
                          colour=Industry) )
d + geom_point() +
  geom_smooth(fill=NA, size=1.2)
