#' SAM to BAM
#'
#'R function to convert from SAM to BAM files
#'
#'@param sam_file - Input SAM file
#'@param bam_file - Output BAM file
#'@keywords SAMtools
#'@export
#'@examples
#'sam_to_bam(sample_data_frame_row)


sam_to_bam <- function(sam_file, bam_file){
  
  # generate string for comand
  sam_bam_string <- paste("samtools view -Sb",
                          sam_file,
                          ">",
                          bam_file)
  
  message("\nSAM to BAM conversion for ", fastq_file, "\n")
  system(sam_bam_string)
}
