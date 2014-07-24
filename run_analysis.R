
##run_analysis.R by Juan Pardo

## It is suppossed the Samsung data is in your working directory
setwd("~/coursera/UCI HAR Dataset")

#reading of Activity and Features to label appropriately the data columns
activity<-read.table("./activity_labels.txt", header=FALSE)
features<-read.table("./features.txt", header=FALSE)


#Construction of the train data set
setwd("~/coursera/UCI HAR Dataset/train")

subject_train<-read.table("./subject_train.txt", header=FALSE)
colnames(subject_train)<-"Subjects"

y_train<-read.table("./Y_train.txt", header=FALSE)
y_train$V1 <- factor(y_train$V1, levels=activity$V1, labels=activity$V2)
colnames(y_train)<-"Activity"

x_train<-read.table("./X_train.txt", header=FALSE)
colnames(x_train)<-features$V2

data_train<-cbind(subject_train, y_train, x_train)

#Construction of the test data set (same steps)
setwd("~/coursera/UCI HAR Dataset/test")

subject_test<-read.table("./subject_test.txt", header=FALSE)
colnames(subject_test)<-"Subjects"

y_test<-read.table("./Y_test.txt", header=FALSE)
y_test$V1 <- factor(y_test$V1, levels=activity$V1, labels=activity$V2)
colnames(y_test)<-"Activity"

x_test<-read.table("./X_test.txt", header=FALSE)
colnames(x_test)<-features$V2

data_test<-cbind(subject_test, y_test, x_test)


#Merges the training and the test sets to create one data set
#Construction of the complete tidy data set for analysis
data_analysis<-rbind(data_train, data_test)

#Save in a txt file the Tidy Data Set
write.table(data_analysis, "~/coursera/UCI HAR Dataset/tidydataset.txt", sep = " ")


#Extracts only the measurements on the mean and standard deviation for each measurement
z<-grep("std",colnames(data_analysis))        #look for pattern "std" in colum names
c<-grep("mean",colnames(data_analysis))       #look for pattern "mean" in colum names
all<-c(c,z)

measurements<-data_analysis[,c(1, 2, all)]    #select only the columns of interest


## Creates a second, independent tidy data set with the average of each variable for each activity and each subject
library(plyr) #library necessary to use ddply

tidydataset2<-ddply(data_analysis, .(Activity, Subjects), .fun=function(x){ colMeans(x[,-c(1:2)])})





