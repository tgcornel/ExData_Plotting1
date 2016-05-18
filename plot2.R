# Reduce text size slightly
par(cex=0.8)

# Read the data
hh<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings=c("?"))
hh2<-subset(hh,as.character(hh$Date)=="1/2/2007" | as.character(hh$Date)=="2/2/2007")

# Calculate time in seconds
datetime<-paste(hh2$Date,hh2$Time)
datetime<-strptime(datetime,format="%d/%m/%Y %H:%M:%S")
hh2$unixtime<-as.numeric(datetime)

thu<-as.numeric(strptime("1/2/2007 00:00:00",format="%d/%m/%Y %H:%M:%S"))
fri<-as.numeric(strptime("2/2/2007 00:00:00",format="%d/%m/%Y %H:%M:%S"))
sat<-as.numeric(strptime("3/2/2007 00:00:00",format="%d/%m/%Y %H:%M:%S"))

# Produce plots
plot(hh2$unixtime,hh2$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="",xaxt="n")
axis(1,at=c(thu[1],fri[1],sat[1]),labels=c("Thu","Fri","Sat"))

# Save it as png
dev.copy(png,'plot2.png')
dev.off()