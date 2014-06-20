CODEBOOK FOR THE SUMMARY DATA DERIVED FROM THE HARSD.

Notes: 
======
This file should be read in conjunction with:
1. The 'README.md' file and
2. The notes embedded within the associated R code file, 'run_analysis.R'


Background Information on the HARSD 
===========================================================
The HARSD was created as part of an experiment to study Human Activity Recognition using Smartphones. Signals were captured from inertial sensors (an accelerometer and a gyroscope) embedded in smartphones attached to the waists of the 30 different subjects.  The subjects performed six different activities, during which 6 different types of signals were captured from the smartphones. The six signals were for acceleration and angular velocity in each of three dimensions, "X', "Y" and "X".  The measurements were then augmented with filters and transformations to produce 33 signal measures.  For each of these measurements, 17 different variables were estimated, including the mean, the standard deviation, the minimum, the maximum, etc. The resulting combinations (33 measures times 17 variables = 561 attributes) are called 'features'.  


Variables Selected from the HARSD to Create the Summary Data 
===========================================================
The variables selected to create the summary data described in this codebook were the mean and the standard deviation for each of the signal measures. (Note that the MeanFreq variables were dropped from the data set because, strictly speaking, the course assignment calls for extracting the measurements on the mean for each measurement, not on the mean frequency). "Activity" and "subject" were added to these variables in order to summarize the data as averages for each activity and for each subject. The resulting summary dataset contains 68 variables - the mean and standard deviation for each of the 33 signal measures, plus the activity and subject variables. 


Transformations Performed on the HARSD Files
===========================================================
The HARSD is provided as a collection of data files, where each reading of the sensors gets a separate data record. In order to In order to obtain the desired data in the form of a tidy dataset (see the section below on "tidy"), I had to perform some transformations on the data. 

The HARSD is provided as a collection of data files, including raw data of the sensor readings as well as data related to the features.  The values for the 561 features are derived from the raw data. I did not use the raw data.  Instead, I started my analysis with the features data. 

MY TRANSFORMATIONS

I started with the features data.  First of all, the features data is divided into separate training and test sets comprising 70% and 30% of the data, respectively. The descriptive names for the 'features' in these datasets are provided in a separate file. I had to add these names to the data. 

Next, the subject identifiers and activity codes corresponding to each of the records in the training and test sets are provided in separate files. I appended the subject identifiers and activity codes to both the training and test sets. In the case of the activity codes, I added descriptive activity names as labels to the codes. Finally, I merged the extended training and test sets to create a single table. 

To arrive at the summary dataset from the merged dataset, I selected the desired features and calculated the averages for each selected feature for each activity and each subject.  


What's "tidy" about the Summary Data (tidyData.txt) 
===========================================================
In an article titled "Tidy Data" in the Journal of Statistical Software (Vol. VV, Issue II), Hadley Wickham describes the structure of a tidy data set as one that meets the following criteria:
1. Each variable is a column
2. Each observation is a row
3. Each type of observational unit is a table

All of these criteria hold for the structure of the Summary Data.

1. Each variable is a Column
The 68 columns of the summary data are: 
2 grouping variables - "activity" and "customer", plus
33 signal measurements times
2 chosen variables estimated from these measurements
Note: The data isn't messy, e.g. column headers are variable names, not values

2. Each observation is a row
The 180 rows of the summary data are:
6 activities times
30 subjects
Note: The data isn't messy, e.g. no variables are stored in the rows

3. Each type of observational unit is a table
There is only one type of observational unit stored in the summary dataset.
All observations are of averages for the same variables for each activity and for each subject.


How to Read the 66 Measurement Variables/Features (including DATA DICTIONARY)
============================================================================
There are 66 measurement variables (called, 'features') in the Summary Data, 33 for means and 33 for standard deviations  Values shown for each are averages of the measurements.   

The variable names take on a consistent format.  REMEMBER:  All of the values provided for the variables are averages. For simplicity, I chose not to add the word "Mean" to the end of each variable description.

There are time domain and frequency domain measures, denoted by a first letter of 'f' or 't', respectively.

Whether the measure is one of the body or gravity is denoted accordingly, followed by whether the signal comes from the accelerometer ("ACC") or the gyroscope ("Gyro"). The former measures acceleration.  The latter measures angular velocity.  Some body measurements are so-called "Jerk"(acceleration of acceleration) measures and labelled as such.    

Finally, the measures are taken in three dimensions, labelled "-X", "-Y" or "-Z".  In some cases, the measurement is one of the magnitude of these 3-dimensional signals and labelled "Mag"

For example, the following variable

tGravityAcc-std()-X

