# Script to read in Apple mobility data from a csv file
# and subset the data to just include rows from California
# and then write out a csv file that only has that subset

# Kekoa Kon
# kakon@dons.usfca.edu
# August 31, 2020

# read in the complete csv file
all_covid_data <- read.csv("data/raw_data/applemobilitytrends-2021-08-30.csv")

# subset the dataset to only include rows where the sub.region column has
# "California" in it but we want all columns. We need to be careful to
# exclude "Baja California"
california_data <- all_covid_data[all_covid_data$sub.region == "California", ]

# save the California data to a new csv file in the output directory
write.csv(california_data, file = "output/california_apple_mobility_data.csv")
