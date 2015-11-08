## This script read data from file household_power_consumption.txt: 
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## Unzip the file and place it in the same directory that contains plot1.R script

# This section read data from the file
data <- read.csv("household_power_consumption.txt", na.strings = "?", sep = ";")

# Filter and clear the data
data$Date <- as.Date(data$Date,"%d/%m/%Y")
tidy <- rbind(data[data$Date == "2007-02-01",],data[data$Date == "2007-02-02",])
tidy$Global_active_power <- as.numeric(as.character(tidy$Global_active_power))

# Plot the histogram
png("plot1.png", width = 480, height = 480)
hist(tidy$Global_active_power, xlab = "Global Active Power(kilowatts)", col = "red", main = "Global Active Power")
dev.off()

# The output is plot1.png