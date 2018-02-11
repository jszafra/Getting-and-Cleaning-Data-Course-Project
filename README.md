# Getting and Cleaning Data Course Project

This repo consists of data files, scripts, and code book used in obtaining a tidy data set as a course project of the **Getting and Cleaning Data Course**  of Coursera.

## The UCI HAR Dataset

The original data set used for this course project is from the **UCI Human Activity Recognition Using Smartphones Dataset**<sup>1</sup> which is a result of an experiment done from 30 volunteers performing certain activities  (i.e. walking, walking upstairs, walking downstairs, sitting, standing, and laying) while carrying a waist-mounted smartphone with embedded inertial sensors.

File can be downloaded from this website:
https://d396qusza40orc.cloudfront.net/getdata%2Fproject??les%2FUCI%20HAR%20Dataset.zip

## The Code Book

This markdown file describes the data, the variables and the transformations done to come up with the final tidy data set.

## The Script (run_analysis.R)

This R script contains the codes used to obtain the final tidy data set. Specifically, it follows the following instructions:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each
measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average
of each variable for each activity and each subject.

**Footnotes:**

[1] *Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012*