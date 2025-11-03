library(tidyverse)
library(gapminder)

est <- read_csv('https://raw.githubusercontent.com/OHI-Science/data-science-training/master/data/countries_estimated.csv')
view(est)


gapminder <- gapminder |>
  rename("life_exp" = lifeExp, "gdp_per_cap" = gdpPercap)


gapminder_est <- gapminder |> 
  left_join(est)



cntry <- "Belguim"
country_list <- c("Albania", "Canada", "Spain")
country_list <- unique(gapminder$country)
length(country_list)

dir.create("figures")

for (cntry in country_list) {
  
  gap_to_plot <- gapminder_est |> 
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




dir.create("figures/europe_1")

gap_europe <- gapminder_est |> 
  filter(continent == "Europe") |> 
  mutate(gdp_tot = gdp_per_cap * pop)

country_list_europe <- unique(gap_europe$country)

cntry <- country_list_europe

for (cntry in country_list_europe) {
  
  print(str_c("plotting", cntry))
  
  gap_to_plot <- gap_europe |> 
    filter(country == cntry)
  
  my_plot <- ggplot(data = gap_to_plot, mapping = aes(x = year, y = gdp_tot))+
    geom_point()+
    labs(title = str_c(cntry, "GDP", sep = " "))
  
  if(any(gap_to_plot$estimated == "yes")) {
    print(str_c(cntry, " data are estimated"))
    
    my_plot <- my_plot +
      labs(subtitle = "Estimated data")
  } else {
    print(str_c(cntry, " data are reported"))
    
    my_plot <- my_plot +
      labs(subtitle = "Reported data")
    
  }
  
  print(str_c("plotting ", cntry))
  
  ggsave(filename = str_c(cntry, "_gdp_totpng", sep = ""), plot = my_plot)
  
}



view(gapminder_est)
