 #' Read Samples
 #'
 #' This function generates a dataframe to use for the NGS alignment
 #' @param config file in csv format
 #' @keywords NGS BWA
 #' @export
 #' @examples
 #' read_samples(config_file_csv)


read_samples <- function(config_file){
  # function read_samples - reads the config csv with the samples
  # to align creates a df for use with the rest of the program
  #
  # Arguments
  # ==========
  # config_file - file to read in csv format
  #
  # Returns
  # =======
  # data.frame samples_to_run_df - dataframe with info for the alignment
  #
  
  samples_df <- read.csv(config_file, as.is = TRUE)
  number_of_samples_read <- length(samples_df[,"Sample.Name"])
  
  # tell the user how many samples we have read
  message("\nRead ", number_of_samples_read, "sample/s for analysis\n") 
  
  return(samples_df)
}
