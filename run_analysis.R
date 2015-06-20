## Course Project - Getting and Cleaning Data
## Chand Sooran

## I downloaded the files using the following commands
## temp <- tempfile(tmpdir = "C://Chand Sooran/Johns Hopkins/Getting and Cleaning Data/Course Project/")
## download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", temp)

## I then figured out the name of the file using the list.file() command
## After which, I unzipped the file
## unzip("C://Chand Sooran/Johns Hopkins/Getting and Cleaning Data/Course Project/file56a04dca1c0b")

## I changed the directory to the now unzipped directory with the dataset
setwd("C://Chand Sooran/Johns Hopkins/Getting and Cleaning Data/Course Project/")
setwd("./UCI HAR Dataset")

## Download the individual tables
## List of labels for activities
activity_labels <- read.table("activity_labels.txt")

## Then in the sub-directory for the test data set
setwd("./test")

## The list of individuals in the test data set
subject_test <- read.table("subject_test.txt")

## The list of activities in the test data set
y_test <- read.table("y_test.txt")

## The readings for the 561 variables in the test data set
x_test <- read.table("X_test.txt")

## Similarly for the training data set
setwd("../train")
subject_train <- read.table("subject_train.txt")
y_train <- read.table("y_train.txt")
x_train <- read.table("X_train.txt")

## Move back to the Course Project directory
setwd("C://Chand Sooran/Johns Hopkins/Getting and Cleaning Data/Course Project/")

## Merge the training and test data sets
## Make a data frame for the test data that has the individuals, activities, and reported data
testData <- cbind(subject_test,y_test,x_test)

## Similarly for the training data
trainData <- cbind(subject_train, y_train, x_train)

## Create a new merged data frame called totalData
totalData <- rbind(testData,trainData)

## Extract only measurements of the mean and standard deviation for each measurement
## There are 17 variables, some of which have readings for each of the x, y, and z dimensions
## Mean and standard deviations are a subset of 66 of the 561 variables
## First, name the columns in totalData
names(totalData) <- c("id","activity",1:561)

## Setup a vector of the relevant 66 columns, in addition to columns for the id and activity
## I selected the variables listed in 'features' tht had either "mean()" or "std()" in the variable title
subsetTotalData <- c(1:8, 43:48, 83:88, 123:128, 163:168, 203:204, 216:217, 229:230, 242:243, 255:256,268:273, 347:352, 426:431, 505:506, 518:519, 531:532, 544:545)

## Use the select() function to select out these relevant columns
selectData <- select(totalData, subsetTotalData)

## Change the values for the activity variable to reflect the 6 possible activities descriptively
for(i in 1:numObs)
{
  if(selectData[i,2] == 1) selectData[i,2] <- "Walking" else
    if(selectData[i,2] == 2) selectData[i,2] <- "Walking_Upstairs" else
      if(selectData[i,2] == 3) selectData[i,2] <- "Walking_Downstairs" else
        if(selectData[i,2] == 4) selectData[i,2] <- "Sitting" else
          if(selectData[i,2] == 5) selectData[i,2] <- "Standing" else
            selectData[i,2] <- "Laying"
}

## Appropriately label the variables with descriptive names
nameTimeBodyAcc <- c("TimeBodyAccelMeanX", "TimeBodyAccelMeanY", "TimeBodyAccelMeanZ", "TimeBodyAccelSDX", "TimeBodyAccelSDY","TimeBodyAccelSDZ")
nameTimeGravityAcc <- c("TimeGravityAccelMeanX","TimeGravityAccelMeanY","TimeGravityAccelMeanZ","TimeGravityAccelSDX","TimeGravityAccelSDY","TimeGravityAccelSDZ")
nameTimeBodyAccJerk <- c("TimeBodyAccelJerkMeanX","TimeBodyAccelJerkMeanY","TimeBodyAccelJerkMeanZ","TimeBodyAccelJerkSDX","TimeBodyAccelJerkSDY","TimeBodyAccelJerkSDZ")
nameTimeBodyGyro <- c("TimeBodyGyroMeanX","TimeBodyGyroMeanY","TimeBodyGyroMeanZ","TimeBodyGyroSDX","TimeBodyGyroSDY","TimeBodyGyroSDZ")
nameTimeBodyGyroJerk <- c("TimeBodyGyroJerkMeanX", "TimeBodyGyroJerkMeanY","TimeBodyGyroJerkMeanZ","TimeBodyGyroJerkSDX","TimeBodyGyroJerkSDY","TimeBodyGyroJerkSDZ")
nameTimeBodyAccMag <- c("TimeBodyAccelMagMean","TimeBodyAccelMagSD")
nameTimeGravityAccMag <- c("TimeGravityAccelMagMean","TimeGravityAccelMagSD")
nameTimeBodyAccJerkMag <- c("TimeBodyAccelJerkMagMean","TimeBodyAccelJerkMagSD")
nameTimeBodyGyroMag <- c("TimeBodyGyroMagMean","TimeBodyGyroMagSD")
nameTimeBodyGyroJerkMag <- c("TimeBodyGyroJerkMagMean","TimeBodyGyroJerkMagSD")
nameFourierBodyAcc <- c("FourierBodyAccelMeanX","FourierBodyAccelMeanY","FourierBodyAccelMeanZ","FourierBodyAccelSDX","FourierBodyAccelSDY","FourierBodyAccelSDZ")
nameFourierBodyAccJerk <- c("FourierBodyAccelJerkMeanX", "FourierBodyAccelJerkMeanY","FourierBodyAccelJerkMeanZ","FourierBodyAccelJerkSDX","FourierBodyAccelJerkSDY","FourierBodyAccelJerkSDZ")
nameFourierBodyGyro <- c("FourierBodyGyroMeanX", "FourierBodyGyroMeanY","FourierBodyGyroMeanZ","FourierBodyGyroSDX","FourierBodyGyroSDY","FourierBodyGyroSDZ")
nameFourierBodyAccMag <- c("FourierBodyAccelMagMean","FourierBodyAccelMagSD")
nameFourierBodyBodyAccJerkMag <- c("FourierBodyBodyAccelJerkMean","FourierBodyBodyAccelJerkSD")
nameFourierBodyBodyGyroMag <- c("FourierBodyBodyGyroMagMean","FourierBodyBodyGyroMagSD")
nameFourierBodyBodyGyroJerkMag <- c("FourierBodyBodyGyroJerkMagMean","FourierBodyBodyGyroJerkMagSD")

## Join them all up
names(selectData) <- c("id", "activity", nameTimeBodyAcc, nameTimeGravityAcc, nameTimeBodyAccJerk,
                       nameTimeBodyGyro, nameTimeBodyGyroJerk, nameTimeBodyAccMag, 
                       nameTimeGravityAccMag, nameTimeBodyAccJerkMag,
                       nameTimeBodyGyroMag, nameTimeBodyGyroJerkMag, nameFourierBodyAcc,
                       nameFourierBodyAccJerk, nameFourierBodyGyro, nameFourierBodyAccMag,
                       nameFourierBodyBodyAccJerkMag, nameFourierBodyBodyGyroMag, 
                       nameFourierBodyBodyGyroJerkMag)

names(selectData)

## Create a second, independent data set from this selectData data set
## With the average of each variable for each activity and each subject

groupedSelectData <- aggregate(selectData[,-(1:2)], by = list(selectData$id, selectData$activity), FUN = mean)
write.table(groupedSelectData, file = "tidyData.txt", row.name = FALSE)



