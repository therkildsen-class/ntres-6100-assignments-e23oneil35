calc_shrub_vol <- function(length, width, height) {
  area <- length * width
  volume <- area * height
  return(volume)
}

calc_shrub_vol(0.8, 1.6, 2.0)
calc_shrub_vol(length = 0.8, width = 1.6, height = 2.0)

## area and volume not able to be called outside of the function
## need to use print to see the values

##specify data the order of the numbers by position or by listing out the specific name 
## i.e "length = 0.8", "width = 1.6", "height = 2.0"

## default value in fucntion (height = 1)
calc_shrub_vol <- function(length, width, height = 1) {
  area <- length * width
  volume <- area * height
  return(volume)
}
calc_shrub_vol(length = 0.8, width = 1.6)
## did not need to specifcy height because it has a default value of 1

calc_shrub_vol(length = 0.8, width = 1.6, height = 3.0)
## can go in can chnage the defult value 


convert_pounds_to_grams <- function(pounds){
  grams <- 453.6 * pounds
  return (grams)
}

convert_pounds_to_grams(3.75)



## estimating shrub mass 
library(tidyverse)

est_shrub_mass <- function(volume) {
  mass <- 2.65 * volume^0.9
  return(mass)
}

shrub_volume <- calc_shrub_vol(length = 0.8, width = 1.6, height = 2.0)
shrub_mass <- est_shrub_mass(calc_shrub_vol(0.8, 1.6, 2.0))

calc_shrub_vol(0.8, 1.6, 2.0) |> 
  est_shrub_mass()

##functions within functions

est_shrub_mass_from_raw <- function(length, width, height) {
  volume <- calc_shrub_vol(length, width, height)
  mass <- est_shrub_mass(volume)
  return(mass)
}

est_shrub_mass_from_raw(0.8, 1.6, 2.0)



### for loop and functions

library(tidyverse)
library(gapminder)


gapminder <- gapminder |> 
  rename("life_exp" = lifeExp, "gdp_per_cap" = gdpPercap)


est <- read_csv('https://raw.githubusercontent.com/OHI-Science/data-science-training/master/data/countries_estimated.csv')
gapminder_est <- gapminder |> 
  left_join(est)


cntry <- "Belgium"
country_list <- c("Albania", "Canada", "Spain")


dir.create("figures")
dir.create("figures/europe")

country_list <- unique(gap_europe$country)

gap_europe <- gapminder_est |> 
  filter(continent == "Europe") |> 
  mutate(gdp_tot = gdp_per_cap * pop)


#cntry <- "Albania"

print_plot <- function(cntry) {
  
  print(str_c("Plotting ", cntry))
  
  gap_to_plot <- gap_europe |> 
    filter(country == cntry)
  
  my_plot <- ggplot(data = gap_to_plot, mapping = aes(x = year, y = gdp_tot)) +
    geom_point() +
    labs(title = str_c(cntry, "GDP", sep = " "), 
         subtitle = ifelse(any(gap_to_plot$estimated == "yes"), "Estimated data", "Reported data"))
  
  ggsave(filename = str_c("figures/europe/", cntry, "_gdp_tot.png", sep = ""), plot = my_plot)
  
}

##for loop

for(cntry in country_list){
  print_plot(cntry)
}

##changing to add "stat"

##change stat to stat = "gdp_per_cap" to print specific stat that will be printed in the print plot

print_plot <- function(cntry, stat) {
  
  print(str_c("Plotting ", cntry))
  
  gap_to_plot <- gap_europe |> 
    filter(country == cntry)
  
  my_plot <- ggplot(data = gap_to_plot, mapping = aes(x = year, y = get(stat))) +
    geom_point() +
    labs(title = str_c(cntry, "GDP", sep = " "), 
         subtitle = ifelse(any(gap_to_plot$estimated == "yes"), "Estimated data", "Reported data"))
  
  ggsave(filename = str_c("figures/europe/", cntry, "_", stat, ".png", sep = ""), plot = my_plot)
  
}
print_plot ("Germnany")
## these print other stats that were not defined in the beginning of the function 
print_plot ("Germany", "gdp_per_cap")
print_plot ("Germany", "pop")


##for loop

for(cntry in country_list){
  print_plot(cntry)
}



