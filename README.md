---
title: "Course Project"
output: 
  html_document:
    keep_md: true
---
# By Jing Guo.

**This repository is for course project of getting and cleaning data**. The aim of this project is tidying the raw data collected from a Samsung Galaxy S smartphone into an readable table which is ready for carrying out the downstream analysis.  

## The input data

The input data is the zip file downloaded from the course project websit call **"getdata_projectfiles_UCI HAR Dataset.zip"**. It must be put into the same directory of the script "run_analysis.R".

## The script to generate the tidy data

The script name is "run_analysis.R" which is a R script file.

**To run it**, you have to have a zip file named "getdata_projectfiles_UCI HAR Dataset.zip" in the **same** directory and the version of R should be **above 3.1.1**.

For example, you can type in the following command if you are under linux operation system and already included the "Rscript" software in your environment path.

**$Rscript run_analysis.R**

In the script, there are **five steps** to accomplish the tidying process in a sequential order. They are seperately the following.

  1: Unzip the zipped data file.    
  2: Read the files required to be merged.    
  3: Select the columns which are the mean and standard deviation for each measurement    
  4: Calculate the average of each variable for each activity and each subject.    
  5: Write the final table in txt format, in which the columns were seperated by space.   

After running it, it will generate a tidy table named **"AverageOfEachMeasurement.txt"** which I committed into this repository as well.

## The tidy table

Of the tidy table, there is an code book describing it. It's name is **"codeBook.txt"**
