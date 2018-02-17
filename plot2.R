setwd("/Users/MeghaPatel/Desktop/datasciencecoursera")

#Reads in data from file then subsets data for specified dates
power <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

#clean up
power[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
power[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
power<- power[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot2.png", width=480, height=480)

## Plot 
plot(x = power[, dateTime]
     , y = power[, Global_active_power]
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()