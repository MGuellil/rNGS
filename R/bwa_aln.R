 #' BWA align
 #'
 #'R function to run the BWA "aln" method on our sample dataframe
 #'
 #'@param sample dataframe
 #'@keywords BWA aln
 #'@export
 #'@import tools
 #'@examples
 #'bwa_align(sample_data_frame_row)
 
bwa_align <- function(config_df_row){
  
  # get all the things we need
  fastq_file <- config_df_row[1]
  genome <- config_df_row[5]
  bwa_arguments <- config_df_row[3]
  
  # generate the output string using the cool command
  # file_path_sans_ext
  output_file <- file_path_sans_ext(fastq_file)
  sai_file <- paste(output_file, ".sai", sep = "")
  
  # form my BWA aln string
  bwa_aln_string <- paste("bwa aln",
                          bwa_arguments,
                          genome,
                          fastq_file,
                          " > ",
                          sai_file)
  
  # run the BWA comand
  message("Running BWA aln for ", fastq_file, "\n")
  system(bwa_aln_string)
}
