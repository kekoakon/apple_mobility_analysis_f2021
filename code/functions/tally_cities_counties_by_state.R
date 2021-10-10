# The goal of this script is to create a function that will read in any
# state and tally the rows grouped by city, county and
# transportation. Then, make a csv file and output it into the output directory

# Kekoa Kon
# September 24, 2021````````
# kakon@dons.usfca.edu

# Create a function to tally
# this should also create an output CSV file that is named based on the state
# that is subsetted
tally_cities_counties_by_state <- function(state_to_tally) {

  # load the dplyr package
  library("dplyr")

  # read in the complete csv file
  state_data <- readr::read_csv(state_to_tally)

  # use a dplyr chain to tally the city/county, region and transportation
  tallied_by_state <- state_data %>%
    select(geo_type, region, transportation_type) %>%
    group_by(geo_type, transportation_type) %>%
    tally()

  # check that the subsetted data actually has data in it
  if (nrow(tallied_by_state) == 0) {
    stop("ERROR, No rows matching given state name. Did you make a typo?")
  }

  # save the subset city and county data by state to a new csv file in the
  # output directory
  readr::write_csv(tallied_by_state, file = paste0("output/",
                                            "tallied_files/",
                                      tools::file_path_sans_ext(
                                        basename(state_to_tally)),
                                      "_",
                                      "tally_cities_counties_by_state",
                                      ".csv"))
}
