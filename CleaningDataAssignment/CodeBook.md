# Code Book

## mergedAveragedDataset (tidy dataset)
Only Column names containing mean() and std() were extracted based on the definition in the feature_info file

The dataset contains the following variables in this order

* subject: subject id (30 different numbered subjects)
* activity: activity performed (descriptive string)
	six different activities: 
		1 WALKING
		2 WALKING_UPSTAIRS
		3 WALKING_DOWNSTAIRS
		4 SITTING
		5 STANDING
		6 LAYING
 )
* average of the mean values of the following variables listed in the feature_info file:
	* tBodyAcc-XYZ 		(3 Variables, X, Y and Z)   
	* tGravityAcc-XYZ	(3 Variables, X, Y and Z)  
	* tBodyAccJerk-XYZ	(3 Variables, X, Y and Z)  
	* tBodyGyro-XYZ		(3 Variables, X, Y and Z)  
	* tBodyGyroJerk-XYZ	(3 Variables, X, Y and Z)  
	* tBodyAccMag
	* tGravityAccMag
	* tBodyAccJerkMag
	* tBodyGyroMag
	* tBodyGyroJerkMag
	* fBodyAcc-XYZ		(3 Variables, X, Y and Z)  
	* fBodyAccJerk-XYZ	(3 Variables, X, Y and Z)  
	* fBodyGyro-XYZ		(3 Variables, X, Y and Z)  
	* fBodyAccMag
	* fBodyAccJerkMag
	* fBodyGyroMag
	* fBodyGyroJerkMag
	
	Explanation to the Variable names:
	t: time domain signals (captured at a rate of 50Hz)
	f: Fast Fourier Transform applied to the time domain signals
	GravityAcc: Gravity acceleration signals from the accelerometer
	BodyAcc: Body acceleration signals from the accelerometer
	BodyGyro: Measurements from the gyroscope
	Jerk: Jerk signals
	Mag: Magnitude of the three dimensional signals calculated using the Euclidean norm
	XYZ: Dimension of the respective measurement or variable
	
* standard deviation values of the variables listed under the third point

The dataset has in total 180 rows and 68 columns

It is ordered according to the values of the first two columns(subject id and activity) in ascending order

It is necessary to read the dataset with the following command:
read.table("mergedAveragedDataset.txt",header=TRUE) 
This way the column names are automatically set
