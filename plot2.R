data <- read.csv("./dataset/household_power_consumption.txt", header=TRUE, sep=';', na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
select <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]
timestamp <- paste(as.Date(select$Date), select$Time)
select$timestamp <- as.POSIXct(timestamp)
with(select,plot(Global_active_power~timestamp, type="l",
                 ylab="Global Active Power (kilowatts)", xlab=""))
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()