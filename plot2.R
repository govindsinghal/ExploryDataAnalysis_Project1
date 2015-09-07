##Set data
setwd("C:/aaaaaaaaaaaaa/coursera/Data science/4.Explotry data analysis/ExploryDataAnalysis_Project1")
hous_pow_cons <- read.table("household_power_consumption.txt",
                            sep=";",
                            col.names=c("Date", "Time","Global_active_power", "Global_reactive_power","Voltage", "Global_intensity","Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
                            fill=FALSE, 
                            strip.white=TRUE)
## change class of Date and time and other variable
Dat <- as.Date(hous_pow_cons$Date, "%d/%m/%Y")
tim <- strptime(hous_pow_cons$Time, "%H:%M:%S")
hous_pow_cons$Date <- Dat
hous_pow_cons$Time <-tim
fechas <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
household_power_consumption <- subset(hous_pow_cons, Date %in% fechas)

household_power_consumption$Global_active_power<-as.numeric(as.character(household_power_consumption$Global_active_power))
household_power_consumption$Global_reactive_power<-as.numeric(as.character(household_power_consumption$Global_reactive_power))
household_power_consumption$Voltage<-as.numeric(as.character(household_power_consumption$Voltage))
household_power_consumption$Global_intensity<-as.numeric(as.character(household_power_consumption$Global_intensity))
household_power_consumption$Sub_metering_1<-as.numeric(as.character(household_power_consumption$Sub_metering_1))
household_power_consumption$Sub_metering_2<-as.numeric(as.character(household_power_consumption$Sub_metering_2))
household_power_consumption$Sub_metering_3<-as.numeric(as.character(household_power_consumption$Sub_metering_3))

## Plot
png("C:/aaaaaaaaaaaaa/coursera/Data science/4.Explotry data analysis/ExploryDataAnalysis_Project1/plot2.png", width = 480, height = 480)
plot(household_power_consumption$Time,
     household_power_consumption$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()