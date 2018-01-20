# plot 3

png(file = "plot3.png")
plot(df$Date, df$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
  lines(df$Sub_metering_2, type = "l", col = "red")
  lines(df$Date, df$Sub_metering_2, type = "l", col = "red")
  lines(df$Date, df$Sub_metering_3, type = "l", col = "blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()