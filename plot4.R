##create first plot
run_plot4 <- function(){
##from row 66638 to 69517 included
    colname <- read.table("household_power_consumption.txt", nrows = 1, sep=";")
    eletricpower <- read.table("household_power_consumption.txt", header=FALSE, skip = 66637, nrows = 2880, sep=";")
    colnames(eletricpower) <- as.vector(colname)
    eletricpower$Date <- as.Date(eletricpower$Date,format="%d/%m/%Y")
    joindatetime <- paste0(eletricpower$Date,"-",eletricpower$Time)
    eletricpower$Time <- strptime(joindattime,format = "%d/%m/%Y-%H:%M:%S")

    par(mfrow=c(2,2),mar=c(4,4,4,4),oma=c(0,0,0,0))
    with(eletricpower,{
        plot(eletricpower$Time,eletricpower$Global_active_power, xlab = " ", ylab = "Global Active Power (Kilowatts)",type="l")
        
        plot(eletricpower$Time,eletricpower$Voltage, xlab = "datetime", ylab = "Voltage",type="l")
        
        with(eletricpower,plot(eletricpower$Time,eletricpower$Sub_metering_1,xlab=" ",ylab="Energy Sub Metering",type="n"))
        lines(eletricpower$Time,eletricpower$Sub_metering_1, type="l", col="black")
        lines(eletricpower$Time,eletricpower$Sub_metering_2, type="l", col="red")
        lines(eletricpower$Time,eletricpower$Sub_metering_3, type="l", col="blue")
        legend("topright",legend=c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"), col=c("black","red","blue"),lty=1,y.intersp=0.5,box.lty = 0,cex=0.5)
        
        plot(eletricpower$Time,eletricpower$Global_reactive_power, xlab = "datetime", ylab="Global_reactive_power", type="l")
        dev.copy(png,file="plot4.png")
        dev.off()
    })
}