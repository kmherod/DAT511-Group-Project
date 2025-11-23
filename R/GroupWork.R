# Libraries
library(stringr)
install.packages("dplyr")
library(dplyr)
### UCI HAR Dataset
# Set Working Directory
# Can change this to your own
#setwd("/Users/payplu/Downloads")
#setwd("C:/Users/kelse/OneDrive/Documents/DAT511/R/UCI HAR Dataset/UCI HAR Dataset")



#1 Merging Training and Test Data

# set the path
#path <- "UCI HAR Dataset"

train_x       <- read.table("train/X_train.txt")        # measurements
train_y       <- read.table("train/y_train.txt")        # activity labels
train_subject <- read.table("train/subject_train.txt")  # subject IDs

# TEST
test_x       <- read.table("test/X_test.txt")
test_y       <- read.table("test/y_test.txt")
test_subject <- read.table("test/subject_test.txt")

# FEATURES & LABELS
features        <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")

# Combine the rows (use rbind for combining rows)
# Tried bind_rows w/ dplyr - not sure why it didn't work the same
X_rows <- rbind(train_x, test_x)
Y_rows <- rbind(train_y, test_y)
subjects <- rbind(train_subject, test_subject)

# Create Column names
colnames(X_rows) <- features$V2 # select the second column - vector
colnames(Y_rows) <- "Activities"
colnames(subjects) <- "Subjects"

# Merge the dataset into one
merged_data <- cbind(subjects, Y_rows, X_rows)

# 2 Extract Relevant Measurements
# Finding the mean and Std dev. (Use columns with mean & std) 
# (str_which will find the column with contained mean & std dev.)
measurements <- str_which(features$V2, "mean\\(\\)|std\\(\\)")

# First two columns of the measurements are subjects and activities 
cleaned_data <- merged_data[, c(1,2,measurements + 2)]


# 3 Descriptive Activity Names
# Create a vector in order of associated activity numbers
activity_names <- c(
  "WALKING",
  "WALKING_UPSTAIRS",
  "WALKING_DOWNSTAIRS",
  "SITTING",
  "STANDING",
  "LAYING"
)

#Replace activity number with associated activity name
cleaned_data$Activities <- activity_names[cleaned_data$Activities]


# 4 Label Data with Descriptive Names

# Replace t with Time and f with Frequency
names(cleaned_data) <- gsub("^t", "Time",      names(cleaned_data))
names(cleaned_data) <- gsub("^f", "Frequency", names(cleaned_data))

# Abbreviated to full names for measurement types
names(cleaned_data) <- gsub("Acc",  "Acceleration", names(cleaned_data))
names(cleaned_data) <- gsub("Gyro", "Gyroscope",    names(cleaned_data))
names(cleaned_data) <- gsub("Mag",  "Magnitude",    names(cleaned_data))
names(cleaned_data) <- gsub("BodyBody", "Body",     names(cleaned_data))

# Remove extra symbols
names(cleaned_data) <- gsub("-mean\\(\\)", "Mean", names(cleaned_data))
names(cleaned_data) <- gsub("-std\\(\\)",  "STD",  names(cleaned_data))
names(cleaned_data) <- gsub("[()\\-]", "", names(cleaned_data))
