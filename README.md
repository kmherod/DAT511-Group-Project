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

2. Once the file is where you would like it to be open it. You should see two files named "test" and "train".

3. Right click on either one and in the pop-up menu select "Properties"

4. In the pop-up box find "Location" and copy the entire file path.

5. Open up your R Project

6. use command setwd() to set your working directory. The file path you copied must be in quotes and all back slashes must be change to forward slashes.

7. Run your script to set the directory and use code getwd() to test if it worked.






