##  Imports data from ted_tags.csv
##  Makes a list of all possible TED-tags 
##
##  Author: Charley Carriero
##  Date: 01-Dec-2017
####################################################


## dependencies
library(tidyverse)
library(readr)
library(stringr)


## import
ted_talks <-read_csv("ted_talks.csv")
ted_data <- ted_talks %>% 
  select(title, main_speaker, views, tags, ratings)


## regex
ted_data$tags <- ted_data$tags %>% 
  str_replace_all('\\[', '') %>% 
  str_replace_all('\\]', '') %>% 
  str_replace_all('\'', '') %>% 
  str_replace_all(' ', '')  

ted_data <- ted_data %>% 
  mutate(tags = str_split(tags, ','))


## find unique tags 
ted_tags <- c()

for (i in 1:nrow(ted_data)) {
  for (tag in ted_data$tags[[i]]) {
    if (tag %in% ted_tags == FALSE) {
      ted_tags <- c(ted_tags, tag)
    }
  }
}