##### plot3.R ##########################################################

# assumes that household_power_consumption.txt is in the working dir
# to avoid reading the whole file, some people did neat stuff
# with sql packages; they know more than I do

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

plot(theDates,dtFeb12$Sub_metering_1,ylab="Energy sub Meetering",type="l")
points(theDates,dtFeb12$Sub_metering_2,type="l",col="red")
points(theDates,dtFeb12$Sub_metering_3,type="l",col="blue")
legend("topright",
   lty=1,
   col=c("black","blue","red"),
   legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# do the copy to png

dev.copy(png,file="plot3.png",width=480,height=480)
dev.off() # this was emphasized heartily in the class lecture

##### the end ##########################################################
