==================================================================
This Repository includes information which will allow you to reproduce and understand a set of summary data derived from the "Human Activity Recognition Using Smartphones Dataset, Version 1.0"(HARSD).  The dataset is used with permission from the following publication:
1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

A full description of the HARSD is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


This repository includes the following files:
=========================================
1. 'run_analysis.R':
This file contains the R code, or script, that I used to perform my analysis.   The output of this code, 'tidyData.txt', is the summary data referred to above. A description of how the R code works is provided below as well as within comments embedded with the code.


2. 'CodeBook.md':
This file briefly describes the HARSD.  It then goes on to explain the variables I have selected from the HARDS and the transformations I have performed on those variables in order to arrive at the summary data, i.e., the tidyData.txt file.  In addition, I explain why the summary data can indeed be considered "tidy" and explain how to read the variables in the summary data, including a data dictionary.


How the R code, or Script, Works
================================
The R code file, 'run_analysis.R', contains not only the code, but also descriptions of each step carried out within the code to create the summary data. You should be able to run the code and produce the summary data as an object in R called "tidyData". Simply replace the location of the HARSD data files in the initial read.table statements with the location of the same files on your PC. The final lines of the code contain write.table and write.csv commands.  Again, if you simply replace the destination location in these commands with the location where you would like the files to be created on you PC, you will get the summary data in file format.  In fact, you'll get it in both '.txt' and '.csv' format. The latter will not have row names, which will make it convenient for you to import and view the summary data set in Excel.

