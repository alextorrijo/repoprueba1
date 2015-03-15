complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  total<-length(id)
  complete_data <-data.frame(id=integer(total),nobs=integer(total))
  index=1
  for (i in id)
  {
    file_name<-paste(directory, "/", sprintf("%03d",i), ".csv", sep="")
    data_read <- read.csv(file_name)
    ncases<-sum(complete.cases(data_read))
    complete_data$id[index]<-i
    complete_data$nobs[index]<-ncases
    index=index+1
  }
  complete_data
  
}