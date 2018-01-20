#plot 2

png(file = "plot2.png")
    plot(df$Date, df$Global_active_power,  ylab = "Global Active Power (kilowatts)", 
    xlab = "", lty = 1, type = "l")
dev.off()
