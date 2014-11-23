# Getting and Cleaning Data
# Course Project
# CodeBook.md

This file describes variable names used in run_analysis.R script.

I arranged them in alphabetical order for easy reference, not in the order they appear in the script.


activities  - (6 x 2) table that contains activity labels and names as defined in "UCI HAR Dataset/activity_labels.txt"
                file; this table is used to map the activity labels used in the datasets to the readable activity names

aggregatedSet - (180 x 81) data frame that containes the aggregated data with means calculated and sorted 
                by activity and subject just before I merge in the activity names
            
combinedDataSet - (10299 x 563) combined train and test data sets with the activity and subject columns included
                before any extraction or manipulation is done 

features - (561 x 2) table that contains the feature names as they are defined in "UCI HAR Dataset/features.txt"
                this table is used to generate the column names vector for both train and test datasets
  
featureNames - (1 x 561) vector of feature names that comes from features table

meansAndDeviations - (10299 x 81) this data frame is the subset of the combinedDataSet, it contains the ActivityLabel, 
                Subject columns plus the columns with mean and standard deviation features. 

meanFeatures - (1 x 46) vector of feature names that contain "-mean()" substring
 
newDataSet - (180 x 82) the new tidy data set just before it is written to the file

testActivityLabels - (2947 x 1) vector of activity labels for the test set as defined in "UCI HAR Dataset/test/y_test.txt"

testSet - (2947 x 561)  data frame that contains the test data set defined in "UCI HAR Dataset/test/X_test.txt"

testSetLabeled - (2947 x 563) data frame that contains the test data set plus test activity and subject labels

testSubjectLabels - (2947 x 1) vector of subject labels for the test set as defined in "UCI HAR Dataset/test/subject_test.txt"

trainActivityLabels - (2947 x 1) vector of activity labels for the train set as defined in "UCI HAR Dataset/train/y_train.txt"

trainSet - (2947 x 561)  data frame that contains the train data set defined in "UCI HAR Dataset/train/X_train.txt"

trainSetLabeled - (2947 x 563) data frame that contains the train data set plus train activity and subject labels

trainSubjectLabels - (2947 x 1) vector of subject labels for the train set as defined in "UCI HAR Dataset/train/subject_train.txt"

stdFeatures - (1 x 33) vector of feature names that contain "-std()" substring