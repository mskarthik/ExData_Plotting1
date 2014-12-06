mydata<-read.csv("household_power_consumption.txt",sep=";",na.strings="?")
mydata.sub <- subset(mydata,(as.Date(Date,"%d/%m/%Y")==as.Date("01/02/2007","%d/%m/%Y"))|
                            (as.Date(Date,"%d/%m/%Y")==as.Date("02/02/2007","%d/%m/%Y")))
mydata.sub$Time_posix <- strptime(paste(mydata.sub$Date,mydata.sub$Time), "%d/%m/%Y %H:%M:%S")

png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

##plot1
plot(mydata.sub$Time_posix, mydata.sub$Global_active_power, type="l", ylab = "Global Active Power",xlab="") 

##plot2
plot(mydata.sub$Time_posix, mydata.sub$Voltage,type="l",ylab="Voltage",xlab="datetime")

##plot3
plot(mydata.sub$Time_posix, mydata.sub$Sub_metering_1,type="l",ylim=c(0,38), ylab = "Energy sub metering", xlab="")
par(new=T)
plot(mydata.sub$Time_posix, mydata.sub$Sub_metering_2,type="l",ylim=c(0,38),col="red", ylab ="", xlab="")
par(new=T)
plot(mydata.sub$Time_posix, mydata.sub$Sub_metering_3,type="l",ylim=c(0,38),col="blue", ylab="", xlab="")
par(new=T)
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lwd=2,bty="n")


##plot4
plot(mydata.sub$Time_posix, mydata.sub$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off()