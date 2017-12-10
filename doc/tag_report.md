# TED-tags
Author: Charley Carriero<br/>
Date: 10 Dec 2017

---
<br/>
In attempt to converge ideas from **T**echnology, **E**ntertainment and **D**esign, non-profit organization [TED](https://www.ted.com/about/our-organization) was formed. TED aims to make great ideas accessible. But what kind of ideas are they spreading? 

<br/>
In this simple analysis project I have explored how the topic of TED talks have changed over time. The  [dataset](https://www.kaggle.com/rounakbanik/ted-talks) used contains information on all 2550 TED-talks given up until September 21st, 2017. Each talk is given a list of tags to describe the theme of the talk (eg. "technology", "sustainability", "education", etc.). By identifying the frequency that each of these tags appears per annum we can see how the popularity of each tag changes over time. 

<br/>
## The data 



Below is a preview of the raw data. 

|main_speaker  |  film_date|tags                                                                                                                                       |
|:-------------|----------:|:------------------------------------------------------------------------------------------------------------------------------------------|
|Ken Robinson  | 1140825600|['children', 'creativity', 'culture', 'dance', 'education', 'parenting', 'teaching']                                                       |
|Al Gore       | 1140825600|['alternative energy', 'cars', 'climate change', 'culture', 'environment', 'global issues', 'science', 'sustainability', 'technology']     |
|David Pogue   | 1140739200|['computers', 'entertainment', 'interface design', 'media', 'music', 'performance', 'simplicity', 'software', 'technology']                |
|Majora Carter | 1140912000|['MacArthur grant', 'activism', 'business', 'cities', 'environment', 'green', 'inequality', 'politics', 'pollution']                       |
|Hans Rosling  | 1140566400|['Africa', 'Asia', 'Google', 'demo', 'economics', 'global development', 'global issues', 'health', 'math', 'statistics', 'visualizations'] |
|Tony Robbins  | 1138838400|['business', 'culture', 'entertainment', 'goal-setting', 'motivation', 'potential', 'psychology']                                          |

The orginal dataset contains a lot of data irrelevant to this analysis. For example, things like the number of comments on the video or the list of languages it has been translated into. For this reason, I have only imported the main speaker of each talk, the film date and the associated tags. 

<br/>
## The analysis

As shown above, the film-date for each talk is recoreded as UNIX timestamp. Before performing any analysis the script `src/clean_data.R` cleans the data such that all filmdates are recorded as POSIX date-times. Following this, the script `src/find_tags.R` is used to find the tally of each tag per year. Tallys have been represented as a frequency proportional to the number of talks given that year. Note that the proportions will not sum to 100% as each talk can have more than one tag. Below is a preview of the most popular tags in 2016.


|tag           |     count|year |
|:-------------|---------:|:----|
|society       | 0.4186992|2016 |
|humanity      | 0.3292683|2016 |
|innovation    | 0.3048780|2016 |
|communication | 0.3048780|2016 |
|technology    | 0.2967480|2016 |

<br/>
## Results 

The following is a visualization of the 10 most popular tags in 2016, 2011, 2016 compared to the top 10 tags over all-time.

![](/Users/charleycarriero/Documents/MDS/522/TED-tags/results/tag_tally_plot.png)

I was actually quite surprised when I first looked at this graph. There is a large shift in theme popularity starting in 2016. Years like 2006 and 2011 have many unique topics share popularlity. For example, there are just as many talks on science as there are on culture. With such broad category names it is not surprising that talks on science and cuture are two of the most common talk themes since the advent of TED. What is more interesting is that science and culture are not even among the top 10 themes of 2016. Contrast to previous years the tags of 2016 all share a common idea. 2016 is focused on human improvement. 2016 in the TED-world was about social change, communication and humanity. It will be interesting to see if this shift towards social psychology talks is sustained in 2017. 











