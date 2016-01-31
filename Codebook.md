<h1> Codebook Steps </h1>
<p> The script DataSet.R performs the 5 steps described in the course project's definition. </p>

•The data which is similar in nature is merged with the rbind function, ensuring that the number of columns and observations are uniform.
•Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. Their names are subsequently changed to give uniformity.
•The activity names and IDs from  activity_labels.txt are substituted in the dataset and in the whole dataset, those columns with vague column names are corrected.
•Thus, we create a new tidy dataset with all the average measures for each subject and activity type. The output file is called  averages_data.txt , and uploaded to this repository.

<h1> Variable Terminology </h2>

•Xtrain ,  YTrain ,  XTest ,  YTest ,  MainTrain  and  MainTest  contain the data from the downloaded files.
•XData, YData  and  MainData  are the merged results of the previous datasets, which is subject to further downstream analysis.
• The features  text file contains the correct names for the  SubsetXData  dataset. This makes sure that the column names are applied to the numeric data stored in  MeanAndStdFeatures.
•A similar approach is taken with activity names through the  activities  variable.
• EntireData  merges  SubsetXData ,  YData  and  MainData  in a big and tidy dataset.
•Finally,  averages_data  contains the relevant averages which will be later stored in a  .txt  file.
