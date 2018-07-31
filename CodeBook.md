# Getting and Cleaning Data Course Project

This code book is created in order to describe the processing steps followed in order to create a tidy data set from the raw data set collected for the purpose of developing wearable technology. The following files are included in this repository:

	- `README.md`: a markdown file describing the analysis
	- `tidy_data.txt`: resulting data set in .txt file format
	- `run_analysis.R`: the script used for the analysis
	- `CodeBook.md`: a markdown file describing the tidy data set

In the [Processing Step](#processing step) section, the transformation of the raw data into the tidy data set is described. In the [Name of Variables](#name of variables) section, the meaning of the variable is described and summarized. The variables are listed in the [List of Variables](#transformations).

## Processing Step <a name="processing step"></a>

1. The raw data is downloaded and unzipped from the URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.  
1. The training set, test set, features and activity labels are loaded into the working variables. Training set and test set each contains the set of data collected, the idenfication list of subjects corresponding to the data set, and the activity label corresponding the data set. These three components are joined together into a table with column names set using the elements in the features.txt file. 
1. The training set and test set are merged together into a master data set.
1. The variables describing means and standard deviations are extracted from the data set by finding "mean" and "std" strings in the column names.
1. The variables with names starting with "angle" are removed from the dataset.
1. The "activity" column is changed from numeric indicator to string description using the activity labels.
1. The variable names are cleaned up using the following rules: 
    - All special characters are removed ("-","(",")",and ",").
     - All abbreviation is changed into descriptive names.
    - Typos removed ("BodyBody" is assumed to be an incorrect description of "Body")
1. The master data set is grouped according to subject identification (ID) and activity idenfitification (activity). The mean of the all variables in each group is calculated and reported into a tidy data set. 
1. The tidy data set is written into the tidy_data.txt file.

## Name of Variables <a name="name of variables"></a>

Each observation, containing 79 signals, is indentified using the subject identification (ID) and activity label (activity). 

### Observation Idenfication <a name="observation idenfication"></a>

- `ID`

  A numeric idenfication, ranging 1 to 30, assigned to each subject in the experiments.

- `activity`

	The activity labels include: 
	  - WALKING
	  - WALKING_UPSTAIRS
	  - WALKING_DOWNSTAIRS
	  - SITTING
	  - STANDING
	  - LAYING

### Signal variables  <a name="signal variables"></a>

All measurements are normalised to the range of [-1, 1] and multiple readings are averaged out in the tidy data set. The names of the variables are descriptive and self-explanatory. The meaning of the key words are listed below:

    - Domain of measurements: "Timedomain" vs. "Frequencydomain"
    - Object of measurements: "Gravity" vs. "Body"
    - Mean of measurements: "Gyroscope" vs. "Accelerometer"
    - Duration of measurements: "Jerk" (instantaneous) vs "Mean" (time-averaged)
    - Property: "Frequency" vs. "Magnitude"
    - Direction: "X","Y" vs. "Z"
    - Statistical property: "Mean" vs. "Standarddeviation"

### List of signals  <a name="list of signals"></a>

    - `TimedomainBodyAccelerometerMeanX`
    - `TimedomainBodyAccelerometerMeanY`
    - `TimedomainBodyAccelerometerMeanZ`
    - `TimedomainBodyAccelerometerStandarddeviationX`
    - `TimedomainBodyAccelerometerStandarddeviationY`
    - `TimedomainBodyAccelerometerStandarddeviationZ`
    - `TimedomainGravityAccelerometerMeanX`
    - `TimedomainGravityAccelerometerMeanY`
    - `TimedomainGravityAccelerometerMeanZ`
    - `TimedomainGravityAccelerometerStandarddeviationX`
    - `TimedomainGravityAccelerometerStandarddeviationY`
    - `TimedomainGravityAccelerometerStandarddeviationZ`
    - `TimedomainBodyAccelerometerJerkMeanX`
    - `TimedomainBodyAccelerometerJerkMeanY`
    - `TimedomainBodyAccelerometerJerkMeanZ`
    - `TimedomainBodyAccelerometerJerkStandarddeviationX`
    - `TimedomainBodyAccelerometerJerkStandarddeviationY`
    - `TimedomainBodyAccelerometerJerkStandarddeviationZ`
    - `TimedomainBodyGyroscopeMeanX`
    - `TimedomainBodyGyroscopeMeanY`
    - `TimedomainBodyGyroscopeMeanZ`
    - `TimedomainBodyGyroscopeStandarddeviationX`
    - `TimedomainBodyGyroscopeStandarddeviationY`
    - `TimedomainBodyGyroscopeStandarddeviationZ`
    - `TimedomainBodyGyroscopeJerkMeanX`
    - `TimedomainBodyGyroscopeJerkMeanY`
    - `TimedomainBodyGyroscopeJerkMeanZ`
    - `TimedomainBodyGyroscopeJerkStandarddeviationX`
    - `TimedomainBodyGyroscopeJerkStandarddeviationY`
    - `TimedomainBodyGyroscopeJerkStandarddeviationZ`
    - `TimedomainBodyAccelerometerMagnitudeMean`
    - `TimedomainBodyAccelerometerMagnitudeStandarddeviation`
    - `TimedomainGravityAccelerometerMagnitudeMean`
    - `TimedomainGravityAccelerometerMagnitudeStandarddeviation`
    - `TimedomainBodyAccelerometerJerkMagnitudeMean`
    - `TimedomainBodyAccelerometerJerkMagnitudeStandarddeviation`
    - `TimedomainBodyGyroscopeMagnitudeMean`
    - `TimedomainBodyGyroscopeMagnitudeStandarddeviation`
    - `TimedomainBodyGyroscopeJerkMagnitudeMean`
    - `TimedomainBodyGyroscopeJerkMagnitudeStandarddeviation`
    - `FrequencydomainBodyAccelerometerMeanX`
    - `FrequencydomainBodyAccelerometerMeanY`
    - `FrequencydomainBodyAccelerometerMeanZ`
    - `FrequencydomainBodyAccelerometerStandarddeviationX`
    - `FrequencydomainBodyAccelerometerStandarddeviationY`
    - `FrequencydomainBodyAccelerometerStandarddeviationZ`
    - `FrequencydomainBodyAccelerometerMeanFrequencyX`
    - `FrequencydomainBodyAccelerometerMeanFrequencyY`
    - `FrequencydomainBodyAccelerometerMeanFrequencyZ`
    - `FrequencydomainBodyAccelerometerJerkMeanX`
    - `FrequencydomainBodyAccelerometerJerkMeanY`
    - `FrequencydomainBodyAccelerometerJerkMeanZ`
    - `FrequencydomainBodyAccelerometerJerkStandarddeviationX`
    - `FrequencydomainBodyAccelerometerJerkStandarddeviationY`
    - `FrequencydomainBodyAccelerometerJerkStandarddeviationZ`
    - `FrequencydomainBodyAccelerometerJerkMeanFrequencyX`
    - `FrequencydomainBodyAccelerometerJerkMeanFrequencyY`
    - `FrequencydomainBodyAccelerometerJerkMeanFrequencyZ`
    - `FrequencydomainBodyGyroscopeMeanX`
    - `FrequencydomainBodyGyroscopeMeanY`
    - `FrequencydomainBodyGyroscopeMeanZ`
    - `FrequencydomainBodyGyroscopeStandarddeviationX`
    - `FrequencydomainBodyGyroscopeStandarddeviationY`
    - `FrequencydomainBodyGyroscopeStandarddeviationZ`
    - `FrequencydomainBodyGyroscopeMeanFrequencyX`
    - `FrequencydomainBodyGyroscopeMeanFrequencyY`
    - `FrequencydomainBodyGyroscopeMeanFrequencyZ`
    - `FrequencydomainBodyAccelerometerMagnitudeMean`
    - `FrequencydomainBodyAccelerometerMagnitudeStandarddeviation`
    - `FrequencydomainBodyAccelerometerMagnitudeMeanFrequency`
    - `FrequencydomainBodyAccelerometerJerkMagnitudeMean`
    - `FrequencydomainBodyAccelerometerJerkMagnitudeStandarddeviation`
    - `FrequencydomainBodyAccelerometerJerkMagnitudeMeanFrequency`
    - `FrequencydomainBodyGyroscopeMagnitudeMean`
    - `FrequencydomainBodyGyroscopeMagnitudeStandarddeviation`
    - `FrequencydomainBodyGyroscopeMagnitudeMeanFrequency`
    - `FrequencydomainBodyGyroscopeJerkMagnitudeMean`
    - `FrequencydomainBodyGyroscopeJerkMagnitudeStandarddeviation`
    - `FrequencydomainBodyGyroscopeJerkMagnitudeMeanFrequency`

## Acknowledgement <a name="acknowledgement"></a>
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.