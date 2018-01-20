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

#plot1
png(file = "plot1.png")
hist(df$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
