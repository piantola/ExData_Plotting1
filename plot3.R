## This script read data from file household_power_consumption.txt: 
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## Unzip the file and place it in the same directory that contains plot3.R script

# This section read data from the file
data <- read.csv("household_power_consumption.txt", na.strings = "?", sep = ";")

# Filter and clear the data
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data$DT <- strptime(paste(data$Date,data$Time), "%Y-%m-%d %H:%M:%S", tz = "UTC")
tidy <- rbind(data[data$Date == "2007-02-01",],data[data$Date == "2007-02-02",])
tidy$Sub_metering_1 <- as.numeric(as.character(tidy$Sub_metering_1))
tidy$Sub_metering_2 <- as.numeric(as.character(tidy$Sub_metering_2))
tidy$Sub_metering_3 <- as.numeric(as.character(tidy$Sub_metering_3))

# Plot the data
if(.Platform$OS.type == "unix") { 
  Sys.setlocale("LC_TIME", "en_US.UTF-8") 
} else { 
  Sys.setlocale("LC_TIME", "English") 
}

png("plot3.png", width = 480, height = 480)
plot(tidy$DT,tidy$Sub_metering_1 , type = "l", ylab = "Energy sub metering", xlab = "")
lines(tidy$DT,tidy$Sub_metering_2, col="red")
lines(tidy$DT,tidy$Sub_metering_3, col="blue")
legend("topright", lwd = 2, c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"))
dev.off()

# The output is plot3.png