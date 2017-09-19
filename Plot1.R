setwd("C:/Users/s.maramreddy/OneDrive - Accenture/Personal/R/")
install.packages("sqldf")
library(sqldf)

fulldata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data1 <- subset(fulldata, Date %in% c("1/2/2007","2/2/2007"))

data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
png("plot1.png",width=480,height=480)
hist(data1$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
##png("plot1.png", width=480, height=480)
dev.off()