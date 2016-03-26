## Plot 1
## The file household_power_consumption.txt must be in the same directory

data_raw<-read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

##Changing column type to date with as.Date() function and subsetting with date interval needed
data_raw$Date<-as.Date(data_raw$Date, format="%d/%m/%Y")
data<-subset(data_raw, Date=="2007-02-01"|Date=="2007-02-02")

##plotting and saving png file
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()


