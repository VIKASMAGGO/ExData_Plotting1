library(dplyr)
##plot1.png

file <- read.table("household_power_consumption.txt",sep=";",header=TRUE,
                   stringsAsFactors = FALSE,dec=".");
file$Date <- as.Date(file$Date,format="%d/%m/%Y")
sub <- file %>% filter(Date == "2007-02-01" | Date == "2007-02-02");
num <- as.numeric(sub$Global_active_power );
png("plot1.png", width=480, height=480) ; 
hist(num, col="red", main="Global Active Power", 
            xlab="Global Active Power (kilowatts)" , ylab="Frequency") ; 
dev.off(); 

#plot2.png

sub <- file %>% filter(Date == "2007-02-01" | Date == "2007-02-02");
datetime <- strptime(paste(sub$Date,sub$Time, sep=" "), 
                     "%Y-%m-%d %H:%M:%S");
png("plot2.png", width=480, height=480) ; 
plot(datetime, num, type="l", xlab="", 
           ylab="Global Active Power (kilowatts)")
dev.off(); 

#plot3.png

sub <- file %>% filter(Date == "2007-02-01" | Date == "2007-02-02");
datetime <- strptime(paste(sub$Date,sub$Time, sep=" "), 
                     "%Y-%m-%d %H:%M:%S");
Sub1 <- as.numeric(sub$Sub_metering_1);
Sub2 <- as.numeric(sub$Sub_metering_2);
Sub3 <- as.numeric(sub$Sub_metering_3);
png("plot3.png", width=480, height=480) ; 
plot(datetime, Sub1, type="l", ylab="Energy Submetering", xlab="");
lines(datetime, Sub2, type="l", col="red");
lines(datetime, Sub3, type="l", col="blue");
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=2.5, 
       col=c("black", "red", "blue"));
dev.off(); 
    
#plot4.png

    sub <- file %>% filter(Date == "2007-02-01" | Date == "2007-02-02");
    datetime <- strptime(paste(sub$Date,sub$Time, sep=" "), 
                         "%Y-%m-%d %H:%M:%S");
    datetime <- strptime(paste(sub$Date,sub$Time, sep=" "), 
                         "%Y-%m-%d %H:%M:%S");
    Sub1 <- as.numeric(sub$Sub_metering_1);
    Sub2 <- as.numeric(sub$Sub_metering_2);
    Sub3 <- as.numeric(sub$Sub_metering_3);
    vol <- na.omit(as.numeric(sub$Voltage) );
    grp <- na.omit(as.numeric(sub$Global_reactive_power));
    png("plot4.png", width=480, height=480) ; 
    par(mfcol=c(2,2));
    plot(datetime, num, type="l", xlab="", 
         ylab="Global Active Power (kilowatts)");
    plot(datetime, Sub1, type="l", ylab="Energy Submetering", xlab="");
    lines(datetime, Sub2, type="l", col="red");
    lines(datetime, Sub3, type="l", col="blue");
    legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           lty=1, lwd=2.5, 
           col=c("black", "red", "blue"));
    plot(x=datetime, y=vol, type="l", xlab="datetime", 
         ylab="Voltage") ;
    plot(x=datetime,y=grp,type="l",xlab="datetime",ylab="Global_reactive_power") ; 
    dev.off(); 




