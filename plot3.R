
# Read data from local file
library(data.table)
DT<- fread("household_power_consumption.txt", sep=";", na.strings=c("NA","N/A","","?"))
DT<- DT[DT$Date=="1/2/2007" | DT$Date=="2/2/2007"]

# Prepare data
DT$Sub_metering_1 <- as.numeric(DT$Sub_metering_1)
DT$Sub_metering_2 <- as.numeric(DT$Sub_metering_2)
DT$Sub_metering_3 <- as.numeric(DT$Sub_metering_3)

t <- paste0(DT$Date, " ", DT$Time)
t <- strptime(t,"%d/%m/%Y %H:%M:%S")

# Create a plot in png file
png(file = "plot3.png", width = 480, height = 480)
plot(t, DT$Sub_metering_1, type="l", col="black",
     ylab="Energy sub metering", 
     xlab="", 
     main="")
lines(t, DT$Sub_metering_2, col="red")
lines(t, DT$Sub_metering_3, col="blue")
legend("topright", lty=c(1, 1, 1), 
       col = c("black", "red", "blue"), 
       legend = names(DT)[c(7,8,9)])

dev.off()
