##create first plot
run_plot1 <- function(){
##from row 66638 to 69517 included
    colname <- read.table("household_power_consumption.txt", nrows = 1, sep=";")
    eletricpower <- read.table("household_power_consumption.txt", header=FALSE, skip = 66637, nrows = 2880, sep=";")
    colnames(eletricpower) <- as.vector(colname)
    eletricpower$Date <- as.Date(eletricpower$Date,format="%d/%m/%Y")
    joindatetime <- paste0(eletricpower$Date,"-",eletricpower$Time)
    eletricpower$Time <- strptime(joindattime,format = "%d/%m/%Y-%H:%M:%S")
    
    hist(eletricpower$Global_active_power, col = "red",xlab = "Global Active Power (Kilowatts)", main = "Global Active Power")
    dev.copy(png,file="plot1.png")
    dev.off()
}