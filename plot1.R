full_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
sub_data <- subset(full_data, Date %in% c("1/2/2007","2/2/2007"))
sub_data$Date <- as.Date(sub_data$Date, format="%d/%m/%Y")
dim(sub_data)
View(sub_data)

hist(sub_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts")

