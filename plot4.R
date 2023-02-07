
full_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
sub_data <- subset(full_data, Date %in% c("1/2/2007","2/2/2007"))
sub_data$Date <- as.Date(sub_data$Date, format="%d/%m/%Y")
dateTime <- paste(sub_data$Date, sub_data$Time)
dateTime <- setNames(dateTime, "DateTime")
sub_data <- cbind(sub_data, dateTime)

sub_data$dateTime <- as.POSIXct(dateTime)

#Creating a 2x2 environment for four plots:
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))


#Repeating plot 2:
plot(sub_data$Global_active_power ~ sub_data$dateTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
#Recreating plot 2 but with Voltage instead:
plot(sub_data$Voltage ~ sub_data$dateTime, type = "l", ylab = "Voltage", xlab = "datetime")

#Repeating plot 3:
plot(sub_data$Sub_metering_1 ~ sub_data$dateTime, type = "l", ylab = "Energy sub metering", xlab = "")
lines(sub_data$Sub_metering_2 ~ sub_data$dateTime, col = "red")
lines(sub_data$Sub_metering_3 ~ sub_data$dateTime, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Recreating plot 2 but with Global reactive power instead:
plot(sub_data$Global_reactive_power ~ sub_data$dateTime, type = "l", ylab = "Global Reactive Power (kilowatts)", xlab = "datetime")


## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()

