#Imports the zipped file
install.packages("downloader")
library(downloader)
download("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", dest = "power_data.zip")
unzip("power_data.zip", exdir = "./")

#Reads the zipped file
install.packages("data.table")
library(data.table)
install.packages("readtext")
library(readtext)
power.data <- data.table(read.table("household_power_consumption.txt", header = T, sep = ";"))

#Converts date variable to date format
power.data$Date <- as.character(power.data$Date)
power.data$Date <- as.Date(power.data$Date, format = "%d/%m/%Y")

#Reduces the data set to the two dates needed for the project
power.data <- power.data[Date >= "2007-02-01" & Date <= "2007-02-02",]

#Plot 2
power.data$Global_active_power <- as.numeric(as.character(power.data$Global_active_power))
date.time <- as.POSIXct(paste(power.data$Date, power.data$Time))
png ("plot2.png", width = 480, height = 480)
plot(date.time, power.data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()


