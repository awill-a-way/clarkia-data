##This code is copied directly from Yaniv for the sake of reference
# Load required libraries
library(readr)
library(dplyr)
library(ggplot2)

# Define the URL of the dataset and read it into a data frame
ril_link <- "https://raw.githubusercontent.com/ybrandvain/datasets/refs/heads/master/clarkia_rils.csv"
ril_data <- readr::read_csv(ril_link) |> 
  dplyr::mutate(
    # Correcting a data entry issue where "1.8O" should be "1.80"
    growth_rate = case_when(growth_rate == "1.8O" ~ "1.80",
                            .default = growth_rate),  
    # Convert growth_rate to numeric
    growth_rate = as.numeric(growth_rate),
    # Create a binary variable 'visited' indicating if the plant was visited (mean_visits > 0)
    visited = mean_visits > 0
  )

# First ggplot: Bar plot of num_hybrid, grouped by petal_color and faceted by location
ggplot(
  ril_data |> 
    filter(
      !is.na(location),     # Exclude missing location values
      !is.na(petal_color),  # Exclude missing petal color values
      !is.na(petal_area_mm) # Exclude missing petal area values
    ) |> 
    mutate(
      # Create a binary variable 'big_petal' indicating whether petal_area_mm is greater than the median
      big_petal = petal_area_mm > median(petal_area_mm, na.rm=TRUE)
    ), 
  aes(x = num_hybrid, fill = petal_color, alpha = big_petal) # Map aesthetics
) +
  geom_bar() + # Bar plot
  facet_grid(paste(petal_color) ~ location) + # Facet by petal_color and location
  theme_light() + # Use a light theme
  scale_alpha_manual(values = c(.5,1)) # Manually set alpha values for big_petal

# Second ggplot: Density plot of num_hybrid, grouped by petal_color
ggplot(
  ril_data |> 
    filter(
      !is.na(location), 
      !is.na(petal_color),
      !is.na(petal_area_mm)
    ) |> 
    mutate(big_petal = petal_area_mm > median(petal_area_mm, na.rm=TRUE)), 
  aes(x = num_hybrid, fill = petal_color) # Map aesthetics
) +
  geom_density(alpha = .3) # Density plot with transparency

# Third ggplot: Density plot of num_hybrid, grouped by petal_color with an adjustment for smoothing
ggplot(
  ril_data |> 
    filter(
      !is.na(location), 
      !is.na(petal_color),
      !is.na(petal_area_mm)
    ) |> 
    mutate(big_petal = petal_area_mm > median(petal_area_mm, na.rm=TRUE)), 
  aes(x = num_hybrid, fill = petal_color) # Map aesthetics
) +
  geom_density(alpha = .3, adjust = 1.5) # Density plot with increased smoothing