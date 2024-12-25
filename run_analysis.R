
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

# Reading train dataset and test dataset
subject_train <- read.table("train/subject_train.txt")
X_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")

# Reading test data
subject_test <- read.table("test/subject_test.txt")
X_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")


#Step2

# Add Column Names

# Reading feature names
features <- read.table("features.txt")
colnames(X_train) <- features[, 2]
colnames(X_test) <- features[, 2]

# Assign column names to subject and activity data
colnames(subject_train) <- "Subject"
colnames(subject_test) <- "Subject"
colnames(y_train) <- "Activity"
colnames(y_test) <- "Activity"

#Step 3

#Combine Training and Test Data

# Combine subject, activity, and measurements for train and test datasets
train_data <- cbind(subject_train, y_train, X_train)
test_data <- cbind(subject_test, y_test, X_test)

# Merge the training and test datasets
merged_data <- rbind(train_data, test_data)


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

# Load feature names
features <- read.table("features.txt", col.names = c("Index", "FeatureName"))

# Identify columns with "mean()" or "std()"
mean_std_features <- grep("mean\\(\\)|std\\(\\)", features$FeatureName)

# Get the names of the selected columns
selected_feature_names <- features$FeatureName[mean_std_features]


#Step 3: Subset the Dataset

#Use the identified column indices to extract the relevant measurements from the dataset.

# Subset the merged dataset (including Subject and Activity columns)
selected_columns <- c("Subject", "Activity", selected_feature_names)
tidy_data <- merged_data[, selected_columns, drop = FALSE]

#Step 4: Verify the Subset

# View the structure of the new dataset
str(tidy_data)

# Preview the first few rows
head(tidy_data)



########################################################################


#Task 03  Uses descriptive activity names to name the activities in the data set


#Step 1: Load the Activity Labels

# Load activity labels
activity_labels <- read.table("activity_labels.txt", col.names = c("Activity", "ActivityName"))




#Step 2: Merge Activity Labels with the Dataset

# Merge the activity labels with the dataset
merged_data <- merge(merged_data, activity_labels, by = "Activity", all.x = TRUE)

#  Reorder the columns so that "ActivityName" appears earlier
merged_data <- merged_data[, c("Subject", "ActivityName", setdiff(names(merged_data), c("Subject", "ActivityName")))]



#Step 3: Remove the Numeric Activity Column

merged_data$Activity <- NULL


#Step 4: Verify the Result
# Preview the dataset
head(merged_data)

# Check the unique activity names
unique(merged_data$ActivityName)



##########################################################################

#Task 4 Appropriately labels the data set with descriptive variable names. 


# Step 1: Load the Variable Names
features <- read.table("features.txt", col.names = c("Index", "FeatureName"))
feature_names <- features$FeatureName

# Step 2: Clean and make variable names descriptive
feature_names <- gsub("^t", "Time", feature_names)
feature_names <- gsub("^f", "Frequency", feature_names)
feature_names <- gsub("Acc", "Accelerometer", feature_names)
feature_names <- gsub("Gyro", "Gyroscope", feature_names)
feature_names <- gsub("Mag", "Magnitude", feature_names)
feature_names <- gsub("BodyBody", "Body", feature_names)
feature_names <- gsub("-mean\\(\\)", "Mean", feature_names)
feature_names <- gsub("-std\\(\\)", "STD", feature_names)
feature_names <- gsub("[()-]", "", feature_names)

# Step 3: Assign Descriptive Variable Names
num_features <- ncol(merged_data) - 2  # Exclude Subject and Activity columns
feature_names <- feature_names[1:num_features]  # Subset feature names to match

# Assign column names
colnames(merged_data) <- c("Subject", "Activity", feature_names)



###########################################################################

#Task 5 From the data set in step 4, creates a second, independent tidy data set
#with the average of each variable for each activity and each subject.

# Step 1.  Install and Load dplyr Package

install.packages("dplyr")
library(dplyr)

# Step 2. Group the Data by Subject and Activity, then Calculate the Mean


# Assuming 'merged_data' has already been loaded and cleaned
tidy_data <- merged_data %>%
  group_by(Subject, Activity) %>%
  summarize(across(starts_with("Time") | starts_with("Frequency"), mean, na.rm = TRUE))

# View the resulting tidy data
head(tidy_data)


# Step 3  Save the Tidy Data to a File

write.csv(tidy_data, "tidy_data.csv", row.names = FALSE)






