library(tidyverse)
library(skimr) #install.packages("skimr")

coronavirus <- read_csv('https://raw.githubusercontent.com/RamiKrispin/coronavirus/master/csv/coronavirus.csv')

###differen ways to look at the data
summary(coronavirus)
skim(coronavirus)
view(coronavirus)
head(coronavirus)
tail(coronavirus)

##how to look at individual variables 
  ##base R
coronavirus$cases


## filter function 
? filter
## filter by cases
filter(coronavirus, cases > 0)

## filter by countries
coronavirus_US <-filter(coronavirus, country =="US")
  ##not the US
filter(coronavirus, country !="US")

### OR function 
filter(coronavirus, country =="US" | country =="Canada")
    ## AND would be &

filter(coronavirus, country =="US" & type == "death")

filter(coronavirus, country == c("US", "Canada"))
filter(coronavirus, country %in%c("US", "Canada"))

##subset the data to only show the death counts in 3 european countries on today's date in 2021

filter(coronavirus, country %in% c("Denmark", "Italy", "Spain"), type == "death", date == "2021-09-16")


### how to only keep certain rows 
  ### control over orfer by how you order the select function 

select(coronavirus, date, country, type, cases)
## how to get rid of one column 
select(coronavirus, -province)

## create a new data frame including only country, lat, long

select(coronavirus,country, lat, long)
select(coronavirus, date:cases)


