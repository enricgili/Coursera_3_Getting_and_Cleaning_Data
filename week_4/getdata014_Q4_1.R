#setwd("Documents/datasciencecoursera/Coursera_3_Getting_and_Cleaning_Data/week_4/")

#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv","ss06hid.csv",method="curl")

ss06hid <- read.csv("ss06hid.csv", quote="")
strsplit(names(ss06hid),"wgtp")[123]
