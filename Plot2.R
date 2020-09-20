datafile<-"./Exploratory Data Analysis/household_power_consumption.txt"
data<-read.table(datafile,sep=";",header=TRUE)   #read data
subdata<-subset(data,data$Date %in% c("1/2/2007","2/2/2007"))  #subset data from 1/2/2007 to 2/2/2007
subdata$datetime <- strptime(paste(subdata$Date, subdata$Time),  "%d/%m/%Y %H:%M:%S")
subdata$Global_active_power<-as.numeric(subdata$Global_active_power)
plot(subdata$datetime,subdata$Global_active_power,type="l",xlab="",ylab = "Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png")
dev.off()

