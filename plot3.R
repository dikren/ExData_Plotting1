

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
png(filename = 'plot3.png', width = 480, height = 480, bg = 'transparent')
# Creating plot
plot(data$Time, data$Sub_metering_1, type = 'l', col = 'black', 
		ylab = 'Energy sub metering', xlab = '')
lines(data$Time, data$Sub_metering_2, type = 'l', col = 'red')
lines(data$Time, data$Sub_metering_3, type = 'l', col = 'blue')
legend(x = 'topright', lty = 1, 
		legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
		col = c('black', 'red', 'blue'))
# closing current file device
dev.off()

