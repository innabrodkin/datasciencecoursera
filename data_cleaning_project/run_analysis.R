#Getting and Cleaning Data 
# Course Project 
# run_analysis.R

# read in activity_labels.txt and give columns meaningful names
activities<-read.table("./UCI HAR Dataset/activity_labels.txt")
names(activities)<-cbind("ActivityLabel","Activity")

# read in features.txt to get the data set feature names and convert the list into a vector
features<-read.table("./UCI HAR Dataset/features.txt")
featureNames<-as.vector(features$V2, mode="character")

# read in the contents of train/X_train.txt 
trainSet<-read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE, sep="")
# use the feature names vector as the column names for the train set
names(trainSet)<-featureNames
# read in the activity labels for the train set
trainActivityLabels<-read.table("./UCI HAR Dataset/train/y_train.txt")
names(trainActivityLabels)<-"ActivityLabel"
# read in the subject labels for the train set
trainSubjectLabels<-read.table("./UCI HAR Dataset/train/subject_train.txt")
names(trainSubjectLabels)<-"Subject"
# combine the train set with the activity labels and the subject labels vectors
# as additional columns
trainSetLabeled<-cbind(trainActivityLabels, trainSubjectLabels, trainSet)

#read in the contents of test/X_test.txt
testSet<-read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE, sep="")
# use the feature names vector as the column names for the test set
names(testSet)<-featureNames
#read in the activity labels for the test set
testActivityLabels<-read.table("./UCI HAR Dataset/test/y_test.txt")
names(testActivityLabels)<-"ActivityLabel"
#read in the subject labels for the test set
testSubjectLabels<-read.table("./UCI HAR Dataset/test/subject_test.txt")
names(testSubjectLabels)<-"Subject"
# combine the test set with the activity labels and the subject labels vectors
# as additional columns
testSetLabeled<-cbind(testActivityLabels, testSubjectLabels, testSet)

# combine the train set and the test set into one dataset
combinedDataSet<-rbind(trainSetLabeled,testSetLabeled)

# extract the column names for mean and standard deviation measurements 
# out of the featureNames vector
# note: I am only taking the columns that have "...-mean()" and "...-std()" in their names
meanFeatures<-grep("-mean()", featureNames, ignore.case=FALSE, value=TRUE)
stdFeatures<-grep("-std()", featureNames, ignore.case=FALSE, value=TRUE)

# create a subset of the combined dataset that contains only the columns with mean 
# and standard deviation measurements
meansAndDeviations<-subset(combinedDataSet, select=c("ActivityLabel", "Subject", meanFeatures,stdFeatures))

# calculate the means of the extracted mean and std measurements columns 
# aggregated by subject and activity
aggregatedSet<-aggregate(meansAndDeviations, 
            by = list(meansAndDeviations$Subject, meansAndDeviations$ActivityLabel),
            mean, simplify=TRUE)
# aggregate() adds two extra columns : Group1 and Group2 , remove them
aggregatedSet<-subset(aggregatedSet, select=c(names(meansAndDeviations)))
                      
# merge the activities table and the aggregatedSet, 
# this operation brings in the descriptive activity names
# note: I am keeping the ActivityLabel column as i believe it preserves integrity 
# with the original data set, and besides using integers for activity identifiers would
# allow for speed if any other manipulations of the data are desired later on
newDataSet<-merge(activities, aggregatedSet, by.x="ActivityLabel", by.y="ActivityLabel")

# write the new data set to a file "TidyDataSet.txt" 
write.table(newDataSet, file= "./TidyDataSet.txt", row.name=FALSE)