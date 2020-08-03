setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
setClass('myDate')

data <- read.table('household_power_consumption.txt', header = TRUE,
                   sep = ";", na.strings = "?", comment.char = "",
                   colClasses = c('myDate','character',rep('numeric',times = 7)))
data[[2]] <- as.POSIXct(paste(data[[1]],data[[2]]))
data <- subset(data, Date=='2007-02-01' | Date=='2007-02-02')

png("plot3.png", width=480, height=480)
plot(data$Time,data$Sub_metering_1,type = 'n',xlab = "",ylab = "Energy Sub Metering")
lines(data$Time,data$Sub_metering_1,type='l')
lines(data$Time,data$Sub_metering_2,type='l',col = 2)
lines(data$Time,data$Sub_metering_3,type='l',col = 3)
legend("topright",col = c(1,2,3),
       legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       lty = c(1,1,1))
dev.off()