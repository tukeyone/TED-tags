#   Summarize talk-tags
#
#
#
#
#
#
################################################################

library(tidyverse)
library(readr)
library(stringr)
library(lubridate)


args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_file <- args[2]

ted_data <- read_csv(input_file)


## wrangle tags into a list 
ted_data$tags <- ted_data$tags %>% 
  str_replace_all('\\[', '') %>% 
  str_replace_all('\\]', '') %>% 
  str_replace_all('\'', '') %>% 
  str_replace_all(' ', '')  

ted_data <-mutate(ted_data, tags =  str_split(tags, ','))


tag_tally_table <- function(data, data_year, num_entires) {
  
  all_tags <- unlist(data)
  unique_tags <- unique(all_tags)
  
  tag_tally <- tibble (
    tag = unique_tags,
    count = rep(0, length(unique_tags)),
    year = rep(data_year, length(unique_tags))
  )
  
  for (tag in unique_tags) {
    tag_tally$count[tag_tally$tag == tag] <- sum(all_tags == tag) / num_entires
  }
  
  tag_tally <-arrange(tag_tally, desc(count))
  return(head(tag_tally,10))
}


overall <-tag_tally_table(ted_data$tags, "overall", nrow(ted_data))

data_16 <- filter(ted_data, year(film_date) == 2016)
tag_16  <- tag_tally_table(data_16$tags, 2016, nrow(data_16))

data_11 <- filter(ted_data, year(film_date) == 2011)
tag_11  <- tag_tally_table(data_11$tags, 2011, nrow(data_11))

data_06 <- filter(ted_data, year(film_date) == 2006)
tag_06  <- tag_tally_table(data_06$tags, 2006, nrow(data_06))


tally_sum <- rbind(overall, tag_16, tag_11, tag_06)

write_csv(tally_sum, output_file)
