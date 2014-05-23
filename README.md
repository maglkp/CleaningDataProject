Analysis of the "Human Activity Recognition Using Smartphones Dataset experiment" 
as performed by www.smartlab.ws.
(see http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The purpose of the run_analysis.R script enclosed in this repository is the 
cleaning and preliminary analysis of the data set obtained in the experiment on wearable
computing equipment usage performed by Smart Lab company.

The script is comprised of the following steps:

1. Merge the training and the test sets to create one data set. 
This is performed by a union operation as the test and train data are in the same format.

2. Only the measurements on the mean and standard deviation for each measurement are retained.
Columns that contain other data are filtered out.

3. Activity name column (Walking, Standing, etc.) is added to the data set based on activity codes
from y_test.txt and y_train.txt files.

4. Another data set is created that contains the average of each variable for each activity and each subject
from the cleaned data set. Columns in this data set represent subjects and rows represent avarages of different observation types (tBodyAcc-mean()-X, etc.)

5. Input of the script is the data set provided in the "UCI HAR Dataset" directory.
The output of the script are the following files:

* uciHarData.csv
* uciHarSubjectMeans.csv 

The second one contains the average of each variable from the cleaned dataset 
for each activity and each subject (see CodeBook.md for details). 
