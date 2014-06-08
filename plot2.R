##Load Data
elec<- read.table("household_power_consumption.txt",header=TRUE,sep=";")
elec$Date2 <- as.Date(as.character(elec$Date), "%d/%m/%Y")
elec2days <- subset(elec, Date2==as.Date("2007-02-01")|
                      Date2==as.Date("2007-02-02"))
rm(elec)

elec2days$dt<-strptime(paste(elec2days$Date, elec2days$Time), 
                       "%d/%m/%Y %H:%M:%S")

##Plot 2
plot(elec2days$dt,as.numeric(elec2days$Global_active_power)/500, 
     ylab="Global Active Power (kilowatts)", xlab=" ", type="l")

##Create PNG
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()