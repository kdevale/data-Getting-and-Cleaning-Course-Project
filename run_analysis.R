library(dplyr)
library(RCurl)

###############################################################################
# run_analysis - creates a tidy data set from the train and test data files
#                 - by applying descriptive col. names,  [req. 4]
#                 - combining all test (and train) data, 
#                 - concatenating the test and train data, [req. 1]
#                 - replacing activity ids with human readable names, [req. 3] 
#                 - dropping columns that are not SubjectID,Activity,means,or stds [req.2]
#              - creates a second independent tidy data set that 
#                 - includes the average for each variable & for each subject [req. 5]
#                 - outputs the this summary dataset to a file
#
#   note:working directory must be the directory of the file folders test & train
###############################################################################


# read data files
## read the training text files
train_data_x <- read.table("train/X_train.txt")
train_data_y <- read.table("train/Y_train.txt")
train_data_subject <- read.table("train/subject_train.txt")

## read the test text files
test_data_x <- read.table("test/X_test.txt")
test_data_y <- read.table("test/Y_test.txt")
test_data_subject <- read.table("test/subject_test.txt")

## read the descriptions files (text)
feature_data <- read.table("features.txt", stringsAsFactors = FALSE)
activity_data <- read.table ("activity_labels.txt", stringsAsFactors = FALSE)

#apply descriptions to test and train files
## feature_data (in col 2) is the column names for x data files 
feature_names <- make.names(feature_data[,2], unique = TRUE)
names(test_data_x) <- feature_names
names(train_data_x) <- feature_names

## create names for activities 
activity_names <- make.names(activity_data[,2], unique = TRUE)

## add SubjectID col name to data subject files
names(test_data_subject) <- c("SubjectID")
names(train_data_subject) <- c("SubjectID")

## add Activity col name to y data files
names(test_data_y) <- c("ActivityID")
names(train_data_y) <- c("ActivityID")

#create DPLYR data tables for test and train
train_x_tbl <- tbl_df(train_data_x)
train_y_tbl <- tbl_df(train_data_y)
train_sub_tbl <- tbl_df(train_data_subject)
test_x_tbl <- tbl_df(test_data_x)
test_y_tbl <- tbl_df(test_data_y)
test_sub_tbl <- tbl_df(test_data_subject)

# build complete data sets (sub,y,x)
train_all_tbl <- bind_cols(train_sub_tbl,train_y_tbl,train_x_tbl)
test_all_tbl <- bind_cols(test_sub_tbl, test_y_tbl,test_x_tbl)

# combine train and test
data_all_tbl <- bind_rows(train_all_tbl,test_all_tbl)


# clean up
rm(train_x_tbl)
rm(train_y_tbl)
rm(train_sub_tbl)
rm(test_x_tbl)
rm(test_y_tbl)
rm(test_sub_tbl)
rm(train_all_tbl)
rm(test_all_tbl) 

# convert Activity col to human readable values 
temp <- mutate(data_all_tbl,Activity = activity_names[ActivityID])

# build data set - dropping data that isn't SubjectID, Activity, mean & std
data_all_tbl <- select(temp,1,564,contains("mean"),contains("std"))
rm(temp)

###############################################################################
# create an independent tidy data set with the average of each variable for 
# each activity and each subject and write the result
###############################################################################

summary_data <- group_by(data_all_tbl,SubjectID,Activity) %>%
  summarise_each(funs(mean),3:88) %>%
  ungroup

# note the output file has the means in columns 3:55 and stds in columns 56:88
write.table(summary_data, "summary_data.txt",row.names = FALSE)

#cleanup
rm(data_all_tbl)
