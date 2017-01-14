## Getting full dataset

dataSource <- "C:/Users/Erin/Desktop/Exploratory_Data_Analysis/household_power_consumption.txt"
powerConsumption <- read.csv(dataSource, header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
powerConsumption$Date <- as.Date(powerConsumption$Date, format="%d/%m/%Y")

## Subsetting the data

powerConsumptionSub <- subset(powerConsumption, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(powerConsumption)

## Converting dates

dateTime <- paste(as.Date(powerConsumptionSub$Date), powerConsumptionSub$Time)
powerConsumptionSub$Datetime <- as.POSIXct(dateTime)

powerConsumptionSub$Global_active_power <- as.numeric(powerConsumptionSub$Global_active_power)

## Plot 3

with(powerConsumptionSub, {
        plot(Sub_metering_1 ~ Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2 ~ Datetime,col='Red')
        lines(Sub_metering_3 ~ Datetime,col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
