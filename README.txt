This is the description of Getting and Cleaning Data Course Project

The repository contains:
1. CodeBook.md file, describing the initial requirements for smoothly running the program, variables and data
2. Run_Analysis.R script

The project is based on the dataset from a project Human Activity Recognition Using Smartphones Dataset, and the link to the dataset we are using is:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

We were required to write a script which:
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names. 
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each     activity and each subject.
  
The original data needs to be downloaded and unzipped into the working directory. Plyr package needs to be loaded.

2. Run_Analysis.R, R script required in the description of the project does:

Step 1. The data is merged using the rbind() function. This is done according to the dataset decription from the README.txt file accompaning the dataset. Files with the same dimentions and also names (differing by test/train description) are assumed to refer to the relevant datasets which can be merged. 

Step 2. Columns with the mean and standard deviation measures are selected from the merged dataset. 
First a vector is created from the features file, with rows numbers, of those rows, which contain std or mean.
This vector is used to subset the merged data (all_data).
This vector is then used to extract the features names from the features files and then to correct the column names in the merged data (all_data file).

Step 3. Activity data has assigned values 1:6, the activity names and corresponding IDs are taken from activity_labels.txt (activities) and substituted in the merged labels.

Step 4. On the merged dataset, the column name for subject is corrected and the measurements data is merged with subjects and activity. The first 66 columns contain activity measurements that range from -1 to 1, the "subjects" column contains integers that range from 1 to 30 inclusive; the "activity" column contains 6 kinds of activity names.

Step 5. Generation of a new dataset (mean.txt) with all the average measures for each measurement mean and std based on subject and activity type. There are 30 unique subjects and 6 unique activities, which result in a 180 combinations of the two. For each combination, we calculate the mean of each measurement with the corresponding combination and we get a 180x68 data frame.


Make sure the Run_analysis.R script and the data are in the current working directory.
Use source("Run_analysis.R") to run the script in RStudio.

The two output files are generated in the current working directory:
final_data: containing the columns of means and std of the various measurements, with corresponding subjects and activities, dim(10299x68)
mean_data: file with mean values of all the columns from the final_data file, the average of each variable for each activity and each subject, 6 activities in total and 30 subjects in total, gives 180 rows with all combinations for each of the 66 features: dim(180x68)
The mean_data is exported as txt file - exported_data, you can inspect it by downloading it back to R
