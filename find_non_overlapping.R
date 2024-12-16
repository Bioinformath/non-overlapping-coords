library(GenomicRanges)

process_bed_file <- function(file_path) {
  bed_data <- read.table(file_path, header = FALSE, sep = "\t", stringsAsFactors = FALSE)
  colnames(bed_data) <- c("chr", "start", "end")
  gr <- GRanges(seqnames = bed_data$chr,
                ranges = IRanges(start = bed_data$start,
                                 end = bed_data$end))
  dis <- disjoin(gr)
  res <- dis[countOverlaps(dis, gr) == 1]
  return(res)
}

extract_columns <- function(input_file, output_file) {
  data <- read.table(input_file, header = FALSE, sep = "\t", stringsAsFactors = FALSE)
  extracted_data <- data[, 1:3]
  write.table(extracted_data, file = output_file, sep = "\t", quote = FALSE, row.names = FALSE, col.names = FALSE)
  cat("The final bed_file with non-overlapping regions is written to :", output_file, "\n")
}

bed_file_path <- commandArgs(trailingOnly = TRUE)[1]
non_overlapping_output_file <- commandArgs(trailingOnly = TRUE)[2]
extracted_columns_file <- commandArgs(trailingOnly = TRUE)[3]

non_overlapping_intervals <- process_bed_file(bed_file_path)
result_df <- as.data.frame(non_overlapping_intervals)

write.table(result_df, file = non_overlapping_output_file, sep = "\t", quote = FALSE, row.names = FALSE, col.names = FALSE)
cat("Non-overlapping intervals written to", non_overlapping_output_file, "\n")

extract_columns(non_overlapping_output_file, extracted_columns_file)






