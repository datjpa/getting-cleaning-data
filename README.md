README FOR "data_average"
========================================================
This document describes the data, the variables and transformations performed to arrive at the final data set. 

The data for the project was obtained at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A full description of the data is available here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The final dataset can be loaded from data_average.txt using the following code:
data <- read.table("file path", sep"", header=TRUE)

The run_analysis.R script runs with the assumption that the data is available in the working directory in an unzipped UCI HAR Dataset folder and that the path to your working directory is provided in the script's 'setwd()' and performs the following steps to clean the data:

01. Reads the X_test.txt, y_test.txt and subject_test.txt data and stores them in 'test_subj', 'test_x' and 'test_y' respectively. 
02. Adds 'test_y' and 'test_subj' to 'test_x' data as columns "activity" and "id" respectively and stores in 'test_data'.
03. Reads the X_train.txt, y_train.txt and subject_train.txt data and stores them in 'train_subj', 'train_x' and 'train_y' respectively. 
04. Adds 'train_y' and 'train_subj' to train_x data as columns "activity" and "id" respectively and stores in 'train_data'.
05. Merges 'test_data' and 'train_data' and stores in 'data_all'. 

06. Reads the features.txt data and stores in 'features_raw'.
07. Makes syntactically valid names from 'features_raw' and stores in 'features'.
08. Uses 'features' data to appropriately label dataset with descriptive variable names.
09. Extracts measurements on the standard deviation for each measurement and stores in 'data_std'.
10. Extracts measurements on the mean for each measurement and stores in 'data_mean'.

11. Merges 'data_std' and 'data_mean' and stores in 'data_extract'.
12. Reads the activity_labels.txt data and stores in 'act_labels'.
13. Uses descriptive activity names to name the activities in the dataset.
14. Adds column "activity" and "id" to 'data_extract' dataset and stores result in 'data_sub'.
15. Generates a second independent data set with the averages of each variable for each activity and each subject and stores result in 'data_sum'.

16. Cleans data from double variables and stores final result in 'data_average'.




