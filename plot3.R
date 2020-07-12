##create first plot
run_plot3 <- function(){
##from row 66638 to 69517 included
    colname <- read.table("household_power_consumption.txt", nrows = 1, sep=";")
    eletricpower <- read.table("household_power_consumption.txt", header=FALSE, skip = 66637, nrows = 2880, sep=";")
    colnames(eletricpower) <- as.vector(colname)
    eletricpower$Date <- as.Date(eletricpower$Date,format="%d/%m/%Y")
    joindatetime <- paste0(eletricpower$Date,"-",eletricpower$Time)
    eletricpower$Time <- strptime(joindattime,format = "%d/%m/%Y-%H:%M:%S")

    with(eletricpower,plot(eletricpower$Time,eletricpower$Sub_metering_1,xlab=" ",ylab="Energy Sub Metering",type="n"))
    lines(eletricpower$Time,eletricpower$Sub_metering_1, type="l", col="black")
    lines(eletricpower$Time,eletricpower$Sub_metering_2, type="l", col="red")
    lines(eletricpower$Time,eletricpower$Sub_metering_3, type="l", col="blue")
    legend("topright",legend=c("Sub_Metering_1","Sub_Metering_2","Sub_Metering_3"), col=c("black","red","blue"), lty=1, y.intersp=0.5,x.intersp=4,cex=0.8)
    dev.copy(png,file="plot3.png")
    dev.off()
}