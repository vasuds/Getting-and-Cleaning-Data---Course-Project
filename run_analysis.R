library(plyr)

#1.Merges the training and the test sets to create one data set.

Xtestdata <- read.table("/UCI HAR Dataset/test/X_test.txt")

Ytestdata <- read.table("/UCI HAR Dataset/test/Y_test.txt")

subjecttestdata <- read.table("/UCI HAR Dataset/test/subject_test.txt")


Xtraindata <- read.table('/UCI HAR Dataset/train/X_train.txt')

Ytraindata <- read.table('/UCI HAR Dataset/train/y_train.txt')

subjecttraindata <- read.table('/UCI HAR Dataset/train/subject_train.txt')

# create 'x' data set
xdata <- rbind(Xtraindata,Xtestdata)

# create 'y' data set
ydata <- rbind(Ytraindata,Ytestdata)

# create 'subject' data set
subjectdata <- rbind(subjecttraindata,subjecttestdata)

#2.Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table('/UCI HAR Dataset/features.txt')

#get only columns with mean() or std() in their names

mean_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
xdata <- xdata[,mean_std_features]

# correct the column names
names(xdata) <- features[mean_std_features, 2]

# 3.Use descriptive activity names to name the activities in the data set

activities <- read.table('/UCI HAR Dataset/activity_labels.txt')

# update values with correct activity names

ydata[,1] <- activities[ydata[,1],2]

# correct column name

names(ydata) <- "activity"


# 4.Appropriately label the data set with descriptive variable names

# correct column name
names(subjectdata) <- "subject"

# bind all the data in a single data set

xysdata <- cbind(xdata,ydata,subjectdata)

#5.Create a second, independent tidy data set with the average of each variable for each activity and each subject

# 66 <- 68 columns but last two (activity & subject)

avg_data <- ddply (xysdata, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(avg_data, "avg_data.txt", row.name=FALSE)