# set working directory to where the data set is before running this script
#setwd("~/Cleaning Data/course project")

## Merge the training and the test sets to create one data set.
# read feature names
featureNames <- read.table("UCI HAR Dataset/features.txt", col.names=c("featureIndex", "featureName"))

# read observations from both data sets
trainData <- read.table("UCI HAR Dataset/train/X_train.txt", colClasses="numeric", col.names=featureNames$featureName)
testData <- read.table("UCI HAR Dataset/test/X_Test.txt", colClasses="numeric", col.names=featureNames$featureName)

# union the observations
uciHarData <- rbind(trainData, testData)

## Extract only the measurements on the mean and standard deviation for each measurement. 
# retain only columns in observation data that contain either "std" or "mean"
retainedColumns <- unlist(lapply(featureNames$featureName, function(e) grepl("std", e) | grepl("mean", e)))
uciHarData <- uciHarData[retainedColumns]

# read subject identifiers and add the subject column to data 
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names="subject")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names="subject")

# union the subject data
subjects <- rbind(trainSubjects, testSubjects)

## Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
uciHarDataSplit <- split(uciHarData, subjects)
meansList <- lapply(uciHarDataSplit, colMeans)
uciHarSubjectMeans <- data.frame(meansList)
names(uciHarSubjectMeans) <- unique(subjects$subject)

## Use descriptive activity names to name the activities in the data set
# read the data tags for the observations
trainTags <- read.table("UCI HAR Dataset/train/y_train.txt", col.names=c("activityCode"))
testTags <- read.table("UCI HAR Dataset/test/y_test.txt", col.names=c("activityCode"))

# union the tag data
allTags <- rbind(trainTags, testTags)
# read activity labels and replace numeric tags with labels
activityLabels <- c(WALKING=1, WALKING_UPSTAIRS=2, WALKING_DOWNSTAIRS=3, SITTING=4, STANDING=5, LAYING=6)
allTags$activityLabel <- names(activityLabels)[allTags$activityCode]
#alternative way: testTags$label <- names(activityLabels)[match(testTags$V1, activityLabels)]

## Appropriately label the data set with descriptive activity names. 
uciHarData$activityLabel <- allTags$activityLabel

# save the final results to file
write.csv(file="uciHarSubjectMeans.csv", x=uciHarSubjectMeans)
write.csv(file="uciHarData.csv", x=uciHarData)
