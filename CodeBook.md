The script run_analysis.R performs the following 5 steps described in the course project's definition.

1.Merges the training and the test sets to create one data set.

2.Extracts only the measurements on the mean and standard deviation for each measurement.

3.Uses descriptive activity names to name the activities in the data set.

4.Appropriately labels the data set with descriptive variable names.
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

First, all the similar data is merged using the rbind() function. By similar, we address those files having the same number of columns and referring to the same entities.

Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from features.txt.

As activity data is addressed with values 1:6, we take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.

On the whole dataset, those columns with vague column names are corrected.

Finally, we generate a new dataset with all the average measures for each subject and activity type. The output file is called avg_data.txt, and uploaded to this repository.