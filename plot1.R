# Reduce text size slightly
par(cex=0.8)

# Read the data
hh<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings=c("?"))
hh2<-subset(hh,as.character(hh$Date)=="1/2/2007" | as.character(hh$Date)=="2/2/2007")

# Plot the histogram
hist(as.numeric(hh2$Global_active_power),col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power",xlim=c(0,7.5))

# Save it as png
dev.copy(png,'plot1.png')
dev.off()