Getting and Cleaning Data Course Project
----------------------------------------

In this Markdown document will explain all the variables and data
created in the script used to accomplish the Getting and Cleaning Data
Course Project. This code can be seen in the next repo URL in GitHub
<a href="https://github.com/Endless-Void/Getting-and-Cleaning-Data-Course-Project" class="uri">https://github.com/Endless-Void/Getting-and-Cleaning-Data-Course-Project</a>.

Variables and Data Sets
-----------------------

All the variables and data sets presented here, are in order of
appearence in the script:

**GeneralFiles** -&gt; Its a character vector that contains all the data
directories in the “UCI\_HAR\_Dataset”

**TestFiles** -&gt; Its a character vector that contains all the data
directories in the test folder.

**TrainFiles** -&gt; Its a character vector that contains all the data
directories in the train folder.

**features** -&gt; Its a data frame containning the variable names for
the test and train data.

**test** -&gt; Its a data frame containning the test data set with a
dimensions of 2946 x 561.

**testlabels** -&gt; Its a data frame containning the test labels or
activities with a dimensions of 2946 x 1.

**testsubject** -&gt; Its a data frame containning the test subjects
with a dimensions of 2946 x 1.

**train** -&gt; Its a data frame containning the train data set with a
dimensions of 7351 x 561.

**trainlabels** -&gt; Its a data frame containning the train labels or
activities with a dimensions of 7351 x 1.

**trainsubject** -&gt; Its a data frame containning the train subjects
with a dimensions of 7351 x 1.

**RawTestData** -&gt; Its a data frame resulting from a cbind from
“testsubject”, “testlabels” and “test” in that respective order with a
dimensions of 2946 x 563.

**RawTrainData** -&gt; Its a data frame resulting from a cbind from
“trainsubject”, “trainlabels” and “train” in that respective order with
a dimensions of 7351 x 563.

**Note: For RawTrainData and RawTestData, i change the names for the
first and second column for “Subject” and “Labels” Respectively.**

**RawData** -&gt; Its a data frame resulting from a rbind from
“RawTestData” and “RawTrainData” in that respective order with a
dimensions of 10297 x 563.

**RawDataSelected** -&gt; Its a data frame resulting from the “select”
function from the “dplyr” library, where we only wanna have the
“Subject”, “Activity” columns and columns that in their name have the
word “mean” and “std” this data frame with a dimensions of 10297 x 88.

**GroupData** -&gt; Its a data frame with class “tbl\_df” Here i group
the “OrderedRawData” first by Subject and then by Label so the desired
calculations are done by this groups. This data frame has dimensions of
10297 x 88.

**ResultData** Its the resulting data frame with class “tbl\_df” in this
data frame are done the mean and sd calculations using the
“summarize\_all” function of the “dplyr” library from the “GroupData”
data frame. This data frame has a dimension of 180 x 174.

**Note: the dimension of “ResultData” data frame are:**

**180 rows: at the moment that we group our data frame to do the
calculations, the resulting data frame has 6 types of activities and 30
subjects then there will be 6x30=180 groups that are represeted by
rows.**

**174 columns: at the moment that we group our data frame to do the
calculations, these calculations are two, the mean and the std so for
every column has to do 2 calculations plus the subject and the label
variables so we will have 88x2 + 2 = 174 columns.**

**the names of the columns are the same from the “GroupData” data frame
but now they have an indicative for the mean or std calculation.**

**data** -&gt; Stores the data frame exported by the “write.table”
function using “ResultData” as data source.

And thats all. Hope you liked my work. Thanks :3
