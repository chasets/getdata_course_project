# TSC
# 2014-06-19
# run_analysis.R for Getting and Cleaning data course project
# requirements are listing in comments as they are attressed

# setwd('/xxxxx/classes/getting_cleaning_data/course_project')
fileURL <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip '

download.file(fileURL, 'uci_har_dataset.zip', method='curl')
unzip('uci_har_dataset.zip')

# test/subject_test.txt has the subject_id
# test/y_test.txt has the activity_id
# test/X_test.txt has the measurement_vector
# activity_labels.txt has id and activity_label
# features.txt has the label for the measurement_vectors

# load common labels
activity_labels_temp <- read.table('UCI HAR Dataset/activity_labels.txt', header=FALSE)
names(activity_labels_temp) <- c("activity_id", "activity_name")  # need nice names later

measurement_labels_temp <- read.table('UCI HAR Dataset/features.txt', header=FALSE)


# we're going to do this twice, so we might as well write a function

get_df <- function (splitname) {
    # read the train or test data
    df_subject_id <- read.table(sprintf('UCI HAR Dataset/%s/subject_%s.txt', splitname, splitname), header=FALSE)
    df_activity_id <- read.table(sprintf('UCI HAR Dataset/%s/y_%s.txt', splitname, splitname), header=FALSE)
    df_measurement <- read.table(sprintf('UCI HAR Dataset/%s/X_%s.txt', splitname, splitname), header=FALSE)
    
    # 4. Appropriately labels the data set with descriptive variable names. 
    names(df_measurement) <- measurement_labels_temp[,2]
    
    # add the subject_id and activity_id
    df <- cbind(df_subject_id, df_activity_id, df_measurement)
    
    # give them nice names
    colnames(df)[1] <- "subject_id"
    colnames(df)[2] <- "activity_id"
    
    # 3. Uses descriptive activity names to name the activities in the data set
    # print(dim(df))  # before merge
    df <- merge(df, activity_labels_temp, by="activity_id")
    # print(dim(df))  # after merge, just to make sure we didn't lose any rows
    return(df)
}

# 1. Merges the training and the test sets to create one data set.
df_test = get_df("test")
df_train = get_df("train")
df_full <- rbind(df_test, df_train)

#  dim(df_full)  ## number of obs matches expected from website
# table(df_full$subject_id)
# OK, we have 30 subjects
# plot(table(df_full$subject_id), type="l")
# abline(h=mean(table(df_full$subject_id)))
# OK, the rows are pretty evenly distributed among the 30 subjects
# table(df_full$activity_name)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# My interpretation is that "mean" should only include names "mean()" not gravityMean or meanFreq
meanCols <- grep('mean\\(\\)', names(df_full))    # 33
stdCols <- grep('std\\(\\)', names(df_full))      # 33

# so let's keep subject_id=2, activity_name=564, and the meanCols and stdCols
df_final <- df_full[,c(2,564,meanCols,stdCols)]
# dim(df_final) 
# [1] 10299    68   
# sum(complete.cases(df_final))   # no NAs

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
# This is ambiguous as to whether to use the variables in the original or the set just created.
# I'm assuming that it is based on the variables in df_final. It is OK to have one row per subject per activiy
# (see http://vita.had.co.nz/papers/tidy-data.pdf page 5)
# So, we should end up with 
# subject_id, activity_name, mean(col_1), mean(col2), etc.

# looks like aggregate does everything we need
# I would expect 2 id columns and 66 data columns with 180 rows (30 subs X 6 activities)
df_subject_activity_means <- aggregate(subset(df_final, select= -c(subject_id, activity_name)), 
                                       by=list(subject_id=df_final$subject_id, activity_name=df_final$activity_name), 
                                       mean)

# table(df_subject_activity_means$activity_name)  # 30 for each activity
# table(df_subject_activity_means$subject_id)     # 6 for each subject
# sum(complete.cases(df_subject_activity_means))

# writing out the smaller (tidy) set for submission
write.csv(df_subject_activity_means, 'getdata_course_project_submission.csv', row.names = FALSE)




