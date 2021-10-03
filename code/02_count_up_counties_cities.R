# The goal of this script is to load in the function created to tally
# cities and counties by state using a dplyr chain. Then use a for loop to
# tally cities and counties for any given state and save to the tallied files
# in the output directory

# Kekoa Kon
# September 28, 2021
# kakon@dons.usfca.edu

# load the function to tally the counties and cities of a state
source("code/functions/tally_cities_counties_by_state.R")

# create a for loop to create csv files with tallies for cities and counties
# transportation
for (state in c("California", "Texas", "New York", "Oregon",
     "Michigan", "Alabama", "Virginia")) {
  tally_cities_counties_by_state(state_to_tally = state)

}
