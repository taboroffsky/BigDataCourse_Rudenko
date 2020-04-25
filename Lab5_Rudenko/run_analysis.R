library(DBI)
library(RSQLite)
library(dplyr) 
data <- read.table("D:\\1\\UCI HAR Dataset\\features.txt", colClasses = "character")[,2]
##read all tables with text data from the work directory
x_train <- read.table("D:\\1\\UCI HAR Dataset\\train\\X_train.txt", col.names = data, check.names = F)
y_train <- read.table("D:\\1\\UCI HAR Dataset\\train\\y_train.txt", col.names = c('activity'))
subject_train <- read.table("D:\\1\\UCI HAR Dataset\\train\\subject_train.txt", col.names = c('subject'))

x_test <- read.table("D:\\1\\UCI HAR Dataset\\test\\X_test.txt", col.names = data, check.names = F)
y_test <- read.table("D:\\1\\UCI HAR Dataset\\test\\Y_test.txt", col.names = c('activity'))
subject_test <- read.table("D:\\1\\UCI HAR Dataset\\test\\subject_test.txt", col.names = c('subject'))

act_labels <- read.table("D:\\1\\UCI HAR Dataset\\activity_labels.txt", col.names = c('n','text'))
##joined the table
alldata <- cbind(rbind(x_train, x_test),
              rbind(y_train, y_test), 
              rbind(subject_train, subject_test))

data1 <- alldata[, !duplicated(colnames(alldata))]

data2 <- select(data1,  matches("mean\\(\\)|std\\(\\)|subject|activity"))

data3 <- within(data2, activity <- factor(activity, labels = act_labels[,2]))

data4 <- aggregate(x = data3[, -c(67,68)], 
                   by = list(data3[,'subject'], data3[, 'activity']),
                   FUN = mean)

write.csv(data4, "tidy_dataset.csv", row.names=F)
setwd("D:\\1")
