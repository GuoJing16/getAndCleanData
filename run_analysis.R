# Unzip the zipped data file.
unzip("./getdata_projectfiles_UCI\ HAR\ Dataset.zip")
# Read the files required to be merged.
featureLables<-read.table("./UCI\ HAR\ Dataset/features.txt",head=FALSE)
activityLabels<-read.table("./UCI\ HAR\ Dataset/activity_labels.txt",head=FALSE)
testDataSet<-read.table("./UCI\ HAR\ Dataset/test/X_test.txt",head=FALSE)
testSubject<-read.table("./UCI\ HAR\ Dataset/test/subject_test.txt",head=FALSE)
testActivities<-read.table("./UCI\ HAR\ Dataset/test/y_test.txt",head=FALSE)
trainDataSet<-read.table("./UCI\ HAR\ Dataset/train/X_train.txt",head=FALSE)
trainSubject<-read.table("./UCI\ HAR\ Dataset/train/subject_train.txt",head=FALSE)
trainActivities<-read.table("./UCI\ HAR\ Dataset/train/y_train.txt",head=FALSE)
mergedDataSet<-rbind(testDataSet,trainDataSet)
mergedSubject<-rbind(testSubject,trainSubject)
mergedActivities<-rbind(testActivities,trainActivities)
for(i in 1:length(mergedActivities$V1)){
  mergedActivities$V1[i]<-as.character.factor(activityLabels$V2[activityLabels$V1==mergedActivities$V1[i]])
}
colnames(mergedDataSet)<-as.character.factor(featureLables$V2)
# Select the columns which are the mean and standard deviation for each measurement
tmpdf1 <- subset(mergedDataSet, select=(names(mergedDataSet)[grep('mean',names(mergedDataSet),ignore.case = TRUE)]))
tmpdf2 <- subset(mergedDataSet, select=(names(mergedDataSet)[grep('std',names(mergedDataSet),ignore.case = TRUE)]))
selectedDataSet<-cbind(tmpdf1,tmpdf2)
colnames(mergedSubject)<-"Subject"
colnames(mergedActivities)<-"Activity"
mergedTotal<-cbind(mergedSubject,mergedActivities,selectedDataSet)
# Calculate the average of each variable for each activity and each subject
valueNum<-length(colnames(mergedTotal))
for(i in 3:valueNum){
  if(i==3){
    tmp<-as.numeric(by(mergedTotal[,i],mergedTotal[,1:2],mean))
  }
  else{
    tmp1<-as.numeric(by(mergedTotal[,i],mergedTotal[,1:2],mean))
    tmp<-cbind(tmp,tmp1)
  }
}
Activity<-factor(mergedTotal$Activity)
Subject<-factor(mergedTotal$Subject)
tmp1<-rep(as.character(levels(Subject)),6)
tmp2<-rep(as.character(levels(Activity)),each=30)
final<-as.data.frame(cbind(tmp1,tmp2,tmp))
colnames(final)<-colnames(mergedTotal)
for(i in 3:valueNum){
  colnames(final)[i]<-paste("Average_of_",colnames(final)[i],sep="")
}
# Write the final table in txt format, in which the columns were seperated by space. 
write.table(final,file="AverageOfEachMeasurement.txt",row.name=FALSE)
