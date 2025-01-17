# Per-Capita Wind Capacity by Country

This repository contains the code, datasets, and outputs for visualizing per-capita wind energy capacity by country.

## Project Structure


## Description

This project visualizes the per-capita wind energy capacity (in kW per person) globally, based on population and wind energy capacity data.

## Data

1. **Population Data (`POP.csv`)**:
   - Contains country ISO3 codes, names, and populations (in thousands).

2. **Wind Energy Data (`Data_windenergy.xlsx`)**:
   - Contains wind energy capacity (in MW) for each country.

## Output

The project generates two maps:
- `Map_plot_with_customised_dataset.png`: Based on actual datasets.
- `Versatile_map_plot.png`: Based on example data.

## Usage

### Prerequisites
- R (≥ 4.0.0)
- R libraries: `readxl`, `dplyr`, `ggplot2`, `sf`, `rnaturalearth`

### Steps to Run
1. Clone the repository:
