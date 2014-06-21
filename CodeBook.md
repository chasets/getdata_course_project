Code Book for Getting and Cleaning Data Course Project
========================================================

The Data
--------

The data for this project is from the UC Irvine Machine Learning Repository set called "Human Activity Recognition Using Smartphones Data Set". See http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones for a full description. Below, I'll refer to this as the Project. 

The data itself was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 

Transformations
---------------

The R script "run_analysis.R" performs the following transformations on the Project data:

1. Load the data an appropriately label it. This includes pulling labels from the Project files activity_labels.txt and features.txt. 
2. Combine the "test" and "training" data from the Project. 
3. Select a specific subset of variables according to the instructions at https://class.coursera.org/getdata-004/human_grading/view/courses/972137/assessments/3/submissions. See the *Variable Subset* section below.
4. Calculate the mean of the selected variables by subject and activity.
5. Store this in a tidy dataset. 

*Variable Subset*

The submission instructions say to "[extract] only the measurements on the mean and standard deviation for each measurement". There are several variables in the Project data to which the term "mean" could apply. I chose to have it apply only to the variables with "mean()" in the name, thereby excluding variables with names including "gravityMean" or "meanFreq".


Variables 
---------

subject_id - the individual ID assigned and stored in the subject*.txt file in the Project data. This represents the person performing the activity.

activity_name - the name of the activity performed by the person, matched from an id loaded from the Project data

*List of mean and standardard deviation variables*

tBodyAcc-mean()-X    

tBodyAcc-mean()-Y          

tBodyAcc-mean()-Z          

tGravityAcc-mean()-X       

tGravityAcc-mean()-Y       

tGravityAcc-mean()-Z       

tBodyAccJerk-mean()-X      

tBodyAccJerk-mean()-Y      

tBodyAccJerk-mean()-Z      

tBodyGyro-mean()-X         

tBodyGyro-mean()-Y         

tBodyGyro-mean()-Z         

tBodyGyroJerk-mean()-X     

tBodyGyroJerk-mean()-Y     

tBodyGyroJerk-mean()-Z     

tBodyAccMag-mean()         

tGravityAccMag-mean()      

tBodyAccJerkMag-mean()     

tBodyGyroMag-mean()        

tBodyGyroJerkMag-mean()    

fBodyAcc-mean()-X          

fBodyAcc-mean()-Y          

fBodyAcc-mean()-Z          

fBodyAccJerk-mean()-X      

fBodyAccJerk-mean()-Y      

fBodyAccJerk-mean()-Z      

fBodyGyro-mean()-X         

fBodyGyro-mean()-Y         

fBodyGyro-mean()-Z         

fBodyAccMag-mean()         

fBodyBodyAccJerkMag-mean() 

fBodyBodyGyroMag-mean()    

fBodyBodyGyroJerkMag-mean()

tBodyAcc-std()-X           

tBodyAcc-std()-Y           

tBodyAcc-std()-Z           

tGravityAcc-std()-X        

tGravityAcc-std()-Y        

tGravityAcc-std()-Z        

tBodyAccJerk-std()-X       

tBodyAccJerk-std()-Y       

tBodyAccJerk-std()-Z       

tBodyGyro-std()-X          

tBodyGyro-std()-Y          

tBodyGyro-std()-Z          

tBodyGyroJerk-std()-X      

tBodyGyroJerk-std()-Y      

tBodyGyroJerk-std()-Z      

tBodyAccMag-std()          

tGravityAccMag-std()       

tBodyAccJerkMag-std()      

tBodyGyroMag-std()         

tBodyGyroJerkMag-std()     

fBodyAcc-std()-X           

fBodyAcc-std()-Y           

fBodyAcc-std()-Z           

fBodyAccJerk-std()-X       

fBodyAccJerk-std()-Y       

fBodyAccJerk-std()-Z       

fBodyGyro-std()-X          

fBodyGyro-std()-Y          

fBodyGyro-std()-Z          

fBodyAccMag-std()          

fBodyBodyAccJerkMag-std()  

fBodyBodyGyroMag-std()     

fBodyBodyGyroJerkMag-std() 



