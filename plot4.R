## The code below reads and manipulates the Electric Power Consumption data set
## in order to display 4 graphs for February 1, 2007

## Read the csv to create the initial dataset
initdata <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.string = "?", stringsAsFactors = FALSE)

## Translate the Date field into a proper date class using as.Date function
initdata$Date <- as.Date(initdata$Date, format = "%d/%m/%Y")

## Create a subset of the initial data as we only need data from one day
data <- subset(initdata, Date >= "2007-02-01" & Date <= "2007-02-02")

## Combine the new date and time formats into a DateTime field
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(data$DateTime)

## Plot the graphs
## Create the 2 x 2 area, plotting row by row
par (mfrow = c(2, 2), mar = c (4, 4, 2, 1))
        ## top-left
        plot (data$DateTime, data$Global_active_power,
                type = "l",
                xlab = "", ylab = "Global Active Power (kilowatts)")
        ## top-right
        plot (data$DateTime, data$Voltage, 
              type = "l",
              xlab = "datetime", ylab = "Voltage")
        ## bottom-left
        plot (data$DateTime, data$Sub_metering_1,
                type = "l",
                ylab = "Energy sub metering", xlab = "")
        lines (data$DateTime, data$Sub_metering_2, col = "red")
        lines (data$DateTime, data$Sub_metering_3, col = "blue")
        legend ("topright", 
                bty = "n",
                col = c("black", "red", "blue"),
                lwd = 1, 
                c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                cex = 0.50)
        ## bottom-right
        plot (data$DateTime, data$Global_reactive_power, 
                type = "l",
                xlab = "datetime", ylab = "Global_reactive_power")      
        
## Save the graph
dev.copy(png, file="plot4.png", height = 480, width = 480, units = "px", bg = "transparent")
dev.off()