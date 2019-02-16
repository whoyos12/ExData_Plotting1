library(readr)
library(dplyr)
house_power <- read_delim("/Users/whoyos21/Downloads/Course_4_Exploratory_Data_Analysis_with_R/Week_1/Project_1/household_power_consumption.txt", 
                          ";", escape_double = FALSE, trim_ws = TRUE)

house_power$Date <- as.Date(house_power$Date, "%d/%m/%Y")


house_power_feb <- house_power %>%
        filter(Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

date_and_time <- paste(house_power_feb$Date, house_power_feb$Time)

house_power_feb <- cbind(house_power_feb, date_and_time)

house_power_feb$date_and_time <- as.POSIXct(date_and_time)


plot(house_power_feb$Global_active_power ~ house_power_feb$date_and_time, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png, "plot2.png", width = 480, height = 480)
dev.off()
