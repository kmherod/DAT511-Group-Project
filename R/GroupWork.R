# Libraries
library(stringr)
install.packages("dplyr")
library(dplyr)
### UCI HAR Dataset
# Set Working Directory
# Can change this to your own
setwd("/Users/payplu/Downloads")
#1 - Merging Training and Test Data

# set the path
path <- "UCI HAR Dataset"

# Log training & Testing Data
train_x <- read.table(file.path(path, "train", "X_train.txt")) # measurement
train_y <- read.table(file.path(path, "train", "y_train.txt")) # Activity
train_subject <- read.table(file.path(path, "train", "subject_train.txt")) # Subjects

test_x <- read.table(file.path(path, "test", "X_test.txt"))
test_y <- read.table(file.path(path, "test", "y_test.txt"))
test_subject <- read.table(file.path(path, "test", "subject_test.txt"))

# Read in features & activity labels
# Features + activity labels
features <- read.table(file.path(path, "features.txt"))
activity_labels <- read.table(file.path(path, "activity_labels.txt"))

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

#2
# Finding the mean and Std dev. (Use columns with mean & std) 
# (str_which will find the column with contained mean & std dev.)
measurements <- str_which(features$V2, "mean\\(\\)|std\\(\\)")

# First two columns of the measurements are subjects and activities 
cleaned_data <- merged_data[, c(1,2,measurements + 2)]

