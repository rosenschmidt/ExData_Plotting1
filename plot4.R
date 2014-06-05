# plot4.R

# read data - raw and all of it
dt <- read.table("household_power_consumption.txt",
   sep=";",
   header=TRUE,
   na.string="?")

# doesn't work - tale of woe
# dt$Date <- as.Date(dt$Date,format="%d/%m/%Y")

# extract out the two days we want and put those in a separate object
dt1 <- dt[dt$Date == "1/2/2007",]
dt2 <- dt[dt$Date == "2/2/2007",]
dtFeb12 <- rbind(dt1,dt2)

# since we (well, I) have to compute the dates manually,
# leave them in a separate variable

datetime <- paste(dtFeb12$Date,dtFeb12$Time)
datetime <- strptime(datetime,"%d/%m/%Y %H:%M:%S",tz="")

par(mfrow = c(2,2))
with(dtFeb12, {

# first plot  - our original plot2.R

plot(datetime,Global_active_power,
  type="l",
  ylab="Global Active Power (kilowatts)",
  xlab="")

# second plot - a new one, voltage

plot(datetime,Voltage,type="l")

# third plot - our original plot3.R

plot(datetime,Sub_metering_1,ylab="Energy sub Meetering",type="l")
points(datetime,Sub_metering_2,type="l",col="red")
points(datetime,Sub_metering_3,type="l",col="blue")
legend("topright",
   lty=1,
   col=c("black","blue","red"),
   legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#fourth plot - another newbie

plot(datetime,Global_reactive_power,type="l")

})


