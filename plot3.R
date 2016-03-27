## Plot 3
## The file household_power_consumption.txt must be in the same directory
data_raw<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

##Changing column type to date with as.Date() function and subsetting with date interval needed
data_raw$Date<-as.Date(data_raw$Date, format="%d/%m/%Y")
data<-subset(data_raw, Date=="2007-02-01"|Date=="2007-02-02")
data$Time<-strptime(paste(as.character(data$Date), as.character(data$Time), sep = ' '), format = "%Y-%m-%d %H:%M:%S")

##plotting and saving png file
png("plot3.png", width = 480, height = 480)
plot(data$Time, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(data$Time, data$Sub_metering_1, col = "black")
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")
legend("topright", col = c("black","red","blue"), lty = 1, legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) #imprime leyenda
dev.off()
