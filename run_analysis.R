## Get the location of every file
GeneralFiles <- list.files("./UCI_HAR_Dataset", full.names = TRUE)
TestFiles <- list.files("./UCI_HAR_Dataset/test", full.names = TRUE)
TrainFiles <- list.files("./UCI_HAR_Dataset/train", full.names = TRUE)
## Read all relevant files from the test data files
test <- read.table("./UCI_HAR_Dataset/test/X_test.txt", header = TRUE)
testlabels <- read.table("./UCI_HAR_Dataset/test/y_test.txt", header = TRUE)
testsubject <- read.table("./UCI_HAR_Dataset/test/subject_test.txt", header = TRUE)
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
## Read all relevant files from the train data files
train <- read.table("./UCI_HAR_Dataset/train/X_train.txt", header = TRUE)
trainlabels <- read.table("./UCI_HAR_Dataset/train/y_train.txt", header = TRUE)
trainsubject <- read.table("./UCI_HAR_Dataset/train/subject_train.txt", header = TRUE)
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
##bind the subjects and labels with the test and train data
RawTestData <- cbind(testsubject, testlabels, test)
names(RawTestData)[1:2] <- c("Subject", "Labels")
RawTrainData <- cbind(trainsubject, trainlabels, train)
names(RawTrainData)[1:2] <- c("Subject", "Labels")
##Here I am assuming that the variables of the test and train data are the same, 
##which can be supported in the README file that says "The obtained dataset 
##has been randomly partitioned into two sets, where 70% of the volunteers
#was selected for generating the training data and 30% the test data"
#therefore although they have different names, they represent the same
OriginalTestNames <- names(test)
OriginalTrainNames <- names(train)
names(RawTrainData) <- names(RawTestData)
RawData<- rbind(RawTestData,RawTrainData)
##Order All the data
library(dplyr)
OrderedRawData <- arrange(RawData, Subject, Labels)
##Group all the data by subjects and Labels so we can do the mean and standard deviation in each group 
GroupData<- group_by(OrderedRawData, Subject, Labels)
ResultData <- summarize_all(GroupData, funs(mean, sd))
ResultData
data <- write.table(ResultData,file = "tidydata.txt")
