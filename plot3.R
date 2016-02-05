#read in the reduced data (only the two relevant dates)
electric <- read.csv("household_power_consumption_reduced.csv", header = TRUE)
#create a combined DateTime column
electric$DateTime <- paste(electric$Date, electric$Time)
electric$DateTime <- as.POSIXct(electric$DateTime, format = "%d/%m/%Y %H:%M:%S")
#prepare the graphics device
png("plot3.png", width = 480, height = 480, units = "px")
#plot
plot(electric$Sub_metering_1 ~ electric$DateTime, type = "l", ylab = "Energy sub metering", xlab = "")
points(electric$Sub_metering_2 ~ electric$DateTime, type = "l", col = "red")
points(electric$Sub_metering_3 ~ electric$DateTime, type = "l", col = "blue")
#close the graphics device
dev.off()