Translates to following data dictionary description:

"Mean of the standard deviation of the time measurement for the acceleration in the X axis due to Gravity.""

As far as the units of measurement are concerned, the readings from the accelerometer were in standard gravity units, 'g'.  The readings from the gyroscope were in radians/second.  The features were then normalized and bounded within [-1,1].

For a Data Dictionary description of each variable in the summary data, see 'DATA DICTIONARY' section below.

DATA DICTIONARY

activity
  The activity in which the subject/volunteer was engaged. 
  
subject
  The identification number of the subject who performed the activity (1 through 30)
  
tBodyAcc-mean()-X
  Mean of the mean of the time measurement for the acceleration in the x axis of the body

tBodyAcc-mean()-Y
  Mean of the mean of the time measurement for the acceleration in the y axis of the body

tBodyAcc-mean()-Z
  Mean of the mean of the time measurement for the acceleration in the z axis of the body
  
tGravityAcc-mean()-X
  Mean of the mean of the time measurement for the acceleration in the x axis due to gravity

tGravityAcc-mean()-Y
  Mean of the mean of the time measurement for the acceleration in the y axis due to gravity

tGravityAcc-mean()-Z
  Mean of the mean of the time measurement for the acceleration in the z axis due to gravity
  
tBodyAccJerk-mean()-X
  Mean of the mean of the time measurement for the jerk acceleration in the x axis of the body
  
tBodyAccJerk-mean()-Y
 Mean of the mean of the time measurement for the jerk acceleration in the y axis of the body
 
tBodyAccJerk-mean()-Z
  Mean of the mean of the time measurement for the jerk acceleration in the z axis of the body
  
tBodyGyro-mean()-X
 Mean of the mean of the time measurement for the angular velocity in the x axis of the body

tBodyGyro-mean()-Y
  Mean of the mean of the time measurement for the angular velocity in the y axis of the body

tBodyGyro-mean()-Z
  Mean of the mean of the time measurement for the angular velocity in the z axis of the body

tBodyGyroJerk-mean()-X
  Mean of the mean of the time measurement for the jerk angular velocity in the x axis of the body

tBodyGyroJerk-mean()-Y
  Mean of the mean of the time measurement for the jerk angular velocity in the y axis of the body
  
tBodyGyroJerk-mean()-Z
   Mean of the mean of the time measurement for the jerk angular velocity in the z axis of the body
   
tBodyAccMag-mean()
  Mean of the mean of the time measurement for the magnitude of the acceleration in 3-dimensional space of the body
 
tGravityAccMag-mean()
 Mean of the mean of the time measurement for the magnitude of the acceleration in 3-dimensional space due to gravity
 
tBodyAccJerkMag-mean()
  Mean of the mean of the time measurement for the magnitude of the jerk acceleration in 3-dimensional space of the body
  
tBodyGyroMag-mean()
  Mean of the mean of the time measurement for the magnitude of the angular velocity in 3-dimensional space of the body
  
tBodyGyroJerkMag-mean()
  Mean of the mean of the time measurement for the magnitude of the jerk angular velocity in 3-dimensional space of the body

fBodyAcc-mean()-X
  Mean of the mean of the frequency measurement for the acceleration in the x axis of the body
  
fBodyAcc-mean()-Y
  Mean of the mean of the frequency measurement for the acceleration in the y axis of the body

fBodyAcc-mean()-Z
  Mean of the mean of the frequency measurement for the acceleration in the z axis of the body
  
fBodyAccJerk-mean()-X
  Mean of the mean of the frequency measurement for the jerk acceleration in the x axis of the body
  
fBodyAccJerk-mean()-Y
  Mean of the mean of the frequency measurement for the jerk acceleration in the Y axis of the body

fBodyAccJerk-mean()-Z
  Mean of the mean of the frequency measurement for the jerk acceleration in the z axis of the body

fBodyGyro-mean()-X
  Mean of the mean of the frequency measurement for the angular velocity in the x axis of the body
  
fBodyGyro-mean()-Y
  Mean of the mean of the frequency measurement for the angular velocity in the y axis of the body
  
fBodyGyro-mean()-Z
  Mean of the mean of the frequency measurement for the angular velocity in the z axis of the body
  
fBodyAccMag-mean()
  Mean of the mean of the frequency measurement for the magnitude of the acceleration in 3-dimensional space of the body
  
fBodyBodyAccJerkMag-mean()
 Mean of the mean of the frequency measurement for the magnitude of the jerk acceleration in 3-dimensional space of the body
 
fBodyBodyGyroMag-mean()
 Mean of the mean of the frequency measurement for the magnitude of the angular velociy in 3-dimensional space of the body

