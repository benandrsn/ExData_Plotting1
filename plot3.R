##Load Data
elec<- read.table("household_power_consumption.txt",header=TRUE,sep=";")
elec$Date2 <- as.Date(as.character(elec$Date), "%d/%m/%Y")
elec2days <- subset(elec, Date2==as.Date("2007-02-01")|
                      Date2==as.Date("2007-02-02"))
rm(elec)

elec2days$dt<-strptime(paste(elec2days$Date, elec2days$Time), 
                       "%d/%m/%Y %H:%M:%S")

##Plot 3
plot(elec2days$dt,as.numeric(elec2days$Sub_metering_1),
     ylab="Energy sub metering", xlab=" ", 
     type="n", col="black")
points(elec2days$dt,as.numeric(elec2days$Sub_metering_1), 
       col="black", type="l")
points(elec2days$dt,as.numeric(elec2days$Sub_metering_2), 
       col="red", type="l")
points(elec2days$dt,as.numeric(elec2days$Sub_metering_3), 
       col="blue", type="l")
legend("topright", pch="-",col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##Create PNG
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()