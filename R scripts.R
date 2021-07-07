install.packages("dplyr")
library(dplyr)
install.packages("reshape2")
library(reshape2)

# download files and unzip files 
if(!file.exists("data")){
  dir.create("data")
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",destfile="data/data.zip",method="curl")
}
unzip("./data/data.zip",exdir="./data")

# read test data
testlabel<-read.table("../data/UCI HAR Dataset/test/y_test.txt")
testdata<-read.table("../data/UCI HAR Dataset/test/x_test.txt")
testsubject<-read.table(("../data/UCI HAR Dataset/test/subject_test.txt"))

# read train data 
trainlabel<-read.table("../data/UCI HAR Dataset/train/y_train.txt")
traindata<-read.table("../data/UCI HAR Dataset/train/x_train.txt")
trainsubject<-read.table("../data/UCI HAR Dataset/train/subject_train.txt")

# combine test label and train label
alllabel<-rbind(testlabel,trainlabel)
colnames(alllabel)<-"labels"

# read avtivity label
activities<-read.table("../data/UCI HAR Dataset/activity_labels.txt")
colnames(activities)=c("labels","activities")

# join two dataset
label_activities<-inner_join(alllabel,activities,by="labels")

# combine test subject and train subject
allsubject<-rbind(testsubject,trainsubject)
colnames(allsubject)<-"subjects"

# combine all the information to give a dataset
alldata<-rbind(testdata,traindata)
featurename<-read.table("../data/UCI HAR Dataset/features.txt")[,2]
colnames(alldata)<-featurename
newdataset<-cbind(alldata,allsubject,label_activities)

# extract the columns with mean and standard deviation
mean_and_std_dataset<-select(newdataset,contains("mean")|contains("std"))

# substitute the column name with std(),mean(),mad() with descriptive name
# legnth>1 error happened when i use %>% operator which i dont know how to fix
ddataset<-gsub("std()","Standard deviation",newdataset)
ddataset1<-gsub("mean()","Mean value",ddataset)
ddataset2<-gsub("mad()","Median absolute deviation",ddataset1)

# reshape and write dataset to 
meltedData <- melt(newdataset, id = c("subjects", "activities"))
tidyData <- dcast(meltedData, subjects + activities ~ variable, mean)
write.table(tidyData, "tidy.txt", row.names = FALSE, quote = FALSE)

