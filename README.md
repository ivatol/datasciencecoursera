datasciencecoursera
===================

Repo for the project of Coursera Course "The Data Scientist’s Toolbox and Gather and Cleaning Data"

There is only one R script (run_analysis.R) in this moment.

In the script is the R code to perform the peer assesment project in the coursera course "Gather and Cleaning Data".

The script was made in R-Studio ver. 0.98.501 with R-Base ver. 3-0-3 "Warm Puppy".

To run this script successfully, you must download the raw data sets from this link:

"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

Please unzip this file in your R's working directory before run the script.


The script perform a series of actions in the raw data:

- Load the raw data sets.
- Name the variables.
- Choose only the variables of interest.
- Bind all the datasets into one.
- Calculate the mean of each variable for each subject.
- Write the final (tidy) data set in a txt file.


Thank you.
