#Script duplicates#
This R script is designed to remove duplicated articles from an Excel file and then save the results in a new Excel workbook with two sheets: one containing the unique articles and another with the duplicated articles. Below is a step-by-step brief description:

Installing and loading necessary libraries: The script installs and loads the libraries readxl, dplyr, writexl, and openxlsx, which are essential for reading, manipulating, and writing Excel files in R.

Selecting the file: The file.choose() function is used to open a window that allows you to select the Excel file to work with. The user must manually copy the file path to the ruta_excel variable.

Reading the Excel file: The selected file is read and stored in an object called datos using the read_excel() function.

Removing duplicates: The data is filtered to remove duplicated articles based on the Title and Authors columns, and the result is stored in a new object called datos_cured.

Identifying duplicates: The duplicated articles are identified and stored in a new object called datos_deleted.

Creating a new Excel workbook: A new Excel workbook is created using the createWorkbook(), addWorksheet(), and writeData() functions from the openxlsx package. This workbook will have two sheets: one with unique articles (cured) and another with duplicated articles (deleted).

Saving the file: Finally, the new Excel workbook is saved to the path specified in ruta_excel_final.

This script is useful for cleaning datasets of articles where duplicates might exist, allowing for more accurate and organized analysis.

#Inclusion and Exclusion#

The last R script The following R script is designed to apply inclusion and exclusion criteria to a set of articles in an Excel file, filtering the data based on specific keywords and then saving the results in a new Excel workbook with multiple sheets. Below is a brief step-by-step description:

Installing necessary packages:
The script checks if the required packages (readxl, dplyr, writexl, openxlsx) are installed. If they are not installed, it automatically installs them. These packages are essential for reading, manipulating, and writing Excel files in R.

Loading the libraries:
Once the packages are installed, they are loaded into the R session using the library() function, making the necessary functions available for data manipulation.

Selecting the Excel file:
The script uses the file.choose() function to open a dialog box that allows the user to select the Excel file to work with. The selected file path is stored in the rute_excl variable.

Reading the Excel file:
The selected Excel file is read using the read_excel() function. In this case, the sheet named "cured" is specified, and the data is stored in the data_excl object.

Filtering data based on specific criteria:
The script applies several filters using the filter() function from dplyr. These filters search for specific keywords in the "Abstract" column, allowing the extraction of subsets of data that meet the defined search criteria.

Defining combined search patterns:
Multiple keywords are combined into a single search pattern using the | operator, which is useful for performing more complex text searches in the "Abstract" column.

Applying the combined filter:
The script filters the data to extract all rows that match any of the keywords defined in the combined pattern. The results are stored in the total_filter object.

Identifying excluded data:
The script also filters out data that does not meet the combined criteria, storing the excluded rows in the excluded_data object. This step is crucial for differentiating between articles that meet and do not meet the established criteria.

Creating a new Excel workbook:
Using the createWorkbook() function from openxlsx, a new, empty Excel workbook is created, where worksheets will be added to store the filtered results.

Adding worksheets and writing data:
Several worksheets are created in the Excel workbook using addWorksheet(), and the filtered data is written into the respective sheets using the writeData() function. Each applied filter is saved in a separate sheet to facilitate later analysis.

Saving the Excel workbook:
Finally, the new Excel workbook, which contains all the sheets with the filtered and excluded data, is saved to a location specified by the user using the saveWorkbook() function.

This script is useful for filtering sets of articles based on specific criteria, allowing for organized classification and facilitating the subsequent analysis of the selected and excluded data.

