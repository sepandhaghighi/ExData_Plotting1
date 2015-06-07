if (!file.exists("R.RData")){
file<-read.table("household_power_consumption.txt",sep=";",header=TRUE)
}

file_1<-subset(file,Date=="1/2/2007")
file_2<-subset(file,Date=="2/2/2007")

raw_data<-as.matrix(rbind(file_1,file_2))
#Plot 1
length<-dim(raw_data)[1]
active_power<-NULL
for (i in 1:length) {
  if (!is.na(as.numeric(raw_data[i,3])))
    active_power<-cbind(active_power,as.numeric(raw_data[i,3]))
    
}

hist(active_power,col="red",xlab="Global Active Power(Kilowatts)",main="Global Active Power")
dev.copy(png,"plot1.png")
dev.off()

