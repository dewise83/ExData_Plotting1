
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

png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(d5$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowats)")
dev.off()
