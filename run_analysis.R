## set working dir -- change path by your working directory
setwd("/Users/cjmarchante/Desktop/Coursera/Getting and Cleaning Data/project")
library(RCurl)
## download file
dFile <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
#download.file(dFile, 'UCI HAR Dataset.zip', method='curl')
unzip('./UCI HAR Dataset.zip')

# Objectives 1 and 2
#################################################################
# Merges "x"training and  test  data set
x.train <- read.table('./UCI HAR Dataset/train/X_train.txt')
x.test <- read.table('./UCI HAR Dataset/test/X_test.txt')
x <- rbind(x.train, x.test)

# Merges "subject"  training and  test  data set
subject.train <- read.table('./UCI HAR Dataset/train/subject_train.txt')
subject.test <- read.table('./UCI HAR Dataset/test/subject_test.txt')
subject <- rbind(subject.train, subject.test)

# At this time we will keep only the measurements on the mean and standard deviation for each measurement, now in X dataset
features <- read.table('./UCI HAR Dataset/features.txt')
fmeanstd <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
x <- x[, fmeanstd]

# merging "y" training and test.
y.train <- read.table('./UCI HAR Dataset/train/y_train.txt')
y.test <- read.table('./UCI HAR Dataset/test/y_test.txt')
y <- rbind(y.train, y.test)

#merge all in one data set with mean and standard deviation
data <- cbind(subject, x, y)
#################################################################
# so far we have completed objectives 1 and 2: Merging to get one dataset keeping the mean and standard deviation


# Objective 4
#################################################################
#labeling the data set with descriptive variable names and removing symbols and caps
colnames(data) <-c("subject",as.character (features[fmeanstd, 2]),"activity")
colnames(data) <- tolower(colnames(data)) 
colnames(data)<- gsub("\\(|\\)", "", colnames(data))
# objective 4th completed: Appropriately labels the data set with descriptive variable names.

# Objective 3
#################################################################
# read and clean activity activity names
alabels <- read.table('./UCI HAR Dataset/activity_labels.txt')
alabels[, 2] <- tolower(as.character(alabels[, 2]))
alabels[, 2] <- gsub("_", "", alabels[, 2])
# index for "activity" variable
idx<-which(names(data)=="activity")
# changing the id by the activity descriptive name.
data[, idx] = alabels[data[, idx], 2]
#################################################################
# We completed 3rd objective: Uses descriptive activity names to name the activities in the data set


# Objective 5
#################################################################
#################################################################

avgdata<- aggregate(x=data, by=list(activities=data$activity, subjects=data$subject), FUN=mean)
avgdata <- avgdata[, !(colnames(avgdata) %in% c("subject", "activity"))]


#################################################################
# We completed 5th objective: From the data set in step 4, creates a second,
# independent tidy data set with the averageof each variable for each activity and each subject


## Writing data set to file

write.table(avgdata, './averagedataset.txt', row.names = F) 
