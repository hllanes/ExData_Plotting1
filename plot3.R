data <- read.csv2("household_power_consumption.txt", colClasses = "character")
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
data$DateTime <- strptime(do.call(paste, data[c("Date", "Time")]), 
  "%d/%m/%Y %H:%M:%S")

png(filename = "plot3.png", height = 480, width = 480)
with(data, 
  {
    plot(DateTime, as.numeric(Sub_metering_1), type = "l", col = "black",
      xlab = NA, ylab = "Energy sub metering")
    lines(DateTime, as.numeric(Sub_metering_2), type = "l", col = "red")
    lines(DateTime, as.numeric(Sub_metering_3), type = "l", col = "blue")
    legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  }
)
dev.off()

