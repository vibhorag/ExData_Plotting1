
###this is the first plot
library(data.table)
library(plyr)
getwd()
setwd("/Volumes/vibhor-sd/EXPLORATORY_DATA")
unzip("exdata-data-household_power_consumption.zip")
Data <- fread("household_power_consumption.txt",colClasses = "character")
Data$Date <- as.Date(Data$Date,"%d/%m/%Y")
subData <- subset(Data,(Data$Date == "2007-02-01") | (Data$Date=="2007-02-02") )
subData$Global_active_power <- as.numeric(subData$Global_active_power)
subData$Global_active_power
t= data.frame(subData)
t= as.data.frame(subData)
w = table(subData$Global_active_power)
t = as.data.frame(w)
png("plot1.png", height=480, width=480)
hist(subData$Global_active_power, col="red", xlab="Global Active Power (kilowatts)",ylab="Frequency", main="Global Active Power")
dev.off()
