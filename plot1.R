DT <- fread("household_power_consumption.txt",
            na.strings = '?', header = TRUE,
            colClasses = c(rep('character', 2), rep('numeric', 7)))
DT <- DT[grep("^(2|1)/2/2007", DT$Date),]
DT[['DateTime']] <- paste(DT[['Date']], DT[['Time']])
DT[['DateTime']] <- strptime(DT[['DateTime']], format = "%d/%m/%Y %H:%M:%S")

png(file="plot1.png", width = 480, height = 480, units = "px")
hist(DT$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
