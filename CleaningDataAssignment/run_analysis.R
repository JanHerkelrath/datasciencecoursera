## load the plyr and dplyr package
library(plyr)
library(dplyr)

## Check if the file is in the current working directory and download it if necessary
if(!file.exists("./UCI HAR Dataset")){
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileURL,"data.zip","auto")
        unzip("data.zip")       
}

## read the list of features and activities
features <- read.table("UCI HAR Dataset/features.txt",stringsAsFactors=F)
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

## Identify the required variables from the features list(mean and standard deviation values)
meanIndex <- grepl("mean\\(\\)",features[,2])
stdIndex <- grepl("std\\(\\)", features[,2])

## read the three test data files
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
y_test<- read.table("UCI HAR Dataset/test/y_test.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")

## read the three training data files
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
y_train<- read.table("UCI HAR Dataset/train/y_train.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")

## Merge the test data and training files into one data.frame each using cbind
testMerge <- cbind(subject_test,y_test,X_test[,meanIndex],X_test[,stdIndex])
trainMerge <- cbind(subject_train,y_train,X_train[,meanIndex],X_train[,stdIndex])

## Merge the test and training data into one data.frame
merged <- rbind(trainMerge,testMerge)

## Set the column names of the data.frame using the features list 
columnNames <- names(merged)
columnNames[1] <- "subject"
columnNames[2] <- "activity"
columnNames[3:(3+sum(meanIndex)-1)] <- features[meanIndex,2]
columnNames[(3+sum(meanIndex)):length(columnNames)] <- features[stdIndex,2]
names(merged) <- columnNames

## Change the values of the activity column to the respective labels
## and sort it according to the first two columns in the data.frame in ascending order
merged <- arrange(merged, subject, activity)
merged$activity <- activity_labels[merged$activity,2]
merged$activity <- factor(merged$activity, levels = activity_labels[,2])

## Save the merged dataset to a .txt file
write.table(merged,"mergedDataset.txt", row.names=FALSE)

## Create a new dataset taking the mean of each variable grouped by the subject id and the activity
mergedAverage <- merged %>% group_by(subject, activity) %>% summarise_each(funs(mean))

## Save the final dataset to a .txt file
write.table(mergedAverage,"mergedAveragedDataset.txt", row.names=FALSE)

