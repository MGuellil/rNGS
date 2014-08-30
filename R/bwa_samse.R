#' BWA samse
#'
#'R function to run the BWA "samse"
#'
#'@param fastq_file Input fastq file
#'@param genome Genome for alignment
#'@param read_groups Read group information for alignment
#'@param sai_file Input sai file
#'@param sam_file Output sam file
#'@keywords BWA samse
#'@export
#'@examples
#'bwa_samse("fastq.fa", "genome.fa", 
#'"read group string", "input.sai", "output.sam")

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
