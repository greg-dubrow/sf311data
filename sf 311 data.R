# working file to get the data, do some eda & test visualizations

library(RSocrata)
library(tidyverse)
library(jsonlite) 

## sf 311 data wite https://data.sfgov.org/City-Infrastructure/311-Cases/vw6y-z8j6/data
## api endpoints https://dev.socrata.com/docs/endpoints.html
## rsocrata useage https://dev.socrata.com/blog/2015/06/17/forecasting_with_rsocrata.html


ls.socrata("https://data.sfgov.org/City-Infrastructure/311-Cases/vw6y-z8j6/data")

sfdatasources <- ls.socrata("https://data.sfgov.org/")
attributes(sfdata)

head(sfdata$class)




sfdata311 <- read.socrata("https://data.sfgov.org/api/views/vw6y-z8j6")
sfdata311 <- read.socrata("https://data.sfgov.org/resource/vw6y-z8j6.json")
sfdata311 %>%
  count(police_district)

saveRDS(sfdata311, file = "sfdata311.rds")
# Restore the object
sfdata311_rds <- readRDS(file = "sfdata311.rds")

sfdata311_t <- sfdata311 %>%
  filter(police_district == "TARAVAL")

sfdata3112 <- read.socrata("https://data.sfgov.org/resource/vw6y-z8j6.json") %>%
  filter(police_district == "TRAVAL")

sfdata3112 <- fromJSON('https://data.sfgov.org/resource/vw6y-z8j6.json')%>%
  filter(police_district == "TARAVAL")

filenames <- list.files(pattern="https://data.sfgov.org/resource/vw6y-z8j6.json", full.names=TRUE)
filenames

glimpse(sfdata311)

EMSIncidents <- read.socrata("https://data.austintexas.gov/resource/bptg-ndvw.json") 