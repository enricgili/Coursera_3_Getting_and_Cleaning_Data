con = url("http://biostat.jhsph.edu/~jleek/contact.html ")
htmlcode = readLines(con)
close(con)
c(nchar(htmlcode[10]),nchar(htmlcode[20]),nchar(htmlcode[30]),nchar(htmlcode[100]))
  
