library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 

length(grep("^2012",sampleTimes))

twentytwelve <- sampleTimes[grep("^2012",sampleTimes)]
length(twentytwelve[weekdays(twentytwelve)=="Monday"])