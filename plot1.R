##Load Data
elec<- read.table("household_power_consumption.txt",header=TRUE,sep=";")
elec$Date2 <- as.Date(as.character(elec$Date), "%d/%m/%Y")
elec2days <- subset(elec, Date2==as.Date("2007-02-01")|
                          Date2==as.Date("2007-02-02"))
rm(elec)

elec2days$dt<-strptime(paste(elec2days$Date, elec2days$Time), 
                       "%d/%m/%Y %H:%M:%S")

##Plot 1
hist(as.numeric(elec2days$Global_active_power)/500, 
     col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

##Create PNG
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()