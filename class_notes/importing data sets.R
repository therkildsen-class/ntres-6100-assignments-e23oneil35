library(tidyverse)
library(readxl)##install.packages("readxl")
library(googlesheets4)  ##install.packages("googlesheets4")
library(janitor)##install.packages("janitor")
## grabbing something online
lotr <- read_csv("https://raw.githubusercontent.com/jennybc/lotr-tidy/master/data/lotr_tidy.csv")

write_csv(lotr, file = "./data/lotr.csv")

lotr<- read.csv("data/lotr.csv")

lotr<- read.csv("Users/emily/OneDrive/Desktop/Git Hub/ntres-6100-assignments-e23oneil35/data/lotr.csv")

lotr<- read.csv("data/lotr.csv", skip = 1, comment = "#")

lotr <- read_xlsx("data/data_lesson11.xlsx", sheet = "FOTR")


gs4_deauth()
lotr_google <- read_sheet("https://docs.google.com/spreadsheets/d/1X98JobRtA3JGBFacs_JSjiX-4DPQ0vZYtNl_ozqF6IE/edit#gid=754443596", sheet = "FOTR", range = "A5:F15")


msa <- read_tsv("https://raw.githubusercontent.com/nt246/NTRES-6100-data-science/main/datasets/janitor_mymsa_subset.txt")
view(msa)

colnames(msa)
msa_clean <- clean_names(msa, case = "upper_camel")

cbind(colnames(msa), colnames(msa_clean))


parse_number("$100")
parse_number("80%")
parse_number("It cost $100")


# ##Day 2  ----------------------------------------------------------------


##parse function
parse_double("1,23",locale =locale(decimal_mark = ","))
parse_number("123.456.789", locale = locale(grouping_mark = "."))


mess = read_tsv("https://raw.githubusercontent.com/nt246/NTRES-6100-data-science/refs/heads/main/datasets/messy_data.tsv", locale = locale(decimal_mark = ","))


mess = read_tsv("https://raw.githubusercontent.com/nt246/NTRES-6100-data-science/refs/heads/main/datasets/messy_data.tsv", locale = locale(decimal_mark = ","), na = c("Missing", "N/A"))
problems()



