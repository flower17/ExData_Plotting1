
loadData <- source("readFile.R")$value

plot2 <- function() {
  data <- loadData("../exdata_data_household_power_consumption/household_power_consumption.txt", "../exdata_data_household_power_consumption/output.txt")
  
  data$dd <- as.POSIXct(data$DateTime)
  
  par(mfrow=c(1,1))
  plot(data$dd, data$Global_active_power, type="l", xaxt = "n", ylab="Global Active Power (kilowatts)", xlab="", main="")
  axis(side=1,at=pretty(data$dd, n=2), labels=format(pretty(data$dd, n=2), "%a"))
  
  dev.copy(png, file="plot2.png", width = 480, height = 480) 
  dev.off()
}
