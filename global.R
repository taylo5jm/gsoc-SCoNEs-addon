# global.R
library(magrittr)

data_path <- "SCONES_test.tsv"
SCONES_test <- read.table(data_path, header = TRUE,
                          sep = "\t")
# compute log2 ratio
# SCONES_test$log2Ratio <- SCONES_test$testSample1 / SCONES_test$testSample2

# interval ID for each start to end frame
SCONES_test$intervalID <- 1:nrow(SCONES_test)

# infinite values
infinite_vals <- c(which(is.infinite(SCONES_test$testSample1)), 
                   which(is.infinite(SCONES_test$testSample2)))
bad_windows <- paste(SCONES_test$start[infinite_vals], 
                     
                     SCONES_test$end[infinite_vals], sep = "-")
cat(paste("Infinite values found in row(s): ", paste(infinite_vals, sep = ",", collapse = ","),
          " (intervals ", paste(bad_windows, sep = ",", collapse = ","), ")"))
cat("Removing infinite values...")

SCONES_test <- SCONES_test[-infinite_vals,]
numeric_cols <- which(sapply(SCONES_test, class) == "numeric")
SCONES_test[,numeric_cols] <- signif(SCONES_test[,numeric_cols], 4)

