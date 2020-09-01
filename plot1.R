#Read Data
hpc <- read.csv("C:/Users/Razia Khalid Butt/data_scientist_coursera/Data_science_toolbox/Exploratory data anaylsis/exdata_data_household_power_consumption/household_power_consumption.txt",sep=";")
#covert data
hpc$Date <- as.Date(hpc$Date,format="%d/%m/%Y")
#subset data
data <- subset(hpc, Date >= "2007-02-01" & Date<= "2007-02-02")
#open png file
png(file= "plot1.png" ,width = 480, height = 480 )
#plot histogram
hist(as.numeric(as.character(data$ Global_active_power )), col="red", 
     xlab= "Global Active Power (kilowatts)", breaks = 12, main = "Global Active Power")


dev.off()
