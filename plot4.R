## Plot 3
## The file household_power_consumption.txt must be in the same directory
data_raw<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

##Changing column type to date and Time with as.Date() and strptime() function and subsetting with date interval needed
data_raw$Date<-as.Date(data_raw$Date, format="%d/%m/%Y")
data<-subset(data_raw, Date=="2007-02-01"|Date=="2007-02-02")
data$Time<-strptime(paste(as.character(data$Date), as.character(data$Time), sep = ' '), format = "%Y-%m-%d %H:%M:%S")

##plotting and saving png file
png("plot4.png", width = 480, height = 480)

#ploting four graphics
par(mfrow = c(2,2))

#plot 1
plot(data$Time, data$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(data$Time, data$Global_active_power)

#plot 2
plot(data$Time, data$Voltage, type = "n", xlab = "datetime", ylab = "Voltage")
lines(data$Time, data$Voltage)

#plot 3
plot(data$Time, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(data$Time, data$Sub_metering_1, col = "black")
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")
legend("topright", col = c("black","red","blue"), lty = 1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) #imprime leyenda

#plot 4
plot(data$Time, data$Global_reactive_power, type = "n", xlab = "datetime", ylab = "Global_reactive_power")
lines(data$Time, data$Global_reactive_power)


dev.off()
