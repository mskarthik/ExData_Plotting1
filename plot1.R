mydata<-read.csv("household_power_consumption.txt",sep=";",na.strings="?")
mydata.sub <- subset(mydata,(as.Date(Date,"%d/%m/%Y")==as.Date("01/02/2007","%d/%m/%Y"))|
                            (as.Date(Date,"%d/%m/%Y")==as.Date("02/02/2007","%d/%m/%Y")))

png("plot1.png", width = 480, height = 480)
histogram <- hist(mydata.sub$Global_active_power,main="Global Active Power", col="red",xlab = "Global Active Power (kilowatts)", ylab="Frequency")
dev.off()