## Getting full dataset
dataSource <- "C:/Users/Erin/Exploratory_Data_Analysis/household_power_consumption.txt"
powerConsumption <- read.csv(dataSource, header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
powerConsumption$Date <- as.Date(powerConsumption$Date, format="%d/%m/%Y")

## Subsetting the data
powerConsumptionSub <- subset(powerConsumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(powerConsumption)

## Converting dates
dateTime <- paste(as.Date(powerConsumptionSub$Date), powerConsumptionSub$Time)
powerConsumptionSub$Datetime <- as.POSIXct(dateTime)

powerConsumptionSub$Global_active_power <- as.numeric(powerConsumptionSub$Global_active_power)

## Plot 2
plot(powerConsumtionSub$Global_active_power ~ powerConsumptionSub$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
