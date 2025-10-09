library(tidyverse)
library(nycflights13)

##install.packages("nycflights13")


# Row binding -------------------------------------------------------------


fship <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Fellowship_Of_The_Ring.csv")

ttow <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Two_Towers.csv")

rking <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/The_Return_Of_The_King.csv")

lotr <- bind_rows(fship, ttow, rking)

fship_no_female <- fship |> 
  select(Male, Film, Race)

bind_rows(ttow,fship_no_female, rking)


# Join Functions  ---------------------------------------------------------

flights
view(flights)

airlines
airports

planes |> 
  count(tailnum)|> 
  filter(n > 1)

planes |> 
  count(year) |> 
  tail()

weather
view(weather)

weather |> 
  count(time_hour, origin) |> 
  filter(n > 1)

planes |> 
  filter(is.na(tailnum))

flights2 <- flights |> 
  select(year:day, hour, origin, dest, tailnum, carrier)

flights2


airlines

### join airline table with "flight 2" table based on carrier column varibles

flights2 |> 
  left_join(airlines)

flights2 |> 
  left_join(weather)

flights2 |> 
  left_join(planes, join_by(tailnum), suffix = c("_flight","_planes"))

flights2
airports

flights2 |> 
  left_join(airports, join_by(origin == faa))

flights2 |> 
  left_join(airports, join_by(origin == faa))

airports2 <- airports |> 
  select(faa, name, lat, lon)
airports2

flights2 |> 
  left_join(airports2, join_by(origin == faa)) |> 
  left_join(airports2, join_by (dest == faa), suffix = c("_origin", "_dest"))


# Filter_join -------------------------------------------------------------

airports |>
  semi_join(flights2, join_by(faa == origin))

flights2 |> 
  anti_join(airports, join_by(dest == faa)) |> 
  distinct(dest)
  count(dest)
  
  
## filter flights to only show flights with planes that have flown at least 100 flights (hint: use summarize ()or count () first)
  
planes
planes_gt100 <- flights2 |> 
  group_by(tailnum) |> 
  summarise(count =n()) |> 
  filter(count > 100)

##short hand way 
flights2 |> 
  count(tailnum) |> 
  filter(n >100)

flights |> 
  semi_join(planes_gt100)
