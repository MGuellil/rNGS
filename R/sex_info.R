#' Sex Info
#'
#'R function to try to sex an aDNA sample by using alignment to autosomes 
#'and the X-Chromosome
#'
#'@param bam_file BAM f alignment
#'@keywords SAMtools
#'@import ggplot2
#'@export
#'@examples
#'sex_info(bam_file)

sex_info <- function(bam_file, need_index = TRUE, draw_plot=TRUE){
  
  ## --------- index bam file if needed
  if (need_index){
    message("indexing ", bam_file)
    # index BAM file
    system(paste("samtools index",
                 bam_file)
    )
  }else{
    message("Skipping indexing")
  }
  
  ## ------- generate dataframe
  
  # Read idx stats
  idx_stats <- system(paste("samtools idxstats", 
                       "~/Desktop/repeats/KRP_merge.bam"), 
                 intern =TRUE)
  
  # use string split and a lambda function to split the results on tabs
  idx_mx <- t(data.frame(sapply(test, function (x) (strsplit(x, "\t")))))
  
  # create the final dataframe
  rownames(idx_mx) <- NULL
  idx_df <- data.frame(idx_mx, stringsAsFactors = FALSE)
  colnames(idx_df) <- c("Chr", "Chr_Length", "Aligned_Reads", "Unaligned_Reads")
  idx_df$Chr_Length <- as.numeric(idx_df$Chr_Length)
  idx_df$Aligned_Reads <- as.numeric(idx_df$Aligned_Reads)

  # filter the final 
  idx_df <- idx_df[-nrow(idx_df),]
  
  ## --------- plot the results if draw_plot is TRUE
  # Use ggplot2 to plot the results
  if (draw_plot){
    ggplot2::ggplot(idx_df, aes(Chr_Length, Aligned_Reads)) + 
      ggplot2::geom_text(aes(label=Chr), size=4, vjust=0) + 
      ggplot2::geom_smooth(method=lm, se=FALSE) 
    
  }
}