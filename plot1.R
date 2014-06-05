# plot1.R

dt <- read.table("household_power_consumption.txt",
   sep=";",
   header=TRUE,
   na.string="?")

# doesn't work - tale of woe
# dt$Date <- as.Date(dt$Date,format="%d/%m/%Y")

dt1 <- dt[dt$Date == "1/2/2007",]
dt2 <- dt[dt$Date == "2/2/2007",]
dtFeb12 <- rbind(dt1,dt2)

theDates <- paste(dtFeb12$Date,dtFeb12$Time)
theDates <- strptime(theDates,"%d/%m/%Y %H:%M:%S",tz="")

hist(dtFeb12$Global_active_power,
   main="Global Active Power",
   xlab="Global Active Power (kilowatts)",
   col="red")

# the end