fBodyBodyGyroJerkMag-mean()
  Mean of the mean of the frequency measurement for the magnitude of the jerk angular velociy in 3-dimensional space of the body
  
tBodyAcc-std()-X
  Mean of the standard deviation of the time measurement for the acceleration in the x axis of the body

tBodyAcc-std()-Y
  Mean of the standard deviation of the time measurement for the acceleration in the y axis of the body

tBodyAcc-std()-Z
  Mean of the standard deviation of the time measurement for the acceleration in the z axis of the body
  
tGravityAcc-std()-X
  Mean of the standard deviation of the time measurement for the acceleration in the x axis due to gravity

tGravityAcc-std()-Y
  Mean of the standard deviation of the time measurement for the acceleration in the y axis due to gravity

tGravityAcc-std()-Z
  Mean of the standard deviation of the time measurement for the acceleration in the z axis due to gravity
  
tBodyAccJerk-std()-X
  Mean of the standard deviation of the time measurement for the jerk acceleration in the x axis of the body
  
tBodyAccJerk-std()-Y
 Mean of the standard deviation of the time measurement for the jerk acceleration in the y axis of the body
 
tBodyAccJerk-std()-Z
  Mean of the standard deviation of the time measurement for the jerk acceleration in the z axis of the body
  
tBodyGyro-std()-X
 Mean of the standard deviation of the time measurement for the angular velocity in the x axis of the body

tBodyGyro-std()-Y
  Mean of the standard deviation of the time measurement for the angular velocity in the y axis of the body

tBodyGyro-std()-Z
  Mean of the standard deviation of the time measurement for the angular velocity in the z axis of the body

tBodyGyroJerk-std()-X
  Mean of the standard deviation of the time measurement for the jerk angular velocity in the x axis of the body

tBodyGyroJerk-std()-Y
  Mean of the standard deviation of the time measurement for the jerk angular velocity in the y axis of the body
  
tBodyGyroJerk-std()-Z
   Mean of the standard deviation of the time measurement for the jerk angular velocity in the z axis of the body
   
tBodyAccMag-std()
  Mean of the standard deviation of the time measurement for the magnitude of the acceleration in 3-dimensional space of the body
 
tGravityAccMag-std()
 Mean of the standard deviation of the time measurement for the magnitude of the acceleration in 3-dimensional space due to gravity
 
tBodyAccJerkMag-std()
  Mean of the standard deviation of the time measurement for the magnitude of the jerk acceleration in 3-dimensional space of the body
  
tBodyGyroMag-std()
  Mean of the standard deviation of the time measurement for the magnitude of the angular velocity in 3-dimensional space of the body
  
tBodyGyroJerkMag-std()
  Mean of the standard deviation of the time measurement for the magnitude of the jerk angular velocity in 3-dimensional space of the body

fBodyAcc-std()-X
  Mean of the standard deviation of the frequency measurement for the acceleration in the x axis of the body
  
fBodyAcc-std()-Y
  Mean of the standard deviation of the frequency measurement for the acceleration in the y axis of the body

fBodyAcc-std()-Z
  Mean of the standard deviation of the frequency measurement for the acceleration in the z axis of the body
  
fBodyAccJerk-std()-X
  Mean of the standard deviation of the frequency measurement for the jerk acceleration in the x axis of the body
  
fBodyAccJerk-std()-Y
  Mean of the standard deviation of the frequency measurement for the jerk acceleration in the Y axis of the body

fBodyAccJerk-std()-Z
  Mean of the standard deviation of the frequency measurement for the jerk acceleration in the z axis of the body

fBodyGyro-std()-X
  Mean of the standard deviation of the frequency measurement for the angular velocity in the x axis of the body
  
fBodyGyro-std()-Y
  Mean of the standard deviation of the frequency measurement for the angular velocity in the y axis of the body
  
fBodyGyro-std()-Z
  Mean of the standard deviation of the frequency measurement for the angular velocity in the z axis of the body
  
fBodyAccMag-std()
  Mean of the standard deviation of the frequency measurement for the magnitude of the acceleration in 3-dimensional space of the body
  
fBodyBodyAccJerkMag-std()
 Mean of the standard deviation of the frequency measurement for the magnitude of the jerk acceleration in 3-dimensional space of the body
 
fBodyBodyGyroMag-std()
 Mean of the standard deviation of the frequency measurement for the magnitude of the angular velociy in 3-dimensional space of the body

fBodyBodyGyroJerkMag-std()
  Mean of the standard deviation of the frequency measurement for the magnitude of the jerk angular velociy in 3-dimensional space of the body

