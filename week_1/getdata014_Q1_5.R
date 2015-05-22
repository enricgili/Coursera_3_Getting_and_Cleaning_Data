library(data.table)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile = "idaho.csv", method="curl")
dateDownloaded <- date()
print(dateDownloaded)
DT <- fread("idaho.csv")
file.info("idaho.csv")$size
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(mean(DT[DT$SEX==1,]$pwgtp15)) + system.time(mean(DT[DT$SEX==2,]$pwgtp15))
system.time(rowMeans(DT)[DT$SEX==1]) + system.time(rowMeans(DT)[DT$SEX==2])