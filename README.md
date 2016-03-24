# Project for Getting and Cleaning Data on Coursera

## Source Data
Data comes from the UCI Machine Learning Repository [Human Activity Recognitions](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Download the [full dataset here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).


## Description of script
The script run_analysis.R performs the following steps:
- Downloads the data set
- Loads and merges the subject data files 
- Loads and merges the feature data files
- Selects feature columns for means and standard deviation
- Loads activity data
- Replaces activity numbers with names
- Merges the subject, feature and activity data


## Licence 
This Licence was in the original dataset

```
License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
``