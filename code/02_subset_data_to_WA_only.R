# Script to read in Apple mobility data from a csv file
# and subset the data to just include rows from Washington
# and then write out a csv file that has that subset

# Kekoa Kon
# email:kakon@dons.usfca.edu
# September 1st, 2021

# read in the complete csv file
all_covid_data <- read.csv("data/raw_data/applemobilitytrends-2021-08-30.csv")

# subset the dataset to only include rows where the sub.region column has
# "Washington" in it but we want all columns.
washington_data <- all_covid_data[all_covid_data$sub.region == "Washington", ]

# Lastly, save the Washington data into it's own csv file in the output section
# of the folder.
write.csv(washington_data, file = "output/washington_apple_mobility_data.csv")
