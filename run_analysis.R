# This code aims to have a tidy data set using data from Human Activity Recognition Using 
# Smartphones Dataset v1 containing averages of selected variables for each activity and 
# each volunteer.

#Load needed package(s).
library(dplyr)

#Download the Human Activity Recognition Using Smartphones Dataset v1.
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, "./UCI HAR Dataset.zip")
unzip("./UCI HAR Dataset.zip")

#Import data into R
features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <-  read.table("./UCI HAR Dataset/activity_labels.txt")

files_test <- list.files("./UCI HAR Dataset/test", pattern = "*.txt", full.names = TRUE)
data_test <- lapply(files_test, function(x) read.table(x))
test <- do.call("cbind", data_test)
files_train <- list.files("./UCI HAR Dataset/train", pattern = "*.txt", full.names = TRUE)
data_train <- lapply(files_train, function(x) read.table(x))
train <- do.call("cbind", data_train)

#Following codes will do as suggested in the instruction to come up with a tidy data set.

#1. Merges the training and the test sets to create one data set.
har_data <- rbind(train, test)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
x_varnames <- as.character(features$V2)
colnames(har_data) <- c("Subject", x_varnames, "Activity")
sel_columns <- grep('-(mean|std)\\(', x_varnames, value = TRUE)
cleaned_har_data <- har_data[, c("Subject", "Activity", sel_columns)]

#3. Uses descriptive activity names to name the activities in the data set
cleaned_har_data$Activity <- ordered(cleaned_har_data$Activity, levels = seq(1:6),
                                     labels = activity_labels$V2)

#4. Appropriately labels the data set with descriptive variable names.
colnames(cleaned_har_data) <- gsub("^t", "Time", colnames(cleaned_har_data))
colnames(cleaned_har_data) <- gsub("^f", "Frequency", colnames(cleaned_har_data))
colnames(cleaned_har_data) <- gsub("BodyBody", "Body", colnames(cleaned_har_data))
colnames(cleaned_har_data) <- gsub("mean\\()", "Mean", colnames(cleaned_har_data))
colnames(cleaned_har_data) <- gsub("std\\()", "Std", colnames(cleaned_har_data))
colnames(cleaned_har_data) <- gsub("-", "", colnames(cleaned_har_data))

#5. From the data set in step 4, creates a second, independent tidy data set with the average 
#   of each variable for each activity and each subject.
tidy_data_set <- cleaned_har_data %>%
  group_by(Subject, Activity) %>%
  summarize_all(mean)

write.table(tidy_data_set,row.name = FALSE,file = "tidy_data_set.txt")
