setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
setClass('myDate')

data <- read.table('household_power_consumption.txt', header = TRUE,
                   sep = ";", na.strings = "?", comment.char = "",
                   colClasses = c('myDate','character',rep('numeric',times = 7)))
data[[2]] <- as.POSIXct(paste(data[[1]],data[[2]]))
data <- subset(data, Date=='2007-02-01' | Date=='2007-02-02')

png("plot1.png", width=480, height=480)
hist(data$Global_active_power, col = "red", main = "Global Active Power",
     ylab = "Frequency", xlab = "Global Active Power(kilowatts)")
dev.off()