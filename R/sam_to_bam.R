#' SAM to BAM
#'
#'R function to convert from SAM to BAM files
#'
#'@param sample dataframe row
#'@keywords SAMtools
#'@export
#'@import tools
#'@examples
#'sam_to_bam(sample_data_frame_row)


sam_to_bam <- function(config_df){
  
  # get the info we want
  fastq_file <- config_df[1]
  
  # make the output file
  output_file <- file_path_sans_ext(fastq_file)
  sam_file <- paste(output_file, ".sam", sep = "")
  bam_file <- paste(output_file, ".bam", sep = "")
  
  # generate string for comand
  sam_bam_string <- paste("samtools view -Sb",
                          sam_file,
                          ">",
                          bam_file)
  
  message("SAM to BAM conversion")
  system(sam_bam_string)
}
