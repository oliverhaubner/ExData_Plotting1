setwd("~/COURSERA/Exploratory/Week 1/powerconsumption")
global <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
#set time format
global$Date <- strptime(global$Date, format = "%d/%m/%Y")
#subset to 1st and 2nd february 2007
feb12 <- subset(global, global$Date == as.POSIXlt("1/2/2007", format = "%d/%m/%Y") | global$Date == as.POSIXlt("2/2/2007", format = "%d/%m/%Y"))
#paste Date and Time columns
feb12$Date <- paste(feb12$Date, feb12$Time)
#set time format
feb12$Date <- strptime(feb12$Date, format = "%Y-%m-%d %H:%M:%S")
df <- data.frame(feb12)
#set numeric vectors
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
df$Voltage <- as.numeric(as.character(df$Voltage))
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))

#plot4
png(file = "plot4.png")
par(mfcol = c(2,2))
plot(df$Date, df$Global_active_power, ylab = "Global Active Power", xlab = "", lty = 1, type = "l")

plot(df$Date, df$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(df$Sub_metering_2, type = "l", col = "red")
lines(df$Date, df$Sub_metering_2, type = "l", col = "red")
lines(df$Date, df$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(df$Date, df$Voltage, ylab = "Voltage", xlab = "datetime", lty = 1, type = "l")

plot(df$Date, df$Global_reactive_power, ylab = "Global_reactive_power", 
     xlab = "datetime", lty = 1, type = "l")
dev.off()
