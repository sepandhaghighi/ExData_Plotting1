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
  
  plot(raw_data$Time,raw_data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")
  
  dev.copy(png,"plot2.png")
  
  dev.off()
  
    
    
}



