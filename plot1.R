# Goal: Examine how household energy usage varies over a 2-day period in February, 2007. 

library(tidyverse)
library(lubridate)

epower <- read.table("household_power_consumption.txt", 
                     header = TRUE,
                     sep = ";",
                     stringsAsFactors = FALSE,
                     na.strings = "?") %>%
  filter(Date == "1/2/2007" | Date == "2/2/2007")

# Plot 1
# Histogram of Global Active Power with red bars
png("plot1.png", width = 480, height = 480)
hist(epower$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()