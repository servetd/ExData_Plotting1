# reda data from txt file
epc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

# subset 2007-02-01 and 2007-02-02
sub_epc <- subset(epc, Date=="1/2/2007"|Date=="2/2/2007")
# Global_active_power is factor so that   data is converted firstly charecter and then to numeric
hist(as.numeric(as.character(sub_epc$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.copy(png,"plot1.png")
png(filename ="plot1.png", width = 480, height = 480 )
dev.off()