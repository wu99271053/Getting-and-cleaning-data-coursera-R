# Getting-and-cleaning-data-coursera-R
This is the coursera getting and cleaning data final project. 30 volutneers were asked to perform 6 types of activities, and data was collected and stored in different documents. The R script was used to merge and label the data to make it more informative and tidy.

The dataset used for analysis is on https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The description of the dataset is available on http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The datasets were merged to give a new dataset with descriptive column names and extracted columns.

The datasets were reshaped used package reshape2 and dplyr


i got inner join help from this website: https://rpubs.com/williamsurles/293454

i got duplicated error solution from this answer on stackoverflow https://stackoverflow.com/questions/28549045/dplyr-select-error-found-duplicated-column-name

i got pattern length>1 error solution from this answer on stackoverflow https://stackoverflow.com/questions/44137635/argument-pattern-has-length-1-and-only-the-first-element-will-be-used-gsub
