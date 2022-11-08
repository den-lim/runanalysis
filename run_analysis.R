## Installs and loads tidyverse
install.packages("tidyverse")
library(tidyverse)

install.packages("data.table")
library("data.table")


## Load the activity labels and features

features <- read_delim("./Dataset/features.txt", col_select = 2, 
                       col_names=F)
activity_labels <- read_delim("./Dataset/activity_labels.txt", col_names=F )


## Load the test data

test_subject <- read_tsv("./Dataset/test/subject_test.txt", 
                           col_names="subject", col_types="d")
test_activity <- read_tsv("./Dataset/test/y_test.txt", 
                          col_names="activity", col_types="d")
test_data <- fread("./Dataset/test/X_test.txt", sep=" ",
                      colClasses=c(rep("numeric",times=561)), 
                      col.names = features$X2)
      
                
## Load the train data

train_subject <- read_tsv("./Dataset/train/subject_train.txt", 
                         col_names="subject", col_types="d")
train_activity <- read_tsv("./Dataset/train/y_train.txt", 
                          col_names="activity", col_types="d")
train_data <- fread("./Dataset/train/X_train.txt", sep=" ",
                   colClasses=c(rep("numeric",times=561)), 
                   col.names = features$X2)


## Combining test data
test_data_combined <- data.table(test_subject, test_activity, test_data)
train_data_combined <- data.table(train_subject, train_activity, train_data)

test_data_combined$test_type <- "test"
train_data_combined$test_type <- "train"
complete_data <- rbind(test_data_combined, train_data_combined)


## Changing Activity column values according to activity_labels
activity_vec <- activity_labels$X2
complete_data$activity <- sapply(complete_data$activity, 
                                 function(i) {activity_vec[i]})


## Selecting mean and std columns, plus original 3 columns subject, activity
complete_data_select <- complete_data %>% 
    select(matches("*mean*|*std*|subject|activity"))
complete_data_select <- complete_data_select %>%
    select(-"test_type")


## Getting the means per subject/activity combination
tidy_data <- complete_data_select %>% group_by(subject, activity) %>% 
    summarise_at(vars("tBodyAcc-mean()-X":"angle(Z,gravityMean)"), mean)


