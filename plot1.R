

#Reading data
data = read.table('household_power_consumption.txt', sep = ';', header = T, 
		na.strings = '?', 
		colClasses = c('character', 'character', 'numeric','numeric','numeric',
				'numeric','numeric','numeric','numeric'))
#Changing types of date/time and choosing only needed rows
data$Date = as.Date(data$Date, format = '%d/%m/%Y')
data = subset(data, data$Date >= '2007-02-01' & data$Date <= '2007-02-02')
data$Time = strptime(paste(data$Date, data$Time), 
		format = '%Y-%m-%d %H:%M:%S', tz = 'GMT')


# creating PNG device with no background 
# because in the files in the forked github repository thee are no background 
png(filename = 'plot1.png', width = 480, height = 480, bg = 'transparent')
# Creating plot
hist(data$Global_active_power, col = 'red', main = 'Global Active Power', 
		xlab = 'Global Active Power (kilowatts)')
# closing current file device
dev.off()

