#Course Project 1

#Let's start by reading the data
setwd("~/GitHub/CourseProject1") #set the working directory
x<-read.table("./household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
head(x)

#Convert the Date/Time variables to a Date/Time classes
x$Date1<-as.Date(x$Date, "%d/%m/%Y")
x$Time1<-strptime(x$Time, "%H:%M:%S")

#subsetting the data to get data between 2007/02/01 and 2007-02-02
x1<-subset(x, Date1=="2007-2-2", select=Global_active_power:Date1)
x2<-subset(x, Date1=="2007-2-1", select=Global_active_power:Date1)

#Combine the two datasets into one dataset
x3<-rbind(x1,x2)
head(x3)

#Construct the plot
with(x3, hist(Global_active_power, col="red", xlab="Global Active Power(Kilowatts)",
              main="Global Active Power"))
dev.copy(png,file="plot1.png") #copy my plot to a PNG file
dev.off() #close the PNG device
