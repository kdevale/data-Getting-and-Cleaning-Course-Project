title:  "Getting and Cleaning Data Course Project - codebook for summary_data.txt created by run_analysis.R

## Overview 
## Data organization
The data is organized as a tidy set with each row containing sensor data for one activity/participant.  
(There will be multiple rows of data for each participant.  There will also be multiple rows with the same activity. 
The combination of participant and activity represents a unique row.)

### Data processing
**All data cleaning and analysis is down by the run_analysis.R file.**  DPLYR is used by run_analyis.

0. The working directory must be *UCI HAR Dataset* and files must be previously downloaded and unzipped from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
1. Using read.table the 8 input files (test/subject_test.txt, test/X_test.txt, test/y_test.txt, train/subject_train.txt, train/X_train.txt, train/y_train.txt, features.txt, activity_labels.txt) are read into data frames
2. columns are labelled to be human readable
  *make.names is used on the features data to ensure uniqueness and then applied as column names for the "X" data
  *SubjectID and ActivityID are applied to the subject and y data respectively
3. make.names is also used on the activity names to ensure uniqueness
4. DPLYR dataframe tables are created for all the train and test data
5. bind_cols is used to join all the train data and then again to join all the test data
6. bind_rows is used to join train and test data into a single data frame
7. mutate is used to apply the human readable activity names
8. select used to build a reduced dataframe that contains the SubjectId,Activity, and any columns with "mean" or "std" in the column name
9. After grouping on SubjectID and Activity summarize_each is called to apply the mean to each unique combination of SubjectID and Activity
10. Finally the summarized data is written out to the file summary_data.txt by write.table

### Column Descriptions
Column 1 contains the subject ID and is of class Integer.  
Column 2 contains the human readable description of activity (origin activity_labels.txt) is of class character
Column 3:88 contain the mean of all mean and stardard deviation measurements (raw data from test_x and train_x files) of type numeric 

units remain the same as the original work 

