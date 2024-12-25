

# Smartphone Data Analysis

This repository contains an analysis of the Smartphone data collected from sensors. 
The goal is to clean and process the data, and then generate a tidy data set with
 the average of each variable for each activity and each subject.

## How to Run the Script

1. Clone this repository to your local machine.
2. Place the Samsung dataset files (X_train.txt, X_test.txt, subject_train.txt, subject_test.txt, y_train.txt, y_test.txt, features.txt, and activity_labels.txt) in your working directory.
3. Run the `run_analysis.R` script in your R environment.
4. The script will output a file called `tidy_data.txt` in your working directory.


### Dataset

##http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Tasks


# Task 01:   Merges the training and the test sets to create one data set.

## Task 02: Extracts only the measurements on the mean and standard deviation for each measurement. 

# Task 03: Uses descriptive activity names to name the activities in the data set

# Task 04:  Appropriately labels the data set with descriptive variable names. 

# Task 05: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#####################################################################

## Output

The output will be a tidy data set saved as `tidy_data.txt`, containing the average of each variable for each activity and subject.

## Codebook

Please refer to the `CodeBook.md` file for descriptions of the variables and the dataset.

