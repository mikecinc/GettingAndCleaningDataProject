GettingAndCleaningDataProject
=============================
The run_analysis.R script is a series of commands to read in the Samsung data from your working directory and manipulate it to produce a readable table of means of any fields related to "mean" or "standard deviation", divided by Subject and Activity.

The first section of code is filled with "read.table" commands to bring the necessary tables into R. There are two groups of subjects: test and train. 

The next section of codes applies the same commands to each group of subjects: merge the list of subjects (test_subjects) with the list of activities (test_y) and results (test_x) and make the resulting table more readable by using 'names' command to set header IDs and translating the activity codes via the for loop calling custom function 'get_activity_name'.

Once that is cdone for each group, they are combined into 1 large table using rbind. The non-relevant columns (those that don't have "mean" or "std" in the header) are filtered out using full_sort and grepl.

From there, the aggregate command actually gets the means values for each of 180 Subject/Activity combinations. 

Finally, write.table saves the last step out to a text file. 
