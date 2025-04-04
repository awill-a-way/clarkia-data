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
#site22_Feb12$date <- as.double(site22_Feb12$date) #this command is explained and repeated before unifying
#Feb13
site22_Feb13 <- site22_original|>
  select(1:11, 18:23)|>
  mutate(year = 2013,
         month = "feb")
colnames(site22_Feb13) <- str_remove(string = colnames(site22_Feb13), "_\\d." )
#March13
site22_Mar13 <- site22_original|>
  select(1:11, 24:31)|>
  mutate(year = 2013,
         month = "mar")
colnames(site22_Mar13) <- str_remove(string = colnames(site22_Mar13), "_\\d." )
#MayJun13
site22_MayJun13 <- site22_original|>
  select(1:11, 32:39)|>
  mutate(year = 2013,
         month = "mayjun")
site22_MayJun13 <- site22_MayJun13 %>% mutate(date = NA_real_)
colnames(site22_MayJun13) <- str_remove(string = colnames(site22_MayJun13), "_\\d." )
#MayJun14
site22_MayJun14 <- site22_original|>
  select(1:11, 69:77)|>
  mutate(year = 2014,
         month = "mayjun")
site22_MayJun14 <- site22_MayJun14 %>% mutate(date = NA_real_)
colnames(site22_MayJun14) <- str_remove(string = colnames(site22_MayJun14), "_\\d." )
#The last column in MayJun14 is a note column BUT it is technically not under May/June Survey
#Feb15
site22_Feb15 <- site22_original|>
  select(1:11, 78:83)|>
  mutate(year = 2015,
         month = "feb")
colnames(site22_Feb15) <- str_remove(string = colnames(site22_Feb15), "_\\d." )
#MayJun15
site22_MayJun15 <- site22_original|>
  select(1:11, 84:92)|>
  mutate(year = 2015,
         month = "mayjun")
site22_MayJun15 <- site22_MayJun15 %>% mutate(date = NA_real_)
colnames(site22_MayJun15) <- str_remove(string = colnames(site22_MayJun15), "_\\d." )
#Unified below isn't working so we need to check which dates aren't the same
typeof(site22_Feb12$date) #was logical
typeof(site22_Feb13$date) #double
typeof(site22_Mar13$date) #double
typeof(site22_MayJun13$date) #Was "Warning message: Unknown or uninitialised column: `date`." Now logical
typeof(site22_MayJun14$date) #Was "Warning message: Unknown or uninitialised column: `date`." Now logical
typeof(site22_Feb15$date) #double
typeof(site22_MayJun15$date) #Was "Warning message: Unknown or uninitialised column: `date`." Now logical
#Changing ALL dates to double
double_date <- function(x) {x$date <- as.double(x$date)}
double_date(site22_Feb12)
double_date(site22_Feb13)
double_date(site22_Mar13)
double_date(site22_MayJun13)
double_date(site22_MayJun14)
double_date(site22_Feb15)
double_date(site22_MayJun15)
#test unify
test1_unified_site22 <- bind_rows(site22_Feb12, site22_Feb13) #error
test2_unified_site22 <- bind_rows(site22_Feb13, site22_Mar13) #error
test3_unified_site22 <- bind_rows(site22_MayJun13, site22_MayJun14) #this one worked????
#date is not working so im just gonna delete it for now
site22_Feb12 <- site22_Feb12 %>% select(-date)
site22_Feb13 <- site22_Feb13 %>% select(-date)
site22_Mar13 <- site22_Mar13 %>% select(-date)
site22_MayJun13 <- site22_MayJun13 %>% select(-date)
site22_MayJun14 <- site22_MayJun14 %>% select(-date)
site22_Feb15 <- site22_Feb15 %>% select(-date)
site22_MayJun15 <- site22_MayJun15 %>% select(-date)
#this isn't working??????
site22_Feb12 <- site22_Feb12 %>% mutate(date = NULL)
site22_Feb13 <- site22_Feb13 %>% mutate(date = NULL)
site22_Mar13 <- site22_Mar13 %>% mutate(date = NULL)
site22_MayJun13 <- site22_MayJun13 %>% mutate(date = NULL)
site22_MayJun14 <- site22_MayJun14 %>% mutate(date = NULL)
site22_Feb15 <- site22_Feb15 %>% mutate(date = NULL)
site22_MayJun15 <- site22_MayJun15 %>% mutate(date = NULL)
#Unified site22-1 data
unified_site22 <- bind_rows(site22_Feb12, site22_Feb13, site22_Mar13, site22_MayJun13, site22_MayJun14, site22_Feb15, site22_MayJun15)



str(site22_Feb12)
str(site22_Feb12)
  
  2,typeof),
apply(site22_Feb13,2,typeof))
apply(site22_Mar13,2,class),
apply(site22_MayJun13,2,class),
apply(site22_MayJun14,2,class),
apply(site22_Feb15,2,class),
apply(site22_MayJun15,2,class))
  




