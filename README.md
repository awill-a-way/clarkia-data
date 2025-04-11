# clarkia-data
#I edited this file on 2/12/2025 at 5:48 PM
#3/18 - Focus on making a graph and summary stats. next week, be able to point at patterns (specifically with germination)
#barplots for germinants?
#3/27 - Make plots of germination (bar plots wrapped by year planted and colored by type, FIX MAY JUN) and survival
#4/9 function advice
add2 <- function(x){
x <- x+2
return(x)
}

add2(1)
#
#moved notes from site22-1 here
#Unified below isn't working so we need to check which dates aren't the same
typeof(site22_Feb12$date) #was logical
typeof(site22_Feb13$date) #double
typeof(site22_Mar13$date) #double
typeof(site22_MayJun13$date) #Was "Warning message: Unknown or uninitialised column: `date`." Now logical
typeof(site22_MayJun14$date) #Was "Warning message: Unknown or uninitialised column: `date`." Now logical
typeof(site22_Feb15$date) #double
typeof(site22_MayJun15$date) #Was "Warning message: Unknown or uninitialised column: `date`." Now logical
