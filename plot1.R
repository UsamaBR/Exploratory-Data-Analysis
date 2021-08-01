logData <- read.csv(file = "household_power_consumption.txt", 
                    sep = ";")

newData <- subset(x = logData, 
                  Date == "1/2/2007" | Date == "2/2/2007")


newData[,3:9] <- sapply(newData[,3:9], as.numeric)

str(newData)

png("Plot1.png", 
    width = 480, 
    height = 480)

with(newData, hist(Global_active_power, 
                   col = "Red", 
                   main = "Global Active Power", 
                   xlab = "Global Active Power (Kilowatts)"))

dev.off()
