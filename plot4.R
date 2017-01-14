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

## Plot 4

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(powerConsumptionSub, {
        plot(Global_active_power ~ Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
        plot(Voltage ~ Datetime, type="l", ylab="Voltage (volt)", xlab="")
        plot(Sub_metering_1 ~ Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2 ~ Datetime,col='Red')
        lines(Sub_metering_3 ~ Datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power ~ Datetime, type="l", ylab="Global Reactive Power (kilowatts)",xlab="")
})

## Saving to file

dev.copy(png, file="plot4.png", height=480, width=480)

dev.off()
