#Getting and Cleaning Data - Course Project
setwd(path.expand("~/Desktop/DESKTOP/COURSES/DATA SCIENCE/3 - Getting and Cleaning Data/Course_Project/"))
library(dplyr)

#Merges the training and the test sets to create one data set.
test_subj <- read.table("UCI HAR Dataset/test/subject_test.txt", sep = "", header = FALSE)
test_x <- read.table("UCI HAR Dataset/test/X_test.txt", sep = "", header = FALSE)
test_y <- read.table("UCI HAR Dataset/test/y_test.txt", sep = "", header = FALSE)
test_data <- mutate(test_x, activity=(test_y$V1), id=(test_subj$V1))

train_subj <- read.table("UCI HAR Dataset/train/subject_train.txt", sep = "", header = FALSE)
train_x <- read.table("UCI HAR Dataset/train/X_train.txt", sep = "", header = FALSE)
train_y <- read.table("UCI HAR Dataset/train/y_train.txt", sep = "", header = FALSE)
train_data <- mutate(train_x, activity=(train_y$V1), id=(train_subj$V1))

data_all <- rbind(test_data, train_data)

#Extracts only the measurements on the mean and standard deviation for each measurement. 
features_raw <- read.table("UCI HAR Dataset/features.txt", sep = "", header = FALSE)
features <- make.names(features_raw$V2)
colnames(data_all)[1:561] <- features

data_std <- data_all[,grep("std", names(data_all))]
data_mean <- data_all[,grep("mean", names(data_all))]

data_extract <- cbind(data_std, data_mean)

#Uses descriptive activity names to name the activities in the data set
act_labels <- read.table("UCI HAR Dataset/activity_labels.txt", sep = "", header = FALSE)

data_all$activity <- gsub("1",act_labels$V2[1], data_all$activity)
data_all$activity <- gsub("2",act_labels$V2[2], data_all$activity)
data_all$activity <- gsub("3",act_labels$V2[3], data_all$activity)
data_all$activity <- gsub("4",act_labels$V2[4], data_all$activity)
data_all$activity <- gsub("5",act_labels$V2[5], data_all$activity)
data_all$activity <- gsub("6",act_labels$V2[6], data_all$activity)

data_sub <- cbind(data_extract, data_all[562:563])

#From the data set, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

data_sum <- data_sub %>% group_by(id, activity) %>% summarise_each(funs(mean))
data_average <- data_sum[1:79]