##Load libraries
library(dplyr)

##Load files into R
trainData = read.table("train/X_train.txt",header = FALSE, sep="")
trainSubject = read.table("train/subject_train.txt",header = FALSE, sep="")
trainLabel = read.table("train/y_train.txt",header = FALSE, sep="")

testData = read.table("test/X_test.txt",header = FALSE, sep="")
testSubject = read.table("test/subject_test.txt",header = FALSE, sep="")
testLabel = read.table("test/y_test.txt",header = FALSE, sep="")

##merge data and label files into one for (a) Train and 
##(b) Test (#1 in assignment)
allTrain = cbind(trainSubject, trainLabel, trainData)
allTest = cbind(testSubject, testLabel, testData)

## merge all files into one data set (#1 in assignment)
allData = rbind(allTrain, allTest)

##Names columns with descriptive labels (#4 in assignment)
col12 = c("Subject", "Activity")
colNameTable = read.table("features.txt")
othercol = as.vector(colNameTable$V2)
colName = c(col12, othercol)

colnames (allData) <- colName

##Naming Activities with descriptive names (#3 in assignment)
allData$Activity[allData$Activity ==1] <- "Walking"
allData$Activity[allData$Activity ==2] <- "Walking_Upstairs"
allData$Activity[allData$Activity ==3] <- "Walking_Downstairs"
allData$Activity[allData$Activity ==4] <- "Sitting"
allData$Activity[allData$Activity ==5] <- "Standing"
allData$Activity[allData$Activity ==6] <- "Laying"

##Subsetting dataset to include only columns that
## calcuate the mean or standard deviation (#2 in assignment)
Activity <- allData[,grepl("Activity", colnames(allData))]
Subject <- allData[,grepl("Subject", colnames(allData))]
subMean <- allData[,grepl("mean()", colnames(allData))]
subStd <-allData[,grepl("std()", colnames(allData))]

subData <- cbind(Subject, Activity, subMean)
subData <- cbind(subData, subStd)

valid_column_names <- make.names(names=names(subData), unique=TRUE, allow_ = TRUE)
names(subData) <- valid_column_names

## Create a second dataset that calculates the average of each variable
## by (a) activity and (b) subject (#5 in assignment)

subActivity <-cbind(Activity, subMean, subStd)
subSubject <- cbind(Subject, subMean, subStd)

valid_column_names <- make.names(names=names(subActivity), unique=TRUE, allow_ = TRUE)
names(subActivity) <- valid_column_names

valid_column_names <- make.names(names=names(subSubject), unique=TRUE, allow_ = TRUE)
names(subSubject) <- valid_column_names

Data1 <-subActivity %>% group_by(Activity) %>% summarise_each(funs(mean))
Data2 <-subSubject %>% group_by(Subject) %>% summarise_each(funs(mean))

Subject <-rep(NA, 6)
Activity <- rep(NA, 30)

Data1 <- cbind(Subject, Data1)
Data2 <- cbind(Activity, Data2)

GroupedData <- rbind(Data1, Data2)