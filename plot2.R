
# Read data from local file
library(data.table)
DT<- fread("household_power_consumption.txt", sep=";", na.strings=c("NA","N/A","","?"))
DT<- DT[DT$Date=="1/2/2007" | DT$Date=="2/2/2007"]

# Prepare data
DT$Global_active_power <- as.numeric(DT$Global_active_power)
t <- paste0(DT$Date, " ", DT$Time)
t <- strptime(t,"%d/%m/%Y %H:%M:%S")

# Create a plot in png file
png(file = "plot2.png", width = 480, height = 480)

plot(t, DT$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", 
     xlab="", 
     main="")

dev.off()
