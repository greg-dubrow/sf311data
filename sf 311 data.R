# working file to get the data, do some eda & test visualizations

## load necessary packages
library(RSocrata)
library(tidyverse)
library(jsonlite) 
library(janitor)


## sf 311 data wite https://data.sfgov.org/City-Infrastructure/311-Cases/vw6y-z8j6/data
## api endpoints https://dev.socrata.com/docs/endpoints.html
## rsocrata useage https://dev.socrata.com/blog/2015/06/17/forecasting_with_rsocrata.html

## using rscorata, get a list of data available from sf open data
sfdatasources <- ls.socrata("https://data.sfgov.org/")
attributes(sfdata)

# download full dataset using rsocrata
sfdata311 <- read.socrata("https://data.sfgov.org/resource/vw6y-z8j6.json")
#convert dates to POSIX
sfdata311$date_req <-  posixify(sfdata311$requested_datetime)

glimpse(sfdata311)

sfdata311 %>%
  count(police_district)

# save first dl...takes a long time to download...need to learn how to filter from json call
saveRDS(sfdata311, file = "sfdata311.rds")
# Restore the object
sf311data <- readRDS(file = "sfdata311.rds")
glimpse(sf311data)




## trying with jsonlite package. only got 90~ records, from current day
sfdata3112 <- fromJSON('https://data.sfgov.org/resource/vw6y-z8j6.json')%>%
  filter(police_district == "TARAVAL")

filenames <- list.files(pattern="https://data.sfgov.org/resource/vw6y-z8j6.json", full.names=TRUE)
filenames

