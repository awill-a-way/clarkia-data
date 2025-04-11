# load libraries 
library(dplyr)
library(janitor)
library(readxl)
library(stringr)

# LOAD SITE22 DATA 1
site22_two <- read_xlsx("Ziploc Experiment Field Data Sheets_ Site 22_2013.xlsx",skip =1)
colnames(site22_two) <- str_replace(string = colnames(site22_two),pattern = "1st", replacement =  "first" )
site22_two <-   clean_names(site22_two)

###############
# FORMAT SITE22 2013
###############

#Feb14 (I'm uncertain about the year here)
site22_Feb14two <- site22_two|>
  select(1:16)|>
  mutate(year = 2014,
         month = "feb")
colnames(site22_Feb14two) <- str_remove(string = colnames(site22_Feb14two), "_\\d." )
site22_Feb14two <-  clean_names(site22_Feb14two)
#MayJun14 (I'm uncertain about the year here)
site22_MayJun14two <- site22_two|>
  select(1:11, 17:24)|>
  mutate(year = 2013,
         month = "mayjun")
colnames(site22_MayJun14two) <- str_remove(string = colnames(site22_MayJun14two), "_\\d." )
site22_MayJun14two <-  clean_names(site22_MayJun14two)
#Feb15
site22_Feb15two <- site22_two|>
  select(1:11, 26:31)|>
  mutate(year = 2015,
         month = "feb")
colnames(site22_Feb15two) <- str_remove(string = colnames(site22_Feb15two), "_\\d." )
site22_Feb15two <-  clean_names(site22_Feb15two)
#MayJun15
site22_MayJun15two <- site22_two|>
  select(1:11, 32:40)|>
  mutate(year = 2015,
         month = "mayjun")
colnames(site22_MayJun15two) <- str_remove(string = colnames(site22_MayJun15two), "_\\d." )
site22_MayJun15two <-  clean_names(site22_MayJun15two)
#Using fix22 on the site22 data (reference site22-1 formatting for the function)
site22_Feb14two <- fix22(site22_Feb14two)
site22_Feb15two <- fix22(site22_Feb15two)
site22_MayJun14two <- fix22(site22_MayJun14two) #gave warning
site22_MayJun15two <- fix22(site22_MayJun15two)
#Unifying site22 2013
unified_site22_two <- bind_rows(site22_Feb14two, site22_Feb15two, site22_MayJun14two, site22_MayJun15two)
  unified_site22_two <- unified_site22_two %>% select(-date)