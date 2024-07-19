# Package-OlleyesConvertArrangePNGtoPDF
 Easiest way to convert 2 png files from Olleyes results, arrange them horizontally (side by side) and save them in 1 pdf file

   Olleyes offers several download options for sharing results: PDF, DICOM, PNG, and the ability to print or email the results. 
  However, there’s a challenge with the PDF, DICOM, and email formats: the results are stacked vertically, making it difficult to analyze them effectively.
 
 To address this, I took the following steps:
 
   1. Downloaded the results in PNG format—I obtained two separate PNG files, one for the right eye (RE) and another for the left eye (LE).
   2. Converted the PNG files to PDF—Next, I transformed these PNG images into PDF format.
   3. Arranged the PDFs side by side—I positioned the RE and LE results next to each other within a single PDF file.
      
-------
How to use this package?

Step 1: Prepare PNG file
a. Download and save Olleyes result in png format. Make sure download only 1 test at a time.
b. Unzip file.
c. Open the folder and you can see 2 png files (page_01.png & page_02.png). Keep the names as they are.


Step 2 Install Packages
a. Install these 2 packages before you proceed to the next step:
   i. install.packages("devtools")
   ii. install.packages("magick")

b. Install "Package-OlleyesConvertArrangePNGtoPDF" by typing in these code and run it:

   library(devtools)
   install_github("aswanism/Package-OlleyesConvertArrangePNGtoPDF")


Step 3. Use "Package-OlleyesConvertArrangePNGtoPDF package
a. Use this script to generate your pdf files:

library(OlleyesConvertArrangePNGtoPDF)
library(magick)

file_source <- "From/Your/Computer"
OD_file <- "page_01.pdf"
OS_file <- "page_02.pdf"
Output_file <- "ChooseTheAppropriateName.pdf" #Example: "Subj 1_11-07-24_OU_Olleyes.pdf"

convert_pngs_to_pdf(file_source, OD_file, OS_file, Output_file)

Step 4. Get The Files
a. Open folder "From/Your/Computer" which where you generate your files.
b. Copy and paste the acquired files to your preferred folder.
c. Delete the remaining files inside "From/Your/Computer" folder.
