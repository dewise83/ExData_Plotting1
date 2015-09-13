
d <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")

d2 <- subset(d, Date == "1/2/2007")

d3 <- subset(d, Date == "2/2/2007")

d4 <- rbind(d2, d3)

d <- NULL
d2 <- NULL
d3 <- NULL

d4[d4=="?"] <- NA

d5 <- d4[complete.cases(d4), ]

d5 <- transform(d5, Global_active_power = as.character(Global_active_power))
d5 <- transform(d5, Global_active_power = as.numeric(Global_active_power))

d5 <- transform(d5, Date = as.character(Date))
d5 <- transform(d5, Time = as.character(Time))
#head(d5)

d5$Date_Time = paste(d5$Date, d5$Time, sep=" ")

d5 <- transform(d5, Date_Time = strptime(Date_Time, format = "%d/%m/%Y %H:%M:%S"))

d5 <- transform(d5, Sub_metering_1 = as.character(Sub_metering_1))
d5 <- transform(d5, Sub_metering_1 = as.numeric(Sub_metering_1))

d5 <- transform(d5, Sub_metering_2 = as.character(Sub_metering_2))
d5 <- transform(d5, Sub_metering_2 = as.numeric(Sub_metering_2))

#sapply(d5, class)


png(filename = "plot3.png", width = 480, height = 480, units = "px")

plot(d5$Date_Time, d5$Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering", col = "black")
lines(d5$Date_Time, d5$Sub_metering_2, type = "l", col = "red")
lines(d5$Date_Time, d5$Sub_metering_3, type = "l", col = "blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1, 1), col = c("black", "red", "blue"))

dev.off()
