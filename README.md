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
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones (source)
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip (download)

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

6. Use command setwd() to set your working directory. The file path you copied must be in quotes and all back slashes must be changed to forward slashes.

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

- #1 MERGING TRAINING AND TEST DATA -  To verify that data sets merged correclty use colnames(your_data)[1:5] to see the first five column names and
      summary(your_data[, 1:3]) to summarize the first 3 columns.

- #2 EXTRACT RELEVANT MEASURES - Use View(your_data) to verify applied calculations.

- #3 DESCRIPTIVE ACTIVTY NAMES - To verify activity numbers were replacec by activity labels use unique(your_data$activity) to list dataset activity names.

- #4 LABEL DATA WITH DESCRIPTIVE NAMES - To verify that the variables names were cleaned up use colnames(your_data)[1:5] to see the first five column names.

- #5 CREATE TIDY DATA - Use View(your_data) to verify grouping worked.

- #6 SAVE THE TIDY DATA - To verify the file was saved use list.files(pattern = "your_data.txt").


Reflection Questions

1. Why did we merge the training and test datasets? What was their original
    purpose, and why don't we need them separated for this project?

   The training set is used to train and build predictive models. The test set is used to determine how well the predictive model performs.
   The purpose of this project is to clean and organize data not build predicitive models so that is why the datasets were merged.

2. How many observations did each subject contribute to the study?
   (HINT: Use table(data_combined$subject) to find out)


3. Why did we select only mean() and std() features? What do these 
    statistics tell us about the data?

   It's a large and complex dataset so simpler but informative calculations are better to work with. Standard deviation tells us how spread out the data is
   and the mean provides the central tendency of the data.

 4. What does it mean for data to be "tidy"? How does our final tidy_data
   dataset follow tidy data principles?

Tidy data is structured so the layout reflects the meaning of the data, with each variable in its own column and each observation in its own row.

 5. What is the interpretation of one row in the tidy_data dataset?
   What does a single value in one of the measurement columns represent?

 One row is a single observation. And a column represents a single measurement to that observation.









