# Introduction

The R script  "run_analysis.R" performs the getting and cleaning of movement data collected from the accelerometers from the Samsung Galaxy S smartphone.
The getting and cleaning of the data is done by the following steps:

* read in the needed data files
* merge the data sets
* extract only the relevant columns form the merged data set
* set descriptive activity names to the activiites of the data set
* label the the variables of the data set with descriptive names
* create a second data set containing the average of each variable for each activity and each subject


The following variables are used in the R script: 
* x_train ,  y_train , subject_train, x_test ,  y_test , subject_test, features, activities  containing the data from the downloaded files.
* x_merged ,  y_merged, subject_merged containing the merged data sets for x-,y- and subject data
* relFeatures containing the relevant features (i.e. mean and standard deviation) 
* movement_merged containing the data set with the x-,y- and subject data for the relevant features
* movement_merged2 containing the with the average of each variable for each activity and each subject. 
