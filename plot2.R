if(file.exists('household_power_consumption.txt') != TRUE){
  url<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
  f <- file.path(getwd(),"data.zip")
  download.file(url,f)
  unzip(f)
}
dataFile <- "./household_power_consumption.txt"
dt <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
sub_dt<- dt[dt$Date %in% c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(sub_dt$Date, sub_dt$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(sub_dt$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()