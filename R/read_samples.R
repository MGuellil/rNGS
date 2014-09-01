 #' Read Samples
 #'
 #' This function generates a dataframe to use for the NGS alignment
 #' @param config file in csv format
 #' @keywords NGS BWA
 #' @export
 #' @examples
 #' read_samples(config_file_csv)


read_samples <- function(config_file){

  samples_df <- read.csv(config_file, as.is = TRUE)
  number_of_samples_read <- nrow(samples_df)
  
  # tell the user how many samples we have read
  message("\nRead ", number_of_samples_read, " sample/s for analysis\n") 
  
  return(samples_df)
}
