## The code below reads and manipulates the Electric Power Consumption data set
## in order to display a line graph of the Global Active Power in kilowatts for 
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
plot(data$DateTime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## Save the graph
dev.copy(png, file="plot2.png", height = 480, width = 480, units = "px", bg = "transparent")
dev.off()