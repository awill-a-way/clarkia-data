# load libraries 
library(dplyr)
library(janitor)
library(readxl)
library(stringr)

# LOAD BODFISH DATA 2 (otherwise known as bodfish 2013)
bodfish_two <- read_xlsx("Ziploc Experiment Field Data Sheets_ Bodfish_2013.xlsx",skip =1)
colnames(bodfish_two) <- str_replace(string = colnames(bodfish_two),pattern = "1st", replacement =  "first" )
colnames(bodfish_two) <- str_replace(string = colnames(bodfish_two),pattern = "#", replacement =  "number" )
bodfish_two <-   clean_names(bodfish_two)

###############
# FORMAT BODFISH
###############


#feb 2014 two
bodfish_Feb14two <-bodfish_two|>
  select(c(1:16))|>
  mutate(year = 2014,
         month = "feb")
colnames(bodfish_Feb14two) <- str_remove(string = colnames(bodfish_Feb14two), "_\\d.")
#mayjun 2014 two (note that 17:25 is uncertain)
bodfish_mayjun14two <-bodfish_two|>
  select(c(1:10, 17:25))|>
  mutate(year = 2014,
         month = "mayjun")
colnames(bodfish_mayjun14two) <- str_remove(string = colnames(bodfish_mayjun14two), "_\\d.")
#feb 2015 two
bodfish_Feb15two <-bodfish_two|>
  select(c(1:10, 26:31))|>
  mutate(year = 2015,
         month = "feb")
colnames(bodfish_Feb15two) <- str_remove(string = colnames(bodfish_Feb15two), "_\\d.")
#mayjun 2015 two
bodfish_mayjun15two <-bodfish_two|>
  select(c(1:10, 32:40))|>
  mutate(year = 2015,
         month = "mayjun")
colnames(bodfish_mayjun15two) <- str_remove(string = colnames(bodfish_mayjun15two), "_\\d.")
#Unified bodfish 2014+2015 two
unified_bodfish_two<-bind_rows(bodfish_Feb14two,bodfish_mayjun14two,bodfish_Feb15two,bodfish_mayjun15two)
unified_bodfish_two$row <- as.double(unified_bodfish_two$row)
#note that, for bodfish two (meaning 2013), "first flower" has a date AND description of the flower