#Read Data
hpc <- read.csv("C:/Users/Razia Khalid Butt/data_scientist_coursera/Data_science_toolbox/Exploratory data anaylsis/exdata_data_household_power_consumption/household_power_consumption.txt",sep=";")
#covert data
hpc$Date <- as.Date(hpc$Date,format="%d/%m/%Y")
hpc$datetime <- strptime(paste(hpc$Date,hpc$Time),format = "%Y-%m-%d %H:%M:%S")
#subset data
data <- subset(hpc, Date >= "2007-02-01" & Date<= "2007-02-02")
#open png file
png(file= "plot2.png" ,width = 480, height = 480 )
#plot 
with(data, plot(datetime, as.numeric(as.character(Global_active_power)), type = "l", xlab = "",
                ylab = "Global Active Power (kilowatts)", xaxt = "n"))


axis(side = 1, at = c(as.numeric(data$datetime[1]),
                      as.numeric(data$datetime[1441]),
                      as.numeric(data$datetime[2880])),labels = c("Thu","Fri","Sat"))

dev.off()