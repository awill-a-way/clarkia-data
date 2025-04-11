# load libraries 
library(dplyr)
library(janitor)
library(readxl)
library(stringr)

# LOAD BODFISH DATA 1
bodfish_original <- read_xlsx("Ziploc Experiment Field Data Sheets_ Bodfish-1.xlsx",skip =1)
colnames(bodfish_original) <- str_replace(string = colnames(bodfish_original),pattern = "1st", replacement =  "first" )
colnames(bodfish_original) <- str_replace(string = colnames(bodfish_original),pattern = "#", replacement =  "number" )
bodfish_original <-   clean_names(bodfish_original)|>
  rename(planting_notes = notes_11)

###############
# FORMAT BODFISH
###############

# feb13
bodfish_Feb13 <- bodfish_original|>
  select(1:17)|>
  mutate(year = 2013,
         month = "feb")
colnames(bodfish_Feb13) <- str_remove(string = colnames(bodfish_Feb13), "_\\d." )

# march13
bodfish_Mar13 <- bodfish_original|>
  select(c(1:11,18:25))|>
  mutate(year = 2013,
         month = "mar")
colnames(bodfish_Mar13) <- str_remove(string = colnames(bodfish_Mar13), "_\\d." )

bodfish_Mar13 <- bodfish_Mar13 |>
  mutate(number_lvs = as.numeric(number_lvs))#I removed rename(number_germ = number_new_germ) from here
#bodfish mayjun
bodfish_Mayjun13 <- bodfish_original|>
  select(c(1:11,26:42))|>
  mutate(year = 2013,
         month = "mayjun")
colnames(bodfish_Mayjun13) <- str_remove(string = colnames(bodfish_Mayjun13), "_\\d." )
#feb 2014 (by myself)
bodfish_Feb14 <-bodfish_original|>
  select(c(1:11, 59:64))|>
  mutate(year = 2014,
         month = "feb")
colnames(bodfish_Feb14) <- str_remove(string = colnames(bodfish_Feb14), "_\\d.")
#Mayjun 2014 (by myself)
bodfish_Mayjun14 <-bodfish_original|>
  select(c(1:11, 65:72))|>
  mutate(year = 2014,
         month = "mayjun")
colnames(bodfish_Mayjun14) <- str_remove(string = colnames(bodfish_Mayjun14), "_\\d.")
#unified bodfish
unified_bodfish<- bind_rows(bodfish_Feb13,bodfish_Mar13,bodfish_Mayjun13,bodfish_Feb14,bodfish_Mayjun14)