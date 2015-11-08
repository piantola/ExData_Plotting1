## This script read data from file household_power_consumption.txt: 
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## Unzip the file and place it in the same directory that contains plot2.R script

# This section read data from the file
data <- read.csv("household_power_consumption.txt", na.strings = "?", sep = ";")

# Filter and clear the data
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data$DT <- strptime(paste(data$Date,data$Time), "%Y-%m-%d %H:%M:%S", tz = "UTC")
tidy <- rbind(data[data$Date == "2007-02-01",],data[data$Date == "2007-02-02",])
tidy$Global_active_power <- as.numeric(as.character(tidy$Global_active_power))

# Plot the data
if(.Platform$OS.type == "unix") { 
  Sys.setlocale("LC_TIME", "en_US.UTF-8") 
} else { 
  Sys.setlocale("LC_TIME", "English") 
}

png("plot2.png", width = 480, height = 480)
plot(tidy$DT,tidy$Global_active_power, type = "l", ylab = "Global Active Power(kilowatts)", xlab = "")
dev.off()

# The output is plot2.png