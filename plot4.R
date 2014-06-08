##Load Data
elec<- read.table("household_power_consumption.txt",header=TRUE,sep=";")
elec$Date2 <- as.Date(as.character(elec$Date), "%d/%m/%Y")
elec2days <- subset(elec, Date2==as.Date("2007-02-01")|
                      Date2==as.Date("2007-02-02"))
rm(elec)

elec2days$dt<-strptime(paste(elec2days$Date, elec2days$Time), 
                       "%d/%m/%Y %H:%M:%S")

##Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(elec2days, {
  plot(dt,as.numeric(Global_active_power)/500, 
       ylab="Global Active Power (kilowatts)", xlab=" ", type="l")
  plot(dt,as.numeric(Voltage), 
       ylab="Voltage", xlab="datetime", type="l")
  plot(dt,as.numeric(Sub_metering_1),
       ylab="Energy sub metering", xlab=" ", 
       type="n", col="black")
  points(dt,as.numeric(Sub_metering_1), 
         col="black", type="l")
  points(elec2days$dt,as.numeric(Sub_metering_2), 
         col="red", type="l")
  points(dt,as.numeric(Sub_metering_3), 
         col="blue", type="l")
  legend("topright", pch="-",col=c("black","red","blue"), 
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  par(new=F)
  plot(dt,as.numeric(Global_reactive_power), 
       ylab="Global Active Power (kilowatts)", xlab=" ", type="l")
})

##Create PNG
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()