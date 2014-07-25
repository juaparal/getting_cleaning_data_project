getting_cleaning_data_project
=============================

Files for getting and cleaning data project

run_analysis.R

README.md

CodeBook.md

tidydataset.txt 

Description of the run_analysis.R script

1. It is suppossed the Samsung data is in your working directory in my case ~/coursera/UCI HAR Dataset

2. It is read the activity_labels.txt to label the data of the activity column

3. It is read features.txt to label the columns name of the data coming from the sensors


4. Construction of the train data set

4.1 Read the subject_train.txt, Y_train.txt, X_train.txt

4.2 Label the appropiate column names

4.3 Construction of a data set of traning data


5. Construction of the test data set (same steps)

5.1 Read the subject_test.txt, Y_test.txt, X_test.txt

5.2 Label the appropiate column names

5.3 Construction of a data set of test data


6. Construction of the complete tidy data set for analysis. 

6.1 It is saved as a txt file. This is de tidy data set uploaded.


7. It is solved the question "Extracting only the measurements on the mean and standard deviation for each measurement"

7.1 I make a subset of the tidy data set choosing only the columns that have "std" or "mean" in the column name

7.2 A data set named as "measurements" is constructed


8.It is solved the question "Creates a second, independent tidy data set with the average of each variable for each activity and each subject"

8.1 It is used the library "plyr"

8.2 With the "ddply" instruction it is created the second tidy data set.


Thus all the exercises have been completed.



