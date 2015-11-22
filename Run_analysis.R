# Step 1. Merge the training and the test sets to create one data set.

library(plyr)

x_train <- read.table("./X_train.txt")
y_train <- read.table("./y_train.txt")
subject_train <- read.table("./subject_train.txt")

x_test <- read.table("./X_test.txt")
y_test <- read.table("./y_test.txt")
subject_test <- read.table("./subject_test.txt")

# merge "data" data sets
all_data <- rbind(x_train, x_test)

# merge "labels" data sets
all_labels <- rbind(y_train, y_test)

# merge "subject" data sets
all_subjects <- rbind(subject_train, subject_test)

# Step 2. Extract only the measurements on the mean and standard deviation for each measurement

features <- read.table("features.txt")

# get only columns with have mean() or std() in their names
#MeanStdfeatures <- grep("-(mean|std)\\(\\)", features[, 2])
MeanStdfeatures <- grep("(mean|std)", features[, 2])

# subset the desired columns
all_data <- all_data[, MeanStdfeatures]


# change the column names
names(all_data) <- features[MeanStdfeatures, 2]

# Step 3. Use descriptive activity names to name the activities in the data set

activities <- read.table("activity_labels.txt")

# assign correct activity names
all_labels[, 1] <- activities[all_labels[, 1], 2]

# correct labels column name
names(all_labels) <- "activity"

# Step 4. Appropriately label the data set with descriptive variable names

# correct subjects column name
names(all_subjects) <- "subject"

# bind all the data in a single data set
final_data <- cbind(all_data, all_labels, all_subjects)


# Step 5.Create a second, independent tidy data set with the average of each variable
# for each activity and each subject

# this is done from the merged dataset, taking 79 columns because the last two are activity & subject
mean_data <- ddply(final_data, .(subject, activity), function(x) colMeans(x[, 1:79]))

#exporting the dataset as a txt file
exported_data <- write.table(mean_data, "exported_data.txt", sep="\t", row.names = FALSE)
