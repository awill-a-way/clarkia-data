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
# FORMAT sawmill
###############


#feb 2014 two
sawmill_Feb14two <-sawmill_two|>
  select(c(1:16))|>
  mutate(year = 2014,
         month = "feb")
colnames(sawmill_Feb14two) <- str_remove(string = colnames(sawmill_Feb14two), "_\\d.")
#mayjun 2014 two (note that 17:25 is uncertain)
sawmill_mayjun14two <-sawmill_two|>
  select(c(1:10, 17:25))|>
  mutate(year = 2014,
         month = "mayjun")
colnames(sawmill_mayjun14two) <- str_remove(string = colnames(sawmill_mayjun14two), "_\\d.")
#feb 2015 two
sawmill_Feb15two <-sawmill_two|>
  select(c(1:10, 26:31))|>
  mutate(year = 2015,
         month = "feb")
colnames(sawmill_Feb15two) <- str_remove(string = colnames(sawmill_Feb15two), "_\\d.")
#mayjun 2015 two
sawmill_mayjun15two <-sawmill_two|>
  select(c(1:10, 32:40))|>
  mutate(year = 2015,
         month = "mayjun")
colnames(sawmill_mayjun15two) <- str_remove(string = colnames(sawmill_mayjun15two), "_\\d.")

#Unified sawmill 2014+2015 two
bind_rows(sawmill_Feb14two,sawmill_mayjun14two,sawmill_Feb15two,sawmill_mayjun15two)
