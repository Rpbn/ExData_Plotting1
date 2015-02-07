# Read the Datafile (raw data)
alldata <- read.table("household_power_consumption.txt", sep = ";", header = 1, na.strings = "?")

## Changing the date column
alldata$Time <- strptime(paste(alldata$Date, alldata$Time), "%d/%m/%Y %H:%M:%S")

## Select the 2 days required  2007-02-01 and 2007-02-02
twodayfile4 <- alldata[alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007",c("Time","Global_active_power","Sub_metering_1","Sub_metering_2","Sub_metering_3","Voltage","Global_reactive_power")]

png(filename = "plot4.png", width = 480, height = 480, units = "px")
# Select a frame with 4 positions.
par(mfrow = c(2,2))
# Graph 2
    plot(twodayfile4$Time,twodayfile4$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
# Graph 4
    plot(twodayfile4$Time,twodayfile4$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
# Graph 3
    plot(twodayfile4$Time, c(twodayfile4$Sub_metering_1), type = "l", xlab = "", ylab = "Energy sub metering", col = "black", legend = "Sub 1")
    lines(twodayfile4$Time, c(twodayfile4$Sub_metering_2), col = "red")
    lines(twodayfile4$Time, c(twodayfile4$Sub_metering_3), col = "blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = .75, cex = .75)
# Graph 5
    plot(twodayfile4$Time,twodayfile4$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
par(mfrow = c(1,1)) # Goes Back to the normal setting 

dev.off()