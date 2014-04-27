#Warning:  In order to use this script.  The raw data must be downloaded from
#"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#the file must be unzipped, and the folder UCI HAR Dataset must be on your
#working directory.

# This script needs the packages "stringr" and "plyr" installed and loaded.

library(stringr)
library(plyr)

#Create a character vector with the variables names.

features <- read.table("UCI HAR Dataset/features.txt", quote="\"")

var_names <- as.character(features$V2)

#Load the train subjects id's

subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", quote="\"")

colnames(subject_train)[1] <- "subject"

#Load the train data and pass the names of variables, this may take a while, depending on the hardware.

X_train <- read.table("UCI HAR Dataset/train/X_train.txt", quote="\"", col.names=var_names)

#Create a data frame with only the variables which contains "mean"

X_train_mean <- X_train[, str_detect(colnames(X_train), "mean")]

#Get rid of the "non- X,Y,Z" variables.

xtrainmean<- subset(X_train_mean, select= -c(16:20,39:46))

#Create a data frame with only the variables which contains "std"

X_train_std <- X_train[, str_detect(colnames(X_train), "std")]

#Binding the "subject id", the "mean" and the "std" dataframes

train_final<- cbind(subject_train, xtrainmean, X_train_std)

#Load the test subjects id's

subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", quote="\"")

colnames(subject_test)[1] <- "subject"

#Load the test data and pass the names of variables, this may take a while, depending on the hardware.

X_test <- read.table("UCI HAR Dataset/test/X_test.txt", quote="\"", col.names=var_names)

#Create a data frame with only the variables which contains "mean"

X_test_mean <- X_test[, str_detect(colnames(X_test), "mean")]


#Create a data frame with only the variables which contains "std"

X_test_std <- X_test[, str_detect(colnames(X_test), "std")]

#Binding the "subject id", the "mean" and the "std" dataframes

test_final<- cbind(subject_test, X_test_mean, X_test_std)

#Merge and sort the final data sets using the "subject" common column

tidy1<-merge(train_final,test_final,by.x="subject", by.y="subject",all.x=T, all.y=T, sort=T)

#Calculate the mean of each variable grouping by subject.

tidy_final<-ddply(tidy1, .(subject), colwise(mean))
View(tidy_final)

#Save the final dataframe to a txt file.

write.table(tidy_final, file="tidy_final.txt")

#End of the script
