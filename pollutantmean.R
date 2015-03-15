pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  data_id <-data.frame()
  for (i in id)
  {
    file_name<-paste(directory, "/", sprintf("%03d",i), ".csv", sep="")
    data_id <- rbind( data_id, read.csv(file_name) )
  }
  mean(data_id[[pollutant]], na.rm=TRUE)
}