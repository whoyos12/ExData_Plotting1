library(readr)
library(dplyr)
house_power <- read_delim("/Users/whoyos21/Downloads/Course_4_Exploratory_Data_Analysis_with_R/Week_1/Project_1/household_power_consumption.txt", 
                          ";", escape_double = FALSE, trim_ws = TRUE)
house_power$Date <- as.Date(house_power$Date, "%d/%m/%Y")

house_power_feb <- house_power %>%
        filter(Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(house_power_feb, 
     {plot(Global_active_power ~ date_and_time, type = "l", 
             ylab="Global Active Power (kilowatts)", xlab = "")
plot(Voltage ~ date_and_time, type = "l", 
             ylab = "Voltage (volt)", xlab = "")
plot(Sub_metering_1 ~ date_and_time, type = "l", 
             ylab = "Global Active Power (kilowatts)", xlab = "")
lines(Sub_metering_2 ~ date_and_time,col = 'Red')
lines(Sub_metering_3 ~ date_and_time,col = 'Blue')
legend("topright", col = c("black", "red", "blue"), 
               lty = 1, lwd = 2, bty = "n",
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(Global_reactive_power ~ date_and_time, type = "l", 
             ylab="Global Rective Power (kilowatts)",xlab = "")
})

dev.copy(png, "plot4.png", width = 480, height = 480)
dev.off()


