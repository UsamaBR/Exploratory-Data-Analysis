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
png("Plot2.png", 
    width = 480, 
    height = 480)

# Plotting the line graph
with(newData, plot(x = dateTime, 
                   y = Global_active_power, 
                   type = "l",
                   xlab = "",
                   ylab = "Global Active Power (Kilowatts)"))

# Saving and closing the file
dev.off()
