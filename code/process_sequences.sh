#!/bin/bash 

# The goal of the script is to calculate and report out the total number of sequences
# in the file. The script should also tally the number of SARS-CoV-2 sequences from 
# the dataset from each country and sort the output by size: largest to smallest.

# Kekoa Kon
# November 1, 2021
# kakon@dons.usfca.edu

# Create command line arguments before continuing with the script 
if [ $# -eq 0 ]
then
	echo "Please include two arguments that are needed for the script to run:"
	echo "The first argument is a pathway to the compressed sequence dataset."
	echo "The second argument is to include 'TOTAL' for all detailed output."
	exit 1
fi

# Tally the sequences and sort by country.
if [ "$2" = 'TOTAL' ]
then 
	echo "The total number of sequences is: " "
fi

# Now sort the output by country from smallest to largest 
zgrep "isolate.*Homo" "$1" | cut -d"|" -f5 | sort | uniq -c |sort -rn
