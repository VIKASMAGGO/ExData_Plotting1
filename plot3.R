
library(dplyr)
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
