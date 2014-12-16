CodeBook for Samsung Data Project
=============================


The data being used for this analysis is in a directory "UCI HAR Dataset". Here are details about the files:
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all column headings, variable names
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Results for all 561 variables for training subjects
- 'train/y_train.txt': Activity labels for each row of training subject data
- 'train/subject_train.txt': Subject ID for each row of training subject data
- 'test/X_test.txt': Results for all 561 variables for test subjects
- 'test/y_test.txt': Activity labels for each row of test subject data
- 'train/subject_test.txt': Subject ID for each row of test subject data

The output data is in Step5.txt and it has 180 rows (30 subjects, multipled by 6 activities for each) and 81 columns. The first two columns are Subject ID and Activity (which is one of the following: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING or LAYING).

The remaining 79 columns were selected from the full list of 561. These were identified as being related to 'mean' or 'std' data, by having one of those substrings in the header name. These are:
 [1] "Subject"                         "Activity"                       
 [3] "tBodyAcc-mean()-X"               "tBodyAcc-mean()-Y"              
 [5] "tBodyAcc-mean()-Z"               "tBodyAcc-std()-X"               
 [7] "tBodyAcc-std()-Y"                "tBodyAcc-std()-Z"               
 [9] "tGravityAcc-mean()-X"            "tGravityAcc-mean()-Y"           
[11] "tGravityAcc-mean()-Z"            "tGravityAcc-std()-X"            
[13] "tGravityAcc-std()-Y"             "tGravityAcc-std()-Z"            
[15] "tBodyAccJerk-mean()-X"           "tBodyAccJerk-mean()-Y"          
[17] "tBodyAccJerk-mean()-Z"           "tBodyAccJerk-std()-X"           
[19] "tBodyAccJerk-std()-Y"            "tBodyAccJerk-std()-Z"           
[21] "tBodyGyro-mean()-X"              "tBodyGyro-mean()-Y"             
[23] "tBodyGyro-mean()-Z"              "tBodyGyro-std()-X"              
[25] "tBodyGyro-std()-Y"               "tBodyGyro-std()-Z"              
[27] "tBodyGyroJerk-mean()-X"          "tBodyGyroJerk-mean()-Y"         
[29] "tBodyGyroJerk-mean()-Z"          "tBodyGyroJerk-std()-X"          
[31] "tBodyGyroJerk-std()-Y"           "tBodyGyroJerk-std()-Z"          
[33] "tBodyAccMag-mean()"              "tBodyAccMag-std()"              
[35] "tGravityAccMag-mean()"           "tGravityAccMag-std()"           
[37] "tBodyAccJerkMag-mean()"          "tBodyAccJerkMag-std()"          
[39] "tBodyGyroMag-mean()"             "tBodyGyroMag-std()"             
[41] "tBodyGyroJerkMag-mean()"         "tBodyGyroJerkMag-std()"         
[43] "fBodyAcc-mean()-X"               "fBodyAcc-mean()-Y"              
[45] "fBodyAcc-mean()-Z"               "fBodyAcc-std()-X"               
[47] "fBodyAcc-std()-Y"                "fBodyAcc-std()-Z"               
[49] "fBodyAcc-meanFreq()-X"           "fBodyAcc-meanFreq()-Y"          
[51] "fBodyAcc-meanFreq()-Z"           "fBodyAccJerk-mean()-X"          
[53] "fBodyAccJerk-mean()-Y"           "fBodyAccJerk-mean()-Z"          
[55] "fBodyAccJerk-std()-X"            "fBodyAccJerk-std()-Y"           
[57] "fBodyAccJerk-std()-Z"            "fBodyAccJerk-meanFreq()-X"      
[59] "fBodyAccJerk-meanFreq()-Y"       "fBodyAccJerk-meanFreq()-Z"      
[61] "fBodyGyro-mean()-X"              "fBodyGyro-mean()-Y"             
[63] "fBodyGyro-mean()-Z"              "fBodyGyro-std()-X"              
[65] "fBodyGyro-std()-Y"               "fBodyGyro-std()-Z"              
[67] "fBodyGyro-meanFreq()-X"          "fBodyGyro-meanFreq()-Y"         
[69] "fBodyGyro-meanFreq()-Z"          "fBodyAccMag-mean()"             
[71] "fBodyAccMag-std()"               "fBodyAccMag-meanFreq()"         
[73] "fBodyBodyAccJerkMag-mean()"      "fBodyBodyAccJerkMag-std()"      
[75] "fBodyBodyAccJerkMag-meanFreq()"  "fBodyBodyGyroMag-mean()"        
[77] "fBodyBodyGyroMag-std()"          "fBodyBodyGyroMag-meanFreq()"    
[79] "fBodyBodyGyroJerkMag-mean()"     "fBodyBodyGyroJerkMag-std()"     
[81] "fBodyBodyGyroJerkMag-meanFreq()"

Some of the commands used to produce Step5.txt are:
-read.table: Read data from files into data tables in R
-cbind: Combine columns of data (subject ID, activity label, variable results)
-rbind: Combine rows of data (test data and training data)
-names: To set the column headers to more meaningful values
-grepl: To identify headers that contain certain substrings
-aggregate: To get the mean according to subject and activity 
