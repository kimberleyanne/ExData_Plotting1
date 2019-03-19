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

# Plot 2
# Line plot of Global Active Power across the two days of interest - axis based on day of the week
png("plot2.png", width = 480, height = 480)
with(epower, plot(measurementdatetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()