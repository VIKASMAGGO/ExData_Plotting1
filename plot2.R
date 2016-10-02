library(dplyr)
#plot2.png
sub <- file %>% filter(Date == "2007-02-01" | Date == "2007-02-02");
datetime <- strptime(paste(sub$Date,sub$Time, sep=" "), 
                     "%Y-%m-%d %H:%M:%S");
png("plot2.png", width=480, height=480) ; 
plot(datetime, num, type="l", xlab="", 
           ylab="Global Active Power (kilowatts)")
dev.off(); 
