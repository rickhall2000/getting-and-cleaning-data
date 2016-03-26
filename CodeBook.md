
From the documenation for this data from the UCI Machine Learning Repository [Human Activity Recognitions](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw 
> signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured
> at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low 
> pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the 
> acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and 
> tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk 
> signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional 
> signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, 
> tBodyGyroMag, tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, 
> fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to 
> indicate frequency domain signals). 

> These signals were used to estimate variables of the feature vector for each pattern:  
> '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

> tBodyAcc-XYZ
> tGravityAcc-XYZ
> tBodyAccJerk-XYZ
> tBodyGyro-XYZ
> tBodyGyroJerk-XYZ
> tBodyAccMag
> tGravityAccMag
> tBodyAccJerkMag
> tBodyGyroMag
> tBodyGyroJerkMag
> fBodyAcc-XYZ
> fBodyAccJerk-XYZ
> fBodyGyro-XYZ
> fBodyAccMag
> fBodyAccJerkMag
> fBodyGyroMag
> fBodyGyroJerkMag

> Notes: 
> ======
> - Features are normalized and bounded within [-1,1].
> - Each feature vector is a row on the text file.


For each of these measurements, the mean and standard deviation was selected. 

In addition to the feature data each row contains columns:  
subject - An integer between 1 and 30 representing the test subject the row pertains to.
activity - The activity the subject was performing at the time, one of WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING


The summary dataset contains the mean value of each variable, gouped by activity and subject.


## Licence 
This Licence was in the original dataset

> License:
> ========
> Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

> [1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human 
> Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. 
> International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

> This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the 
> authors or their institutions for its use or misuse. Any commercial use is prohibited.

> Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
