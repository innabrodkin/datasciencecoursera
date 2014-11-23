#Getting and Cleaning Data 
# Course Project 
# CodeBook.md 

This file describes the processing that the script run_analysis.R performs
 to the data that is obtained at this location:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

1.  Load in information about the activity labels and names.
    
    Read in "./UCI HAR Dataset/features.txt" as a table and give the columns meaningful names.
    This step produces activities table
    
activities  - (6 x 2) table that contains activity labels and names as defined in "UCI HAR Dataset/activity_labels.txt"
		file; this table is used to map the activity labels used in the datasets to the readable activity names

2.  Load in feature names for the features measured in the experiments
 
    Read in "./UCI HAR Dataset/features.txt" as a table and extract its 2nd column as 
    a list of feature names for the features that both train and test datasets contain.
    This step produces features table and featureNames vector

features - (561 x 2) table that contains the feature names as they are defined in "UCI HAR Dataset/features.txt"
                this table is used to generate the column names vector for both train and test datasets
  
featureNames - (1 x 561) vector of feature names that comes from features table

3. Read in the train dataset, the activity vector and the subject vector corresponding 
   to the measurements recorded in the train data set. Combine the data loaded in this step
   with the featureNames to create  the labeled train dataset with descriptive column names.
   This step creates the following data objects:

trainActivityLabels - (2947 x 1) vector of activity labels for the train set as defined in "UCI HAR Dataset/train/y_train.txt"

trainSet - (2947 x 561)  data frame that contains the train data set defined in "UCI HAR Dataset/train/X_train.txt"

trainSetLabeled - (2947 x 563) data frame that contains the train data set plus train activity and subject labels

trainSubjectLabels - (2947 x 1) vector of subject labels for the train set as defined in "UCI HAR Dataset/train/subject_train.txt"


4. Read in the test dataset, the activity vector and the subject vector corresponding 
   to the measurements recorded in the test data set. Combine the data loaded in this step
   with the featureNames to create  the labeled test dataset with descriptive column names.
   This step creates the following data objects:

testActivityLabels - (2947 x 1) vector of activity labels for the test set as defined in "UCI HAR Dataset/test/y_test.txt"

testSet - (2947 x 561)  data frame that contains the test data set defined in "UCI HAR Dataset/test/X_test.txt"

testSetLabeled - (2947 x 563) data frame that contains the test data set plus test activity and subject labels

testSubjectLabels - (2947 x 1) vector of subject labels for the test set as defined in "UCI HAR Dataset/test/subject_test.txt"


5. Combine the labeled train dataset and the labeled test data set
   This produces combinedDataSet

combinedDataSet - (10299 x 563) combined train and test data sets with the activity and subject columns included
                before any extraction or manipulation is done 

6. Extract the column names that contain "-mean()" and "-std()" suffix substrings out of the featureNames vector.
   Assumption here is that these suffixes identify the mean and standard deviation measurements.
   Note: the featureNames vector does contain some names that have the word Mean in the name itself but it is not clear
   that the feature at hand is realy a mean or some product of mean so I did not include these columns.

meanFeatures - (1 x 46) vector of feature names that contain "-mean()" substring

stdFeatures - (1 x 33) vector of feature names that contain "-std()" substring

7. Extract the ActivityLabel and Subject columns, plus meanFeatures and stdFeatures columns out of the 
   combinedDataSet and create a subset dataset. This produces meanAndDerivations set
   
meansAndDeviations - (10299 x 81) this data frame is the subset of the combinedDataSet, it contains the ActivityLabel, 
                Subject columns plus the columns with mean and standard deviation features. 


8. Calculate the means of the extracted mean and std measurements columns aggregated by subject and activity.
   This step produces aggregatedSet

aggregatedSet - (180 x 81) data frame that containes the aggregated data with means calculated and sorted 
                by activity and subject just before I merge in the activity names
            
9. Merge the activities table and the aggregatedSet, this operation brings in the descriptive activity names.
   
   Note: I am keeping the ActivityLabel column as i believe it preserves integrity 
   with the original data set, and besides using integers for activity identifiers would
   allow for speed if any other manipulations of the data are desired later on

    The result of this operation is the newDataSet, that contains the aggregated means data grouped and ordered
    by activity and subject with the descriptive names. This is the processed dataset

newDataSet - (180 x 82) the new tidy data set just before it is written to the file

10.  Write the new data set to a file "TidyDataSet.txt" 


