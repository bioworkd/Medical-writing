This R script is designed to remove duplicated articles from an Excel file and then save the results in a new Excel workbook with two sheets: one containing the unique articles and another with the duplicated articles. Below is a step-by-step brief description:

Installing and loading necessary libraries: The script installs and loads the libraries readxl, dplyr, writexl, and openxlsx, which are essential for reading, manipulating, and writing Excel files in R.

Selecting the file: The file.choose() function is used to open a window that allows you to select the Excel file to work with. The user must manually copy the file path to the ruta_excel variable.

Reading the Excel file: The selected file is read and stored in an object called datos using the read_excel() function.

Removing duplicates: The data is filtered to remove duplicated articles based on the Title and Authors columns, and the result is stored in a new object called datos_cured.

Identifying duplicates: The duplicated articles are identified and stored in a new object called datos_deleted.

Creating a new Excel workbook: A new Excel workbook is created using the createWorkbook(), addWorksheet(), and writeData() functions from the openxlsx package. This workbook will have two sheets: one with unique articles (cured) and another with duplicated articles (deleted).

Saving the file: Finally, the new Excel workbook is saved to the path specified in ruta_excel_final.

This script is useful for cleaning datasets of articles where duplicates might exist, allowing for more accurate and organized analysis.
