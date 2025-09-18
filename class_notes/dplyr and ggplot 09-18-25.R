library(tidyverse)
library(skimr)

coronavirus <- read_csv('https://raw.githubusercontent.com/RamiKrispin/coronavirus/master/csv/coronavirus.csv')


select(coronavirus, contains ("y"))

### more shorthand notes in the lecture notes for this class 

select(coronavirus, contains ("y"), everything())


filter(coronavirus, country =="US")
## make new object 

coronavirus_us <-filter(coronavirus, country =="US")

coronavirus_us2 <- select(coronavirus_us, -lat, -long, -province)

## |> is the pipe function (shift, control, m)

coronavirus |> 
  filter(countries == "US")

####coronavirus |> 
  ##filter(countries == "US")   is the same as coronavirus_us <-filter(coronavirus, country =="US")

coronavirus |> 
  filter(country == "US") |> 
  select(-lat, -long, -province)

##### use the |>  funtion to subset the coronVIRUS dataset to only include the daily death counts in the US, canada, and mexico including the following variables in this order: country, date, cASES
## do not use quotation marks when calling a variable names
## only when calling text strings
coronavirus |> 
  filter(type == "death", country %in% c("US", "Canada", "Mexico")) |> 
  select(country, date, cases)

##check how to spell (gives unique value and count )
coronavirus |> 
  count(country) |> 
  view()

## pipe into ggplot
coronavirus |> 
  filter(type == "death", country %in% c("US", "Canada", "Mexico")) |> 
  select(country, date, cases) |> 
  ggplot()+ 
  geom_line(mapping = aes(x = date, y= cases, color = country))




# Vaccine Data ------------------------------------------------------------
## mutate function

vacc <- read_csv("https://raw.githubusercontent.com/RamiKrispin/coronavirus/main/csv/covid19_vaccine.csv")

view(vacc)

max(vacc$date)


vacc |> 
  filter(date == max(date)) |> 
  select(country_region, continent_name, people_at_least_one_dose, population) |> 
  mutate(vaxxrate = round(people_at_least_one_dose/population,2))

## round () funtion 

## excerise 

## new variable 
vacc |> 
  filter(date == max(date)) |> 
  select(country_region, continent_name, people_at_least_one_dose, population, doses_admin) |> 
  mutate(dose_per_vaxx = doses_admin/people_at_least_one_dose) |> 
  ggplot()+
  geom_histogram(mapping = aes(x= dose_per_vaxx))

  
vacc |> 
  filter(date == max(date), doses_admin > 200*10^6) |> 
  select(country_region, continent_name, people_at_least_one_dose, population, doses_admin) |> 
  mutate(dose_per_vaxx = doses_admin/people_at_least_one_dose)



vacc |> 
  filter(date == max(date)) |> 
  select(country_region, continent_name, people_at_least_one_dose, population, doses_admin) |> 
  mutate(dose_per_vaxx = doses_admin/people_at_least_one_dose) |> 
  filter(dose_per_vaxx >3) |> 
  arrange(-dose_per_vaxx) |> 
  head()



### exercise

vacc |> 
  filter(date == max(date)) |> 
  select(country_region, continent_name, people_at_least_one_dose, population, doses_admin) |> 
  mutate(dose_per_vaxx = doses_admin/people_at_least_one_dose) |> 
  filter(dose_per_vaxx >0.9) |> 
  arrange(-dose_per_vaxx) |> 
  head()

  

# Summarize ---------------------------------------------------------------



