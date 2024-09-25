
loadData <- source("readFile.R")$value

plot4 <- function() {
  data <- loadData("../exdata_data_household_power_consumption/household_power_consumption.txt", "../exdata_data_household_power_consumption/output.txt")
  
  data$dd <- as.POSIXct(data$DateTime)
  
  par(mfrow=c(2,2), mar = c(4, 4, 1, 1.5), oma = c(0, 0, 0, 0))
  
  ## top left plot
  plot(data$dd, data$Global_active_power, type="l", xaxt = "n", ylab="Global Active Power", xlab="", main="")
  axis(side=1,at=pretty(data$dd, n=2), labels=format(pretty(data$dd, n=2), "%a"))
  
  ## top right
  plot(data$dd, data$Voltage, type="l", xaxt = "n", yaxt = "n", ylab="Voltage", xlab="datetime", main="")
  axis(side=1,at=pretty(data$dd, n=2), labels=format(pretty(data$dd, n=2), "%a"))
  axis(side=2,at=pretty(data$Voltage, n=6), labels=pretty(data$Voltage, n=6))
  
  ## bottom left
  plot(data$dd, data$Sub_metering_1, type="n", ylab="Energy sub metering", xaxt = "n", xlab="")
  
  points(data$dd, data$Sub_metering_1, type="l")
  points(data$dd, data$Sub_metering_2, type="l", col="red")
  points(data$dd, data$Sub_metering_3, type="l", col="blue")
  
  text <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  axis(side=1,at=pretty(data$dd, n=2), labels=format(pretty(data$dd, n=2), "%a"))
  legend("topright", col=c("black", "red", "blue"), legend=text, lty = 1, lwd=1, cex=0.8, bty="n", y.intersp=0.6, text.width = strwidth(text)[1]*0.43) ##text.width = strwidth(text)[1]*0.1
  
  ## bottom right
  plot(data$dd, data$Global_reactive_power, type="l", xaxt = "n", yaxt = "n", ylab="Global_reactive_power", xlab="datetime", main="")
  axis(side=1,at=pretty(data$dd, n=2), labels=format(pretty(data$dd, n=2), "%a"))
  axis(side=2,at=pretty(data$Global_reactive_power, n=5), labels=pretty(data$Global_reactive_power, n=5))
  
  dev.copy(png, file="plot4.png", width = 480, height = 480) 
  dev.off()
}
