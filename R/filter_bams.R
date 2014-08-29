#' filter BAM
#'
#'R function to filter BAM files
#'
#'@param sample dataframe row
#'@keywords BAM file
#'@export
#'@import tools
#'@examples
#'filter_bams(sample_data_frame_row)

filter_bams <- function(config_df){
  # filter bam files by a grade of mapping qualities
  
  fastq_file <- config_df[1]
  output_file <- file_path_sans_ext(fastq_file)
  bam_sort_rmdup_file <- paste(output_file, "_sort_rmdup.bam", sep = "")
  bam_sort_rmdup_file_q15 <- paste(output_file, "_sort_rmdup_q15.bam", sep = "")
  bam_sort_rmdup_file_q25 <- paste(output_file, "_sort_rmdup_q25.bam", sep = "")
  bam_sort_rmdup_file_q30 <- paste(output_file, "_sort_rmdup_q30.bam", sep = "")
  
  #filter for mapping quality 15
  map_qual_15_string <- paste("samtools view -q15 -b ",
                              bam_sort_rmdup_file,
                              ">",
                              bam_sort_rmdup_file_q15) 
  system(map_qual_15_string)
  
  #filter for mapping quality 25
  map_qual_25_string <- paste("samtools view -q25 -b ",
                              bam_sort_rmdup_file,
                              ">",
                              bam_sort_rmdup_file_q25)
  system(map_qual_25_string)
  
  #filter for mapping quality 30
  map_qual_30_string <- paste("samtools view -q30 -b ",
                              bam_sort_rmdup_file,
                              ">",
                              bam_sort_rmdup_file_q30)
  system(map_qual_30_string)
}
