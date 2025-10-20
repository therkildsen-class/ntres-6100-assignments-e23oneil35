##install.packages("dslabs")
library(tidyverse)
library(dslabs)


gapminder %>% as_tibble()%>%
  head(5)

view(gapminder)

# Extract a vector with the 5 countries with the largest population size

top5_countries <- gapminder|> 
  filter(year == 2015) |> 
  arrange(-population) |> 
  select(country) |> 
  head(5) |> 
  pull()
  
gapminder |> 
  filter(country %in% top5_countries) |> 
  ggplot()+
  geom_line(mapping = aes(x= year, y= population, color= country))


##Question 2. Rank the following countries in infant mortality rate in 2015.
##Turkey, Poland, South Korea, Russia, Vietnam, South Africa

gapminder |> 
  filter(year == 2015, country %in% c("Turkey", "Poland", "South Korea", "Russia", "Vietnam", "South Africa")) |>
  arrange(infant_mortality) |> 
  select(country,infant_mortality) |> 
  knitr::kable()

#Question 3. What is the general relationship between per-capita GDP and fertility rate?

gapminder |> 
  filter(year == 2000) |>
  mutate(gdp_pop = gdp/population) |> 
  ggplot(aes(y=fertility, x =gdp_pop))+
  geom_point()+
  geom_smooth(se=F, method="lm")

#Question 4. If you break down the relationship between per-capita GDP and fertility rate by continent, which continent (or regions) stands out as an outlier? (Bonus question: why might this be?)

gapminder |> 
  filter(year== "2000") |> 
  ggplot(aes(y=fertility, x = gdp/population, color=continent))+
  geom_point()
 
  
 
 
  
