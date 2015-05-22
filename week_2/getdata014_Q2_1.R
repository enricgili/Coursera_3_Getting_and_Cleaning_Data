library(httr)
library("jsonlite", lib.loc="~/Library/R/3.1/library")
library("httpuv", lib.loc="~/Library/R/3.1/library")

oauth_endpoints("github")

#Enter unique ID and client secret from github dev app API 
myapp <- oauth_app("github",
                   key = "3d7a8409c42aa21c73ce",
                   secret = "1e1b2b6f5d71d2c76077eb8325297f865cea6f27")
# Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

#use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
json1 <- content(req)
json2 <- jsonlite::fromJSON(toJSON(json1))

#Look for the 'datasharing' row and find the 'created_at' value
json2[json2["name"]=="datasharing",]$created_at