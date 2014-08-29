#' BWA samse
#'
#'R function to run the BWA "aln" method on our sample dataframe
#'
#'@param sample dataframe row
#'@keywords BWA samse
#'@export
#'@import tools
#'@examples
#'bwa_samse(sample_data_frame_row)

bwa_samse <- function(config_df_row){
  # bwa_samse a function to preform a BWA samse alingment
  
  # collect what I need
  fastq_file <- config_df_row[1]
  genome <- config_df_row[5]
  output_file <- file_path_sans_ext(fastq_file)
  sai_file <- paste(output_file, ".sai", sep = "")
  sam_file <- paste(output_file, ".sam", sep = "")
  read_groups <- paste("'", config_df_row[2], "'", sep = "")
  
  # form my BWA samse string
  bwa_samse_string <- paste("bwa samse -r",
                            read_groups,
                            genome,
                            sai_file,
                            fastq_file,
                            ">",
                            sam_file)
  
  message("Running BWA samse for ", fastq_file, "\n")
  system(bwa_samse_string)
}
