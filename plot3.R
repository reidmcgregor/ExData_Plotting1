## The code below reads and manipulates the Electric Power Consumption data set
## in order to display 3 line graphs of the Sub metering data on
## February 1, 2007

## Read the csv to create the initial dataset
initdata <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.string = "?", stringsAsFactors = FALSE)

## Translate the Date field into a proper date class using as.Date function
initdata$Date <- as.Date(initdata$Date, format = "%d/%m/%Y")

## Create a subset of the initial data as we only need data from one day
data <- subset(initdata, Date >= "2007-02-01" & Date <= "2007-02-02")

## Combine the new date and time formats into a DateTime field
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(data$DateTime)

## Plot the graph
with (data, {
        plot(data$DateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
        lines(data$DateTime, Sub_metering_2, type = "l", col = "red")
        lines(data$DateTime, Sub_metering_3, type = "l", col = "blue")
})
legend ("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c ("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.75)

## Save the graph
dev.copy(png, file="plot3.png", height = 480, width = 480, units = "px", bg = "transparent")
dev.off()