#setwd("Documents/datasciencecoursera/Coursera_3_Getting_and_Cleaning_Data/week_4/")

#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv","dataGDP.csv",method="curl")

dataGDP <- read.csv("dataGDP.csv",dec=",",skip=4,nrows=190)
mean(as.numeric(gsub(",","",dataGDP[,5])))


grep("^United",dataGDP[,4])