fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile = "./data/project1.zip")
list.files("./data")
dateDownloaded<-date()
dateDownloaded
library(stringr)
library(reshape2)
library(plyr)
rawTrain<-read.table("./train/X_train.txt")
dim(rawTrain)
str(rawTrain)
head(rawTrain)
tail(rawTrain)
rawTrain[1,1:10]
trainLabels<-read.table("./train/y_train.txt")
dim(trainLabels) # 7352 rows 1 column
head(trainLabels) # starts with 5,5,5,5,5 under column name V1
rawTest<-read.table("./test/X_test.txt")
dim(rawTest)
str(rawTest)
summary(rawTrain)
testLabels<-read.table("./test/y_test.txt")
str(testLabels) # 2947 obs of 1 variable, also starts with 5,5,5,5,5
features<-read.table("./features.txt")
dim(features)
str(features)
rawTrain$subject<-subject$V1
colnames(rawTrain)<-features$V2
colnames(rawTest)<- features$V2
rawTrain$activity<-trainLabels$V1
rawTest$activity<-testLabels$V1
intersect(names(rawTrain),names(rawTest))
library(plyr)
which(colnames(rawTrain)=="subject")
rawTrain[1:2,560:562]
mergedData<-arrange(join(rawTrain,rawTest),subject) #This works but subject reordered
dim(mergedData) #7352 rows 562 columns
mergedData[10297:10299,560:562]
mergedData1<-rbind(rawTrain,rawTest) #This does work and no change to subject
dim(mergedData1)
newmerged<-mergedData1[order(mergedData1$subject),] #arranged according to subject id
newmerged[1:3,560:563] # merged dataset with both train and test sets
dim(newmerged)
head(features)
ggtail(features)
features[1,2]
features[2,2]
features[7,2]
colnames(rawTest)<-features$V2
rawTest[1:2,1:10]
dim(features)
trainTxt <- read.table("subject_train.txt")
str(trainTxt)
table(trainTxt)
names(rawTrain$mean())
mergedData1[1:3,560:562]
subject<-read.table("./train/subject_train.txt")
dim(subject)
head(subject)
tail(subject)
subjectTest<-read.table("./test/subject_test.txt")
dim(subjectTest)
rawTest$subject<-subjectTest$V1
data1<-subset(newmerged,subject=="1")
dim(data1)
data1[1:3,1:10]
data1tBodyAcc<-subset(data1[,1:6])
data1tBodyAcc[1:3,1:6]
dim(data1tBodyAcc)
data1tGravityAcc<-subset(data1[,41:46])
newmerged %>%
  select(activity, everything())
library(dplyr)
newmerged %>%
  select(subject, everything()) #error: found duplicated column name?
head(newmerged$activity)
which(colnames(newmerged)=="subject")
select(newmerged,subject,everything()) # same error
   