#' full_alignment
#'
#'R function to preform full NGS alignment
#'
#'@param sample dataframe row
#'@keywords BWA SAMtools
#'@export
#'@import tools
#'@examples
#'full_alignment("config".csv)

full_alignment <- function(config_file){
  
  alignment_scores_df <- data.frame(Sample_name = character(),
                                    Raw_reads = numeric(),
                                    Aligned_reads_raw = numeric(),
                                    Aligned_reads_rmdup = numeric(),
                                    Aligned_reads_rmdup_q25 = numeric())
  
  samples_to_run_df <- read_samples(config_file)
 
  for (line in 1:nrow(samples_to_run_df)){
    
    # get the current row
    sampleRow <- samples_to_run_df[line,]
    
    #----- collect data 
    # Run cutadapt to get input file for alignments
    input_fastq <- drive_cutadapt(sampleRow$Input_File)
    read_group_info <- sampleRow$Read_Group
    bwa_arguments <- sampleRow$BWA_Arguments
    genome <- sampleRow$Genome
    sai_file <- paste0(file_path_sans_ext(input_fastq),".sai")
    sam_file <- paste0(file_path_sans_ext(input_fastq),".sam")
    bam_file <- paste0(file_path_sans_ext(input_fastq),".bam")
    sorted_bam <- paste0(file_path_sans_ext(input_fastq),"_sorted.bam")
    rmdup_bam <- paste0(file_path_sans_ext(input_fastq),"_sorted_rmdup.bam")
    
    #------- run BWA
    bwa_align(input_fastq, genome, bwa_arguments, sai_file)
    bwa_samse(input_fastq , genome, read_group_info, sai_file, sam_file)
    
    #------- run SAMtools
    sam_to_bam(sam_file, bam_file)
    sort_bam(bam_file, sorted_bam)
    rmdup_bam(sorted_bam, rmdup_bam)

    #------- filter BAM and collect stats
    filter_bam(rmdup_bam)
    alignment_scores_df <- rbind(alignment_scores_df, bam_stats(input_fastq, sampleRow$Input_File))
    
    # write output table 
    output_table <- paste(file_path_sans_ext(config_file),
                          "_output_table.csv", 
                          sep = "")
  }
  
  # ------------ Calculate some percentaged and write table
  alignment_scores_df$Aligned_reads_rmdup_per <- (alignment_scores_df$Aligned_reads_rmdup / alignment_scores_df$Raw_reads) *100
  alignment_scores_df$Aligned_reads_rmdup_q25_per <- (alignment_scores_df$Aligned_reads_rmdup_q25 / alignment_scores_df$Raw_reads) *100
  write.csv(alignment_scores_df, output_table, row.names = FALSE)
}
