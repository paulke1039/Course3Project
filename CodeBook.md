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

This code book summarizes the resulting data fields in `tidy.txt`.

## Identifiers

* `subjectID` - The ID of the test subject
* `activityID` - The ID of theactivity performed when the corresponding measurements were taken

## Measurements
Time.Body.Acceleration.Mean-X
Time.Body.Acceleration.Mean-Y
Time.Body.Acceleration.Mean-Z
Time.Body.Acceleration.StdDev-X
Time.Body.Acceleration.StdDev-Y
Time.Body.Acceleration.StdDev-Z                              
Time.GravityAcceleration.Mean-X
Time.GravityAcceleration.Mean-Y                              
Time.GravityAcceleration.Mean-Z
Time.GravityAcceleration.StdDev-X
Time.GravityAcceleration.StdDev-Y
Time.GravityAcceleration.StdDev-Z
Time.Body.Acceleration_Jerk.Mean-X
Time.Body.Acceleration_Jerk.Mean-Y
Time.Body.Acceleration_Jerk.Mean-Z
Time.Body.Acceleration_Jerk.StdDev-X
Time.Body.Acceleration_Jerk.StdDev-Y
Time.Body.Acceleration_Jerk.StdDev-Z
Time.Body.Gyroscope.Mean-X
Time.Body.Gyroscope.Mean-Y
Time.Body.Gyroscope.Mean-Z
Time.Body.Gyroscope.StdDev-X
Time.Body.Gyroscope.StdDev-Y
Time.Body.Gyroscope.StdDev-Z
Time.Body.Acceleration.Magnitude.Mean
Time.Body.Acceleration.Magnitude.StdDev
Time.GravityAcceleration.Magnitude.Mean
Time.GravityAcceleration.Magnitude.StdDev
Time.Body.Acceleration_Jerk.Magnitude.Mean
Time.Body.Acceleration_Jerk.Magnitude.StdDev                 
Time.Body.Gyroscope.Magnitude.Mean
Time.Body.Gyroscope.Magnitude.StdDev                         
Frequency.Body.Acceleration.Mean-X
Frequency.Body.Acceleration.Mean-Y                           
Frequency.Body.Acceleration.Mean-Z
Frequency.Body.Acceleration.StdDev-X
Frequency.Body.Acceleration.StdDev-Y
Frequency.Body.Acceleration.StdDev-Z
Frequency.Body.Acceleration.MeanFreq-X
Frequency.Body.Acceleration.MeanFreq-Y
Frequency.Body.Acceleration.MeanFreq-Z
Frequency.Body.Acceleration_Jerk.Mean-X
Frequency.Body.Acceleration_Jerk.Mean-Y
Frequency.Body.Acceleration_Jerk.Mean-Z
Frequency.Body.Acceleration_Jerk.StdDev-X
Frequency.Body.Acceleration_Jerk.StdDev-Y
Frequency.Body.Acceleration_Jerk.StdDev-Z
Frequency.Body.Acceleration_Jerk.MeanFreq-X
Frequency.Body.Acceleration_Jerk.MeanFreq-Y
Frequency.Body.Acceleration_Jerk.MeanFreq-Z
Frequency.Body.Gyroscope.Mean-X
Frequency.Body.Gyroscope.Mean-Y
Frequency.Body.Gyroscope.Mean-Z
Frequency.Body.Gyroscope.StdDev-X
Frequency.Body.Gyroscope.StdDev-Y
Frequency.Body.Gyroscope.StdDev-Z
Frequency.Body.Gyroscope.MeanFreq-X
Frequency.Body.Gyroscope.MeanFreq-Y
Frequency.Body.Gyroscope.MeanFreq-Z
Frequency.Body.Acceleration.Magnitude.Mean
Frequency.Body.Acceleration.Magnitude.StdDev
Frequency.Body.Acceleration.Magnitude.MeanFrequency
Frequency.Body.Body.Acceleration_Jerk.Magnitude.Mean
Frequency.Body.Body.Acceleration_Jerk.Magnitude.StdDev
Frequency.Body.Body.Acceleration_Jerk.Magnitude.MeanFrequency
Frequency.Body.Body.Gyroscope.Magnitude.Mean
Frequency.Body.Body.Gyroscope.Magnitude.StdDev
Frequency.Body.Body.Gyroscope.Magnitude.MeanFrequency

## Activity Labels

Value of 1 = `WALKING`: subject was walking during the test
Value of 2 = `WALKING_UPSTAIRS`: subject was walking up a staircase during the test
Value of 3 = `WALKING_DOWNSTAIRS`: subject was walking down a staircase during the test
Value of 4 = `SITTING`: subject was sitting during the test
Value of 5 = `STANDING` : subject was standing during the test
Value of 6 = `LAYING`: subject was laying down during the test