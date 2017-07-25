#WEEK 4 Quiz
#Q 1
#____________
print("Q1:")

library(data.table)
#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "qz4data.csv")
d <- read.csv("qz4data.csv")
print(strsplit(names(d), split = "wgtp")[123])

#Q 2
#____________
print("--------")
print("Q2:")

#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", "qz4data2.csv")
dt <- read.csv("qz4data2.csv")
clean <- gsub(",","",dt[,5])
print(mean(as.numeric(clean[1:215]),na.rm = TRUE))

#Q 4
#____________
print("--------")
print("Q4:")

#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile = "quiz4data3.csv")

data2 <- read.csv("quiz4data3.csv")

#download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile = "quiz4data4.csv")

data3 <- read.csv("quiz4data4.csv")

setnames(data2, c("X", "X.1", "X.3", "X.4"), c("CountryCode", "rankingGDP", "Long.Name", "gdp"))

all <- merge(data2, data3, by = "CountryCode")

print(table(grepl("june", tolower(all$Special.Notes)), grepl("fiscal year end", tolower(all$Special.Notes)))[4])

#Q 5
#____________
print("--------")
print("Q5:")

library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
timeDT <- data.table::data.table(timeCol = sampleTimes)

print(" How many values were collected in 2012? ")
print(timeDT[(timeCol >= "2012-01-01") & (timeCol) < "2013-01-01", .N ])

print("How many values were collected on Mondays in 2012?")
print(timeDT[((timeCol >= "2012-01-01") & (timeCol < "2013-01-01")) & (weekdays(timeCol) == "Monday"), .N ])

