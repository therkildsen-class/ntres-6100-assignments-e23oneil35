library(tidyverse)
library(skimr)

coronavirus <- read_csv('https://raw.githubusercontent.com/RamiKrispin/coronavirus/master/csv/coronavirus.csv')

ggbase<-coronavirus |> 
  filter(type == "confirmed") |> 
  group_by(date) |> 
  summarise(total_cases = sum(cases)) |> 
  ggplot(mapping = aes(x= date, y= total_cases))

ggbase +
  geom_label()

ggbase+
  geom_point()

ggbase+
  geom_col(color = "red")

ggbase+
  geom_area(color = "red", fill = "red")

ggbase+
  geom_line(color = "purple",linetype = "dashed")

ggbase+
  geom_point(mapping = aes(size= total_cases, color= total_cases), alpha = 0.5)+
  theme_minimal()+
  theme(legend.background = element_rect(fill="lemonchiffon", color="grey50", linewidth=1))

ggbase+
  geom_point(mapping = aes(size = total_cases, color=total_cases)), alpha = 0.4)+
  theme_minimal()+
  labs(x= "Date", y ="Total confirmed cases",title ="Daily counts of new conornavirus cases")

coronavirus |> 
  filter(type=="confirmed") |> 
  group_by(date, country) |> 
  summarise(total = sum(cases)) |> 
  ggplot()+
  geom_line(mapping = aes(x= date, y = total, color = country))

top5 <- coronavirus |> 
  filter(type =="confirmed") |> 
  group_by(country) |> 
  summarise(total=sum(cases)) |> 
  arrange(-total) |> 
  head(5) |> 
  pull(country)



# ###09/25/2025  ----------------------------------------------------------

top5 <- coronavirus |> 
  filter(type =="confirmed") |> 
  group_by(country) |> 
  summarise(total=sum(cases)) |> 
  arrange(-total) |> 
  head(5) |> 
  pull(country)

coronavirus |> 
  filter(type=="confirmed", country %in% top5, cases >=0) |> 
  group_by(date, country) |> 
  summarise(total = sum(cases)) |> 
  ggplot()+
  geom_line(mapping = aes(x= date, y = total, color = country))+
  facet_wrap(~country, ncol =1)
 ## ncol makes it split up into single columns



       