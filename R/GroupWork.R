##############################
# DAT 511 – Group Project - UCI HAR Dataset
# Data Cleaning and Tidy Data Preparation Script
##############################

# LIBRARIES
library(stringr)
install.packages("dplyr")
library(dplyr)

# SET WORKING DIRECTORY
# setwd("/Users/payplu/Downloads")
# setwd("C:/Users/kelse/OneDrive/Documents/DAT511/R/UCI HAR Dataset/UCI HAR Dataset")

# SET THE PATH
# path <- "UCI HAR Dataset"


#1 MERGING TRAINING AND TEST DATA

# Training data
train_x       <- read.table("train/X_train.txt")        # measurements
train_y       <- read.table("train/y_train.txt")        # activity labels (1-6)
train_subject <- read.table("train/subject_train.txt")  # subject IDs

# Test data
test_x       <- read.table("test/X_test.txt")
test_y       <- read.table("test/y_test.txt")
test_subject <- read.table("test/subject_test.txt")

# Features and Activity Labels
features        <- read.table("features.txt")          # variable names
activity_labels <- read.table("activity_labels.txt")   # actiivty names

# Combine Rows
X_rows <- rbind(train_x, test_x) # use rbind for combining rows
Y_rows <- rbind(train_y, test_y)
subjects <- rbind(train_subject, test_subject)

# Create Column Names
colnames(X_rows) <- features$V2 # select the second column - vector
colnames(Y_rows) <- "Activities"
colnames(subjects) <- "Subjects"

# Combine Dataset
merged_data <- cbind(subjects, Y_rows, X_rows)


# 2 EXTRACT RELEVANT MEASURES

# Finding the mean and Std dev. (Use columns with mean & std) 
# (str_which will find the column with contained mean & std dev.)
measurements <- str_which(features$V2, "mean\\(\\)|std\\(\\)")

# First two columns of the measurements are subjects and activities 
cleaned_data <- merged_data[, c(1,2,measurements + 2)]


# 3 DESCRIPTIVE ACTIVITY NAMES

# Rename columns of activity_labels data
colnames(activity_labels) <- c("Activities", "ActivityLabel")

# Merge data sets by referencing shared Activities column
cleaned_data <- merge(cleaned_data, activity_labels, by = "Activities", all.x = TRUE)

# Replace activity number with associated activity name
cleaned_data$Activities    <- cleaned_data$ActivityLabel
cleaned_data$ActivityLabel <- NULL

# Reorder Subjects and Activities columns
col_order <- c("Subjects","Activities", setdiff(names(cleaned_data), c("Subjects", "Activities")))

cleaned_data <- cleaned_data[, col_order]


# 4 LABEL DATA WITH DESCRIPTIVE NAMES

# Replace t with Time and f with Frequency
names(cleaned_data) <- gsub("^t", "Time",      names(cleaned_data))
names(cleaned_data) <- gsub("^f", "Frequency", names(cleaned_data))

# Transform abbreviated to full names for measurement types
names(cleaned_data) <- gsub("Acc",  "Acceleration", names(cleaned_data))
names(cleaned_data) <- gsub("Gyro", "Gyroscope",    names(cleaned_data))
names(cleaned_data) <- gsub("Mag",  "Magnitude",    names(cleaned_data))
names(cleaned_data) <- gsub("BodyBody", "Body",     names(cleaned_data))

# Remove extra symbols and capitalize mean and std
names(cleaned_data) <- gsub("-mean\\(\\)", "Mean", names(cleaned_data))
names(cleaned_data) <- gsub("-std\\(\\)",  "STD",  names(cleaned_data))
names(cleaned_data) <- gsub("[()\\-]", "", names(cleaned_data))


# 5 CREATE TIDY DATA

# Use the cleaned_data data frame to create Tidy Data
# Get average of each variable for each activity and each subject.
# Use group_by to group the data by each subject and activity combination

tidy_data <- cleaned_data %>%
  group_by(Subjects, Activities) %>%
  summarize(
    across(everything(), mean),
    .groups = "drop"
  )


# 6 SAVE THE TIDY DATA

write.table(tidy_data, "tidy_data.txt", row.names = FALSE)

list.files(pattern = "tidy_data.txt")
