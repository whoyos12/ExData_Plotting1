library(readr)
library(dplyr)
house_power <- read_delim("/Users/whoyos21/Downloads/Course_4_Exploratory_Data_Analysis_with_R/Week_1/Project_1/household_power_consumption.txt", 
                          ";", escape_double = FALSE, trim_ws = TRUE)

house_power$Date <- as.Date(house_power$Date, "%d/%m/%Y")


house_power_feb <- house_power %>%
        filter(Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

with(house_power_feb, {plot(Sub_metering_1 ~ date_and_time, type = "l",
             ylab = "Global Active Power (kilowatts)", xlab = "")
lines(Sub_metering_2 ~ date_and_time,col = 'Red')
lines(Sub_metering_3 ~ date_and_time,col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lwd = c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


dev.copy(png, "plot3.png", width = 480, height = 480)
dev.off()
