#!/bin/bash 

# The goal of the script is to calculate and report out the total number of sequences
# in the file. The script should also tally the number of SARS-CoV-2 sequences from 
# the dataset from each country and sort the output by size: largest to smallest.

# Kekoa Kon
# November 17, 2021
# kakon@dons.usfca.edu

# Create command line arguments before continuing with the script 
if [ $# -eq 0 ]
then
	echo "Please include an  arguments that are needed for the script to run:"
	echo "The first argument is a pathway to the compressed sequence dataset."
	echo "Next, include 'ALL if you would like more detailed output."
	exit 1
fi

# Make sure to check that there is only one argument 
if [ $# -gt 1 ]
then 
	echo "You only need one argument."
	exit 1
fi

# Now count the number of sequences in the whole file
if [ "$2" = 'ALL' ] 
then
	echo "The total number of sequences is:" 
	bioawk -c fastx '{print $name $comment}' "$1" | wc -l
fi

# Last, tally the number of sequences and sort them from largest to smallest
	bioawk -c fastx '{print  $comment}' "$1" | awk '{split($0,x,"|");print x[21]}' | sort |uniq -c | sort -nr
