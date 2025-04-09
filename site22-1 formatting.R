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
site22_Feb12 <-  clean_names(site22_Feb12)
#site22_Feb12$date <- as.double(site22_Feb12$date) #this command is explained and repeated before unifying
#Feb13
site22_Feb13 <- site22_original|>
  select(1:11, 18:23)|>
  mutate(year = 2013,
         month = "feb")
colnames(site22_Feb13) <- str_remove(string = colnames(site22_Feb13), "_\\d." )
site22_Feb13 <- clean_names(site22_Feb13)
#March13
site22_Mar13 <- site22_original|>
  select(1:11, 24:31)|>
  mutate(year = 2013,
         month = "mar")
colnames(site22_Mar13) <- str_remove(string = colnames(site22_Mar13), "_\\d." )
site22_Mar13 <- clean_names(site22_Mar13)
#MayJun13
site22_MayJun13 <- site22_original|>
  select(1:11, 32:39)|>
  mutate(year = 2013,
         month = "mayjun")
site22_MayJun13 <- site22_MayJun13 %>% mutate(date = NA_real_)
colnames(site22_MayJun13) <- str_remove(string = colnames(site22_MayJun13), "_\\d." )
site22_MayJun13 <- clean_names(site22_MayJun13)
#MayJun14
site22_MayJun14 <- site22_original|>
  select(1:11, 69:77)|>
  mutate(year = 2014,
         month = "mayjun")
site22_MayJun14 <- site22_MayJun14 %>% mutate(date = NA_real_)
colnames(site22_MayJun14) <- str_remove(string = colnames(site22_MayJun14), "_\\d." )
site22_MayJun14 <- clean_names(site22_MayJun14)
#The last column in MayJun14 is a note column BUT it is technically not under May/June Survey
#Feb15
site22_Feb15 <- site22_original|>
  select(1:11, 78:83)|>
  mutate(year = 2015,
         month = "feb")
colnames(site22_Feb15) <- str_remove(string = colnames(site22_Feb15), "_\\d." )
site22_Feb15 <- clean_names(site22_Feb15)
#MayJun15
site22_MayJun15 <- site22_original|>
  select(1:11, 84:92)|>
  mutate(year = 2015,
         month = "mayjun")
site22_MayJun15 <- site22_MayJun15 %>% mutate(date = NA_real_)
colnames(site22_MayJun15) <- str_remove(string = colnames(site22_MayJun15), "_\\d." )
site22_MayJun15 <- clean_names(site22_MayJun15)
#Unified below isn't working so we need to check which dates aren't the same
typeof(site22_Feb12$date) #was logical
typeof(site22_Feb13$date) #double
typeof(site22_Mar13$date) #double
typeof(site22_MayJun13$date) #Was "Warning message: Unknown or uninitialised column: `date`." Now logical
typeof(site22_MayJun14$date) #Was "Warning message: Unknown or uninitialised column: `date`." Now logical
typeof(site22_Feb15$date) #double
typeof(site22_MayJun15$date) #Was "Warning message: Unknown or uninitialised column: `date`." Now logical
#creation of the fix22 function (originally was for JUST date but now also for number leaves, petal length, and petal width)
fix22 <- function(x) {
  x$date <- as.double(x$date)
    if(sum(colnames(x) == "number_lvs") == 1) {
      x$number_lvs <- as.double(x$number_lvs)
      }
  if(sum(colnames(x) == "petal_length") == 1) {
    x$petal_length <- as.numeric(x$petal_length)
    }
  if(sum(colnames(x) == "petal_width") == 1) {
    x$petal_width <- as.numeric(x$petal_width)
  }
  if(sum(colnames(x) == "asd") == 1) {
    x$asd <- as.numeric(x$asd)
  }
  if(sum(colnames(x) == "notes") == 1) {
    x$notes <- as.character(x$notes)
  }
  if(sum(colnames(x) == "notes_2") == 1) {
    x$notes_2 <- as.character(x$notes_2)
  }
  if(sum(colnames(x) == "number_germ") == 1) {
    x$number_germ <- as.double(x$number_germ)
  }
  if(sum(colnames(x) == "site") == 1) {
    x$site <- as.character(x$site)
  }
  if(sum(colnames(x) == "first_flower") == 1) {
    x$first_flower <- as.character(x$first_flower)
  }
  return(x)
}
#Fixing each month/year for site22 for unifying
site22_Feb12 <- fix22(site22_Feb12)
site22_Feb13 <- fix22(site22_Feb13)
site22_Mar13 <- fix22(site22_Mar13)
site22_MayJun13 <- fix22(site22_MayJun13)
site22_MayJun14 <- fix22(site22_MayJun14)
site22_Feb15 <- fix22(site22_Feb15)
site22_MayJun15 <- fix22(site22_MayJun15)
#test unify
test1_unified_site22 <- bind_rows(site22_Feb12, site22_Feb13) #FIXED
test2_unified_site22 <- bind_rows(site22_Feb13, site22_Mar13) #FIXED
test3_unified_site22 <- bind_rows(site22_MayJun13, site22_MayJun14) #FIXED
#Unified site22-1 data (removing date for later complete unification)
unified_site22 <- bind_rows(site22_Feb12, site22_Feb13, site22_Mar13, site22_MayJun13, site22_MayJun14, site22_Feb15, site22_MayJun15)
  unified_site22 <- unified_site22 %>% select(-date)
#


str(site22_Feb12)
str(site22_Feb12)
  
  2,typeof),
apply(site22_Feb13,2,typeof))
apply(site22_Mar13,2,class),
apply(site22_MayJun13,2,class),
apply(site22_MayJun14,2,class),
apply(site22_Feb15,2,class),
apply(site22_MayJun15,2,class))