# CourseProjectCleanData
# The Course Project for Getting and Cleaning Data - Chand Sooran

## I downloaded the files using the following commands
## temp <- tempfile(tmpdir = "C://Chand Sooran/Johns Hopkins/Getting and Cleaning Data/Course Project/")
## download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", temp)

## I then figured out the name of the file using the list.file() command
## After which, I unzipped the file
## unzip("C://Chand Sooran/Johns Hopkins/Getting and Cleaning Data/Course Project/file56a04dca1c0b")

## I changed the directory to the now unzipped directory with the dataset
## setwd("C://Chand Sooran/Johns Hopkins/Getting and Cleaning Data/Course Project/")
## setwd("./UCI HAR Dataset")

## Having unzipped the files, the code is straightforward and proceeds in a number of steps:
## 1. Store the three data frames for each of the test and training data sets
## 2. Join the three data frames for each of the test and training data sets
## 3. Bind the test and training data sets together using the rbind() function
## 4. Select a subset of the joined data set made up of the columns with either mean() or std() in their description in "features"
## 5. Set up a for loop to change the names of the activities from numbers to their descriptions in "activity_labels"
## 6. Rename the columns in the subset to correspond to their descriptions in "features"
## 7. Create a second, independent tidy data set from this subset to calculate the average for each variable and each activity
## 8. Write that second, independent tiday data set to a txt file called "tidyData.txt"


