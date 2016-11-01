
houseCons<-read.table("C:/Users/Utilizador/Desktop/DataScience/ExploratoryDataAnalysis/Week1/household_power_consumption/household_power_consumption.txt",sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")
# Subseting the data to the two days period:
sub_houseCons<- subset(houseCons, (houseCons$Date == "1/2/2007" | houseCons$Date== "2/2/2007"))
# Changing the Date variable class from character to Date: 
sub_houseCons$Date <- as.Date(sub_houseCons$Date, format = "%d/%m/%Y")
# Combining the Date and Time variable in a new column in dataset named "dTime":
sub_houseCons$dTime <- as.POSIXct(paste(sub_houseCons$Date, sub_houseCons$Time))
# Creating the plot2:
png("plot2.png", width = 480, height = 480)
plot(sub_houseCons$dTime, sub_houseCons$Global_active_power, type="l", ylab= "Global Active Power(kilowatts)", xlab="")
dev.off()


