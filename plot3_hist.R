###this is the third plot
library(data.table)
library(plyr)
getwd()
setwd("/Volumes/vibhor-sd/EXPLORATORY_DATA")
unzip("exdata-data-household_power_consumption.zip")
Data <- fread("household_power_consumption.txt",colClasses = "character")
Data$Date_time <- paste(Data$Date,Data$Time)
Data$Date <- as.Date(Data$Date,"%d/%m/%Y")
subData <- subset(Data,(Data$Date == "2007-02-01") | (Data$Date=="2007-02-02") )
subData <- as.data.frame(subData)
subData$Global_active_power = as.numeric(subData$Global_active_power)

##figure
png("plot3.png", height=480, width=480)
with(subData,plot(subData$Date_time,subData$Sub_metering_1,type ="l",col="black", xlab=NA,
ylab="Energy sub metering"))
with(subData,lines(subData$Date_time,subData$Sub_metering_2,type ="l",col="red", xlab=NA,
ylab="Energy sub metering"))
with(subData,lines(subData$Date_time,subData$Sub_metering_3,type ="l",col="blue", xlab=NA,
ylab="Energy sub metering")))
#add legend
legend("topright", lwd=0, col = c("black", "red", "blue"),
legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

