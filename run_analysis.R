# This is my R Script for the Coursera "Getting and Cleaning Data" Project

#Load the required data set files

features <- read.table("~/UCI HAR Dataset/features.txt", quote="\"")

X_train <- read.table("~/UCI HAR Dataset/train/X_train.txt", quote="\"")

X_test <- read.table("~/UCI HAR Dataset/test/X_test.txt", quote="\"")

y_train <- read.table("~/UCI HAR Dataset/train/y_train.txt", quote="\"")

y_test <- read.table("~/UCI HAR Dataset/test/y_test.txt", quote="\"")

subject_train <- read.table("~/UCI HAR Dataset/train/subject_train.txt", quote="\"")

subject_test <- read.table("~/UCI HAR Dataset/test/subject_test.txt", quote="\"")

activity_labels <- read.table("~/UCI HAR Dataset/activity_labels.txt", quote="\"")

#add names from features table to training and test data sets, separately.
names(X_train)<- features$V2
names(X_test)<- features$V2

#check on above
head(X_train)
head(X_test)

#add name "subject" to subject tables for training and test data sets, separately
names(subject_train) <- "subject"
names(subject_test) <- "subject"

#check on above
head(subject_train)
head(subject_test)

#add name "activity" to activity code tables for training and test data sets, separately
names(y_train) <- "activity"
names(y_test) <- "activity"

#add activity descriptions as value labels for training and test data sets, separately
y_train$activity <- factor(y_train$activity,
                    levels = activity_labels$V1,
                    labels = activity_labels$V2) 

y_test$activity <- factor(y_test$activity,
                     levels = activity_labels$V1,
                     labels = activity_labels$V2)

#check on above
head(y_train)
head(y_test)

#add the columns of subject and activity tables to the training and test data sets, separately
tottest <- cbind(y_test,subject_test,X_test)
tottrain <- cbind(y_train,subject_train,X_train)

#check on above
head(tottest[,1:3])
head(tottrain[,1:3])

#merge the rows of the extended training and test data set tables
mergedData <- rbind(tottest, tottrain)

#check on above
NROW(mergedData)

#leave only 68 columns, including 33 feature variables times 2 measures each 
#(mean and std), plus 2 "activity" and "subject"

#Step 1: Create a df of the columns the contain the word "mean", but not "meanFreq" 
dfrmfrm <- mergedData[,grep("mean",names(mergedData))]
names(dfrmfrm)
dfrmm <- dfrmfrm[,-grep("meanFreq",names(dfrmfrm))]
names(dfrmm)
#Step 2: Create a df of the columns the contain the word "std"
dfrmstd <- mergedData[,grep("std",names(mergedData))]
names(dfrmstd)
#Step 3: Create a df of only the subject and activity columns
dfrmas <- mergedData[,c("subject","activity")]
names(dfrmas)
#Step 4: Combine the df's created in Steps #1 to #3 above
dataset1 <- cbind(dfrmas,dfrmm,dfrmstd)
names(dataset1)

#create the tidy data set, by averaging by activity and subject

#Step 1: start with a vector of names for all variables, except activity and subject
varnames <- c(names(dfrmm),names(dfrmstd))
#Step 2: melt the dataframe with these 66 variable names, arranged by activity and subject
dataset1Melt <- melt(dataset1, id=c("activity","subject"), measure.vars=varnames)
head(dataset1Melt, n=3)
tail(dataset1Melt, n=3)
#Step 3: dcast the melted data frame to create the averages of the 66 variables for each activity and each subject
tidyData <- dcast(dataset1Melt, activity + subject ~ variable, mean)
tidyData[,1:5]

#write "tidyData" to text and csv files to save it to the PC
write.table(tidyData, "~/UCI HAR Dataset/tidyData.txt",sep="\t")
write.csv(tidyData, "~/UCI HAR Dataset/tidyData.csv",row.names=FALSE)




