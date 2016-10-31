Sys.setlocale("LC_TIME", "C")

DT <- fread("household_power_consumption.txt",
            na.strings = '?', header = TRUE,
            colClasses = c(rep('character', 2), rep('numeric', 7)))
DT <- DT[grep("^(2|1)/2/2007", DT$Date),]
DT[['DateTime']] <- paste(DT[['Date']], DT[['Time']])
DT[['DateTime']] <- strptime(DT[['DateTime']], format = "%d/%m/%Y %H:%M:%S")

png(file="plot2.png", width = 480, height = 480, units = "px")
with(DT, plot(Global_active_power ~ as.POSIXct(DateTime), type = 'l', xlab = "",
              ylab = "Global Active Power (kilowatts)"))
dev.off()
