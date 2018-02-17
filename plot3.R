setwd("/Users/MeghaPatel/Desktop/datasciencecoursera")

#Reads in data from file then subsets data for specified dates
power <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

#clean up
power[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
power[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
power<- power[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot3.png", width=480, height=480)

# Plot 
plot(power[, dateTime], power[, Sub_metering_1], type="l", xlab="", ylab="Energy sub metering")
lines(power[, dateTime], power[, Sub_metering_2],col="red")
lines(power[, dateTime], power[, Sub_metering_3],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()