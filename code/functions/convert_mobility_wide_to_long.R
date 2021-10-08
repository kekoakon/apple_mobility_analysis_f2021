# Create a function that includes all the original columns from the data set
# with the addition of columns for the data and relative mobility.
# The data set should be in a long format and be generalized to do this for
# any subsetted state.

# Kekoa Kon
# kakon@dons.usfca.edu
# September 29, 2021

# create a function to convert the Apple mobility data from wide to long
convert_mobility_data_wide_to_long <- function(input_file_name) {

# load the "dplyr" package
library("dplyr")

# read in subsetted Apple Mobility data
state_data <- readr::read_csv(paste0("output/subsetted_data/",
"applemobilitytrends-2021-09-22_California.csv"))


# use a tidyr package to convert the data from wide format to long
state_data_long <- tidyr::pivot_longer(state_data, cols = starts_with("202"),
                                      names_to = "date",
                    values_to = "relative_mobility")


# save the long data set as a csv in the output directory
readr::write_csv(state_data_long, file = paste0("output/",
                                 "subsetted_states_long/",
                                          tools::file_path_sans_ext(
                                            basename(input_file_name)),
                                          "_",
                                          "wide_to_long",
                                          ".csv"))
}
# test out the function
source("code/functions/convert_mobility_wide_to_long.R")

convert_mobility_data_wide_to_long(paste0(
  input_file_name =  "output/subsetted_data/",
  "applemobilitytrends-2021-09-16_California.csv"))
