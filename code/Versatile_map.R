# Load required libraries
library(ggplot2)
library(dplyr)
library(countrycode)
library(sf) # New library for spatial data handling

# Example dataset: Wind capacity (in GW) and population (in millions) for each country
data <- data.frame(
  iso3 = c("USA", "CHN", "IND", "DEU", "DNK", "BRA", "ZAF"),
  wind_capacity_gw = c(150, 300, 50, 60, 10, 20, 5), # Wind capacity in GW
  population_millions = c(331, 1441, 1393, 83, 6, 213, 60) # Population in millions
)

# Calculate per-capita wind capacity (kW per person)
data <- data %>%
  mutate(wind_capacity_kw_per_person = (wind_capacity_gw * 1e6) / (population_millions * 1e3))

# Add country names for mapping
data$country <- countrycode(data$iso3, origin = "iso3c", destination = "country.name")

# Load world map as an sf object
world_map_sf <- st_as_sf(getMap(resolution = "low"))

# Merge wind capacity data with map data
# Match by country name
map_data <- world_map_sf %>%
  left_join(data, by = c("NAME" = "country"))

# Plot the map using ggplot2
ggplot(map_data) +
  geom_sf(aes(fill = wind_capacity_kw_per_person), color = "black", size = 0.1) +
  scale_fill_gradient(low = "lightblue", high = "red", na.value = "grey50",
                      name = "kW per Person") +
  theme_minimal() +
  labs(title = "Per-Capita Wind Capacity by Country",
       subtitle = "Measured in kW per person",
       caption = "Source: Example Data") +
  theme(axis.text.x = element_blank(),
        axis.text.y = element_blank(),
        axis.ticks = element_blank(),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank())
