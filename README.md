# "Getting and Cleaning Data Course Project

This project takes data from the data collected from the accelerometers from the Samsung Galaxy S smartphone. 
>Human Activity Recognition Using Smartphones Dataset
>Version 1.0
>
>Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
>Smartlab - Non Linear Complex Systems Laboratory
>DITEN - Universit?? degli Studi di Genova.
>Via Opera Pia 11A, I-16145, Genoa, Italy.
>activityrecognition@smartlab.ws
>www.smartlab.ws
***

The actual data is from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
This data must be downloaded, unzipped and the current working directory needs to be the **UCI HAR Dataset**

There is a single R file that performs the analysis **run_analysis.R**

run_analysis reads in the data contained in 8 files in the **UCI HAR Dataset** directory
1. test/subject_test.txt, test/X_test.txt, test/y_test.txt
2. train/subject_train.txt, train/X_train.txt, train/y_train.txt 
3. features.txt
4. activity_labels.txt

run_analysis outputs a tidy data set that summarizes data for each subject in each position (dplyr is used heavily):

1. creates a tidy data set from the train and test data files
  * by applying descriptive column names,  [req. 4]
  * combining all test (and train) data, 
  * joining the test and train data, [req. 1]
  * replacing activity ids with human readable names, [req. 3] 
  * dropping columns that are not SubjectID, Activity, means, or stds [req.2]
2. creates a second independent tidy data set that 
  * includes the average for each variable & for each subject [req. 5]
  * outputs the this summary dataset to a file

This resulting data *summary_data.txt* set is TIDY, and conforms to the tidy data requirements of:

1. Each variable is in its own column
2. Each observation is in its own row
3. There is a single table, with one kind of data
4. Not applicable as all the data is the same kind, and thus in a single table

For full information on tidy data please refer to:  
Hadley Wickham, Tidy data,  The Journal of Statistical Software, vol. 59, 2014.
http://vita.had.co.nz/papers/tidy-data.pdf




