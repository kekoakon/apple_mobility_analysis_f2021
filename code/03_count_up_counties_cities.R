# the goal of this script is to use the dplyr package to count up the
# number of cities and counties in a given state that have detailed
# Apple mobility data avaialable and then eventually save it to a csv

# Kekoa Kon
# September 23, 2021
# kakon@dons.usfca.edu

# load the package "dplyr"
library("dplyr")

# we would like to get a count of the number of cities and the
# number of counties in a given state that have driving mobility
# data. The input to this will be the output of the previous script
# namely the state csv files that were already subsetted.

# load in the dataset from the previous script
input_file_name <- "output/applemobilitytrends-2021-09-16_California.csv"
state_data <- read.csv(input_file_name)

# starting off with dplyr chains
count_cities_counties_by_type <- state_data %>%
  select(geo_type, region, transportation_type) %>%
  group_by(geo_type, transportation_type) %>%
  tally()

write.csv(count_cities_counties_by_type,
          "output/california_cities_counties_counts.csv")
