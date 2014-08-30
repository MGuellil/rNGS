 #' BWA align
 #'
 #'R function to run the BWA "aln" method on our sample dataframe
 #'
 #'@param fastq_file - path of fastq file to use in alignment
 #'@param genome - path of genome to use in alignment
 #'@param bwa_arguments - arguments for bwa
 #'@keywords BWA aln
 #'@export
 #'@examples
 #'bwa_align("fastq.fa", "genome.fa", "-t 4")
 
bwa_align <- function(fastq_file, genome, bwa_arguments){
  
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
