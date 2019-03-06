mydata1<-data.frame(Name=c("AAA","BBB","CCC","DDD","EEE","FFF"),
                   Gender=c("M","M","F","F","M","M"),
                   Age=c(35,27,30,NA,33,31),
                   Salary=c(25,15,NA,13,8,11), 
                   Country=c("MYR","MYR","IND","IND","CHN","MYR"),
                   Loan=c('Y','Y','Y','N','N','Y'))
mydata1
# Data Preprocessing

# Importing the dataset

write.csv(mydata1, file = "C:/Users/magma/Documents/mydata1.csv")

mydataset = read.csv('C:/Users/magma/Documents/mydata1.csv')

# Taking care of missing data
mydataset$Age = ifelse(is.na(mydataset$Age),
                     ave(mydataset$Age, FUN = function(X) mean(X, na.rm = TRUE)),
                     mydataset$Age)
mydataset$Salary = ifelse(is.na(mydataset$Salary),
                        ave(mydataset$Salary, FUN = function(X) mean(X, na.rm = TRUE)),
                        mydataset$Salary)

# Encoding categorical data
mydataset$Country = factor(mydataset$Country,
                         levels = c("MYR","IND","CHN"),
                         labels = c(1,2,3))
mydataset$Loan = factor(mydataset$Loan,
                           levels = c('N', 'Y'),
                           labels = c(0, 1))

mydataset
str(mydataset)

#Splitting the datasets into the traning set and the test

#install.packages('caTools')
install.packages("caTools")
library(caTools)
set.seed(123)
split = sample.split(mydataset$Age, SplitRatio = 0.7)

#Split, true means the obsersion goes to the training set, false the observsion goes to the testing sets
training_set = subset(mydataset, split == TRUE)
training_set
test_set = subset(mydataset, split == FALSE)
test_set

#as.numeric

#Feature scaling
training_set[,2:3] = scale(training_set[,2:3])
training_set
test_set[,2:3] = scale(test_set[,2:3])
test_set