# Spring 2017
# Presidential Inaugural Address Project: What did the presidents say at their inauguration?

![image](figs/title.jpg)

### [Project Description](doc/)

+ Project title: Analyzing the Words of Presidents
+ Analysis by Galen Simmons

+ Project summary: I was interested in looking at the most common themes across different presidential inaugural addresses.  What I found is that there is not a substantial difference in themes between Republican and Democratic presidents.  Unsurprisingly, modern addresses differ substantially from those delivered in the 18th and 19th century.  Certain key words appear in a majority of presidential inaugural addresses.

I was also interested in creating a quantitative measurement of similarity between modern presidents.  Many historians have noted that the current U.S. President, Donald J. Trump, is unlike any other figure in modern politics.  As a former reality television star, his demeanor is certainly less controlled and calculated than his predecessor, President Barack Obama.  However, even prominent Republicans think that he has an unusual style.  The Independent, a UK newspaper, reported that after President Trump's address, ex-President George W. Bush was heard to saying to an acquaintance:
>"that was some **weird** sh*t" - [Link to source](http://www.independent.co.uk/news/world/americas/us-politics/george-w-bush-donald-trump-inauguration-weird-shit-word-ceremony-us-president-a7657246.html
)

I examine the Pearson product-moment correlation between recent addresses.  I also look at which foreign countries have been mentioned in inaugural addresses and plot them on a world map.

The project structure is shown below.  The `doc` folder contains the main `project_notebook.Rmd` file, which runs the project analysis.  The `lib` folder contains functions used in `project_notebook.Rmd` and other code to automate data importing.  The `data` folder contains the text of the inaugural addresses used in the analysis, and the `figs` folder contains charts and figures that are saved during the running of the `project_notebook.Rmd` file.  The `output` folder contains `.RData` files created by the data import process.

```
proj/
├── lib/
├── data/
├── doc/
├── figs/
└── output/
```

Please see each subfolder for a README file.
