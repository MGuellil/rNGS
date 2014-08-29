#' Sort BAM
#'
#'R function to sort BAM files
#'
#'@param sample dataframe row
#'@keywords SAMtools
#'@export
#'@import tools
#'@examples
#'sort_bam(sample_data_frame_row)


sort_bam <- function(config_df_row){
  # function to preform sort bam file
  fastq_file <- config_df_row[1]
  output_file <- file_path_sans_ext(fastq_file)
  bam_file <- paste(output_file, ".bam", sep = "")
  bam_sort_file <- paste(output_file, "_sort", sep = "")
  sort_string <- paste("samtools sort",
                       bam_file,
                       bam_sort_file)
  message("Sorting BAM \n")
  system(sort_string)
  
}
