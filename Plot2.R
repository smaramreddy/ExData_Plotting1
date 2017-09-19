setwd("C:/Users/s.maramreddy/OneDrive - Accenture/Personal/R/")
install.packages("sqldf")
library(sqldf)

fulldata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data1 <- subset(fulldata, Date %in% c("1/2/2007","2/2/2007"))
datetime <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

data2 <- data1$Global_active_power
data3 <- as.numeric(as.character(data2))

png("plot2.png",width=480,height=480)



plot(datetime, data3, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()