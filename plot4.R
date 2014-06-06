getdata <- function() {
  data <- read.csv2("household_power_consumption.txt", colClasses = "character")

  ## Select dates using format DD/MM/YYYY
  data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
  
  ## Append date and time
  data$datetime <- strptime(
    do.call(paste, data[c("Date", "Time")]), "%d/%m/%Y %H:%M:%S"
  )

  ## Convert numeric columns
  data$Global_active_power <- as.numeric(data$Global_active_power)
  data$Voltage <- as.numeric(data$Voltage)
  data$Global_active_power <- as.numeric(data$Global_active_power)
  data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
  data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
  data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
  return(data)
}

## Setup PNG file
png(filename = "plot4.png", height = 480, width = 480)

## Layout the plots in a 2 x 2 grid
par(mfrow = c(2,2))

with(getdata(), 
  {
    ## Create plot at location 1, 1
    plot(datetime, Global_active_power, type = "l", xlab = NA)
    
    ## Create plot a grid location 1, 2
    plot(datetime, Voltage, type = "l", ylab = "Voltage")
    
    ## Create plot a grid location 2, 1
    plot(datetime, Sub_metering_1, type = "l", col = "black",
      xlab = NA, ylab = "Energy sub metering")
    lines(datetime, Sub_metering_2, type = "l", col = "red")
    lines(datetime, Sub_metering_3, type = "l", col = "blue")
    legend("topright", bty = "n", lty = c(1, 1, 1), col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    ## Create plot a grid location 2, 2
    plot(datetime, Global_reactive_power, type = "l")
  }
)
dev.off()

