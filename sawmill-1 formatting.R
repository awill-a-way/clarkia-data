# load libraries 
library(dplyr)
library(janitor)
library(readxl)
library(stringr)

# LOAD SAWMILL DATA 1
sawmill_original <- read_xlsx("Ziploc Experiment Field Data Sheets_ Sawmill-1.xlsx",skip =1)
colnames(sawmill_original) <- str_replace(string = colnames(sawmill_original),pattern = "1st", replacement =  "first" )
sawmill_original <-   clean_names(sawmill_original)|>
  rename(planting_notes = notes_11)

###############
# FORMAT SAWMILL
###############

# feb13
sawmill_Feb13 <- sawmill_original|>
  select(1:17)|>
  mutate(year = 2013,
         month = "feb")
colnames(sawmill_Feb13) <- str_remove(string = colnames(sawmill_Feb13), "_\\d." )

# march13
sawmill_Mar13 <- sawmill_original|>
  select(c(1:11,18:25))|>
  mutate(year = 2013,
         month = "mar")
colnames(sawmill_Mar13) <- str_remove(string = colnames(sawmill_Mar13), "_\\d." )

sawmill_Mar13 <- sawmill_Mar13 |>
  rename(number_germ = number_new_germ)|>
  mutate(number_lvs = as.numeric(number_lvs))

# sawmill mayjun
sawmill_Mayjun13 <- sawmill_original|>
  select(c(1:11,26:42))|>
  mutate(year = 2013,
         month = "may-jun")
colnames(sawmill_Mayjun13) <- str_remove(string = colnames(sawmill_Mayjun13), "_\\d." )


# UNIFIED sawmill 2013 observstions
bind_rows(sawmill_Feb13, sawmill_Mar13,sawmill_Mayjun13, sawmill_Feb14)


#feb 2014
sawmill_Feb14 <-sawmill_original|>
  select(c(1:11, 59:64))|>
  mutate(year = 2014,
         month = "feb")
colnames(sawmill_Feb14) <- str_remove(string = colnames(sawmill_Feb14), "_\\d.")
#Mayjun 2014 (by myself)
sawmill_Mayjun14 <-sawmill_original|>
  select(c(1:11, 65:72))|>
  mutate(year = 2014,
         month = "Mayjun")
colnames(sawmill_Mayjun14) <- str_remove(string = colnames(sawmill_Mayjun14), "_\\d.")
# UNIFIED sawmill 2013 observations
bind_rows(sawmill_Feb13, sawmill_Mar13,sawmill_Mayjun13, sawmill_Feb14)
#feb 2014
sawmill_Feb14 <-sawmill_original|>
  select(c(1:11, 59:64))|>
  mutate(year = 2014,
         month = "feb")
colnames(sawmill_Feb14) <- str_remove(string = colnames(sawmill_Feb14), "_\\d.")
#Mayjun 2014
sawmill_Mayjun14 <-sawmill_original|>
  select(c(1:11, 65:72))|>
  mutate(year = 2014,
         month = "Mayjun")
colnames(sawmill_Mayjun14) <- str_remove(string = colnames(sawmill_Mayjun14), "_\\d.")


#totally unified sawmill
unified_sawmill <- bind_rows(sawmill_Feb13,sawmill_Mar13,sawmill_Mayjun13,sawmill_Feb14,sawmill_Mayjun14)