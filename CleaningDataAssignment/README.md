# ReadMe

## Requirements to run the run_analysis.R file
	* The plyr and dplyr package has to be installed since the R script makes use of them
	* Internet connection in case the required dataset is not located in the current working directory
	
## Steps of the data transformation (run_analysis.R file)
	* Check for the required data and download it if necessary
	* Read in the feature list and the activity labels and identify the index of the mean and std values
	* Read in the files for the test and training data (6 in total)
	* Merge the test and training data using cbind and rbind
	* Set the column names using the feature list 
	* Set the values of the activity column according to the corresponding label
	* Take the mean of every variable grouped by the subject id and the activity
	* Sort the dataset according to the values of the subject id and the activity in ascending order
	* Save the dataset to a .txt file ("mergedAveragedDataset.txt")

Further comments can be found inside the run_analysis.R file

## Reading the saved dataset
The following command is required to correctly read the dataset:
read.table("mergedAveragedDataset.txt",header=TRUE)
This automatically sets the column names 