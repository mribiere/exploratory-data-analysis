data <- read.csv("./household_power_consumption.txt",sep=";",skip=1,header=TRUE,na.strings="?",col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
mydata <-subset(data, Date=="1/2/2007" | Date=="2/2/2007")
mydata$Date <- as.Date(mydata$Date,"%d/%m/%Y")
mydata$Date <- strptime(paste(mydata$Date,mydata$Time),"%Y-%m-%d %H:%M:%S")

## define plot4.png

png("plot4.png",width=480, height=480, units="px")
par(mfrow=c(2,2),mar=c(4,4,2,1))
## first graph
with(mydata,plot(mydata$Date,mydata$Global_active_power, type="n",xlab="",ylab = "Global Active Power"))
lines(mydata$Date,mydata$Global_active_power)
## second graph
with(mydata,plot(mydata$Date,mydata$Voltage, type="n",xlab="datetime",ylab = "Voltage"))
lines(mydata$Date,mydata$Voltage)
## third graph
with(mydata,plot(Date,Sub_metering_1, type="n",xlab="",ylab ="Energy sub metering"))
lines(mydata$Date,mydata$Sub_metering_1)
lines(mydata$Date,mydata$Sub_metering_2,col="red")
lines(mydata$Date,mydata$Sub_metering_3,col="blue")
legend("topright",lty=1,lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")
## Fourth graph
with(mydata,plot(mydata$Date,mydata$Global_reactive_power, type="n",xlab="datetime",ylab = "Global_reactive_power"))
lines(mydata$Date,mydata$Global_reactive_power)
dev.off()