fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(fileUrl,destfile = "Fwksst8110.for", method="curl")

data <- read.fwf(file="Fwksst8110.for",
                 skip = 4, 
                 widths = c(-1,9,-5,4,4,-5,4,4,-5,4,4,-5,4,4),
                 col.names=c("week","1+2_SST","1+2_SSTA","3_SST","3_SSTA","34_SST","34_SSTA","4_SST","4_SSTA"))
head(data)
sum(data[,4])