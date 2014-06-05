##### plot1.R###########################################################

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

hist(dtFeb12$Global_active_power,
   main="Global Active Power",
   xlab="Global Active Power (kilowatts)",
   col="red")

# do the copy to png

dev.copy(png,file="plot1.png",width=480,height=480)

dev.off() # this was emphasized in the class lectures!!!

##### the end ##########################################################
