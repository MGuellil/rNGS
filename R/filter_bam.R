#' filter BAM
#'
#'R function to filter BAM files
#'
#'@param sort_rmdup_bam Input deduped and sorted bam file
#'@keywords BAM file
#'@export
#'@import tools
#'@examples
#'filter_bams("input_sort_rmdup.bam")

filter_bam <- function(sort_rmdup_bam, map_qualities=c("15", "25", "30")){
  
  # base bam file
  bam_base <- file_path_sans_ext(sort_rmdup_bam)
  
  # filter our BAM files for each quality
  for (each in map_qualities){
    
    # Tell the user what we are up to
    message("Filtering ", sort_rmdup_bam, " for qual ", each, "\n")
    
    # get the files sorted
    original_bam <- sort_rmdup_bam
    output_bam <- paste0(bam_base, "_q", each, ".bam")

    # do the filtering
    filter_string <- sprintf("samtools view -q %s -b %s > %s",
                             each,
                             original_bam,
                             output_bam)
  
    system(filter_string)
  }
}