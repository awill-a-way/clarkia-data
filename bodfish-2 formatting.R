# load libraries 
library(dplyr)
library(janitor)
library(readxl)
library(stringr)

# LOAD BODFISH DATA 2
bodfish_two <- read_xlsx("Ziploc_Experiment_Field_Data_Sheets_Bodfish-2013.xlsx",skip =1)
colnames(bodfish_two) <- str_replace(string = colnames(bodfish_two),pattern = "1st", replacement =  "first" )
bodfish_two <-   clean_names(bodfish_two)

###############
# FORMAT BODFISH
###############