#read in the reduced data (only the two relevant dates)
electric <- read.csv("household_power_consumption_reduced.csv", header = TRUE)
#prepare the graphics device
png("plot1.png", width = 480, height = 480, units = "px")
#plot
hist(electric$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
#close the graphics device
dev.off()