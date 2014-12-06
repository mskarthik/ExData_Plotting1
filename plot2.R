mydata<-read.csv("household_power_consumption.txt",sep=";",na.strings="?")
mydata.sub <- subset(mydata,(as.Date(Date,"%d/%m/%Y")==as.Date("01/02/2007","%d/%m/%Y"))|
                            (as.Date(Date,"%d/%m/%Y")==as.Date("02/02/2007","%d/%m/%Y")))
mydata.sub$Time_posix <- strptime(paste(mydata.sub$Date,mydata.sub$Time), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width = 480, height = 480)
plot(mydata.sub$Time_posix, mydata.sub$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)",xlab="") 
dev.off()