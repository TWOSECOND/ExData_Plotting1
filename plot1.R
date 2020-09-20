datafile<-"./Exploratory Data Analysis/household_power_consumption.txt"
data<-read.table(datafile,sep=";",header=TRUE)   #read data
subdata<-subset(data,data$Date %in% c("1/2/2007","2/2/2007"))  #subset data from 1/2/2007 to 2/2/2007
summary(subdata$Global_active_power) #check the class of Global_active_power,to make histgram, variable must be number
subdata$Global_active_power<-as.numeric(subdata$Global_active_power)
hist(subdata$Global_active_power, xlab = "Global Active Power (kilowatts)",col = "Red",main="Global Active Power")
dev.copy(png,file="plot1.png")  #copy plot1 to png
dev.off()
