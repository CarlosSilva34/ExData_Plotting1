houseCons<-read.table("C:/Users/Utilizador/Desktop/DataScience/ExploratoryDataAnalysis/Week1/household_power_consumption/household_power_consumption.txt",sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")
# Subseting the data to the two days period:
sub_houseCons<- subset(houseCons, (houseCons$Date == "1/2/2007" | houseCons$Date== "2/2/2007"))
# Changing the Date variable class from character to Date: 
sub_houseCons$Date <- as.Date(sub_houseCons$Date, format = "%d/%m/%Y")
# Combining the Date and Time variable in a new column in dataset named "dTime":
sub_houseCons$dTime <- as.POSIXct(paste(sub_houseCons$Date, sub_houseCons$Time))
# Creating the plot4:
png("plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))
plot(sub_houseCons$dTime, sub_houseCons$Global_active_power, type="l", ylab= "Global Active Power", xlab="")
plot(sub_houseCons$dTime, sub_houseCons$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(sub_houseCons$dTime, sub_houseCons$Sub_metering_2, type="l", col="red")
lines(sub_houseCons$dTime, sub_houseCons$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  bty = "n", col=c("black", "red", "blue"), lwd = 1)
plot(sub_houseCons$dTime,sub_houseCons$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(sub_houseCons$dTime,sub_houseCons$Global_reactive_power,type='l',xlab="datetime",ylab="Global_reactive_power")
dev.off()
