library(readr)
library(dplyr)
library(ggplot2)
#unify the datasets (i need to come back and add site22_2 when im done with it)
str(unified_bodfish)
str(unified_bodfish_two)
str(unified_sawmill)
str(unified_sawmill_two)
unified_clarkia<-bind_rows(unified_bodfish, unified_bodfish_two, unified_sawmill, unified_sawmill_two)
#
ggplot(unified_clarkia, aes(x=number_germ))+
  geom_bar()
#
ggplot(unified_clarkia, aes(x=genotype_number, y=number_germ))+
  geom_col()
#
ggplot(
  unified_clarkia |> 
    filter(!is.na(number_germ)) # Correct filter placement
) +
  aes(x = number_germ, fill = as.factor(year)) +  # Aesthetics should be inside ggplot()
  geom_bar() +  # Use geom_bar() if number_germ is count data
  facet_grid(month ~ year) +  # Correct facet syntax
  theme_light() +
  scale_fill_manual(values = c("blue", "red", "green")) # Example for fill customization
#
ggplot(
  unified_clarkia |> 
    filter(!is.na(number_germ))
) +
  aes(x = as.factor(genotype_number), y = number_germ, fill = as.factor(genotype_number)) +  
  geom_col() +  
  facet_grid(as.factor(month) ~ as.factor(year)) +  # Separate plots by month and year
  theme_light() +
  labs(x = "Genotype Number", y = "Number of Germ", fill = "Genotype") +  # Add labels
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate x-axis labels for readability
#
boxplot(unified_clarkia$number_germ)
