#Check for jpeg library and install it if not present
if ("jpeg" %in% rownames(installed.packages()) == F){
        install.packages("jpeg"); library("jpeg")
}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg "
download.file(fileUrl,destfile = "jeff.jpg",method="curl")
dat <- readJPEG("jeff.jpg", native = TRUE)
quantile(dat,probs = c(.3,.8))