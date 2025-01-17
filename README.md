# Per-Capita Wind Capacity by Country

This repository contains the code, datasets, and outputs for visualizing per-capita wind energy capacity by country.

## Project Structure


## Description

This project visualizes the per-capita wind energy capacity (in kW per person) globally, based on population and wind energy capacity data. The project uses R to calculate and map global wind capacity trends, allowing for insightful comparisons between countries.

## Data


1. **Population Data (`POP.csv`)**:
   - Contains:
     - ISO3 country codes.
     - Country names.
     - Population data in thousands.
   - Used to calculate actual population values.

2. **Wind Energy Data (`Data_windenergy.xlsx`)**:
   - Contains:
     - Country names.
     - Wind energy capacity in megawatts (MW).
   - Used to calculate total and per-capita wind capacity.


## Output

The project generates two maps:

1. **`Map_plot_with_customised_dataset.png`**:
   - Based on real datasets (`POP.csv` and `Data_windenergy.xlsx`).
   - Visualizes per-capita wind capacity globally.

2. **`Versatile_map_plot.png`**:
   - Created with example data in `Versatile_map.R`.
   - Demonstrates the flexibility of the mapping script.

## Usage

### Prerequisites

To run this project, you will need:

1. **R** (≥ 4.0.0)
2. The following R libraries:
   - `readxl`: For reading Excel files.
   - `dplyr`: For data manipulation.
   - `ggplot2`: For visualization.
   - `sf`: For spatial data handling.
   - `rnaturalearth`: For world map data.

Install these libraries in R using:
```R
install.packages(c("readxl", "dplyr", "ggplot2", "sf", "rnaturalearth"))

### Steps to Run
1. Clone the repository: git clone https://github.com/Deepikag8/R_Map_Project.git
# R_Map_Project
