setwd(file.path(getwd(), "Exploratory Data"))

# read the dataset
dataset <- read.csv("household_power_consumption.txt", sep = ";", 
                    na.strings = "?")

# saving date as date format
dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")

# Selecting specific rows (datewise) from dataset
my_dataset <- dataset[dataset$Date >= "2007-02-01" & 
                          dataset$Date <= "2007-02-02", ]

# converting datatypes
my_dataset$Global_active_power <- as.numeric(my_dataset$Global_active_power)
my_dataset$Time <- as.POSIXct(my_dataset$Time)

# creating new column concatenating date and time and adding to 
# original my_dataset
dateTime <- paste(my_dataset$Date, my_dataset$Time)
dateTime <- as.POSIXct(dateTime)
my_dataset <- cbind(my_dataset, dateTime)

# plot function
plot(my_dataset$Sub_metering_1 ~ my_dataset$dateTime, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
lines(my_dataset$Sub_metering_2 ~ my_dataset$dateTime, col = "red")
lines(my_dataset$Sub_metering_3 ~ my_dataset$dateTime, col = "blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

# copying the graph to png device
dev.copy(png, "plot3.png")
dev.off()
