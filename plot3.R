

loadData <- source("readFile.R")$value

plot3 <- function() {
  data <- loadData("../exdata_data_household_power_consumption/household_power_consumption.txt", "../exdata_data_household_power_consumption/output.txt")
  
  data$dd <- as.POSIXct(data$DateTime)
  
  par(mfrow=c(1,1))
  plot(data$dd, data$Sub_metering_1, type="n", ylab="Energy sub metering", xaxt = "n", xlab="")
  
  points(data$dd, data$Sub_metering_1, type="l")
  points(data$dd, data$Sub_metering_2, type="l", col="red")
  points(data$dd, data$Sub_metering_3, type="l", col="blue")
  
  axis(side=1,at=pretty(data$dd, n=2), labels=format(pretty(data$dd, n=2), "%a"))
  legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd=1, cex=0.7, y.intersp=0.5)
  
  
  dev.copy(png, file="plot3.png", width = 480, height = 480) 
  dev.off()
}




