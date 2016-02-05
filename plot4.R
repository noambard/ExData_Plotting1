#read in the reduced data (only the two relevant dates)
electric <- read.csv("household_power_consumption_reduced.csv", header = TRUE)
#create a combined DateTime column
electric$DateTime <- paste(electric$Date, electric$Time)
electric$DateTime <- as.POSIXct(electric$DateTime, format = "%d/%m/%Y %H:%M:%S")
#prepare the graphics device
png("plot4.png", width = 480, height = 480, units = "px")
#setup for 2x2 display
par(mfrow = c(2,2))
#plot
plot(electric$Global_active_power ~ electric$DateTime, type = "l", ylab = "Global Active Power (Kilowatts)", xlab = "")
plot(electric$Voltage ~ electric$DateTime, type = "l", ylab = "Voltage", xlab = "")
plot(electric$Sub_metering_1 ~ electric$DateTime, type = "l", ylab = "Energy sub-metering", xlab = "")
points(electric$Sub_metering_2 ~ electric$DateTime, type = "l", col = "red")
points(electric$Sub_metering_3 ~ electric$DateTime, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), pch = "-", legend = c("sub-metering 1", "sub-metering 2", "sub-metering 3"))
plot(electric$Global_reactive_power ~ electric$DateTime, type = "l", ylab = "Global Reactive Power", xlab = "")
#close the graphics device
dev.off()