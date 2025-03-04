# load libraries 
library(dplyr)
library(janitor)
library(readxl)
library(stringr)

# LOAD SITE22 DATA 1
site22_original <- read_xlsx("Ziploc Experiment Field Data Sheets_ Site 22-1.xlsx",skip =1)
colnames(site22_original) <- str_replace(string = colnames(site22_original),pattern = "1st", replacement =  "first" )
site22_original <-   clean_names(site22_original)

###############
# FORMAT SITE22
###############

#Feb12
site22_Feb12 <- site22_original|>
  select(1:17)|>
  mutate(year = 2012,
         month = "feb")
colnames(site22_Feb12) <- str_remove(string = colnames(site22_Feb12), "_\\d." )
#Feb13
site22_Feb13 <- site22_original|>
  select(18:23)|>
  mutate(year = 2013,
         month = "feb")
colnames(site22_Feb13) <- str_remove(string = colnames(site22_Feb13), "_\\d." )
#March13
site22_mar13 <- site22_original|>
  select(24:31)|>
  mutate(year = 2013,
         month = "mar")
colnames(site22_mar13) <- str_remove(string = colnames(site22_mar13), "_\\d." )