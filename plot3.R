data <- read.csv("./dataset/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
select <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]
timestamp <- paste(as.Date(select$Date), select$Time)
select$timestamp <- as.POSIXct(timestamp)
with(select,{ plot(Sub_metering_1~timestamp, type="l",
                ylab="Energy sub metering", xlab="")
                lines(Sub_metering_2~timestamp,col="red")
                lines(Sub_metering_3~timestamp,col="blue")
                })
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, text.width = strwidth("            Sub_metering_2"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()