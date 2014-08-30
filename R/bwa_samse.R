#' BWA samse
#'
#'R function to run the BWA "aln" method on our sample dataframe
#'
#'@param fastq_file - path of fastq file to use in alignment
#'@param genome - path of genome to use in alignment
#'@param read_groups - read group information for alignment
#'@param sai_file - sai file for alignment
#'@param sam_file - sam file for alignment
#'@keywords BWA samse
#'@export
#'@import tools
#'@examples
#'bwa_samse(sample_data_frame_row)

bwa_samse <- function(fastq_file, genome, read_groups, sai_file, sam_file){  
  
  # form my BWA samse string
  bwa_samse_string <- paste("bwa samse -r",
                            read_groups,
                            genome,
                            sai_file,
                            fastq_file,
                            ">",
                            sam_file)
  
  message("\nRunning BWA samse for ", fastq_file, "\n")
  system(bwa_samse_string)
}
