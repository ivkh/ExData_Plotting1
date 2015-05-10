
# Read data from local file
library(data.table)
DT<- fread("household_power_consumption.txt", sep=";", na.strings=c("NA","N/A","","?"))
DT<- DT[DT$Date=="1/2/2007" | DT$Date=="2/2/2007"]

# Prepare data
DT$Global_active_power <- as.numeric(DT$Global_active_power)

# Create a plot in png file
png(file = "plot1.png", width = 480, height = 480)

hist(DT$Global_active_power, col="red", 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", 
     main="Global Active Power")

dev.off()
