# data.clean.assignment
Johns Hopskin's Data Cleaning "Wearable Data" Assignment

The CodeBook.txt describes all variables, the original data, and modifications made to the original data for this assignment.

The results_analysis.R contains a R script to will manipulate the original data (after it is downloaded into your working directory) and do the actions described in detail within CodeBook.txt. Briefly, the script:

1) Merged the the different excel documents with data and combines them into one data frame (allData);
2) Label the column names of the "allData" data frame using the features.txt from the original data along with the manual additions of the labels "Subject" and "Activity";
3) Convert the activity column from the quantitative variable to a qualitative variable using the information within the activity_labels.txt from the original data;
4) Subset the original data frame to include measurement variables that calculated the mean or standard deviation of each measurement along with the activity and subject identification variable (subData);
5) Create a tidy data set that contains the average of each variable of the subset created in #4 by (a) activity and (b) subject (GroupedData)

