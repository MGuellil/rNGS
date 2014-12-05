#' Bam stats
#'
#'R function to collect our sample stats
#'
#'@param fastq_file input sample fastq files
#'@keywords BAM file
#'@export
#'@import tools stringr
#'@examples
#'bam_stats(fastq_file)

bam_stats <- function(fastq_file_cutadapt, fastq_raw){
  # generate a dataframe with our alignment stats
  
  #------- stats for fastq file
  message("Collecting Stats for ", fastq_file, "\n")
  
  #only want the sample name
  fastq_file_base <- strsplit(file_path_sans_ext(basename(fastq_file)), "_")[[1]][1]
  word_count_string <- paste("wc -l",
                             fastq_raw)
  line_count_fastq_file <- system(word_count_string, inter = TRUE)
  line_count_fastq_file_trimed <- str_trim(line_count_fastq_file)
  line_numbers <- as.numeric(strsplit(line_count_fastq_file_trimed, " ")[[1]][1])
  
  raw_reads = line_numbers / 4
  
  #---- stats for bam file 
  output_file <- file_path_sans_ext(fastq_file)
  bam_file <- paste(output_file, ".bam", sep = "")
  bam_stat_line = paste("samtools flagstat",
                        bam_file)
  bam_stats <- system(bam_stat_line, intern = TRUE)
  bam_score <- as.numeric(strsplit(bam_stats[3], " ")[[1]][1])
  
  #---- stats for rmdup bam
  bam_sort_rmdup_file <- paste(output_file, "_sorted_rmdup.bam", sep = "")
  bam_rmdup_stat_line = paste("samtools flagstat",
                              bam_sort_rmdup_file)
  bam_rmdup_stats <- system(bam_rmdup_stat_line, intern = TRUE)
  bam_rmdup_score <- as.numeric(strsplit(bam_rmdup_stats[3], " ")[[1]][1])
  
  #----- stats for other qulaities needs a loop
  
  bam_sort_rmdup_file_q15 <- paste(output_file, "_sorted_rmdup_q15.bam", sep = "")
  bam_sort_rmdup_file_q25 <- paste(output_file, "_sorted_rmdup_q25.bam", sep = "")
  bam_sort_rmdup_file_q30 <- paste(output_file, "_sorted_rmdup_q30.bam", sep = "")
  
  bam_rmdup_q15_stat_line = paste("samtools flagstat",
                                  bam_sort_rmdup_file_q15)
  bam_rmdup_q25_stat_line = paste("samtools flagstat",
                                  bam_sort_rmdup_file_q25)
  bam_rmdup_q30_stat_line = paste("samtools flagstat",
                                  bam_sort_rmdup_file_q30)
  
  bam_rmdup_q15_stats <- system(bam_rmdup_q15_stat_line, intern = TRUE)
  bam_rmdup_q25_stats <- system(bam_rmdup_q25_stat_line, intern = TRUE)
  bam_rmdup_q30_stats <- system(bam_rmdup_q30_stat_line, intern = TRUE)
  
  bam_rmdup_q15_score <- as.numeric(strsplit(bam_rmdup_q15_stats[3], " ")[[1]][1])
  bam_rmdup_q25_score <- as.numeric(strsplit(bam_rmdup_q25_stats[3], " ")[[1]][1])
  bam_rmdup_q30_score <- as.numeric(strsplit(bam_rmdup_q30_stats[3], " ")[[1]][1])
  
  
  #--- collect final score and report
  
  final_score = data.frame(Sample_name = fastq_file_base,
                           Raw_reads = raw_reads, 
                           Aligned_reads_raw = bam_score, 
                           Aligned_reads_rmdup = bam_rmdup_score,
                           Aligned_reads_rmdup_q15 = bam_rmdup_q15_score,
                           Aligned_reads_rmdup_q25 = bam_rmdup_q25_score,
                           Aligned_reads_rmdup_q30 = bam_rmdup_q30_score)
  
  return(final_score)
}
