# Load necessary libraries
library(readxl)
library(dplyr)
library(ggplot2)
library(sf)
library(rnaturalearth)

# Step 1: Read the Datasets

# Read population data (POP.csv) and rename columns appropriately
pop_data <- read.csv("C:/Users/owner/Documents/R_map_plot/POP.csv", skip = 4) %>%
  rename(
    ISO3 = X,
    Country = X.3,
    Population_Thousands = X.4
  ) %>%
  select(ISO3, Country, Population_Thousands) %>%
  filter(!is.na(Population_Thousands)) %>%  # Remove rows with NA in Population_Thousands
  mutate(
    Population = as.numeric(gsub(",", "", Population_Thousands)) * 1000  # Convert population to actual numbers
  ) %>%
  select(ISO3, Country, Population)  # Keep only relevant columns

# Read wind energy data (Data_windenergy.xlsx)
wind_data <- read_excel("C:/Users/owner/Documents/R_map_plot/Data_windenergy.xlsx") %>%
  select(`Country/Area`, `Capacity (MW)`) %>%
  rename(
    Country = `Country/Area`,
    Capacity_MW = `Capacity (MW)`
  )

# Step 2: Process Wind Data

# Group by country and calculate total wind capacity (MW)
wind_capacity_by_country <- wind_data %>%
  group_by(Country) %>%
  summarise(Total_Capacity_MW = sum(Capacity_MW, na.rm = TRUE))

# Step 3: Merge Data

# Merge population data with wind capacity data
merged_data <- pop_data %>%
  left_join(wind_capacity_by_country, by = "Country") %>%
  mutate(
    Per_Capita_Capacity_kW = (Total_Capacity_MW * 1000) / Population  # Calculate per-capita wind capacity in kW
  )

# Step 4: Prepare Map Data

# Load world map data
world_map <- ne_countries(scale = "medium", returnclass = "sf")

# Merge map data with the processed dataset using ISO3 country codes
map_data <- world_map %>%
  left_join(merged_data, by = c("iso_a3" = "ISO3"))

# Step 5: Generate the Map

ggplot(data = map_data) +
  geom_sf(aes(fill = Per_Capita_Capacity_kW), color = "gray80", size = 0.1) +
  scale_fill_viridis_c(name = "kW per person", na.value = "gray90") +
  theme_minimal() +
  labs(
    title = "Per-Capita Wind Capacity by Country (kW per person)",
    subtitle = "Based on population and wind energy capacity data",
    caption = "Source: POP.csv and Data_windenergy.xlsx"
  )

