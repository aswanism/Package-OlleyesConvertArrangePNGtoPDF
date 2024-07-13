#' Convert PNGs to PDF and combine OD and OS PDFs
#'
#' @param file_source The directory containing PNG files.
#' @param OD_file The OD PDF file to combine.
#' @param OS_file The OS PDF file to combine.
#' @param Output_file The output PDF file name.
#' @export
convert_pngs_to_pdf <- function(file_source, OD_file, OS_file, Output_file) {
  convert_png_to_pdf <- function(png_file_path) {
    img <- image_read(png_file_path)
    pdf_file_path <- sub("\\.png$", ".pdf", png_file_path)
    image_write(img, path = pdf_file_path, format = "pdf")
    cat("Converted", png_file_path, "to", pdf_file_path, "\n")
  }

  png_files <- list.files(file_source, pattern = "\\.png$", full.names = TRUE)

  lapply(png_files, convert_png_to_pdf)

  setwd(file_source)

  pdf_OD <- image_read_pdf(OD_file)
  pdf_OS <- image_read_pdf(OS_file)

  combined_pdf <- image_append(c(pdf_OD, pdf_OS), stack = FALSE)

  image_write(combined_pdf, path = Output_file, format = "pdf")

  cat("Combined PDF saved as", Output_file, "\n")
}
