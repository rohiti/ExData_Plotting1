setwd("C:/Users/Rohit/Desktop/Data Science/Coursera/Exploratory Data Analysis")
energy <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
energy$Date = as.Date(as.character(energy$Date), format = "%d/%m/%Y")
library(chron)
energy$Time = chron(times. = energy$Time, format = "h:m:s")
my_data = subset(energy, Date == "2007-02-01" | Date == "2007-02-02")
my_data$Global_active_power = as.numeric(as.character(my_data$Global_active_power))
my_data$Sub_metering_1 = as.numeric(as.character(my_data$Sub_metering_1))
my_data$Sub_metering_2 = as.numeric(as.character(my_data$Sub_metering_2))
my_data$Sub_metering_3 = as.numeric(as.character(my_data$Sub_metering_3))
my_data$Voltage = as.numeric(as.character(my_data$Voltage))
my_data$Global_reactive_power = as.numeric(as.character(my_data$Global_reactive_power))
par(mfrow = c(2,2))
plot(x = my_data$Time[order(my_data$Time)], y = my_data$Global_active_power, type = "l", xaxt = 'n', xlab = "", ylab = "Global Active Power (kilowatts)")
axis(1, at = c(0.0, 0.5, 1), labels = c("Thu", "Fri", "Sat"))
plot(x = my_data$Time[order(my_data$Time)], y = my_data$Voltage, type = "l", xaxt = 'n', xlab = "datetime", ylab = "Voltage")
axis(1, at = c(0.0, 0.5, 1), labels = c("Thu", "Fri", "Sat"))
plot(x = my_data$Time[order(my_data$Time)], y = my_data$Sub_metering_1, type = "l", xaxt = 'n', xlab = "", ylab = "Energy sub metering")
lines(x = my_data$Time[order(my_data$Time)], y = my_data$Sub_metering_3, col = "blue")
lines(x = my_data$Time[order(my_data$Time)], y = my_data$Sub_metering_2, col = "red")
legend("topright", lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
axis(1, at = c(0.0, 0.5, 1), labels = c("Thu", "Fri", "Sat"))
plot(x = my_data$Time[order(my_data$Time)], y = my_data$Global_reactive_power, type = "l", xaxt = 'n', xlab = "datetime", ylab = "Global_reactive_power")
axis(1, at = c(0.0, 0.5, 1), labels = c("Thu", "Fri", "Sat"))
dev.copy(png, "plot4.png", height = 480, width = 480, units = "px")
dev.off()
