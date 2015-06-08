if (!file.exists("R.RData")){
file<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
}

file_1<-subset(file,Date=="1/2/2007")
file_2<-subset(file,Date=="2/2/2007")

raw_data<-rbind(file_1,file_2)
raw_data2<-as.matrix(raw_data)
#Plot 2
length<-dim(raw_data)[1]
days<-NULL
active_power<-NULL
for (i in 1:length) {
  if (!is.na(as.numeric(raw_data2[i,3]))){
    active_power<-cbind(active_power,as.numeric(raw_data2[i,3]))
    days<-cbind(days,i)
    
      
    
  }
  raw_data$Date <- as.Date(raw_data$Date , "%d/%m/%Y")
  raw_data$Time <- paste(raw_data$Date, raw_data$Time, sep=" ")
  raw_data$Time <- strptime(raw_data$Time, "%Y-%m-%d %H:%M:%S")
  par(mfrow=c(2,2))
  plot(raw_data$Time,raw_data$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
  plot(raw_data$Time,raw_data$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
  ylimits = range(c(raw_data$Sub_metering_1, raw_data$Sub_metering_2, raw_data$Sub_metering_3))
  plot(raw_data$Time, raw_data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", ylim = ylimits, col = "black")
  par(new = TRUE)
  plot(raw_data$Time, raw_data$Sub_metering_2, xlab = "", axes = FALSE, ylab = "", type = "l", ylim = ylimits, col = "red")
  par(new = TRUE)
  plot(raw_data$Time, raw_data$Sub_metering_3, xlab = "", axes = FALSE, ylab = "", type = "l", ylim = ylimits, col = "blue")
  legend("topright",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         lty = c(1,1,1),
         col = c("black", "red", "blue")
  )
  plot(raw_data$Time,raw_data$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
  
  dev.copy(png,"plot4.png")
  
  dev.off()
  
    
    
}



