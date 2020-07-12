##create second plot
run_plot2 <- function(){
##from row 66638 to 69517 included
    colname <- read.table("household_power_consumption.txt", nrows = 1, sep=";")
    eletricpower <- read.table("household_power_consumption.txt", header=FALSE, skip = 66637, nrows = 2880, sep=";")
    colnames(eletricpower) <- as.vector(colname)
    eletricpower$Date <- as.Date(eletricpower$Date,format="%d/%m/%Y")
    joindatetime <- paste0(eletricpower$Date,"-",eletricpower$Time)
    eletricpower$Time <- strptime(joindattime,format = "%d/%m/%Y-%H:%M:%S")
    
    with(eletricpower,plot(eletricpower$Time,eletricpower$Global_active_power, xlab = " ", ylab = "Global Active Power (Kilowatts)",type="l"))
    dev.copy(png,file="plot2.png")
    dev.off()
}