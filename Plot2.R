setwd("~/Documents/R/power_consumption")
library(sqldf) 
#read and select specific dates
DF <- read.csv2.sql("household_power_consumption.txt",sql="SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'",sep=";",na.strings="?" )

png("Plot2.png", width=480, height=480)  #create the png file
with(DF, plot(Global_active_power, xaxt='n',  type="l", main="Plot 2", ylab="Global active power (kilowatts)")) #create  the plot
axis(1, at=c(1,nrow(DF)/2,nrow(DF)),labels=c("Thu","Fri","Sat")) #xaxis labels
dev.off()



