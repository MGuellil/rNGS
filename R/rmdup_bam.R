#' rmdup BAM
#'
#'R function to remove BAM file duplicates
#'
#'@param sample dataframe row
#'@keywords SAMtools
#'@export
#'@import tools
#'@examples
#'rmdup_bam(sample_data_frame_row)


rmdup_bam <- function(config_df_row){
  # function to remove duplicates in the bam file
  fastq_file <- config_df_row[1]
  output_file <- file_path_sans_ext(fastq_file)
  bam_sort_file <- paste(output_file, "_sort.bam", sep = "")
  bam_sort_rmdup_file <- paste(output_file, "_sort_rmdup.bam", sep = "")
  rmdup_string <- paste("samtools rmdup -s",
                        bam_sort_file,
                        bam_sort_rmdup_file)
  cat("Removing duplicates\n")
  system(rmdup_string)
}
