datafile<-"./Exploratory Data Analysis/household_power_consumption.txt"
data<-read.table(datafile,sep=";",header=TRUE)   #read data
subdata<-subset(data,data$Date %in% c("1/2/2007","2/2/2007"))  #subset data from 1/2/2007 to 2/2/2007
subdata$datetime <- strptime(paste(subdata$Date, subdata$Time),  "%d/%m/%Y %H:%M:%S")
subdata$Global_active_power<-as.numeric(subdata$Global_active_power)
subdata$Voltage<-as.numeric(subdata$Voltage)
submetering1<-as.numeric(subdata$Sub_metering_1)
submetering2<-as.numeric(subdata$Sub_metering_2)
submetering3<-as.numeric(subdata$Sub_metering_3)
subdata$Global_reactive_power<-as.numeric(subdata$Global_reactive_power)
par(mfrow = c(2, 2))
plot(subdata$datetime, subdata$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(subdata$datetime,subdata$Voltage,type = "l",xlab="datetime",ylab="Voltage")
plot(subdata$datetime,submetering1,type = "l",xlab="",ylab="Energy Submetering")
lines(subdata$datetime,submetering2,type="l",col="red")
lines(subdata$datetime,submetering3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"))
plot(subdata$datetime,subdata$Global_reactive_power,xlab="datetime",ylab = "Global_reactive_power",type = "l")
dev.copy(png,file="plot4.png")
dev.off()

