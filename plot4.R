data <- read.csv("./dataset/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
select <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]
timestamp <- paste(as.Date(select$Date), select$Time)
select$timestamp <- as.POSIXct(timestamp)
par(mfrow=c(2,2), mar=c(4,4,3,2), oma=c(0,0,0,0))
with(select,{
  
  plot(Global_active_power~timestamp, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  
  plot(Voltage~timestamp, type="l",
       ylab="Voltage (volt)", xlab="datetime")
  
  plot(Sub_metering_1~timestamp, type="l",
                   ylab="Energy sub metering", xlab="")
              lines(Sub_metering_2~timestamp,col="red")
              lines(Sub_metering_3~timestamp,col="blue")
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, text.width = strwidth("       Sub_metering_2"), 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex= 0.8, bty = "n")
  
  plot(Global_reactive_power~timestamp, type="l", xlab="datetime", cex.axis=0.9)
  #axis(side = 2, at= c("0.0","0.1","0.2","0.3","0.4","0.5"))
  
})

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
par(mfrow=c(1,1))