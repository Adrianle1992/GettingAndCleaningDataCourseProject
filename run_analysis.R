## Loading necessary packages
library(data.table)
library(dplyr)

## Download and unzip data file:
URL <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
filename <-"GetData.zip"
if (!file.exists(filename)) {
  download.file(URL,filename,method="curl")
}
if (!file.exists("UCI HAR Dataset")) {
  unzip(filename)
}
## Read data into varibles
#Labels and features
activity_labels <-read.table(file.path(getwd(),"UCI HAR Dataset/activity_labels.txt"))
activity_labels <- sapply(activity_labels[,2],as.character)
features <-read.table(file.path(getwd(),"UCI HAR Dataset/features.txt"))
features <-sapply(features[ ,2],as.character)

# Training data
train_set<- read.table(file.path(getwd(),"UCI HAR Dataset/train/X_train.txt"))
train_label<- read.table(file.path(getwd(),"UCI HAR Dataset/train/y_train.txt"))
train_ID<- read.table(file.path(getwd(),"UCI HAR Dataset/train/subject_train.txt"))

# Test data
test_set<- read.table(file.path(getwd(),"UCI HAR Dataset/test/X_test.txt"))
test_label<- read.table(file.path(getwd(),"UCI HAR Dataset/test/y_test.txt"))
test_ID<- read.table(file.path(getwd(),"UCI HAR Dataset/test/subject_test.txt"))

##Step 1: Merges the training and the test sets to create one data set.
data_set <- rbind(train_set,test_set)
data_ID <- rbind(train_ID, test_ID)
data_label <- rbind(train_label, test_label)
data <- cbind (data_ID, data_label, data_set)

##Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
#Finding the mean and standard deviation in feature
colnames(data) <- c("ID", "activity",features)
features_extract <- grepl("mean|std",features, ignore.case=TRUE)
features_extract <- c(TRUE,TRUE,features_extract) #To include ID and activity columns
data<-data[features_extract]
#Exclude data including "angle")
data <- data[!grepl("^angle",colnames(data))]


##Step 3: Uses descriptive activity names to name the activities in the data set
data$activity<-factor(data$activity, levels=c(1:6),labels = activity_labels)

##Step 4: Appropriately labels the data set with descriptive variable names.
var_names <- names(data)
#removing special character
var_names <- gsub("[[:punct:]]","",var_names)
#removing abrreviation
var_names <- gsub("Freq","Frequency",var_names)
var_names <- gsub("^f","Frequencydomain",var_names)
var_names <- gsub("^t","Timedomain",var_names)
var_names <- gsub("tBody","TimedomainBody",var_names)
var_names <- gsub("std","Standarddeviation",var_names)
var_names <- gsub("Mag","Magnitude", var_names)
var_names <- gsub("Gyro","Gyroscope",var_names)
var_names <- gsub("Acc","Accelerometer",var_names)
#each description of variable is capitalised
var_names <- gsub("mean","Mean",var_names)
#removing redundancy
var_names <- gsub("BodyBody","Body",var_names)
names(data)<-var_names

##Step 5: Creates a second, independent tidy data set with the average of each 
##variable for each activity and each subject
tidy_data <- data %>%
  group_by(ID,activity)%>%
  summarise_all(funs(mean))

##Export tidy_data to a txt file
write.table(tidy_data,"tidy_data.txt",row.names=FALSE, quote=FALSE)
