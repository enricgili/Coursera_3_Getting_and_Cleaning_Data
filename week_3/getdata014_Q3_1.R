fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl,destfile = "ss06hid.csv",method="curl")
dat <- read.csv("ss06hid.csv")

#create logical vector
agricultureLogical <- dat$ACR == 3 & dat$AGS == 6
true <- which(agricultureLogical)
head(true,n=3)
