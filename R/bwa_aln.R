 #' BWA align
 #'
 #'R function to run the BWA "aln" method
 #'
 #'@param fastq_file Fastq file for alignment
 #'@param genome BWA indexed genome to use in alignment
 #'@param bwa_arguments Arguments for bwa
 #'@param sai_file Output sai file
 #'@keywords BWA aln
 #'@export
 #'@examples
 #'bwa_align("fastq.fa", "genome.fa", "-t 4", "ouput.sai")
 
bwa_align <- function(fastq_file, genome, bwa_arguments, sai_file){
  
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
