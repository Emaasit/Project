#Course Project 1
#PLOT2

#Let's start by reading the data
setwd("~/GitHub/CourseProject1") #set the working directory
x<-read.table("./household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
head(x)

#Convert the Date/Time variables to a Date/Time classes
x$Date1<-as.Date(x$Date, "%d/%m/%Y")
x$Time1<-strptime(x$Time, "%H:%M:%S")
x$Weekdays<-weekdays(x$Date1, abbreviate=TRUE)
x$Weekdays1<-as.factor(x$Weekdays)

#subsetting the data to get data between 2007/02/01 and 2007-02-02
x1<-subset(x, Date1=="2007-2-2", select=Global_active_power:Weekdays1)
x2<-subset(x, Date1=="2007-2-1", select=Global_active_power:Weekdays1)

#Combine the two datasets into one dataset
x3<-rbind(x1,x2)
head(x4)

#subsetting the data to get dates Thu, Fri, and Sat
x4<-subset(x3, Weekdays=="Thu", select=Global_active_power:Weekdays1)
x5<-subset(x3, Weekdays=="Fri", select=Global_active_power:Weekdays1)
x6<-subset(x3, Weekdays=="Sat", select=Global_active_power:Weekdays1)

#Combine the two datasets into one dataset
x7<-rbind(x4,x5,x6)
head(x7)

#Construct the plot
par(mfrow=c(1,1))
with(x7,{
        plot(Sub_metering_1, type="l", xlab="",ylab="Energy Sub Metering", xaxt="n") 
        par(new=TRUE)
        plot(Sub_metering_2, axes=FALSE,type="l", xlab="",ylab="", col="red",xaxt="n")
        par(new=TRUE)
        plot(Sub_metering_3, axes=FALSE,type="l", xlab="",ylab="", col="blue",xaxt="n")
        axis(1, at=c("0","1500", "2900"), labels=c("Thu", "Fri", "Sat")) 
})
legend("topright", legend="Sub_metering_1", fill, col=)

dev.copy(png,file="plot3.png") #copy my plot to a PNG file
dev.off() #close the PNG device









