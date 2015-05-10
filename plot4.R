
# Read data from local file
library(data.table)
DT<- fread("household_power_consumption.txt", sep=";", na.strings=c("NA","N/A","","?"))
DT<- data.frame(DT[DT$Date=="1/2/2007" | DT$Date=="2/2/2007"])

# Prepare data
DT$Global_active_power <- as.numeric(DT$Global_active_power)
DT$Global_reactive_power <- as.numeric(DT$Global_reactive_power)
DT$Voltage <- as.numeric(DT$Voltage)
DT$Sub_metering_1 <- as.numeric(DT$Sub_metering_1)
DT$Sub_metering_2 <- as.numeric(DT$Sub_metering_2)
DT$Sub_metering_3 <- as.numeric(DT$Sub_metering_3)

t <- paste0(DT$Date, " ", DT$Time)
t <- strptime(t,"%d/%m/%Y %H:%M:%S")

# Create a plot in png file
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

plot(t, DT$Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", 
     xlab="", 
     main="")

plot(t, DT$Voltage, type="l",
     ylab="Voltage", 
     xlab="datetime", 
     main="")

plot(t, DT$Sub_metering_1, type="l", col="black",
     ylab="Energy sub metering", 
     xlab="", 
     main="")
lines(t, DT$Sub_metering_2, col="red")
lines(t, DT$Sub_metering_3, col="blue")
legend("topright", lty=c(1, 1, 1), bty = "n", 
       col = c("black", "red", "blue"), 
       legend = names(DT)[c(7,8,9)])

plot(t, DT$Global_reactive_power, type="l",
     ylab="Global Reactive Power", 
     xlab="datetime", 
     main="")

dev.off()
