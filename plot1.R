## The code below reads and manipulates the Electric Power Consumption data set
## in order to display a histogram graph of the Global Active Power in kilowatts for 
## February 1, 2007

## Read the csv to create the initial dataset
initdata <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.string = "?", stringsAsFactors = FALSE)

## Translate the Date field into a proper date class using as.Date function
initdata$Date <- as.Date(initdata$Date, format = "%d/%m/%Y")

## Create a subset of the initial data as we only need data from one day
data <- subset(initdata, Date >= "2007-02-01" & Date <= "2007-02-02")

## Plot the graph
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

## Save the graph
dev.copy(png, file="plot1.png", height = 480, width = 480, units = "px", bg = "transparent")
dev.off()