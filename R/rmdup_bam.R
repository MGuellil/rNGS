#' rmdup BAM
#'
#'R function to remove BAM file duplicates
#'
#'@param input_sorted_bam
#'@param output_rmdup_bam
#'@keywords SAMtools
#'@export
#'@import tools
#'@examples
#'rmdup_bam(input_sorted.bam, output_rmdup.bam)


rmdup_bam <- function(input_sorted_bam, output_rmdup_bam){
  rmdup_string <- paste("samtools rmdup -s",
                        input_sorted_bam,
                        output_rmdup_bam)
  message("Removing duplicates for ", input_sorted_bam, "\n")
  system(rmdup_string)
}
