library(XML)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
download.file(fileUrl,destfile = "restaurants.xml",method="curl")
doc <- xmlTreeParse("restaurants.xml",useInternal=TRUE)
rootNode <- xmlRoot(doc)
ziplist <- as.numeric(xpathSApply(rootNode,"//zipcode",xmlValue)) #find all nodes called 'zipcode'
length(ziplist[ziplist==21231])
