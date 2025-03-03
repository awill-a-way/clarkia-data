# load libraries 
library(dplyr)
library(janitor)
library(readxl)
library(stringr)

# LOAD sawmill DATA 2
sawmill_two <- read_xlsx("Ziploc Experiment Field Data Sheets_ sawmill_2013.xlsx",skip =1)
colnames(sawmill_two) <- str_replace(string = colnames(sawmill_two),pattern = "1st", replacement =  "first" )
sawmill_two <-   clean_names(sawmill_two)

###############
# FORMAT SAWMILL 2
###############

#Important Note: The May/June survey(s?) in sawmill 2 do NOT have a notes section

#feb 2014 two
sawmill_Feb14two <-sawmill_two|>
  select(c(1:16))|>
  mutate(year = 2014,
         month = "feb")
colnames(sawmill_Feb14two) <- str_remove(string = colnames(sawmill_Feb14two), "_\\d.")
#mayjun 2014 two
sawmill_mayjun14two <-sawmill_two|>
  select(c(1:10, 17:24))|>
  mutate(year = 2014,
         month = "mayjun")
colnames(sawmill_mayjun14two) <- str_remove(string = colnames(sawmill_mayjun14two), "_\\d.")
#feb 2015 two
sawmill_Feb15two <-sawmill_two|>
  select(c(1:10, 25:30))|>
  mutate(year = 2015,
         month = "feb")
colnames(sawmill_Feb15two) <- str_remove(string = colnames(sawmill_Feb15two), "_\\d.")
#mayjun 2015 two
sawmill_mayjun15two <-sawmill_two|>
  select(c(1:10, 31:39))|>
  mutate(year = 2015,
         month = "mayjun")
colnames(sawmill_mayjun15two) <- str_remove(string = colnames(sawmill_mayjun15two), "_\\d.")
#idk why but there's a SECOND mayjune 2015 survey in sawmill 2
sawmill_2ndmayjun15two <-sawmill_two|>
  select(c(1:10, 40:48))|>
  mutate(year = 2015,
         month = "mayjun")
colnames(sawmill_2ndmayjun15two) <- str_remove(string = colnames(sawmill_mayjun15two), "_\\d.")

#Unified sawmill 2014+2015 two (excluding 2nd mayjun2015)
unified_sawmill_two_exclude <- bind_rows(sawmill_Feb14two,sawmill_mayjun14two,sawmill_Feb15two,sawmill_mayjun15two)
unified_sawmill_two_exclude$first_flower <- as.character(unified_sawmill_two_exclude$first_flower)
#Unified sawmill 2014+2015 two (including 2nd mayjun2015)
unified_sawmill_two <- bind_rows(unified_sawmill_two_exclude,sawmill_2ndmayjun15two)