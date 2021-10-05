# Create a function that includes all the original columns from the data set
# with the addition of columns for the data and relative mobility.
# The data set should be in a long format and be generalized to do this for
# any subsetted state.

# Kekoa Kon
# kakon@dons.usfca.edu
# September 29, 2021

# create a function to convert the Apple mobility data from wide to long
convert_mobility_data_wide_to_long <- function(state_data)

# load the "dplyr" package
library("dplyr")

# read in subsetted Apple Mobility data
input_file_name <- paste0("output/subsetted_data/",
                          "applemobilitytrends-2021-09-16",
                          "_",
                          state_data,
                          ".csv")

# run dplyr to filter out the State column to only in
state_data <- all_covid_data %>%
  dplyr::filter(sub.region == "California")

# save the long data set as a csv in the output directory
readr::write_csv(, file = paste0("output/",
                                 "subsetted_states_long/",
                                          tools::file_path_sans_ext(
                                            basename(input_file_name)),
                                          "_",
                                          "convert_mobility_data_wide_to_long",
                                          ".csv"))







