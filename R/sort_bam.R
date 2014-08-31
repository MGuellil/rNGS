#' Sort BAM
#'
#'R function to sort BAM files
#'
#'@param input_bam Input BAM file
#'@param sorted_bam Output sorted BAM file
#'@keywords SAMtools
#'@export
#'@import tools
#'@examples
#'sort_bam("input.bam", "output_sorted.bam")


sort_bam <- function(input_bam, sorted_bam){
  # function to preform sort bam file
  sort_string <- paste("samtools sort",
                       input_bam,
                       sorted_bam)
  message("\nSorting BAM for ", input_bam, "\n")
  system(sort_string)
  
}
