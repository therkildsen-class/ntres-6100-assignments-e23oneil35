library(tidyverse)


table1
?table1

##table one is in "tidy format": each cel has its own variable
table1

table2


table3


table4a
table4b

###rate of cases by population
table1 |> 
  mutate(rate = cases/population *10000)

##how to get the total counts by year
table1 |> 
  group_by(year) |> 
  summarize(total =sum(cases))

table1 |> 
  ggplot(mapping = aes(x = year, y = cases))+
  geom_line()

##compute the rate for table2, and table4a and table4b:
##extract the numbe rof TB cases per coutnry per year
##extract the matching popltion per coutnry per year
##divide cases by popultion and multiply by 10,000
##store back in the appropriate place

table2 |> 
  mutate(rate = cases/population)

##can't do it due to structure of the data 


# Pivot functions ---------------------------------------------------------

## pivot_longer
table4a |> 
  pivot_longer(c('1999','2000'), names_to = "Year", values_to = "Cases")

table4b |> 
  pivot_longer(c('1999','2000'), names_to = "Year", values_to = "Pop.")


##pivot_wider
table2 |> 
  pivot_wider(names_from = type, values_from = count)

table3
##currently has two variables (cases and pop. counts) in one cell, breaks the each cell should have a single data point rule

##seperate function

table3 |> 
  separate(rate, into = c("cases", "population"), sep = "/", convert = TRUE)

table5 <-table3 |> 
  separate(year, into = c("century", "year"), sep = 2)

table5 |> 
  unite(fullyear, century, year, sep = "")

coronavirus
view(coronavirus)
