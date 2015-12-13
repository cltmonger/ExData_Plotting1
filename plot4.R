library(data.table)
setwd("c:\\Documents and Settings\\neigeden\\Moje dokumenty\\Rworkspace\\ExploratoryDataAnalysis")
naglowek<-fread("household_power_consumption.txt",header=FALSE,sep=";",na.strings="[?]",nrows=1)
naglowek<-as.character(naglowek[1,])
dane<-fread("household_power_consumption.txt",header=FALSE,sep=";",na.strings="[?]",nrows=2880,skip=66637,col.names=naglowek)
dane[,Date:={tmp<-paste(Date,Time);as.POSIXct(strptime(tmp,"%d/%m/%Y %H:%M:%S"))}]
dane<-subset(dane,select=-2)
png(filename = "plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))

plot(dane$Date,dane$Global_active_power,xlab="",ylab="Global Active Power",type="l")

with(dane,plot(Date,Voltage,xlab="datetime",ylab="Voltage",type="l"))

with(dane,plot(Date,Sub_metering_1,xlab="",ylab="Energy sub metering",type="l"))
with(dane,lines(Date,Sub_metering_2,col="red"))
with(dane,lines(Date,Sub_metering_3,col="blue"))
legend("topright",col=c("black","red","blue"),lty=1,legend=naglowek[7:9],bty="n")

with(dane,plot(Date,Global_reactive_power,xlab="datetime",ylab="Global_reactive_rower",typ="l"))

dev.off()
