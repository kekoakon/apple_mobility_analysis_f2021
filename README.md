# Analysis of Apple Mobility Data in the Era of COVID-19

Kekoa Kon
kakon@dons.usfca.edu

The aim of this project is to analyze the mobility data made available by Apple.

That data is available for download for the following URL:
https://covid19.apple.com/mobility

It currently uses dplyr to work with some of the tabular data and
also includes the use of ggplot2 to visualize the dataset. 

### Change Log

* 2021-10-11: Finished Rmarkdown file 
* 2021-10-05: Added bibliography and citr to Rmarkdown file
* 2021-10-05: Created an Rmarkdown file to summarize apple mobility dataset project
* 2021-09-30: Created a function to change the mobility data from wide to long
* 2021-09-28: Created a function to tally cities and counties for any given state using a dplyr
chain. Updated the 01 script to include a for loop that subsets multiple states and saves 
to new csv files. Modified the 02 script to include a for loop that tallies the cities and 
counties for each state using the function created. 
* 2021-09-27: Attempted to turn code in second script into a function. Updated script one to run inside of a for loop. 
* 2021-09-23: Added second script to use dplyr to tally up the count of 
cities and counties in a given state that have data from the different 
transportation types
* 2021-09-22: Create Github repository and push commits for the first time.
* 2021-09-20: Initialize git repository for the project in 2021
* 2021-08-31: The data file It was originally downloaded for analysis.
* 2021-09-17: A new version of the data file was downloaded, and I also worked to refactor the code to be more general and to allow for any state to be subset from the larger file.
