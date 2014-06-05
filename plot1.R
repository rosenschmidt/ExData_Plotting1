# plot1.R

dt <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.string="?")

dt$Date <- as.Date(dt$Date,format="%d/%m/%Y")

dt1 <- dt[dt$Date == "2007-02-01",]
dt2 <- dt[dt$Date == "2007-02-02",]

dtFeb12 <- rbind(dt1,dt2)

hist(dtFeb12$Global_active_power)

