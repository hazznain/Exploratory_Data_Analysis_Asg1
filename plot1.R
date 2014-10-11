data <- read.table("./dataset/household_power_consumption.txt",header=TRUE,sep=";")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
select <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]
hist(as.numeric(as.character(select$Global_active_power)),col="red",main ="Global Active Power",xlab ="Global Active Power (kilowatts)")  
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()