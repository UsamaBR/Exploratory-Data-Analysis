logData <- read.csv(file = "household_power_consumption.txt", 
                    sep = ";")

newData <- subset(x = logData, 
                  Date == "1/2/2007" | Date == "2/2/2007")

newData[,3:9] <- sapply(newData[,3:9], as.numeric)

dateTime <- strptime(paste(newData$Date, newData$Time), "%d/%m/%Y %H:%M:%S", tz = "GMT")

newData <- cbind(newData, dateTime)

str(newData)

png("Plot4.png", 
    width = 480, 
    height = 480)

par(mfrow = c(2,2))

with(newData, plot(x = dateTime, 
                   y = Global_active_power, 
                   type = "l",
                   xlab = "",
                   ylab = "Global Active Power (Kilowatts)"))

with(newData, plot(x = dateTime, 
                   y = Voltage, 
                   type = "l",
                   xlab = "datetime",
                   ylab = "Voltage"))

par(mar = c(2,2,1,1))

with(newData, 
     plot(x = dateTime, 
          y = Sub_metering_1, 
          type = "l",
          xlab = "",
          ylab = "Energy Sub Metering",
          col = "Black"))

with(newData, 
     lines(x = dateTime, 
           y = Sub_metering_2, 
           type = "l",
           col = "Red"))

with(newData, 
     lines(x = dateTime, 
           y = Sub_metering_3, 
           type = "l",
           col = "Blue"))

legend("topright", 
       pch = 1, 
       lty = 1,
       col = c("Black", "Blue", "Red"),
       legend = c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"))  

with(newData, plot(x = dateTime, 
                   y = Global_reactive_power, 
                   type = "l"))

dev.off()
