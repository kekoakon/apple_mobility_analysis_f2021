# Script to read in Apple mobility data from a csv file
# and subset the data to just include rows from any particular US state
# and then write out a csv file that only has that subset
# uses functions in the code/function directory. Then use a for loop to subset
# multiple states and save into the output directory

# Kekoa Kon
# kakon@dons.usfca.edu
# September 17th, 2021

# load functions
source("code/functions/subset_mobility_data_to_state.R")

subset_mobility_data_to_state(
  input_file_name = "data/raw_data/applemobilitytrends-2021-09-16.csv",
  state_to_subset = "California")

# create a for loop to output files with the given state names
for (state in c("California", "Texas", "New York", "Oregon",
                "Michigan", "Alabama", "Virginia")) {
  subset_mobility_data_to_state(
    input_file_name = "data/raw_data/applemobilitytrends-2021-09-16.csv",
    paste(state_to_subset = state))
}
