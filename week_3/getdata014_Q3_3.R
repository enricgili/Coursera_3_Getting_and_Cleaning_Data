#Check for dyplr library and install it if not present
if ('dyplr' %in% rownames(installed.packages()) == F){
        install.packages("dyplr"); library("dplyr")
}

fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileUrl1,destfile = "GDP.csv",method="curl")
gdp <- read.csv("GDP.csv", header=F, skip=5, nrows=190)

fileUrl2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileUrl2,destfile = "FEDSTATS_Country.csv",method="curl")
ed <- read.csv("FEDSTATS_Country.csv")

mergedData <- merge(gdp, ed, by.x="V1",by.y="CountryCode",all = F)
mergedData <- rename(mergedData,rank = V2, CountryName = V4)
mergedData <- arrange(mergedData,desc(rank))
mergedData[13,]$CountryName

#question 4
aggregate(mergedData$rank, by=list(IncomeGroup = mergedData$Income.Group), FUN = mean)


#question 5 — 
qntl <- quantile(mergedData$rank,c(0,.2,.4,.6,.8,1))
rank <- cut(mergedData$rank,breaks <- qntl)
table(mergedData$Income.Group,rank)


