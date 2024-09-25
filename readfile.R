readFileLines <- function(fileIn, fileOut) {
  inputFile <- file(fileIn, "r")
  outputFile <- file(fileOut)
  
  lines <- c()
  read <- 0
  
  ## read header
  line <- readLines(inputFile, n = 1)
  lines[1] <- line
  
  
  ## read rest of the document and only write lines with specific dates
  while(TRUE) {
    line <- readLines(inputFile, n = 1)
    read <- read + 1
    if (grepl("1/2/2007", line) || 
        grepl("2/2/2007", line)) {
      lines[length(lines) + 1] <- line
    }
    
    if (grepl("3/2/2007", line)) {
      break
    }
  }

  if (length(lines) > 1) {
    writeLines(lines, outputFile) 
  }
  close(inputFile)
  close(outputFile)
  
  ## read the output file into data frame:
  data <- read.table("../exdata_data_household_power_consumption/output.txt", sep=";", header=TRUE)
  
  
  ## convert date and time columns to DateTime class:
  data$DateTime <- paste(data$Date, data$Time)
  data$DateTime <- strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")
  
  ## remove unused character Date and Time columns:
  data <- subset(data, select = -c(Date, Time))
}