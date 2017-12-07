#  Plot tag tally's
#
#
#
# 
#
###########################################################

library(tidyverse)
library(readr)


args <- commandArgs(trailingOnly = TRUE)
input_file <- args[1]
output_file <- args[2]

tally_sum<-read_csv(input_file)

plot  <- ggplot(tally_sum, aes(x = tag, y = count, fill = year)) + 
            geom_col() + 
            facet_grid(~year) +
            coord_flip() +
            labs(y= "proportion") +
            theme_minimal() 

ggsave(output_file)
