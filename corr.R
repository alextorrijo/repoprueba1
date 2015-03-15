corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  vector<-numeric(0)
  id=1:332
  for (i in id)
  {
    file_name<-paste(directory, "/", sprintf("%03d",i), ".csv", sep="")
    data_read <- read.csv(file_name)
    ncases<-sum(complete.cases(data_read))
    if (ncases >= threshold){
      vector<-c(vector,cor(data_read$nitrate, data_read$sulfate, use="pairwise.complete.obs"))
    }
  }
  vector
}