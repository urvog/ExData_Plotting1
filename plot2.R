## Plot 2
## The file household_power_consumption.txt must be in the same directory
data_raw<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

##Changing column type to date with as.Date() function and subsetting with date interval needed
data_raw$Date<-as.Date(data_raw$Date, format="%d/%m/%Y")
data<-subset(data_raw, Date=="2007-02-01"|Date=="2007-02-02")
data$Time<-strptime(paste(as.character(data$Date), as.character(data$Time), sep = ' '), format = "%Y-%m-%d %H:%M:%S")

##plotting and saving png file
png("plot2.png", width = 480, height = 480)
plot(data$Time, data$Global_active_power, type = "n", xlab = "", ylab = "Global Active Power (kilowatts)")
lines(data$Time, data$Global_active_power)
dev.off()


