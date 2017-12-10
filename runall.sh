#! bin/bash

Rscript src/clean_data.R  data/ted_talks.csv results/clean_data.csv
Rscript src/find_tags.R results/clean_data.csv results/tag_tallys.csv
Rscript src/plot_tag_tallys.R results/tag_tallys.csv results/tag_tally_plot.png

Rscript -e 'ezknitr::ezknit("src/tag_report.Rmd", out_dir = "doc")'
