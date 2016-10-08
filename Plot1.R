#Read the data into memory
elec <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
#convert string to date
elec$Date <- as.Date(elec$Date, "%d/%m/%Y")
#subset only the days between 2007-02-01 and 2007-02-02
subelec <- (elec[(elec$Date >= as.Date("2007-02-01")) & (elec$Date <= as.Date("2007-02-02")),])
#Draw the histogram
hist(subelec$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
#Write to png file
dev.copy(png, filename = "plot1.png", width = 480, height = 480, units = "px")
dev.off()