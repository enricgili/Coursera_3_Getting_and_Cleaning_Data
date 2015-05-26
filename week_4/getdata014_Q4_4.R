#setwd("Documents/datasciencecoursera/Coursera_3_Getting_and_Cleaning_Data/week_4/")

#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv","dataGDP.csv",method="curl")
#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv ","fedstats.csv",method="curl")

dataGDP <- read.csv("dataGDP.csv",dec=",",skip=4,nrows=190)
fedstats <- read.csv("fedstats.csv")

# Match the data based on the country shortcode
m1 <- merge(dataGDP,fedstats,by.x="X",by.y="CountryCode")

length(grep("^Fiscal year end: [Jj]une",(m1[,"Special.Notes"])))