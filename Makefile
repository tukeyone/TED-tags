# Makefile
# Author: Charley Carriero
# Date: 10-Dec-2017
#
# Uses make to generate reproduce analysis
# Type make in the command line to run
# Type make clean to delete all files produced from the analysis
########################################################################


all : results/clean_data.csv results/tag_tallys.csv results/tag_tally_plot.png doc/tag_report.md

#clean data
results/clean_data.csv : data/ted_talks.csv
	Rscript src/clean_data.R data/ted_talks.csv results/clean_data.csv

#find tag tallys
results/tag_tallys.csv : results/clean_data.csv
	Rscript src/find_tags.R results/clean_data.csv results/tag_tallys.csv

#plot tallys
results/tag_tally_plot.png : results/tag_tallys.csv
	Rscript src/plot_tag_tallys.R results/tag_tallys.csv results/tag_tally_plot.png

#generate report
doc/tag_report.md : data/ted_talks.csv results/tag_tallys.csv results/tag_tally_plot.png
	Rscript -e 'ezknitr::ezknit("src/tag_report.Rmd", out_dir = "doc")'

clean :
	rm -f results/*.csv
	rm -f results/*.png
	rm -f doc/*.md
	rm -f doc/*.html