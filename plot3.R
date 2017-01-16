data <- read.csv("./household_power_consumption.txt",sep=";",skip=1,header=TRUE,na.strings="?",col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
mydata <-subset(data, Date=="1/2/2007" | Date=="2/2/2007")
mydata$Date <- as.Date(mydata$Date,"%d/%m/%Y")
mydata$Date <- strptime(paste(mydata$Date,mydata$Time),"%Y-%m-%d %H:%M:%S")

##define plot3.png

png("plot3.png",width=480, height=480, units="px")
with(mydata,plot(Date,Sub_metering_1, type="n",xlab="",ylab ="Energy sub metering"))
lines(mydata$Date,mydata$Sub_metering_1)
lines(mydata$Date,mydata$Sub_metering_2,col="red")
lines(mydata$Date,mydata$Sub_metering_3,col="blue")
legend("topright",lty=1,lwd=1,col=c("black","red","blue"),xjust=1,y.intersp=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()