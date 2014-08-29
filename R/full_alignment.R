#' full_alignment
#'
#'R function to preform full NGS alignment
#'
#'@param sample dataframe row
#'@keywords BWA SAMtools
#'@export
#'@import tools
#'@examples
#'full_alignment(sample_data_frame_row)

full_alignment <- function(config_file){
  
  alignment_scores_df <- data.frame(Sample_name = character(),
                                    Raw_reads = numeric(),
                                    Aligned_reads_raw = numeric(),
                                    Aligned_reads_rmdup = numeric(),
                                    Aligned_reads_rmdup_q15 = numeric(),
                                    Aligned_reads_rmdup_q25 = numeric(),
                                    Aligned_reads_rmdup_q30 = numeric())
  
  samples_to_run_df <- read_samples(config_file)
  
  for (line in samples_to_run_df){
    # Helper function to run a complete alignme
    bwa_align(line)
    bwa_samse(line)
    sam_to_bam(line)
    sort_bam(line)
    rmdup_bam(line)
    filter_bams(line)
    alignment_scores_df <- rbind(alignment_scores_df, collect_stats(line))
    
    # write output table 
    output_table <- paste(file_path_sans_ext(config_file),
                          "_output_table.txt", 
                          sep = "")
    write.csv(alignment_scores_df, output_table, row.names = FALSE)
    
  }
}