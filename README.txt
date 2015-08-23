This is the description of Getting and Cleaning Data Course Project

The project is based on the dataset from a project Human Activity Recognition Using Smartphones Dataset, and the link to the dataset we are using is:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
The data needs to be downloaded and unzipped into the working directory. 

The repository contains:
1. CodeBook.md file, describing the variables, data and manipulations
2. Run_Analysis.R, R script required in the description of the project which:
 
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names. 
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each     activity and each subject.

Make sure the Run_analysis.R script and the data are in the current working directory.
Use source("Run_analysis.R") to run the script in RStudio.

The two output files are generated in the current working directory:
final_data: containing the columns of means and std of the various measurements, with corresponding subjects and activities, dim(10299x68)
mean_data: file with mean values of all the columns from the final_data file, the average of each variable for each activity and each subject, 6 activities in total and 30 subjects in total, gives 180 rows with all combinations for each of the 66 features: dim(180x68).
