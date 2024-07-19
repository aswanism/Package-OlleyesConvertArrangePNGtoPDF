#' Convert PNGs to PDF and combine OD and OS PDFs
#'
#' @param file_source The directory containing PNG files.
#' @param Output_file The output PDF file name without .pdf extension.
#' @export
convert_pngs_to_pdf <- function(file_source, output_file) {

  library(magick)

  # List all PNG files in the specified directory
  png_files <- list.files(file_source, pattern = "\\.png$", full.names = TRUE)

  # Check if any PNG files are found
  if (length(png_files) == 0) {
    stop("No PNG files found in the specified directory. Please check the file path and ensure there are PNG files.")
  }

  # Combine images side by side for each pair
  combined_images <- list()
  for (i in seq(1, length(png_files), by = 2)) {
    if (i + 1 <= length(png_files)) {
      combined_image <- image_append(image_read(c(png_files[i], png_files[i + 1])), stack = FALSE)
    } else {
      combined_image <- image_read(png_files[i])
    }
    combined_images <- c(combined_images, list(combined_image))
  }

  output_file <- sub("\\.pdf$", "", output_file)

  # Save combined images as a new PDF file with multiple pages
  combined_pdf_path <- paste0(output_file, ".pdf")
  image_write(image_join(combined_images), path = combined_pdf_path, format = "pdf")

  cat("PDF files have been merged successfully into", combined_pdf_path, "\n")

}

# Example usage
file_source <- "C:/Users/muham/Downloads/0001-John-Stratton-BUNDLE-41598-03-29-2024-21_06_33_report (4)"
output_file <- "Combined_Olleyes_Results_2"

convert_pngs_to_pdf(file_source, output_file)
