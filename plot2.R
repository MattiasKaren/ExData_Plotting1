full_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
sub_data <- subset(full_data, Date %in% c("1/2/2007","2/2/2007"))
sub_data$Date <- as.Date(sub_data$Date, format="%d/%m/%Y")
dateTime <- paste(sub_data$Date, sub_data$Time)
dateTime <- setNames(dateTime, "DateTime")
sub_data <- cbind(sub_data, dateTime)

sub_data$dateTime <- as.POSIXct(dateTime)

plot(sub_data$Global_active_power ~ sub_data$dateTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

