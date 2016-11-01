setwd("C:/Users/Utilizador/Desktop/DataScience/ExploratoryDataAnalysis/Week1/ExData_Plotting1/")

houseCons<-read.table("C:/Users/Utilizador/Desktop/DataScience/ExploratoryDataAnalysis/Week1/household_power_consumption/household_power_consumption.txt",sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")
#  Subseting the data to the two days period:
sub_houseCons<- subset(houseCons, (houseCons$Date == "1/2/2007" | houseCons$Date== "2/2/2007"))
# Changing the Date variable class from character to Date: 
sub_houseCons$Date <- as.Date(sub_houseCons$Date, format = "%d/%m/%Y")
# Creating the plot1:
png("plot1.png", width = 480, height = 480)
hist(sub_houseCons$Global_active_power, main="Global Active Power",col='red',ylab= "Frequency", xlab="Global Active Power(kilowatts)")
dev.off()

