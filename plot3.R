Sys.setlocale("LC_TIME", "C")

DT <- fread("household_power_consumption.txt",
            na.strings = '?', header = TRUE,
            colClasses = c(rep('character', 2), rep('numeric', 7)))
DT <- DT[grep("^(2|1)/2/2007", DT$Date),]
DT[['DateTime']] <- paste(DT[['Date']], DT[['Time']])
DT[['DateTime']] <- strptime(DT[['DateTime']], format = "%d/%m/%Y %H:%M:%S")

png(file="plot3.png", width = 480, height = 480, units = "px")
with(DT, plot(Sub_metering_1 ~ as.POSIXct(DateTime), type = 'l', xlab = "",
              ylab = "Energy sub metering", col = "black"))
with(DT, lines(Sub_metering_2 ~ as.POSIXct(DateTime), col = "red"))
with(DT, lines(Sub_metering_3 ~ as.POSIXct(DateTime), col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2",
                              "Sub_metering_3"),
       col = c("black", "red", "blue"), bty = "o", lty = 1)
dev.off()
