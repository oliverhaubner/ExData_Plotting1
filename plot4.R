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
