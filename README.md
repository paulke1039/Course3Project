## Getting and Cleaning Data  Project 
Paul Ke

Repository for the submission of the John Hopkins "Getting and Cleaning Data" Course

### Overview
This project serves to demonstrate the collection and formation of a tidy dataset to be used for analysis.

A full description is available at the site where the data was obtained:
[The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

###Project Information
The (run_analysis.R) script will demonstrate my ability to collect, work with, and clean a data set.

The overall project will contain:
1) a tidy data set
2) a link to this Github repository with this script.
3) a code book that describes the variables, the data, and any transformations or work performed to cleanup the data in CodeBook.md

This README in intended to explain how the script works and how everything is connected, the goal for the script are to ensure that it:
### Requirement 1. Merge the training and the test sets to create one data set.
After setting the source directory for the files, read into tables the data located in 
the following files:
- features.txt
- activity_labels.txt
- subject_train.txt
- x_train.txt
- y_train.txt
- subject_test.txt
- x_test.txt
- y_test.txt

After the dataset is read in, column names are updated so it is easier to read and understand.
subject_train and subject_test contain the subjectID
features dataset contain the description for x_train and x_test datasets
and y_train and y_test datasets contain the activityID

### Requirement 2. Extract only the measurements on the mean and standard deviation for each measurement. 
First, the column names are extracted into a logical vector that contains TRUE values for the ActivityID, SubjectID, mean and stdev columns.
The dataset is then subset to include only the required columns into it.

## Requirement 3. Use descriptive activity names to name the activities in the data set
In this step, we merge the dataset with the activityType table by the activityID and include all of the overall dataset values.

## Requirement 4. Appropriately label the data set with descriptive activity names.
In this step, the Activity names are abbreviated and very cryptic to read.  I used gsub functions and regular expressions to make the 
activity names more description and readable.

## Requirement 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
In this step, I used the aggregate function to split the data into subsets of activity and subject and compute the mean for each.
Next, I removed the activityType as activityID is already contained in the dataset and would not make sense in the summary.
Finally, the resulting tidy dataset is written out to a file called "tidy_data.txt"
### Additional Information
Additional information regarding the dataset variables and tidy process can be found in CodeBook.MD file.