***
## Codebook
Variable Index | Data Type | Variable Name (from features.txt)
---------------|-----------|----------------------------------------------------------------------------------------------------------
 1 | integer | SubjectID
 2 | character | Activity
 3 | numeric |  "tBodyAcc.mean...X"
 4 | numeric |  "tBodyAcc.mean...Y"
 5 | numeric |  "tBodyAcc.mean...Z"
 6 | numeric |  "tGravityAcc.mean...X" 
 7 | numeric |  "tGravityAcc.mean...Y" 
 8 | numeric |  "tGravityAcc.mean...Z" 
 9 | numeric |  "tBodyAccJerk.mean...X" 
 10 | numeric |  "tBodyAccJerk.mean...Y" 
 11 | numeric |  "tBodyAccJerk.mean...Z" 
 12| numeric |  "tBodyGyro.mean...X" 
 13 | numeric |  "tBodyGyro.mean...Y" 
 14 | numeric |  "tBodyGyro.mean...Z" 
 15 | numeric |  "tBodyGyroJerk.mean...X" 
 16 | numeric |  "tBodyGyroJerk.mean...Y" 
 17 | numeric |  "tBodyGyroJerk.mean...Z" 
 18 | numeric |  "tBodyAccMag.mean.." 
 19 | numeric |  "tGravityAccMag.mean.." 
 20 | numeric |  "tBodyAccJerkMag.mean.." 
 21 | numeric |  "tBodyGyroMag.mean.." 
 22 | numeric |  "tBodyGyroJerkMag.mean.." 
 23 | numeric |  "fBodyAcc.mean...X" 
 24 | numeric |  "fBodyAcc.mean...Y" 
 25 | numeric |  "fBodyAcc.mean...Z" 
 26 | numeric |  "fBodyAcc.meanFreq...X" 
 27 | numeric |  "fBodyAcc.meanFreq...Y" 
 28 | numeric |  "fBodyAcc.meanFreq...Z" 
 29 | numeric |  "fBodyAccJerk.mean...X" 
 30 | numeric |  "fBodyAccJerk.mean...Y" 
 31 | numeric |  "fBodyAccJerk.mean...Z" 
 32 | numeric |  "fBodyAccJerk.meanFreq...X" 
 33 | numeric |  "fBodyAccJerk.meanFreq...Y" 
 34 | numeric |  "fBodyAccJerk.meanFreq...Z" 
 35 | numeric |  "fBodyGyro.mean...X" 
 36 | numeric |  "fBodyGyro.mean...Y" 
 37 | numeric |  "fBodyGyro.mean...Z" 
 38 | numeric |  "fBodyGyro.meanFreq...X" 
 39 | numeric |  "fBodyGyro.meanFreq...Y" 
 40 | numeric |  "fBodyGyro.meanFreq...Z" 
 41 | numeric |  "fBodyAccMag.mean.." 
 42 | numeric |  "fBodyAccMag.meanFreq.." 
 43 | numeric |  "fBodyBodyAccJerkMag.mean.." 
 44 | numeric |  "fBodyBodyAccJerkMag.meanFreq.." 
 45 | numeric |  "fBodyBodyGyroMag.mean.." 
 46 | numeric |  "fBodyBodyGyroMag.meanFreq.." 
 47 | numeric |  "fBodyBodyGyroJerkMag.mean.." 
 48 | numeric |  "fBodyBodyGyroJerkMag.meanFreq.." 
 49 | numeric |  "angle.tBodyAccMean.gravity." 
 50 | numeric |  "angle.tBodyAccJerkMean..gravityMean." 
 51 | numeric |  "angle.tBodyGyroMean.gravityMean." 
 52 | numeric |  "angle.tBodyGyroJerkMean.gravityMean." 
 53 | numeric |  "angle.X.gravityMean." 
 54 | numeric |  "angle.Y.gravityMean." 
 55 | numeric |  "angle.Z.gravityMean." 
 56 | numeric |  "tBodyAcc.std...X" 
 57 | numeric |  "tBodyAcc.std...Y" 
 58 | numeric |  "tBodyAcc.std...Z" 
 59 | numeric |  "tGravityAcc.std...X" 
 60 | numeric |  "tGravityAcc.std...Y" 
 61 | numeric |  "tGravityAcc.std...Z" 
 62 | numeric |  "tBodyAccJerk.std...X" 
 63 | numeric |  "tBodyAccJerk.std...Y" 
 64 | numeric |  "tBodyAccJerk.std...Z" 
 65 | numeric |  "tBodyGyro.std...X" 
 66 | numeric |  "tBodyGyro.std...Y" 
 67 | numeric |  "tBodyGyro.std...Z" 
 68 | numeric |  "tBodyGyroJerk.std...X" 
 69 | numeric |  "tBodyGyroJerk.std...Y" 
 70 | numeric |  "tBodyGyroJerk.std...Z" 
 71 | numeric |  "tBodyAccMag.std.." 
 72 | numeric |  "tGravityAccMag.std.." 
 73 | numeric |  "tBodyAccJerkMag.std.." 
 74 | numeric |  "tBodyGyroMag.std.." 
 75 | numeric |  "tBodyGyroJerkMag.std.." 
 76 | numeric |  "fBodyAcc.std...X" 
 77 | numeric |  "fBodyAcc.std...Y" 
 78 | numeric |  "fBodyAcc.std...Z" 
 79 | numeric |  "fBodyAccJerk.std...X" 
 80 | numeric |  "fBodyAccJerk.std...Y" 
 81 | numeric |  "fBodyAccJerk.std...Z" 
 82 | numeric |  "fBodyGyro.std...X" 
 83 | numeric |  "fBodyGyro.std...Y" 
 84 | numeric |  "fBodyGyro.std...Z" 
 85 | numeric |  "fBodyAccMag.std.." 
 86 | numeric |  "fBodyBodyAccJerkMag.std.." 
 87 | numeric |  "fBodyBodyGyroMag.std.." 
 88 | numeric |  "fBodyBodyGyroJerkMag.std.."
