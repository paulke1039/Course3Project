## Getting and Cleaning Data Project

Paul Ke

### Description
CodeBook for description of the collection and formation of a tidy dataset to be used for analysis.

### Data Source
A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
[source data.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Data Source Information
From dataset README.txt - The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 
From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

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