#Read Data
hpc <- read.csv("C:/Users/Razia Khalid Butt/data_scientist_coursera/Data_science_toolbox/Exploratory data anaylsis/exdata_data_household_power_consumption/household_power_consumption.txt",sep=";")
#covert data
hpc$Date <- as.Date(hpc$Date,format="%d/%m/%Y")
hpc$datetime <- strptime(paste(hpc$Date,hpc$Time),format = "%Y-%m-%d %H:%M:%S")
#subset data
data <- subset(hpc, Date >= "2007-02-01" & Date<= "2007-02-02")
#open png file
png(file= "plot3.png" ,width = 480, height = 480 )
#plot 
with(data, plot(datetime, as.numeric(as.character(Sub_metering_1)), type = "n", xlab = "",
                ylab = "Energy sub metering", xaxt = "n"))


axis(side = 1, at = c(as.numeric(data$datetime[1]),
                      as.numeric(data$datetime[1441]),
                      as.numeric(data$datetime[2880])),labels = c("Thu","Fri","Sat"))

with(data, lines(datetime, Sub_metering_1))
with(data, lines(datetime, Sub_metering_2, col = "red"))
with(data, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright",lty = 1, col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()