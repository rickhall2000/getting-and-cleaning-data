#download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip', destfile='galaxy.zip', method='curl')
folderName <- 'UCI HAR Dataset/'


# Load Subject Data
subjectTrainFile <- paste(folderName, 'train/subject_train.txt', sep='')
subjectTrain <- read.table(unz('galaxy.zip', subjectTrainFile))
subjectTestFile <- paste(folderName, 'test/subject_test.txt', sep='')
subjectTest <- read.table(unz('galaxy.zip', subjectTestFile))
subjects <- rbind(subjectTrain, subjectTest)
colnames(subjects) <- c('subject')


# Load Feature Data
featureTrainFile <- paste(folderName, 'train/X_train.txt', sep='')
featureTrain <- read.table(unz('galaxy.zip', featureTrainFile))
featureTestFile <- paste(folderName, 'test/X_test.txt', sep='')
featureTest <- read.table(unz('galaxy.zip', featureTestFile))
features <- rbind(featureTrain, featureTest)


# Load Feature Names
featureNameFile <- paste(folderName,'features.txt', sep='')
featureNames <- read.table(unz('galaxy.zip', featureNameFile), stringsAsFactors=F)

removeIllegal <- function(rawString) {
	noComma <- gsub(',','',rawString)
	noLeft <- gsub('\\(','',noComma)
	noRight <- gsub(')','',noLeft)
	noDash <- gsub('-','_',noRight)
	return(noDash)

# Find columns pertaining to mean and standard deviation
mean_std_cols <- grep('mean|std', featureNames[,2])
feature_data <- features[,mean_std_cols]
colnames(feature_data) <- featureNames[mean_std_cols,2]


# colnames(features) <- featureNames[,2]
# colnames(features) <- lapply(featureNames[,2],removeIllegal)
# library(dplyr)



# Load Activity values
activityTrainFile <- paste(folderName, 'train/y_train.txt', sep='')
activityTrain <- read.table(unz('galaxy.zip', activityTrainFile))
activityTestFile <- paste(folderName, 'test/y_test.txt', sep='')
activityTest <- read.table(unz('galaxy.zip', activityTestFile))
activities <- rbind(activityTrain, activityTest)
activities$V1 <- as.factor(activities$V1)
colnames(activities) <- c('activity')

# Load Activity Names
activityNameFile <- paste(folderName, 'activity_labels.txt', sep='')
activityNames <- read.table(unz('galaxy.zip', activityNameFile), stringsAsFactors=F)
levels(activities$activity) <- activityNames$V2


# Clean up unused vars
rm(subjectTrain)
rm(subjectTest)
rm(featureTrain)
rm(featureTest)
rm(activityTrain)
rm(activityTest)


# Merge 
fullData <- cbind(subjects, feature_data, activities)




# activitiesFactor <- as.factor(activities$V1)

#1 Merges the training and the test sets to create one data set.
#2 Extracts only the measurements on the mean and standard deviation for each measurement.
#3 Uses descriptive activity names to name the activities in the data set
#4 Appropriately labels the data set with descriptive variable names.
#5 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

