Getting and Cleaning Data Course Project
----------------------------------------

In this Markdown document Mwill explain all the process and script to
accomplish the Getting and Cleaning Data Course Project. This code can
be seen in the next repo URL in GitHub
<a href="https://github.com/Endless-Void/Getting-and-Cleaning-Data-Course-Project" class="uri">https://github.com/Endless-Void/Getting-and-Cleaning-Data-Course-Project</a>.

1. Data Folder
--------------

To avoid any error, I rename the Data folder from “UCI HAR Dataset” to
“UCI\_HAR\_Dataset” then we proceed to search the files direction so we
can’t make any mistake when we read the txt files.

    GeneralFiles <- list.files("./UCI_HAR_Dataset", full.names = TRUE)
    TestFiles <- list.files("./UCI_HAR_Dataset/test", full.names = TRUE)
    TrainFiles <- list.files("./UCI_HAR_Dataset/train", full.names = TRUE)

2. Reading Data
---------------

Then with the files location we proceed to read them and change the
names from the data variables, the test files:

    labels <- read.table("./UCI_HAR_Dataset/activity_labels.txt", header = FALSE, col.names = c("LabelsID", "Labels"))
    features <- read.table("./UCI_HAR_Dataset/features.txt", header = FALSE, col.names = c("ActivityID", "Activity"))
    test <- read.table("./UCI_HAR_Dataset/test/X_test.txt", header = TRUE)
    testlabels <- read.table("./UCI_HAR_Dataset/test/y_test.txt", header = TRUE, col.names = c("Activity"))
    testsubject <- read.table("./UCI_HAR_Dataset/test/subject_test.txt", header = TRUE, col.names = c("Subject"))
    names(test) <- features$Activity

and the train files:

    train <- read.table("./UCI_HAR_Dataset/train/X_train.txt", header = TRUE)
    trainlabels <- read.table("./UCI_HAR_Dataset/train/y_train.txt", header = TRUE, col.names = c("Activity"))
    trainsubject <- read.table("./UCI_HAR_Dataset/train/subject_train.txt", header = TRUE, col.names = c("Subject"))
    names(train) <- features$Activity

3. Changing the data labels
---------------------------

Next we change the values from the labels from 1 to 6, to the real
activity names, this for the train and test data:

    testlabels$Activity <- labels[testlabels$Activity,2]

and for the train data:

    trainlabels$Activity <- labels[trainlabels$Activity,2]

At this point we already read all the data we need so we begin to work
with these.

4. Making the data tidy
-----------------------

First, we have to bind the subject, the label and data for the train and
test data set. Also, we introduce the names “Subject” and “Labels” in
the respective variables:

    RawTestData <- cbind(testsubject, testlabels, test)
    RawTrainData <- cbind(trainsubject, trainlabels, train)

Binds the test and train data set, then we select the columns of
interest.

    ##RawData<- rbind(RawTestData,RawTrainData)
    ##RawDataSelected <- select(RawData, Subject, Activity, contains("mean"), contains("std"))

To make the desired calculations, we first group the data first by
subject and then by label or activity, then we can perform our
calculations with the `summarize_all` function, before this step we have
a **10297 x 88** but when we do the calculations we will have a **180 x
174** resulting data set, this is because the `summarize_all` function
have to do 2 calculations for the 88 variables in the input data set, so
the function will return a data set with (2 \* 88) + 2 = 174 variables,
the “+2” variables are the Subject and Label variables we merge from the
train and test data sets. Finally, we just print the resulting data set
and export it to a txt file

    ##GroupData<- group_by(RawDataSelected, Subject, Activity)
    ##ResultData <- summarize_all(GroupData, funs(mean, sd))
    ##tbl_df(ResultData)
    ##data <- write.table(ResultData,file = "tidydata.txt",  row.name=FALSE)

And thats all. Hope you liked my work. Thanks :3
