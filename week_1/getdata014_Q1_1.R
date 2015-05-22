data <- read.csv("getdata-data-ss06hid.csv",header=TRUE,sep=",")
newdata <- subset(data, VAL >= 24)
total <- length(newdata[,newdata$VAL])
print(total)


