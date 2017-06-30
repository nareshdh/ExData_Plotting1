# Download data file
#****************************************************
#fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(fileurl, dest="./data/household_power_consumption.zip")

hpc_data <- read.table(text = grep("^[1,2]/2/2007", readLines("./data/household_power_consumption.txt"), value = TRUE), sep = ";", header = FALSE)
colnames(hpc_data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
hpc_data$datetime <- strptime(paste(hpc_data$Date, hpc_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot1.png", width=480, height=480)
with(hpc_data, hist(Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power"))
dev.off()