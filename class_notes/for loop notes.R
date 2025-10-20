library(tidyverse)
library(gapminder)


cntry <- "Belguim"
country_list <- c("Albania", "Canada", "Spain")
country_list <- unique(gapminder$country)
length(country_list)

dir.create("figures")

for (cntry in country_list) {

gap_to_plot <- gapminder |> 
  filter(country == cntry)

my_plot <- ggplot(data = gap_to_plot, mapping = aes(x = year, y = gdp_per_cap))+
  geom_point()+
  labs(title = str_c(cntry, "GDP per Cap", sep = " "))

ggsave(filename = str_c("figures/", cntry, "_gdp_per_cap.png", sep = ""), plot = my_plot)

}


#Exercise:
#Modify our for loop so that it:
#loops through countries in Europe only
#plots the product of gdp_per_cap and population size per year (should approximate the total GDP) instead of the gdp_per_cap
#saves the plots to a new subfolder inside the (recreated) figures folder called “Europe”.


cntry <- "Belguim"

dir.create("figures/europe_1")

gap_europe <- gapminder |> 
  filter(continent == "Europe") |> 
  mutate(gdp_tot = gdp_per_cap * pop)

country_list_europe <- unique(gap_europe$country)

for (cntry in country_list_europe) {
  
  gap_to_plot <- gap_europe |> 
    filter(country == cntry)
  
  my_plot <- ggplot(data = gap_to_plot, mapping = aes(x = year, y = gdp_tot))+
    geom_point()+
    labs(title = str_c(cntry, "GDP", sep = " "))
  
  print(str_c("plotting ", cntry))
  
  ggsave(filename = str_c(cntry, "_gdp_totpng", sep = ""), plot = my_plot)
  
}
