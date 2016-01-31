Xtrain <- read.table("train/X_train.txt")
Ytrain <- read.table("train/y_train.txt")
MainTrain <- read.table("train/subject_train.txt") 
XTest <- read.table("test/X_test.txt")
YTest <- read.table("test/y_test.txt") 
MainTest <- read.table("test/subject_test.txt") ##In the first step the two data sets, i.e., test and training data sets are read into the R environment.
XData <- rbind(Xtrain, XTest)
YData <- rbind(Ytrain, YTest)
MainData <- rbind(MainTrain, MainTest) ## In this step the X and Y data sets are formed by merging of the test and train data sets, along with the subject data sets.
Features <- read.table("features.txt") 
MeanAndStdFeatures <- grep("-(mean|std)\\(\\)", Features[, 2]) ##In this step, we read the features dataset, and we obtain relevant data from the mean and standard deviation columns, using their respective functions.
SubsetXData <- XData[, MeanAndStdFeatures]  ##In this step, we subset the desired data.
names(SubsetXData) <- Features[MeanAndStdFeatures, 2] ##This step is important to remove any errors or discrepancies from the column names.
activities <- read.table("activity_labels.txt") ##Reading of the activity tables done in this step.
YData[, 1] <- activities[YData[, 1], 2] ##The subsetting function is performed again.
names(YData) <- "activity" ##Column names corrected in this step.
names(MainData) <- "subject" ##Labelling of descriptive variables is to be done in an appropriate manner.
EntireData <- cbind(SubsetXData, YData, MainData) 
MeanData <- ddply(EntireData, .(subject, activity), function(x) colMeans(x[, 1:66])) 
write.table(MeanData, "averages_data.txt", row.name=FALSE)
