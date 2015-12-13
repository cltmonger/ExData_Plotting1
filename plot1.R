library(data.table)
setwd("c:\\Documents and Settings\\neigeden\\Moje dokumenty\\Rworkspace\\ExploratoryDataAnalysis")
naglowek<-fread("household_power_consumption.txt",header=FALSE,sep=";",na.strings="[?]",nrows=1)
naglowek<-as.character(naglowek[1,])
dane<-fread("household_power_consumption.txt",header=FALSE,sep=";",na.strings="[?]",nrows=2880,skip=66637,col.names=naglowek)
dane[,Date:={tmp<-paste(Date,Time);as.POSIXct(strptime(tmp,"%d/%m/%Y %H:%M:%S"))}]
dane<-subset(dane,select=-2)
png(filename = "plot1.png",width = 480, height = 480)
hist(dane$Global_active_power,xlab="Global Active Power (kilowatts)",col = "Red",main = "Global active power")
dev.off()

