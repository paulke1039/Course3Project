library(plyr)

# Download the dataset
# For the sake of performance, the download is only performed if the Dataset does not exist.
  if (!file.exists("./UCI HAR Dataset")) {
      fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
      download.file(fileURL, "dataset.zip")
      unzip("./Dataset.zip")
      
  }
  
# Requirement #1 - Merges the training and the test sets to create one data set.
# Reading in Activity and Features
  activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE)
  colnames(activity_labels) <- c('activityID', 'activityType') # assign new column names for clarity.
  features <- read.table("./UCI HAR Dataset/features.txt", header=FALSE)

# Handle Training data
  # Reading in the training data
  subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)
  x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE)
  y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt", header=FALSE)
  
  
  # Assign column names
  colnames(subject_train) <- "subjectID"
  colnames(x_train) <- features[, 2]
  colnames(y_train) <- "activityID"
  
  
  # Create a single Training dataset
  train_dataset <- cbind(subject_train,x_train, y_train)

# Handle Test data
  # Reading in the test data
  subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)
  x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
  y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt", header=FALSE)

  #Assign column names
  colnames(x_test) <- features[, 2]
  colnames(y_test) <- "activityID"
  colnames(subject_test) <- "subjectID"

  # Create a single Test dataset
  test_dataset <- cbind(subject_test, x_test, y_test)
  
  # Create a single overall dataset with both training and test data
  overall_dataset <- rbind(train_dataset, test_dataset)

# Requirement #2 - Extracts only the measurements on the mean and standard deviation for each measurement.
  # gather all column names 
  overall_colNames <- colnames(overall_dataset)
 
  # Identify just the mean and standard deviations
  col_mean_std <- (grepl("activity..", overall_colNames) |
                   grepl("subject..", overall_colNames) |
                   grepl("mean..", overall_colNames) | 
                   grepl("std..", overall_colNames))
  
  #reload the overall dataset by pulling only the mean and standard deviation measurements.
  overall_dataset <- overall_dataset[col_mean_std==TRUE]
  
  # Requirement #3 - Uses descriptive activity names to name the activities in the data set
  overall_dataset <- merge(overall_dataset, activity_labels, by="activityID", all.x=TRUE)
  
  overall_colNames <- colnames(overall_dataset)
# Requirement #4 - Appropriately labels the data set with descriptive variable names.
  # Make the labels more descriptive and readable.
  names(overall_dataset) <- gsub("\\()","", names(overall_dataset)) 
  names(overall_dataset) <- gsub('-std',"StdDev",names(overall_dataset))
  names(overall_dataset) <- gsub('-mean',"Mean",names(overall_dataset))
  names(overall_dataset) <- gsub('^(t)',"Time.",names(overall_dataset))
  names(overall_dataset) <- gsub('^(f)',"Frequency.",names(overall_dataset))
  names(overall_dataset) <- gsub('Acc',"Acceleration.",names(overall_dataset))
  names(overall_dataset) <- gsub('Body',"Body.",names(overall_dataset))
  names(overall_dataset) <- gsub('GyroJerk',"Acceleration_Jerk.",names(overall_dataset))
  names(overall_dataset) <- gsub('\\.Jerk', "_Jerk.", names(overall_dataset))
  names(overall_dataset) <- gsub('Gyro',"Gyroscope.",names(overall_dataset))
  names(overall_dataset) <- gsub('Mag',"Magnitude.",names(overall_dataset))
  names(overall_dataset) <- gsub('Freq\\.',"Frequency.",names(overall_dataset))
  names(overall_dataset) <- gsub('Freq$',"Frequency",names(overall_dataset))
  
# Requirement #5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  
  tidy_dataset <- aggregate(. ~subjectID + activityID, overall_dataset, mean)
  tidy_dataset <- tidy_dataset[, names(tidy_dataset) != "activityType"]
  write.table(tidy_dataset, './tidy_data.txt',row.names=FALSE)
    