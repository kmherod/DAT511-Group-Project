# Merge Training and Test Data #

install.packages("tidyverse")
library(tidyverse)

setwd("C:/Users/kelse/OneDrive/Documents/DAT511/Group Project/DAT511-Group-Project/UCI HAR Dataset")



# Determine how .text files are structured (space separated)

sample <- read_delim("X_test.txt", delim = NULL, n_max = 10)
sample



# Read in files


subject_test  <- read_table("subject_test.txt", col_names = "subject_test")
subject_train <- read_table("subject_train.txt", col_names = "subject_train")


y_test  <- read_table("y_test.txt", col_names = "y_test")
y_train <- read_table("y_train.txt", col_names = "y_train")


X_test  <- read_table("X_test.txt", col_names = "x_test")
X_train <- read_table("X_train.txt", col_names = "x-train")





