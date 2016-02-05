#read in the reduced data (only the two relevant dates)
electric <- read.csv("household_power_consumption_reduced.csv", header = TRUE)
#create a combined DateTime column
electric$DateTime <- paste(electric$Date, electric$Time)
electric$DateTime <- as.POSIXct(electric$DateTime, format = "%d/%m/%Y %H:%M:%S")
#prepare the graphics device
png("plot2.png", width = 480, height = 480, units = "px")
#plot
plot(electric$Global_active_power ~ electric$DateTime, type = "l", ylab = "Global Active Power (Kilowatts)", xlab = "")
#close the graphics device
dev.off()