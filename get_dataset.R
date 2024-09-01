# Install and load  necessary packages
install.packages("openair")
rm(list = ls())
require(openair)
require(tidyverse)


# Specify the required monitoring stations
selected_sites <- c("Manchester Piccadilly", "Manchester Sharston")

# Get metadata for all monitoring stations and filter out the required stations
sites <- importMeta(all = TRUE) %>%
  unique() %>%
  filter(site %in% selected_sites)
# Download pollutant/weather data for selected monitoring stations from 2018 to 2024
dat <- importAURN(site = unique(sites$code),
                  year = 2018:2024,
                  meta = FALSE,
                  data_type = 'hourly',
                  verbose = FALSE)

# Define the file path
sites_file_path <- '/Users/songyuanjie/Desktop/Manchester_GMs_metadata.csv'
dat_file_path <- '/Users/songyuanjie/Desktop/Manchester_GMs_2018_2024.csv'

# Save the dataset as a CSV file
write_csv(sites, sites_file_path)
write_csv(dat, dat_file_path)
