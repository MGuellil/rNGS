#' drive_cutadapt
#'
#'R function to drive cutadapt
#'
#'@param raw_fastq raw fastq_file
#'@param overlap  overlap into read - default 1bp
#'@param adapter adater sequence to trim - default Meyer 2010 
#'@param min_length minmum length of read - default 30bp
#'@param error error rate - default 0.1
#'@param return_name return name of cutadapt output file
#'@keywords cutadapt
#'@export
#'@import tools
#'@examples
#'drive_cutadapt("input_raw.fastq", "1", "AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC", "0.1", return_name = TRUE)


drive_cutadapt <- function(raw_fastq,
                           overlap = "1",
                           min_lenght = "30",
                           error = "0.1",
                           adapter = "AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC",
                           return_name = TRUE){
  
  message("Running cutadapt for ", raw_fastq)
  
  # create output files
  output_file_name_fastq <- paste0(strsplit(basename(raw_fastq), "_")[[1]][1],
                            "_cutadap.fastq")
  output_file_name_log <- paste0(strsplit(basename(raw_fastq), "_")[[1]][1],
                                   "_cutadap.log")
  output_file_full_path_fastq <- paste0(dirname(raw_fastq),
                                 "/",
                                 output_file_name_fastq)
  output_file_full_path_log <- paste0(dirname(raw_fastq),
                                        "/",
                                        output_file_name_log)
  
  # make cutadapt string
  cutadapt_string <- paste("cutadapt",
                           "-O", overlap,
                           "-m", min_lenght,
                           "-e", error,
                           "-a", adapter,
                           raw_fastq,
                           output_file_full_path_fastq,
                           output_file_full_path_log)
  # Run command
  system(cutadapt_string)
  
  # return name of output file
  if (return_name){
    return(output_file_full_path_fastq)
  }
}