# Importing the dataset into the R environment
logData <- read.csv(file = "household_power_consumption.txt", 
                    sep = ";")

# Subsetting the data to get the desired dates
newData <- subset(x = logData, 
                  Date == "1/2/2007" | Date == "2/2/2007")

# Changing the class from character to numeric
newData[,3:9] <- sapply(newData[,3:9], as.numeric)

# Viewing the column names and classes
str(newData)

# Opening the png file
png("Plot1.png", 
    width = 480, 
    height = 480)

# Plotting the histogram
with(newData, hist(Global_active_power, 
                   col = "Red", 
                   main = "Global Active Power", 
                   xlab = "Global Active Power (Kilowatts)"))

# Closing and saving
dev.off()
