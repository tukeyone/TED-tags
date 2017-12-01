# TED-tags

Demonstrates an automated analysis pipeline.

----

What are most TED talks about? <br/>Using a `kaggle` dataset containing information on all 2550 TED talks given from 1972 until September 21st, 2017, this project investigates what most TED talks are about. 

Specifically...<br/>
What are the most common video-tags of all time?
& <br/>
What are the most common video-tags of 2017? 



**Hypothesis**:  I think the most common tag of all time will be 'creativity'. There are 416 different tags, so I think that looking at the distribution of tag popularity will also be very interesting.  I don't think that the most popular tags in 2017 will be the same as the overall tag popularity. I'm anticipating that the 2017 tags will be about 'sustainability' and 'technology'. 


**Visualization Ideas**: I'm thinking of making a plot to show the distribution of tag popularity both overall and in 2017. I'm also thinking a bar graph containing the counts of the 10 most common tags would be effective. 

**Table summary**: I think that making a table containing counts and tag names will be fairly straightforward to make. The challenging aspect will be the regular expression work required to format tag names into a use-able format. Also, all dates are recorded as a UNIX time stamp, so I'm going to have to figure out how to deal with that as well.