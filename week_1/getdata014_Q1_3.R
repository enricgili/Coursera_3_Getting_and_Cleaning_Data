library(xlsx)
colIndex <- 7:15
rowIndex <- 18:23
dat <- read.xlsx("getdata-data-DATA.gov_NGAP.xlsx",sheetIndex=1,colIndex=colIndex,rowIndex=rowIndex)
sum(dat$Zip*dat$Ext,na.rm=T)