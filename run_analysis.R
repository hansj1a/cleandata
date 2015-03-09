# set working directory
setwd("C:/Users/hobramsk/weiterbildung/Getting and cleaning data/course project")

# read in the needed files
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")
features<-read.table("features.txt")
activities <- read.table("activity_labels.txt")

# Get an overview about the data structure
str(x_train)  #'data.frame':        7352 obs. of  561 variables:
str(y_train)  #'data.frame':        7352 obs. of  1 variable:
str(subject_train) #'data.frame':        7352 obs. of  1 variable:
str(x_test)  #'data.frame':        2947 obs. of  561 variables:
str(y_test)  #'data.frame':        2947 obs. of  1 variable:
str(subject_test) #'data.frame':        2947 obs. of  1 variable:
str(features)
str(activities)
View(features)

# merge the corresponding training and test data
x_merged<-rbind(x_train,x_test)
y_merged<-rbind(y_train,y_test)
subject_merged<-rbind(subject_train,subject_test)

#extract only the relevant data, i.e. the data with the mean and the standard deviation
relFeatures<-grep("[m,M]ean|[s,S]td",features[,2])
x_merged<-x_merged[,relFeatures]

# set descriptive column names
names(x_merged)<-features[relFeatures,2]
y_merged[,1]<-activities[y_merged[,1],2]
names(y_merged)<-"Activity"
names(subject_merged)<-"Subject"

# Merge in one single data set of the movement
movement_merged<-cbind(x_merged,y_merged,subject_merged)

# Create second data set with the average of each variable for each activity and each subject
movement_merged2<-aggregate(.~Activity + Subject,movement_merged,mean)
movement_merged2<-movement_merged2[order(movement_merged2$Subject,movement_merged2$Activity),]

# write outputfile
write.table(movement_merged2, "averageMovements.txt", row.name=FALSE)
