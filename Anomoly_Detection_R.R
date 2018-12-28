install.packages("devtools")
devtools::install_github("twitter/AnomalyDetection")
library(AnomalyDetection)

help(AnomalyDetectionTs)

library(AnomalyDetection)

??AnomalyDetectionTs
help(AnomalyDetectionVec)


AnomalyDetectionVec(raw_data[,2], max_anoms=0.02, period=1440, direction='both', only_last=FALSE, plot=TRUE)



raw_data <- read.csv(file="C:/Users/Administrator/Documents/ML_Analysis/heart_activity_fitbit1.csv", 
                     header=TRUE, sep=",",stringsAsFactors = FALSE)

  
head(raw_data,100)

raw_data$caloriesOut_OR = as.numeric(raw_data$caloriesOut_OR)
raw_data$caloriesOut_FB = as.numeric(raw_data$caloriesOut_FB)
raw_data$caloriesOut_Cardio = as.numeric(raw_data$caloriesOut_Cardio)
raw_data$caloriesOut_Peak = as.numeric(raw_data$caloriesOut_Peak)

raw_data$dateTime = as.POSIXct(raw_data$dateTime)

raw_data[is.na(raw_data)] <- 0

AnomalyDetectionTs(raw_data[c("dateTime","caloriesOut_Peak")], xlabel =  "Heart in Peak Mode" , 
                   ylabel = "Calories" , na.rm=T,    max_anoms=0.1, direction='both', plot=TRUE)$plot
AnomalyDetectionTs(raw_data[c("dateTime","caloriesOut_FB")],  xlabel =  "Heart in Fat burn Mode" , ylabel = "Calories",
                   max_anoms=0.1, direction='both', plot=TRUE)$plot

AnomalyDetectionTs(raw_data[c("dateTime","caloriesOut_Cardio")], xlabel =  "Heart in Cardio Mode", ylabel = "Calories",
                   max_anoms=0.1, direction='both', plot=TRUE)$plot

AnomalyDetectionTs(raw_data[c("dateTime","caloriesOut_OR")],  "Heart in Out of Range Mode", ylabel = "Calories",
                   max_anoms=0.1, direction='both', plot=TRUE)$plot




res$plot

df <- read.csv(url("https://raw.githubusercontent.com/ieatbaozi/R-Practicing/master/example.csv"),header = TRUE,stringsAsFactors = FALSE)
df$DateTime <- as.POSIXct(df$DateTime)

library(AnomalyDetection)
ADtest <- AnomalyDetectionTs(df, max_anoms=0.1, direction='both', plot=TRUE)
ADtest$plot

