library(dplyr)
## Get the location of every file
GeneralFiles <- list.files("./UCI_HAR_Dataset", full.names = TRUE)
TestFiles <- list.files("./UCI_HAR_Dataset/test", full.names = TRUE)
TrainFiles <- list.files("./UCI_HAR_Dataset/train", full.names = TRUE)
## Read all relevant files from the test data files and rename with the real names the test data
features <- read.table("./UCI_HAR_Dataset/features.txt", header = FALSE, col.names = c("ActivityID", "Activity"))
test <- read.table("./UCI_HAR_Dataset/test/X_test.txt", header = TRUE)
testlabels <- read.table("./UCI_HAR_Dataset/test/y_test.txt", header = TRUE, col.names = c("Activity"))
testsubject <- read.table("./UCI_HAR_Dataset/test/subject_test.txt", header = TRUE, col.names = c("Subject"))
names(test) <- features$Activity
## Uses descriptive activity names to name the activities in the test labels data set using an "if" sintax
for (i in 1:nrow(testlabels)) {
        if (testlabels[i,1] == 1){
                testlabels[i,1] <- "WALKING"
        }else if (testlabels[i,1] == 2){
                testlabels[i,1] <- "WALKING_UPSTAIRS"
        }else if (testlabels[i,1] == 3){
                testlabels[i,1] <- "WALKING_DOWNSTAIRS"
        }else if (testlabels[i,1] == 4){
                testlabels[i,1] <- "SITTING"
        }else if (testlabels[i,1] == 5){
                testlabels[i,1] <- "STANDING"
        }else if(testlabels[i,1] == 6){
                testlabels[i,1] <- "LAYING" 
        }
}
## Read all relevant files from the train data files and rename with the real names the train data
train <- read.table("./UCI_HAR_Dataset/train/X_train.txt", header = TRUE)
trainlabels <- read.table("./UCI_HAR_Dataset/train/y_train.txt", header = TRUE, col.names = c("Activity"))
trainsubject <- read.table("./UCI_HAR_Dataset/train/subject_train.txt", header = TRUE, col.names = c("Subject"))
names(train) <- features$Activity
## Uses descriptive activity names to name the activities in the test labels data set using an "if" sintax
for (i in 1:nrow(trainlabels)) {
        if (trainlabels[i,1] == 1){
                trainlabels[i,1] <- "WALKING"
        }else if (trainlabels[i,1] == 2){
                trainlabels[i,1] <- "WALKING_UPSTAIRS"
        }else if (trainlabels[i,1] == 3){
                trainlabels[i,1] <- "WALKING_DOWNSTAIRS"
        }else if (trainlabels[i,1] == 4){
                trainlabels[i,1] <- "SITTING"
        }else if (trainlabels[i,1] == 5){
                trainlabels[i,1] <- "STANDING"
        }else if(trainlabels[i,1] == 6){
                trainlabels[i,1] <- "LAYING" 
        }
}
##bind the subjects and activities with the test and train data
RawTestData <- cbind(testsubject, testlabels, test)
RawTrainData <- cbind(trainsubject, trainlabels, train)
##bind the train and test data sets 
RawData<- rbind(RawTestData,RawTrainData)
RawDataSelected <- select(RawData, Subject, Activity, contains("mean"), contains("std"))
##Group al the data by their subject and activity so we can perform the mean and std calculation by these groups
GroupData<- group_by(RawDataSelected, Subject, Activity)
ResultData <- summarize_all(GroupData, funs(mean, sd))
tbl_df(ResultData)
data <- write.table(ResultData,file = "tidydata.txt",  row.name=FALSE)


