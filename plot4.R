# Goal: Examine how household energy usage varies over a 2-day period in February, 2007. 

library(tidyverse)
library(lubridate)

epower <- read.table("household_power_consumption.txt", 
                     header = TRUE,
                     sep = ";",
                     stringsAsFactors = FALSE,
                     na.strings = "?") %>%
  filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
  mutate(measurementdatetime = dmy_hms(paste(Date, Time)))


# Plot 4
# Four facet plot showing plot 1, plot 2, voltage, and global reactive power over the two days of interest
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with(epower, plot(measurementdatetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))
with(epower, plot(measurementdatetime, Voltage, type = "l", xlab = "datetime"))
with(epower, plot(measurementdatetime, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering"))
with(epower, lines(measurementdatetime, Sub_metering_2, col = "red"))
with(epower, lines(measurementdatetime, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"),
       lty = c(1,1,1))
with(epower, plot(measurementdatetime, Global_reactive_power, xlab = "datetime", type = "l"))
dev.off()