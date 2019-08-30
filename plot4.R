# reda data from txt file
epc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

# subset 2007-02-01 and 2007-02-02
sub_epc <- subset(epc, Date=="1/2/2007"|Date=="2/2/2007")
# Time function need  Year, month, day, hour, minute, second so that I merged date and time for time
sub_epc$Time <- paste (sub_epc$Date, sub_epc$Time)
# Converting the class of sub_epc$Date to Date and the class of sub_epc$Time to Time
sub_epc$Date <-as.Date(sub_epc$Date, format="%d/%m/%Y")
sub_epc$Time <- strptime(sub_epc$Time, format="%d/%m/%Y %H:%M:%S")
# if You use local language, you should use this "Sys.setlocale("LC_TIME","en_US.UTF-8")" for convert weekdays in English
#Ararnge frame
par(mfrow=c(2,2))
with(sub_epc,{
  plot(sub_epc$Time,as.numeric(as.character(sub_epc$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(sub_epc$Time,as.numeric(as.character(sub_epc$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(sub_epc$Time,sub_epc$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(sub_epc,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(sub_epc,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(sub_epc,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(sub_epc$Time,as.numeric(as.character(sub_epc$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})
#save file
dev.copy(png,"plot4.png")
png(filename ="plot4.png", width = 480, height = 480 )
dev.off()