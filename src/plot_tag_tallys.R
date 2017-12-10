# Generates a bar plot of annual tag tallys
#
# Run from the command-line
# Parameters: input file (results/tag_tallys.csv)
#             output file (results/tag_tally_plot.png)
#
# Usage Example: Rscript   find_tags.R results/tag_tallys.csv  results/tag_tally_plot.png
#
#  Author: Charley Carriero
#  Date: Dec-2017-07
##########################################################################################

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
