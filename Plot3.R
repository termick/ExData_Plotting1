setwd("~/Documents/R/power_consumption")
library(sqldf) 
#read and select specific dates
DF <- read.csv2.sql("household_power_consumption.txt",sql="SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'",sep=";",na.strings="?" )
strDates <-DF[,1]
dates <- as.Date(strDates, "%d/%m/%Y")
#date1<-as.Date(DF[,1], %d/%m/%Y)
newdate<-paste(dates, DF[,2], sep=' ')
datetime_fixed  <- strptime(newdate,format ="%m/%d/%Y %H:%M:%S")
days <- weekdays(newdate, abbreviate=TRUE)

png("Plot3.png", width=480, height=480)  #create the png file
plot(days,DF[,7],type = "l", xlab = "", ylab = "Energy sub metering", col = "black", main = "Plot 3") #plot
lines (datetime_fixed ,DF[,8] = "l", col = "red") # add submetering 2
points (datetime_fixed , DF[,9] = "l", col = "blue")# add submetering 3
legend("topright", col = c("black", "red", "blue"), lty= "solid", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") # add legend
dev.off()




