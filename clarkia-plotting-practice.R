library(readr)
library(dplyr)
library(ggplot2)
#example
ggplot(ril_data, aes(x=prop_hybrid))+
  geom_bar()
#
ggplot(ril_data, aes(x=prop_hybrid))+
  geom_bar()
#
ggplot(unified_clarkia, aes(x=germ))+
  geom_bar()
#
ggplot(unified_bodfish_two, aes(x=genotype_number, y=number_germ))+
  geom_bar()
#
View(unified_bodfish_two)