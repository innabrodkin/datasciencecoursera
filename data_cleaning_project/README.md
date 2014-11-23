# Getting and Cleaning Data
# Course Project
# README.md

==========================================================================================
One of the most exciting areas in all of data science right now is wearable computing. 
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms 
to attract new users. The data used in this project was collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

 The data used for the project can be found here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

======================================================================================

This directory contains 4 files:
1) README.md     - markdown file that describes the source of the data and the project
2) CodeBook.md   - markdown file that describes how the data was processed
3) run_analysis.R  - the R script performing the data manipulations described in CodeBook.md
4) TidyDataSet.txt - the file that contains the processed data set produced by run_anaysis.R 
                    

=======================================================================================

In order to reproduce the processing as it is described in the CodeBook.md and generate the data 
set identical to the one in TidyDataSet.txt using the raw data, please, use the following steps:

1. Download the data from this location:
   https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

2. Create a working directory and uncompress the downloaded data in the working directory. 
   This step would create a directory  UCI HAR Dataset/  under your working directory

3. Execute the script run_analysis.R in the working directory. The script uses relative filenames
   for the data files that UCI HAR Dataset contains.
    

