library(readr)
library(dplyr)
library(lubridate)
library(ggplot2)
library(plotly)
#unify the datasets (i need to come back and add site22 and site22_two when im done with it)
str(unified_bodfish)
str(unified_bodfish_two)
str(unified_sawmill)
str(unified_sawmill_two)
unified_clarkia<-bind_rows(unified_bodfish, unified_bodfish_two, unified_sawmill, unified_sawmill_two, unified) |>
  mutate(number_germ = ifelse(is.na(number_germ), 0, number_germ))
#
ggplot(unified_clarkia, aes(x=number_germ))+
  geom_bar()
#
ggplot(unified_clarkia, aes(x=genotype_number, y=number_germ))+
  geom_col()
#
plot1 <- ggplot(
  unified_clarkia |> 
    filter(!is.na(number_germ)) # Correct filter placement
) +
  aes(x = number_germ, fill = month) +  # Aesthetics should be inside ggplot()
  geom_bar() +  # Use geom_bar() if number_germ is count data
  facet_wrap( ~ year) +  # Correct facet syntaxhttp://127.0.0.1:47729/graphics/b840e4e2-0b9f-4b47-b596-7bac4a8a9e59.png
  theme_light() +
  scale_fill_manual(values = c("blue", "red")) # Example for fill customization
#
ggplot(
  unified_clarkia   |>
    mutate(year_planted = year(date_planted))|> 
    filter(!is.na(number_germ))
) +
  aes(x = number_germ, fill = month) +
  geom_bar() +
  facet_grid(year_planted ~ year, labeller = "label_both")
  theme_light() +
  scale_fill_manual(values = c("blue", "red"))
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
plot_rainbow <- ggplot(
  unified_clarkia |> 
    filter(!is.na(number_germ)),
  aes(x = as.factor(genotype_number), y = number_germ, fill = as.factor(genotype_number), label=crosstype)) +  
  geom_col() +  
  facet_grid(as.factor(month) ~ as.factor(year)) +  # Separate plots by month and year
  theme_light() + 
  labs(x = "Genotype Number", y = "Number of Germ", fill = "Genotype") +  # Add labels
  theme(axis.text.x = element_text(angle = 45, hjust = 1), legend.position = "none")  # Rotate x-axis labels for readability
#
bar_germ1<- ggplot(
  unified_clarkia |> 
    filter(!is.na(number_germ)),
  aes(x = as.factor(number_germ))) +
  geom_bar()+
  facet_wrap(~ as.factor(crosstype)) +
  theme_light() +
  labs(x = "Number Germ") |>
  bar_germ1
bar_germ1 <- plot_ly()
#
bar_germ2 <- ggplot(
  unified_clarkia |> 
    filter(!is.na(number_germ),!is.na(crosstype)),
  aes(x = as.factor(month), fill = as.factor(crosstype))
) +
  geom_bar(stat = "count") +
  facet_wrap(~ crosstype) +
  theme_light() +
  labs(y = "Number Germ", x = "Month") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), legend.position = "none")

bar_germ3 <- ggplot(
  unified_clarkia |> 
    filter(!is.na(number_germ),!is.na(crosstype))|>
    mutate(year_month = paste(year, month))|>
    group_by(crosstype)|>
    mutate(tot_germ = sum(number_germ,na.rm=TRUE))|>
    ungroup()|>
    filter(tot_germ>50),
  aes(x = as.factor(year_month), fill = as.factor(crosstype))
) +
  geom_bar(stat = "count") +
  facet_wrap(~ crosstype,ncol = 1, strip.position = "right") +
  theme_light() +
  labs(y = "Number Germ", x = "Month") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), legend.position = "none")
#
bar_germ3 <- ggplot(
  unified_clarkia |> 
    filter(!is.na(number_germ),!is.na(crosstype))|>
    mutate(year_month = paste(year, month))|>
    group_by(crosstype)|>
    mutate(tot_germ = sum(number_germ,na.rm=TRUE))|>
    ungroup()|>
    filter(tot_germ>50),
  aes(x = as.factor(year_month), fill = as.factor(crosstype))
) +
  geom_bar(stat = "count") +
  facet_wrap(~ crosstype,ncol = 1, strip.position = "right") +
  theme_light() +
  labs(y = "Number Germ", x = "Month") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), legend.position = "none")
#
bar_germ4 <- ggplot(unified_clarkia |> 
  filter(!is.na(number_germ),!is.na(crosstype))|>
  mutate(year_month = paste(year, month))|>
  group_by(crosstype)|>
  mutate(tot_germ = sum(number_germ,na.rm=TRUE))|>
  ungroup()|>
  filter(tot_germ>50),
aes(x = as.factor(crosstype), fill = as.factor(year_month))) +
  geom_bar(stat = "count") +
  facet_wrap(~ year_month,ncol = 1, strip.position = "right") +
  theme_light() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1), legend.position = "none")
#
#Note that, for "number survived", data was ONLY collected for March 2013
bar_surv1<- ggplot(
  unified_clarkia |> 
    filter(!is.na(number_surv)),
  aes(x = as.factor(number_surv))) +
  geom_bar()+
  facet_wrap(~ as.factor(crosstype)) +
  theme_light() +
  labs(x = "Number Survived")
#