## Read Data Set

dataSource <- "C:/Users/Erin/Desktop/Exploratory_Data_Analysis/household_power_consumption.txt"
powerConsumption <- read.table(dataSource, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Transform Date and Time

powerConsumption$Date <- as.Date(powerConsumption$Date, format = "%d/%m/%Y")
powerConsumptionSub <- subset(powerConsumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(powerConsumption)
dateTime <- paste(as.Date(powerConsumptionSub$Date), powerConsumptionSub$Time)
powerConsumptionSub$Datetime <- as.POSIXct(dateTime)

## Transform Global_active_power Class from Character to Numeric

powerConsumptionSub$Global_active_power <- as.numeric(powerConsumptionSub$Global_active_power)

## Create plot1

hist(powerConsumptionSub$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
