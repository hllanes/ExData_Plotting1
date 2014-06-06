data <- read.csv2("household_power_consumption.txt", colClasses = "character")
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
data$Date <- as.Date(data$Date, "%d/%m/%Y")
png(filename = "plot1.png", height = 480, width = 480)
hist(as.numeric(data$Global_active_power), 
     col = "red",
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency")
axis(side=1, at=c(0, 2, 4, 6))
dev.off()
