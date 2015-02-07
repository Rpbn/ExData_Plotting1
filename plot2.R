setwd("D:/R_Space/ExploratoryAssign1")
alldata <- read.table("household_power_consumption.txt", sep = ";", header = 1, na.strings = "?")

## Changing the date column
alldata$Time <- strptime(paste(alldata$Date, alldata$Time), "%d/%m/%Y %H:%M:%S")

## Select the 2 days required  2007-02-01 and 2007-02-02
twodayfile2 <- alldata[alldata$Date == "1/2/2007" | alldata$Date == "2/2/2007",c("Time","Global_active_power")]

## Generate the PNG
## PNG file with a width of 480 pixels and a height of 480 pixels
## Global Active Power X Frequency

png(filename = "plot2.png", width = 480, height = 480, units = "px")
    plot(twodayfile2$Time,twodayfile2$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()