# 1. Install necessary packages
# These lines check if you don't have the necessary packages installed. If they are not installed, these commands will install them.
# - 'readxl' is used to read Excel files.
# - 'dplyr' is a powerful package for data manipulation.
# - 'writexl' allows you to write data frames to Excel files.
# - 'openxlsx' is used to create and manipulate Excel files.

install.packages("readxl")
install.packages("dplyr")
install.packages("writexl")
install.packages("openxlsx")

# 2. Load the libraries
# Once the packages are installed, you need to load them into your R session using the `library()` function. This makes the functions from these packages available to use.

library(readxl)
library(dplyr)
library(writexl)
library(openxlsx)  # Make sure to load this library

# 3. Select the Excel file
# `file.choose()` opens a dialog box allowing you to select the Excel file you want to work with.
# This is helpful when you don't want to hard-code the file path. After selecting the file, the path will be stored in `rute_excl`.

rute_excl <- file.choose()

# 4. Load data from the selected Excel file
# The `read_excel()` function is used to read the content of the Excel file.
# You specify the sheet you want to read using the `sheet` argument. In this case, you're reading the sheet named "cured".

data_excl <- read_excel(rute_excl, sheet = "cured")

# 5. Filter the data based on specific criteria
# Here, you filter the data using specific keywords in the "Abstract" column. The `filter()` function from `dplyr` is used to keep rows that match the given criteria.

filter_1 <- data_excl %>% filter(grepl("translational research|Translational science|Bench-to-bedside research", Abstract, ignore.case = TRUE))
filter_2 <- data_excl %>% filter(grepl("Drug development|pharmaceutical development|therapies in breast cancer", Abstract, ignore.case = TRUE))
filter_3 <- data_excl %>% filter(grepl("PPIE|User involvement|community cancer", Abstract, ignore.case = TRUE))
filter_4 <- data_excl %>% filter(grepl("review", Abstract, ignore.case = TRUE))

# 6. Define the combined search patterns using the "|" operator
# This pattern combines multiple keywords into one search string.
patterns <- "genetic risk assessment|questionnaire|breast cancer|awareness|attitudes|perceptions"

# 7. Apply the filter using `grepl()` with the combined pattern
# `total_filter` will contain all rows that match any of the keywords in the combined pattern.
total_filter <- data_excl %>% filter(grepl(patterns, Abstract, ignore.case = TRUE))

# 8. Identify data that does not meet the criteria (i.e., excluded data)
# This step filters out rows that do not match the combined criteria.
# The `!grepl()` negates the condition, so you're filtering for rows that do NOT contain the specified keywords.
excluded_data <- data_excl %>% filter(!grepl(patterns, Abstract, ignore.case = TRUE))

# 9. Create a new Excel workbook
# The `createWorkbook()` function from `openxlsx` creates a new, empty workbook where you can add worksheets.

wb <- createWorkbook()

# 10. Add worksheets and write data to the workbook
# `addWorksheet()` creates a new sheet in the workbook, and `writeData()` writes the filtered data into the respective sheet.

addWorksheet(wb, "Filter1")
writeData(wb, "Filter1", filter_1)

addWorksheet(wb, "Filter2")
writeData(wb, "Filter2", filter_2)

addWorksheet(wb, "Filter3")
writeData(wb, "Filter3", filter_3)

addWorksheet(wb, "Filter4")
writeData(wb, "Filter4", filter_4)

addWorksheet(wb, "Total Filter")
writeData(wb, "Total Filter", total_filter)

addWorksheet(wb, "Excluded")
writeData(wb, "Excluded", excluded_data)

# 11. Save the workbook to a new Excel file
# Finally, you specify the path where you want to save the Excel file that contains the filtered results.
# `saveWorkbook()` saves the workbook at the specified path.

rute_results <- "C:\\Users\\Usuario\\Documents\\.xlsx"  # Specify the path where you want to save the results, e.g., "path/to/save/results.xlsx"
saveWorkbook(wb, rute_results)
