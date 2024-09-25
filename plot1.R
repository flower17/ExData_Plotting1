
loadData <- source("readFile.R")$value

plot1 <- function() {
  data <- loadData("../exdata_data_household_power_consumption/household_power_consumption.txt", "../exdata_data_household_power_consumption/output.txt")
  
  par(mfrow=c(1,1))
  hist(data$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
  
  dev.copy(png, file="plot1.png", width = 480, height = 480) 
  dev.off()
}
