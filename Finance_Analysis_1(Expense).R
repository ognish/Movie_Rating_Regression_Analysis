library(tidyr)
library(dplyr)
expense_data <- read.csv("/Users/apple/Desktop/Datas/Expense(%GDP).csv")
fina_lib_data <- read.csv("/Users/apple/Desktop/Datas/Financial_liabilities_India.csv")
#gsub("X","", names(expense_data))

sapply(fina_lib_data[1,], levels)