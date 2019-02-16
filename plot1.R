library(readr)
library(dplyr)
house_power <- read_delim("/Users/whoyos21/Downloads/Course_4_Exploratory_Data_Analysis_with_R/Week_1/Project_1/household_power_consumption.txt", 
                                          ";", escape_double = FALSE, trim_ws = TRUE)

house_power$Date <- as.Date(house_power$Date, "%d/%m/%Y")


house_power_feb <- house_power %>%
        filter(Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))


hist(house_power_feb$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off()
