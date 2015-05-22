#setwd("Documents//datasciencecoursera/Coursera_3_Getting_and_Cleaning_Data/week_2/")
options(gsubfn.engine = "R")
library(sqldf)

#Download the American Community Survey data and load it into an R object called 'acs'
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl,destfile = "ss06pid.csv",method="curl")

#read csv into sqldf
acs <- read.csv.sql("ss06pid.csv",header=TRUE,sep=",")
sqldf("select distinct AGEP from acs")




