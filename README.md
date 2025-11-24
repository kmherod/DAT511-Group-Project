# DAT511-Group-Project
Data Cleaning and Tidy Data Preparation
---
title: "README"
author: "Chrinovic Mukulu, Kelsey Herod, Plu Reh"
date: "2025-11-23"
output: pdf_document
---

How to download and extract the dataset

Dataset: Human Activity Recognition Using Smartphones
Source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Download: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

1. Copy and paste the source link into your web browser to access the dataset. The link will lead you
directly to the UC Irvine Machine Learning Repository web page for the Human Activity Recognition database.

2. At the top of the page click the blue download button.

3. Find the downloaded dataset by going to where your downloads are usually stored.

4. Right click on the zipped file and select "Extract All..." to utilize its contents.


How to set the working directory

1. Move the unzipped file to your preferred location.

2. Once the file is where you would like it to be, open it. You should see two files named "test" and "train".

3. Right click on either one and in the pop-up menu select "Properties".

4. In the pop-up box find "Location" and copy the entire file path.

5. Open up your R Project script

6. Use command setwd() to set your working directory. The file path you copied must be in quotes and all back slashes must be change to forward slashes.

7. Run your script to set the directory

8. Define the path to the UCI HAR Dataset folder by assigning "UCI HAR Dataset" to an appropriately named variable.


What each section of the script accomplishes

- LIBRARIES - Includes the necessary packages and libraries needed for data cleaning and preparation.

- SET WORKING DIRECTORY - Sets the working directory so R knows where to read files from and where to save output in the same location.

- #1 MERGING TRAINING AND TEST DATA - Uploads relevant training and test datasets into R and combines them into one dataset.

- #2 EXTRACT RELEVANT MEASURES - Calculates the mean and standard deviations for each measurement.

- #3 DESCRIPTIVE ACTIVTY NAMES - Replaces an activity number with its associated activity name.

- #4 LABEL DATA WITH DESCRIPTIVE NAMES - Cleans up variable names so they are easier to read.

- #5 CREATE TIDY DATA - Calculates average of each variable for each activity and each subject.

- #6 SAVE THE TIDY DATA - Creates a text file for the tidy data dataset.


How to verify the results

- LIBRARIES - Run command packageVersion() with package name to verify it loaded correctly.

- SET WORKING DIRECTORY - Use command getwd() to confirm file path. Use command list.files() to verify folder contents.

- #1 MERGING TRAINING AND TEST DATA - Use colnames(your_data)[1:5] to see the first five column names. Use summary(your_data[, 1:3]) to summarize the first 3 columns.

- #2 EXTRACT RELEVANT MEASURES - 

- #3 DESCRIPTIVE ACTIVTY NAMES - 

- #4 LABEL DATA WITH DESCRIPTIVE NAMES - 

- #5 CREATE TIDY DATA - Use View(your_data) to verify grouping worked.

- #6 SAVE THE TIDY DATA - To verify the file was saved use list.files(pattern = "your_data.txt").









