#Read in tables 
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test_y <- read.table("UCI HAR Dataset/test/y_test.txt")
test_x <- read.table("UCI HAR Dataset/test/x_test.txt")
features <- read.table("UCI HAR Dataset/features.txt")
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train_y <- read.table("UCI HAR Dataset/train/y_train.txt")
train_x <- read.table("UCI HAR Dataset/train/x_train.txt")

#Starting with test subjects, merge tables and add headers
merge2 <- cbind(test_subjects, test_y, test_x)
headers <- c("Subject", "Activity", as.character(features[,2]))
names(merge2) <- headers

#Function to translate an activity ID with its label
get_activity_name <- function(x){
  this_activity <- ""
  for(i in seq_along(activities[,2])){
    if(x==activities[i,1]){
      this_activity = as.character(activities[i,2])
    }
  }
  x = this_activity
}

#Translate the activity IDs to readable labels.
for(i in seq_along(merge2[,2])){
  merge2[i,2]<-get_activity_name(merge2[i,2])
}

#Now do the same thing for training subjects
merge3 <- cbind(train_subjects, train_y, train_x)
names(merge3) <- headers
for(i in seq_along(merge3[,2])){
  merge3[i,2]<-get_activity_name(merge3[i,2])
}

#Combine training and test data
full_records <- rbind(merge2,merge3)
#Sort the data by subject
full_sort <- full_records[order(full_records$Subject),]
#Filter out any columns that don't have 'mean' or 'std' in heading name
just_mean_col <- full_sort[,grepl("mean", colnames(full_sort))|grepl("std", colnames(full_sort))]
#The filter chopped off the subject and activity columns so put them back
final_data <- cbind(full_sort[,1:2],just_mean_col)
#Use aggregate to get mean by subject/activity. The aggregate added some
#new columns that I want to remove, so that's what the last few lines are
#doing.
agg_means <-aggregate(final_data, by=list(final_data[,1],final_data[,2]), FUN=mean, na.rm=TRUE)
agg_means[,3] <- agg_means[,1]
agg_means[,4] <- agg_means[,2]
step5 <- subset(agg_means,,3:83)
write.table(step5,file="Step5.txt",row.names=FALSE)