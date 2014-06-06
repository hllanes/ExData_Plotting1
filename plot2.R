data <- read.csv2("household_power_consumption.txt", colClasses = "character")
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
data$DateTime <- strptime(
    do.call(paste, data[c("Date", "Time")]), "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png", height = 480, width = 480)
plot(data$DateTime, as.numeric(data$Global_active_power), type = "l", 
    xlab = NA, ylab = "Global Active Power (kilowatts)")
dev.off()
