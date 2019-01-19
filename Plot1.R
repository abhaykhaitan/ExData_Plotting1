setwd(file.path(getwd(), "Exploratory Data"))

# read the dataset
dataset <- read.csv("household_power_consumption.txt", sep = ";",
                    na.strings = "?")

# saving date as date format
dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")
sapply(dataset, class)

# Selecting specific rows (datewise) from dataset
my_dataset <- dataset[dataset$Date >= "2007-02-01" & 
                          dataset$Date <= "2007-02-02", ]

my_dataset$Global_active_power <- as.numeric(my_dataset$Global_active_power)

# Creating graph
hist(my_dataset$Global_active_power, 
     xlab = "Global Active Power (killowatts)", 
     main= "Global Active Power", col= "red")

dev.copy(png, "plot1.png")
dev.off()
