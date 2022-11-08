## Installs and loads tidyverse
install.packages("tidyverse")
library(tidyverse)

## Load the activity labels and features

features <- read_delim("./Dataset/features.txt", col_select = 2)
activity_labels <- read_delim("./Dataset/activity_labels.txt")


## Load the test data




## Load the train data

