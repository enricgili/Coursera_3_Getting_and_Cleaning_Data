#setwd("Documents/datasciencecoursera/Coursera_3_Getting_and_Cleaning_Data/Course_project")

#Load all text files into data frames
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt") 
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")

features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement.

# selects only the columns that have "mean()" or "std()" in their measurement name
variablesMeanStd <- features[c(grep("mean\\()",features$V2),grep("std\\()",features$V2)),]

# create TEST subset with mean and standard measurements
subdata_test <- X_test[variablesMeanStd[,1]]
# give right measurement names to columns
colnames(subdata_test) <- variablesMeanStd[,2]
# assemble test dataset by binding subject, activity and test data
testData <- cbind(subject_test,y_test,subdata_test)

# create TRAIN subset with mean and standard measurements
subdata_train <- X_train[variablesMeanStd[,1]]
# give right measurement names to columns
colnames(subdata_train) <- variablesMeanStd[,2]
# assemble train dataset by binding subject, activity and test data
trainData <- cbind(subject_train,y_train,subdata_train)

#Combine test and train data sets
alldata <- rbind(testData,trainData)
#name 'subject' and 'activity' columns 
colnames(alldata)[1] <- "Subject"
colnames(alldata)[2] <- "Activity"


#Order data by subject and activity
alldata <- alldata[ order(alldata[,1],alldata[,2]),]
#remove row names added by order() function
rownames(alldata) <- NULL

#3. Uses descriptive activity names to name the activities in the data set

# convert Activity column values in to factor and use the labels from activity_labels
alldata$Activity <- factor(alldata$Activity,labels=activity_labels[,2])

#4. Appropriately labels the data set with descriptive variable names.

# rename abbreviations with full words
colnames(alldata) <- gsub("^t","Time",colnames(alldata))
colnames(alldata) <- gsub("Acc","Acceleration",colnames(alldata))
colnames(alldata) <- gsub("Gyro","Gyroscopic",colnames(alldata))
colnames(alldata) <- gsub("Mag","Magnitude",colnames(alldata))
colnames(alldata) <- gsub("^f","Frequency",colnames(alldata))


#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# create aggregate set based on activity and subject variable
tidySet <- aggregate(alldata, by=list(Activity = alldata[,2],Subject = alldata[,1]),FUN=mean)

# clean up data frame by removing duplicate and NA columns 
tidySet  <- subset(tidySet ,select = -c(3,4))

# Write txt file with data frame
write.table(tidySet ,file="tidydataset.txt",row.name=FALSE)