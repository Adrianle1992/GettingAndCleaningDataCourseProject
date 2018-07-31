# Getting and Cleaning Data Course Project

This code book is created in order to describe the processing steps followed in order to create a tidy data set from the raw data set collected for the purpose of developing wearable technology. The following files are included in this repository:

	- `README.md`: a markdown file describing the analysis
	- `tidy_data.txt`: resulting data set in .txt file format
	- `run_analysis.R`: the script used for the analysis
	- `CodeBook.md`: a markdown file describing the tidy data set in details.
	
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained from [this website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#)

[Here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) are the data for the project.

The following processing requirements are specified:

1. Merges the training and the test sets to create one data set.
1. Extracts only the measurements on the mean and standard deviation for each measurement.
1. Uses descriptive activity names to name the activities in the data set
1. Appropriately labels the data set with descriptive variable names.
1. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

