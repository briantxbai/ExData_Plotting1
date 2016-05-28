if(file.exists('household_power_consumption.txt') != TRUE){
  url<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
  f <- file.path(getwd(),"data.zip")
  download.file(url,f)
  unzip(f)
}
dt <- read.table('./household_power_consumption.txt',header = TRUE,stringsAsFactors=FALSE, sep = ';', dec = '.')
sub_dt <- dt[dt$Date %in% c("1/2/2007","2/2/2007") ,]

globalActivePower <- as.numeric(sub_dt$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
