# Download and unzipping file 
fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL, destfile = "C:/Users/perrecha/Documents/coursera/Exploratory  Data Analysis/Week 1/HPC.zip")
HPC <- unzip("C:/Users/perrecha/Documents/coursera/Exploratory  Data Analysis/Week 1/HPC.zip")

# Reading table
plotHPC <- read.table(HPC, header=T, sep=";", na.strings="?")

# Subsetting table by date
plotHPC$Date <- as.Date(plotHPC$Date, "%d/%m/%Y")
Data <- subset(plotHPC,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

# Joining and converting Date and Time variables into a Date_Time variable with Date and Time classes
Date_Time <- paste(Data$Date, Data$Time)
Data <- cbind(Date_Time, Data)
Data$Date_Time <- as.POSIXct(Date_Time)


# Constructing the plot and saving it to a PNG
png(filename = "C:/Users/perrecha/Documents/coursera/Exploratory  Data Analysis/Week 1/plot4.png",width=480,height=480,units="px")
par(mfrow=c(2,2))
labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
plot(Data$Date_Time, Data$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power")
plot(Data$Date_Time, Data$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")
plot(Data$Date_Time, Data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(Data$Date_Time, Data$Sub_metering_2, type="l", col="red")
lines(Data$Date_Time, Data$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(Data$Date_Time, Data$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")
dev.off()