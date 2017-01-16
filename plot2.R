data <- read.csv("./household_power_consumption.txt",sep=";",skip=1,header=TRUE,na.strings="?",col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
mydata <-subset(data, Date=="1/2/2007" | Date=="2/2/2007")
mydata$Date <- as.Date(mydata$Date,"%d/%m/%Y")
mydata$Date <- strptime(paste(mydata$Date,mydata$Time),"%Y-%m-%d %H:%M:%S")

## define plot2.png

png("plot2.png",width=480, height=480, units="px")
par(mfrow=c(1,1), mar= c(4,4,2,1))
with(mydata,plot(mydata$Date,mydata$Global_active_power, type="n",xlab="",ylab = "Global Active Power (kilowatts)"))
lines(mydata$Date,mydata$Global_active_power)
dev.off()