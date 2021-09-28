# The goal of this script is to create a function that will read in any
# subsetted mobility data and tally the rows grouped by city, county and
# transportation. Then, make a csv file and output it into the output directory

# Kekoa Kon
# September 24, 2021
# kakon@dons.usfca.edu

# Create a function to subset any city and county out of the full dataset
# this should also create an output CSV file that is named based on the state
# that is subsetted
subset_city_county <- function(input_file_name, city_county_to_subset) {

   # read in the complete csv file
  all_covid_data <- read.csv(input_file_name)

  # subset the dataset to only include rows where the sub.region column has
  # the state name in it, but we want all columns.
  state_data <- all_covid_data[all_covid_data$sub.region
                                     == city_county_to_subset, ]

  # check that the subsetted data actually has data in it
  if (nrow(state_data) == 0) {
    stop("ERROR, No rows matching given state name.
         Did you make a typo?")
  }

  # load dplyr package
  library("dplyr")

  # load in the dataset
  input_file_name <- "data/raw_data/applemobilitytrends-2021-09-22.csv"
  city_county_to_subset <- read.csv(input_file_name)

  # starting off with dplyr chains
  count_cities_counties_by_type <- state_data %>%
    select(geo_type, region, transportation_type) %>%
    group_by(geo_type, transportation_type) %>%
    tally()

  # write out the result of the dplyr chain
  write.csv(count_cities_counties_by_type,
            "output/cities_counties_counts.csv")

  # save the city county data to a new csv file in the output directory
  write.csv(count_cities_counties_by_type, file = paste0("output/",
                                      tools::file_path_sans_ext(
                                        basename(input_file_name)),
                                      "_",
                                      city_county_to_subset,
                                      ".csv"))
}

# test the function
subset_city_county(
  input_file_name = "data/raw_data/applemobilitytrends-2021-09-16.csv",
  city_county_to_subset = "California")
