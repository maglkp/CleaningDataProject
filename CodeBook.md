# Analysis of the "Human Activity Recognition Using Smartphones Dataset experiment" 
as performed by www.smartlab.ws.
(see http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

This file contains the description of the flow of the run_analysis.R script 
and its output data sets.

The flow of the script is as follows:

1. Observations from both original data sets are read to variables called "trainData" and "testData".
This is then union into the variable "uciHarData".

2. The "uciHarData" is then filtered retaining only columns containing either mean or standard deviation values.
This is done through helper variable "retainedColumns" which is a boolean vector containing TRUE if a column name
contains "std" or "mean" and FALSE otherwise.

3. Subjects for both data sets are read into "trainSubjects" and "testSubjects" variables and union into "subjects".
This is one dimentional numeric vector containing the participants numbers for a given observation.
The length of this vector is the same as the lenght of the combined data set i.e. 10299.

4. A second data set is created kept in the variable called "uciHarSubjectMeans". This contains 
a set with the average of each variable for each activity and each subject. 
Columns in this data set represent subjects and rows represent avarages of different observation types
(tBodyAcc-mean()-X, etc.)

5. Finally the cleaned "uciHarData" data set is extened with the activity name column. This is created based
on the literal vector "activityLabels" and the activity codes for both test and train data read from files into "trainTags" and "testTags" variables respectively.
