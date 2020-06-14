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
first and second variable for “Subject” and “Labels” Respectively.**

**OriginalTestNames** -&gt; Its a character vector containing the
variable names of the “test” data frame. this object has a lenght of
561.

**OriginalTrainNames** -&gt; Its a character vector containing the
variable names of the “train” data frame. this object has a lenght of
561.

**Note: After this step, i remplace the names of “RawTrainData” for the
names of “RawTestData”, for more information see the “README.md” file.**

**RawData** -&gt; Its a data frame resulting from a rbind from
“RawTestData” and “RawTrainData” in that respective order with a
dimensions of 10297 x 563.

**OrderedRawData** -&gt; Its a data frame resulting from the “arrange”
function from the “dplyr” library, ordering first the subject and then
the label from the “RawData” data frame with a dimensions of 10297 x
563.

**GroupData** -&gt; Its a data frame with class “tbl\_df” Here i group
the “OrderedRawData” first by Subject and then by Label so the desired
calculations are done by this groups. This data frame has dimensions of
10297 x 563.

**ResultData** Its the resulting data frame with class “tbl\_df” in this
data frame are done the mean and sd calculations using the
“summarize\_all” function of the “dplyr” library from the “GroupData”
data frame. This data frame has a dimension of 180 x 1124.

**Note: the dimension of “ResultData” data frame are:**

**180 rows: at the moment that we group our data frame to do the
calculations, the resulting data frame has 6 types of activities and 30
subjects then there will be 6x30=180 groups that are represeted by
rows.**

**1124 columns: at the moment that we group our data frame to do the
calculations, these calculations are two, the mean and the sd so for
every column has to do 2 calculations plus the subject and the label
variables so we will have 561x2 + 2 = 1124 columns.**

**the names of the columns are the same from the “GroupData” data frame
but now they have an indicative for the mean or sd calculation.**

**data** -&gt; Stores the data frame exported by the “write.table”
function using “ResultData” as data source.

And thats all. Hope you liked my work. Thanks :3
