setwd("~/Documents/R/power_consumption")
library(sqldf) 
#read and select specific dates
DF <- read.csv2.sql("household_power_consumption.txt",sql="SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'",sep=";",na.strings="?" )

png("Plot1.png", width=480, height=480)  #create the png file
hist(DF$Global_active_power, col="red", main="Plot 1", xlab="Global active power", ylab="Frequency") #create the plot
dev.off()


