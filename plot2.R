#set working directory
setwd("C:/Users/Kuan/Desktop/exdata/")

library(data.table)

## Getting full dataset
DT1 <- read.csv("./household_power_consumption.txt", header=TRUE, sep=';', na.strings="?",nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')

DT1<-fread("./household_power_consumption.txt", na.strings="?")

DT1$Date <- as.Date(DT1$Date, format="%d/%m/%Y")

## Subsetting the data
DT1.filter <- subset(DT1, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(DT1)

## Converting dates
datetime <- paste(as.Date(DT1.filter$Date), DT1.filter$Time)
DT1.filter$Datetime <- as.POSIXct(datetime)

#output histogram to PNG
plot(DT1.filter$Global_active_power~DT1.filter$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()
