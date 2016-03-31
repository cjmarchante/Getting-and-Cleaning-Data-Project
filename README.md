Getting and Cleaning Data Course Project
=

Objective
----

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 

**A)** a tidy data set as described below;

**B)** a link to a Github repository with your script for performing the analysis; and
 
**C)** a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called **CodeBook.md**. 

You should also include a **README.md** in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

Repo Content
-----------

`README.md`: this file

`CodeBook.md`: the code book for the resulting data set

`run_analysis.R`: The script to be run that perform all the steps to get the final data set.

`averagedataset.txt`: the resulting dataset


Requested tasks
-------
create one R script called run_analysis.R that does the following

1. Merges the training and the test sets to create one data set.2. Extracts only the measurements on the mean and standard deviation for eachmeasurement.3. Uses descriptive activity names to name the activities in the data set4. Appropriately labels the data set with descriptive variable names.5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

run_analysis.R
-----------------

This are the steps performed by the script:

***First block: Requested Tasks 1 and 2***

1. It sets the working dir -- change path by your working directory
2. It downloads the file from the web and unzips it.
3. It reads the **"x"** test and training datasets and merges them.
4. It carries out the same with the **subject** dataset.
5. It reads the features data set in order to filter the variables with mean and standard deviation.
6. It extracts from **"x"** only the columns with the mean(-mean) and standard deviation (-std).
7. It reads the **"Y"** test and training datasets and merges them.
8. It joins the 3 data sets **(subject ,X and Y)** getting a merged data set with only varaibles with the mean and standard deviation.

***Second block: Requested Task 4***

1. It proceeds to label the data set with descriptive variable names and removing symbols and caps. It changes the column names  to **subject**, the **selected variables**(from features dataset) and **activity**. Parenthesis and pipe symbols are removed from the names and lowercase the text.

***Third block: Requested Task 3***

1. It reads the activity_labels data set in order to replace their values by the names in the dataset.
2. It also removes underscore symbol and change to lowercase.

***Fourth block: Requested Task 5***

It creates a new data set aggregating the data by the activity and subject column and applying the mean function. So two new  columns (activities and subjects) are created.

Finally it writes the file with the final tidy dataset.


