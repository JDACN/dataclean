#Week3 

## Q1

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url,"w3.csv")

dt<- read.csv("w3.csv")
print('Q1:')
print(which(dt$ACR == 3 & dt$AGS == 6)[1:3])

## Q2
print("--------")
print('Q2:')

library(jpeg)
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
img <- download.file(url, "jeff.jpg" ,mode = "wb")
data2 <- readJPEG("jeff.jpg" , native = TRUE)
print(quantile(data2,probs = c(0.3, 0.8)))


## Q3
print("--------")
print('Q3:')

library(data.table)
library(dplyr)

Url1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
Url2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

download.file(Url1, destfile = "GDP.csv" ,mode='wb')          # It has blanks at start :(
download.file(Url2, destfile = "country.csv" ,mode='wb')


#gdp <- read.csv("FGDP.csv", skip = 3)
#edu <- read.csv("country.csv")

gdp <- fread("GDP.csv", skip = 4, nrows = 190, select = c(1, 2, 4, 5), col.names = c("CountryCode", "Rank", "Economy", "Total"))
edu <- fread("country.csv")
merge <- merge(gdp, edu, by = 'CountryCode')


print(nrow(merge))
print(arrange(merge, desc(Rank))[13,5])

## Q4
print("--------")
print('Q4:')
print(tapply(merge$Rank, merge$`Income Group`, mean))


## Q5
print("--------")
print('Q5:')
merge$RankGroups <- cut(merge$Rank, breaks = 5)
print(table(merge$RankGroups, merge$`Income Group`))