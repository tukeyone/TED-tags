#
#
#
#
#
#  Author: Charley Carriero
#  Date: Dec-2017-07
#####################################################################

## dependencies
library(tidyverse)
library(readr)
library(lubridate)


args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_file <- args[2]

## import data
ted_talks <-read_csv(input_file)


## select variables, convert UNIX timestamps to POSIX dates
ted_data <- ted_talks %>% 
  select(title, main_speaker, film_date, tags) %>% 
  mutate(film_date = as.POSIXct(film_date, origin = '1970-01-01', tz = "GMT"))


write_csv(ted_data, output_file)


