# smartphone-data-analysis
Human Activity Recognition Using Smartphones

### Dataset

##http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Tasks


# Task 01:   Merges the training and the test sets to create one data set.

## Task 02: Extracts only the measurements on the mean and standard deviation for each measurement. 

# Task 03: Uses descriptive activity names to name the activities in the data set

# Task 04:  Appropriately labels the data set with descriptive variable names. 

# Task 05: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#####################################################################


####Task  01###

#Merges the training and the test sets to create one data set

#Step1

# Read train dataset and test dataset


#Step2

# Add Column Names



#Step 3

#Combine Training and Test Data

#Step 4  

# Verify the Merged Dataset

# View the structure of the merged data
str(merged_data)

# Check dimensions
dim(merged_data)

# Preview the data
head(merged_data)


######################################################


###Task  2 ##############

#Extracts only the measurements on the mean and standard deviation for each measurement.

#Step 1: Load the Data   i.e from merged_data
#Step 2: Identify Relevant Columns  that contain mean() or std() from features.txt file

# Step3: Load feature names


# Step 4: Identify columns with "mean()" or "std()"


#Step 5: Subset the Dataset

#Use the identified column indices to extract the relevant measurements from the dataset.



#Step 6: Verify the Subset

# View the structure of the new dataset
str(tidy_data)

# Preview the first few rows
head(tidy_data)



########################################################################


#Task 03  Uses descriptive activity names to name the activities in the data set


#Step 1: Load the Activity Labels



#Step 2: Merge Activity Labels with the Dataset


#Step 3: Remove the Numeric Activity Column




#Step 4: Verify the Result
# Preview the dataset
# Check the unique activity names




##########################################################################

#Task 4 Appropriately labels the data set with descriptive variable names. 


# Step 1: Load the Variable Names


# Step 2: Clean and make variable names descriptive

# Step 3: Assign Descriptive Variable Names




###########################################################################

#Task 5 From the data set in step 4, creates a second, independent tidy data set
#with the average of each variable for each activity and each subject.

# Step 1.  Install and Load dplyr Package



# Step 2. Group the Data by Subject and Activity, then Calculate the Mean




# Step 3  Save the Tidy Data to a File



