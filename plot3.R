setwd("D:/R_Space/ExploratoryAssign1")
alldata <- read.table("household_power_consumption.txt", sep = ";", header = 1, na.strings = "?")

## Changing the date column
alldata$Time <- strptime(paste(alldata$Date, alldata$Time), "%d/%m/%Y %H:%M:%S")

## Select the 2 days required  2007-02-01 and 2007-02-02
twodayfile3 <- alldata[alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007",c("Time","Sub_metering_1","Sub_metering_2","Sub_metering_3")]

## Generate the PNG
## PNG file with a width of 480 pixels and a height of 480 pixels
## Legend
## Sub_meter

png(filename = "plot3.png", width = 480, height = 480)
    plot(twodayfile3$Time, c(twodayfile3$Sub_metering_1), type = "l", xlab = "", ylab = "Energy sub metering", col = "black", legend = "Sub 1")
    lines(twodayfile3$Time, c(twodayfile3$Sub_metering_2), col = "red")
    lines(twodayfile3$Time, c(twodayfile3$Sub_metering_3), col = "blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = .75, cex = .75)
dev.off()
