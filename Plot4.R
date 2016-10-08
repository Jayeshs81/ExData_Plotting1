library(lubridate)
#Read the data into memory
elec <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
#convert string to date
elec$Date <- as.Date(elec$Date, "%d/%m/%Y")
#subset only the days between 2007-02-01 and 2007-02-02
subelec <- (elec[(elec$Date >= as.Date("2007-02-01")) & (elec$Date <= as.Date("2007-02-02")),])
#set Time column
subelec$Time <- ymd_hms(paste(subelec$Date, subelec$Time))

#Draw the required plot
par(mfrow = c(2,2))
#First Plot
with(subelec, plot(Time, Global_active_power, type = "l", 
                   xlab = "", ylab = "Global Active Power"))
#Second Plot
with(subelec, plot(Time, Voltage, type = "l", xlab = "datetime", ylab="Voltage"))
#third Plot
with(subelec, plot(Time, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering"))
with(subelec, lines(Time, Sub_metering_1, col="black"))
with(subelec, lines(Time, Sub_metering_2, col="red"))
with(subelec, lines(Time, Sub_metering_3, col="blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, lwd = 1, pt.cex=1, cex=0.5)
#fourth plot
with(subelec, plot(Time, Global_reactive_power, type = "l", 
                   xlab = "datetime", ylab="Global_recative_power"))
#Write to png file
dev.copy(png, filename = "plot4.png", width = 480, height = 480, units = "px")
dev.off()
