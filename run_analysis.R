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
}

# Find columns pertaining to mean and standard deviation
mean_std_cols <- grep('mean|std', featureNames[,2])
feature_data <- features[,mean_std_cols]
revisedFeatureNames <- lapply(featureNames[mean_std_cols,2],removeIllegal)
colnames(feature_data) <- revisedFeatureNames

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


#5 From the data set in step 4, creates a second, independent tidy data set with the average of 
# each variable for each activity and each subject.

library(dplyr)
by_subj_act <- group_by(fullData, subject, activity)


## The following code was used to build the summarize statement used below
colToExpression <- function(colName) {
	 middle <- " = mean(" 
	 end <- ")"
    result <- paste(colName, middle, colName, end, sep='')
    return(result)
}

expressions <- lapply(revisedFeatureNames,colToExpression)

paster <- function(acc, x) {
	return(paste (acc, x, sep=','))
}

meanTerms <- Reduce(paster, x, "")
cleanMeanTerms <- substr(meanTerms, 2, nchar(meanTerms))
summarizeString <- paste("summarize(by_subj_act", meanTerms, ")")

## End code generation section

# Set a new variable to the value of the summarizeString 
summary_data <- summarize(by_subj_act ,tBodyAcc_mean_X = mean(tBodyAcc_mean_X), 
	tBodyAcc_mean_Y = mean(tBodyAcc_mean_Y),tBodyAcc_mean_Z = mean(tBodyAcc_mean_Z),	
	tBodyAcc_std_X = mean(tBodyAcc_std_X),tBodyAcc_std_Y = mean(tBodyAcc_std_Y),
	tBodyAcc_std_Z = mean(tBodyAcc_std_Z),tGravityAcc_mean_X = mean(tGravityAcc_mean_X),
	tGravityAcc_mean_Y = mean(tGravityAcc_mean_Y),tGravityAcc_mean_Z = mean(tGravityAcc_mean_Z),
	tGravityAcc_std_X = mean(tGravityAcc_std_X),tGravityAcc_std_Y = mean(tGravityAcc_std_Y),
	tGravityAcc_std_Z = mean(tGravityAcc_std_Z),tBodyAccJerk_mean_X = mean(tBodyAccJerk_mean_X),
	tBodyAccJerk_mean_Y = mean(tBodyAccJerk_mean_Y),tBodyAccJerk_mean_Z = mean(tBodyAccJerk_mean_Z),
	tBodyAccJerk_std_X = mean(tBodyAccJerk_std_X),tBodyAccJerk_std_Y = mean(tBodyAccJerk_std_Y),
	tBodyAccJerk_std_Z = mean(tBodyAccJerk_std_Z),tBodyGyro_mean_X = mean(tBodyGyro_mean_X),
	tBodyGyro_mean_Y = mean(tBodyGyro_mean_Y),tBodyGyro_mean_Z = mean(tBodyGyro_mean_Z),
	tBodyGyro_std_X = mean(tBodyGyro_std_X),tBodyGyro_std_Y = mean(tBodyGyro_std_Y),
	tBodyGyro_std_Z = mean(tBodyGyro_std_Z),tBodyGyroJerk_mean_X = mean(tBodyGyroJerk_mean_X),
	tBodyGyroJerk_mean_Y = mean(tBodyGyroJerk_mean_Y),tBodyGyroJerk_mean_Z = mean(tBodyGyroJerk_mean_Z),
	tBodyGyroJerk_std_X = mean(tBodyGyroJerk_std_X),tBodyGyroJerk_std_Y = mean(tBodyGyroJerk_std_Y),
	tBodyGyroJerk_std_Z = mean(tBodyGyroJerk_std_Z),tBodyAccMag_mean = mean(tBodyAccMag_mean),
	tBodyAccMag_std = mean(tBodyAccMag_std),tGravityAccMag_mean = mean(tGravityAccMag_mean),
	tGravityAccMag_std = mean(tGravityAccMag_std),tBodyAccJerkMag_mean = mean(tBodyAccJerkMag_mean),
	tBodyAccJerkMag_std = mean(tBodyAccJerkMag_std),tBodyGyroMag_mean = mean(tBodyGyroMag_mean),
	tBodyGyroMag_std = mean(tBodyGyroMag_std),tBodyGyroJerkMag_mean = mean(tBodyGyroJerkMag_mean),
	tBodyGyroJerkMag_std = mean(tBodyGyroJerkMag_std),fBodyAcc_mean_X = mean(fBodyAcc_mean_X),
	fBodyAcc_mean_Y = mean(fBodyAcc_mean_Y),fBodyAcc_mean_Z = mean(fBodyAcc_mean_Z),
	fBodyAcc_std_X = mean(fBodyAcc_std_X),fBodyAcc_std_Y = mean(fBodyAcc_std_Y),
	fBodyAcc_std_Z = mean(fBodyAcc_std_Z),fBodyAcc_meanFreq_X = mean(fBodyAcc_meanFreq_X),
	fBodyAcc_meanFreq_Y = mean(fBodyAcc_meanFreq_Y),fBodyAcc_meanFreq_Z = mean(fBodyAcc_meanFreq_Z),
	fBodyAccJerk_mean_X = mean(fBodyAccJerk_mean_X),fBodyAccJerk_mean_Y = mean(fBodyAccJerk_mean_Y),
	fBodyAccJerk_mean_Z = mean(fBodyAccJerk_mean_Z),fBodyAccJerk_std_X = mean(fBodyAccJerk_std_X),
	fBodyAccJerk_std_Y = mean(fBodyAccJerk_std_Y),fBodyAccJerk_std_Z = mean(fBodyAccJerk_std_Z),
	fBodyAccJerk_meanFreq_X = mean(fBodyAccJerk_meanFreq_X),
	fBodyAccJerk_meanFreq_Y = mean(fBodyAccJerk_meanFreq_Y),
	fBodyAccJerk_meanFreq_Z = mean(fBodyAccJerk_meanFreq_Z),fBodyGyro_mean_X = mean(fBodyGyro_mean_X),
	fBodyGyro_mean_Y = mean(fBodyGyro_mean_Y),fBodyGyro_mean_Z = mean(fBodyGyro_mean_Z),
	fBodyGyro_std_X = mean(fBodyGyro_std_X),fBodyGyro_std_Y = mean(fBodyGyro_std_Y),
	fBodyGyro_std_Z = mean(fBodyGyro_std_Z),fBodyGyro_meanFreq_X = mean(fBodyGyro_meanFreq_X),
	fBodyGyro_meanFreq_Y = mean(fBodyGyro_meanFreq_Y),fBodyGyro_meanFreq_Z = mean(fBodyGyro_meanFreq_Z),
	fBodyAccMag_mean = mean(fBodyAccMag_mean),fBodyAccMag_std = mean(fBodyAccMag_std),
	fBodyAccMag_meanFreq = mean(fBodyAccMag_meanFreq),
	fBodyBodyAccJerkMag_mean = mean(fBodyBodyAccJerkMag_mean),
	fBodyBodyAccJerkMag_std = mean(fBodyBodyAccJerkMag_std),
	fBodyBodyAccJerkMag_meanFreq = mean(fBodyBodyAccJerkMag_meanFreq),
	fBodyBodyGyroMag_mean = mean(fBodyBodyGyroMag_mean),
	fBodyBodyGyroMag_std = mean(fBodyBodyGyroMag_std),
	fBodyBodyGyroMag_meanFreq = mean(fBodyBodyGyroMag_meanFreq),
	fBodyBodyGyroJerkMag_mean = mean(fBodyBodyGyroJerkMag_mean),
	fBodyBodyGyroJerkMag_std = mean(fBodyBodyGyroJerkMag_std),
	fBodyBodyGyroJerkMag_meanFreq = mean(fBodyBodyGyroJerkMag_meanFreq) )

# Write out the summary data set for submission
# write.table(summary_data, "summary_dataset.txt", row.names=FALSE)


