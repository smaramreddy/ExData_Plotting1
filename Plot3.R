setwd("C:/Users/s.maramreddy/OneDrive - Accenture/Personal/R/")
install.packages("sqldf")
library(sqldf)

fulldata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data1 <- subset(fulldata, Date %in% c("1/2/2007","2/2/2007"))
datetime <- strptime(paste(data1$Date, data1$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot3.png",width=480,height=480)


plot(datetime, data1$Sub_metering_1, type="l", xlab="", ylab="Energy Sub-Metering", col="green", ylim=c(0,40))
par(new=TRUE)
plot(datetime, data1$Sub_metering_2, type="l", xlab="", ylab="Energy Sub-Metering", col="red", ylim=c(0,40))
par(new=TRUE)
plot(datetime, data1$Sub_metering_3, type="l", xlab="", ylab="Energy Sub-Metering", col="blue", ylim=c(0,40))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("green","red","blue"))

dev.off()