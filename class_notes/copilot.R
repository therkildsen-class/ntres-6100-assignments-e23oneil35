##install.packages("polmerpenguins")
library(polmerpenguins)
library(tidyverse)

#explore penguin dataset
glimpse(penguins)
view(penguins)

#vizulaize bill length by species
ggplot(data = penguins) +
  geom_boxplot(mapping = aes(x = species, y = bill_len, fill = species)) +
  labs(title = "Bill Length by Penguin Species",
       x = "Penguin Species",
       y = "Bill Length (mm)") +
  theme_minimal()

#what is the relationship between body mass and flipper length in penguins
ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_len, y = body_mass, color = species)) +
  labs(title = "Body Mass vs Flipper Length in Penguins",
       x = "Flipper Length (mm)",
       y = "Body Mass (g)") +
  theme_minimal()

#what is the relationship between body mass and flipper length in penguins by sex 
ggplot(data = penguins) +
  geom_point(mapping = aes(x = flipper_len, y = body_mass, color = sex)) +
  labs(title = "Body Mass vs Flipper Length in Penguins by Sex",
       x = "Flipper Length (mm)",
       y = "Body Mass (g)") +
  theme_minimal()


#install.packages("knitr")
library(gapminder)
library(janitor)
library(knitr)

head(gapminder) |> kable()

gapminder_clean<- gapminder |> 
  clean_names()

#create a plot of gdp_per_cap vs year for each country use for loops and gg