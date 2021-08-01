# Importing the dataset into the R environment
logData <- read.csv(file = "household_power_consumption.txt", 
                    sep = ";")

# Subsetting the data to get the desired dates
newData <- subset(x = logData, 
                  Date == "1/2/2007" | Date == "2/2/2007")

# Changing the class from character to numeric
newData[,3:9] <- sapply(newData[,3:9], as.numeric)

# Using strptime() to get date and time
dateTime <- strptime(paste(newData$Date, newData$Time), "%d/%m/%Y %H:%M:%S", tz = "GMT")

# Binding the column of date and Time data to the subsetted dataset
newData <- cbind(newData, dateTime)

# Viewing the column names and classes
str(newData)

# Opening the png file
png("Plot4.png", 
    width = 480, 
    height = 480)

# Dividing the plot into two rows and two columns
par(mfrow = c(2,2))

# Plotting the first subplot
with(newData, plot(x = dateTime, 
                   y = Global_active_power, 
                   type = "l",
                   xlab = "",
                   ylab = "Global Active Power (Kilowatts)"))

# Plotting the second subplot
with(newData, plot(x = dateTime, 
                   y = Voltage, 
                   type = "l",
                   xlab = "datetime",
                   ylab = "Voltage"))

# Plotting the third subplot plot
# Setting the margins
par(mar = c(2,2,1,1))

# Adding first layer to third subplot
with(newData, 
     plot(x = dateTime, 
          y = Sub_metering_1, 
          type = "l",
          xlab = "",
          ylab = "Energy Sub Metering",
          col = "Black"))

# Adding second layer to third subplot
with(newData, 
     lines(x = dateTime, 
           y = Sub_metering_2, 
           type = "l",
           col = "Red"))

# Adding third layer to third subplot
with(newData, 
     lines(x = dateTime, 
           y = Sub_metering_3, 
           type = "l",
           col = "Blue"))

# Adding legend to third subplot
legend("topright", 
       pch = 1, 
       lty = 1,
       col = c("Black", "Blue", "Red"),
       legend = c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"))  

# Plotting the fourth plot
with(newData, plot(x = dateTime, 
                   y = Global_reactive_power, 
                   type = "l"))

# Saving and Closing
dev.off()
