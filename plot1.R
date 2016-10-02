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
