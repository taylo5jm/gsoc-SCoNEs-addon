# global.R
# Justin Taylor
# 3/5/2016
library(magrittr)

# read data
data_path <- "SCONES_test.tsv"
SCONES_test <- read.table(data_path, header = TRUE,
                          sep = "\t")

# interval ID for each start to end frame
SCONES_test$intervalID <- 1:nrow(SCONES_test)

# find infinite values
infinite_vals <- c(which(is.infinite(SCONES_test$testSample1)), 
                   which(is.infinite(SCONES_test$testSample2)))
bad_windows <- paste(SCONES_test$start[infinite_vals], 
                     
                     SCONES_test$end[infinite_vals], sep = "-")

# print indices of infinite values to console
cat(paste("Infinite values found in row(s): ", paste(infinite_vals, sep = ",",
                                                     collapse = ","),
          " (intervals ", paste(bad_windows, sep = ",", collapse = ","), ")"))
cat("Removing infinite values...")

# excise infinite values
SCONES_test <- SCONES_test[-infinite_vals,]

# round numeric values for clarity
numeric_cols <- which(sapply(SCONES_test, class) == "numeric")
SCONES_test[,numeric_cols] <- signif(SCONES_test[,numeric_cols], 4)

