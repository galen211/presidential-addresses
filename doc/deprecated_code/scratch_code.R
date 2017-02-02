# scratch code
m <- list(id = "id", Content = "fulltext")
reader <- readTabular(mapping = m)
speech.corpus <- Corpus(DataframeSource(speech.list), readerControl = list(reader = myReader))
```
## Step 2.1: example of term frequency in a single document
```{r}
ds = DirSource(directory = file.path("..","data","InauguralSpeeches",fsep = .Platform$file.sep),
               pattern = "*.txt",
               mode = "text")
speech.corpus = VCorpus(ds,ds$reader(ds$speech_text))
```

## Step 2: get sentence data into sentence.list
```{r, message=FALSE, warning=FALSE}
sentence.list=NULL
for(i in 1:nrow(speech.list)){
  sentences=sent_detect(speech.list$fulltext[i],
                        endmarks = c("?", ".", "!", "|",";"))
  if(length(sentences)>0){
    emotions=get_nrc_sentiment(sentences)
    word.count=word_count(sentences)
    # colnames(emotions)=paste0("emo.", colnames(emotions))
    # in case the word counts are zeros?
    emotions=diag(1/(word.count+0.01))%*%as.matrix(emotions)
    sentence.list=rbind(sentence.list, 
                        cbind(speech.list[i,-ncol(speech.list)],
                              sentences=as.character(sentences), 
                              word.count,
                              emotions,
                              sent.id=1:length(sentences)
                        )
    )
  }
}
```


# Sentences
```{r}
sentence.list%>%
  filter(length(grep("war",sentence.list))>0)%>%
  select(sentences)
```

```{r}
sentence.list%>%
  filter(File=="BarackObama", 
         type=="inaug", 
         word.count<=3)%>%
  select(sentences)
```




-------------
  
  # Step 2: construct term frequency inverse document frequency matrix (tf-idf)
  ```{r}
require(tm)
ds = DirSource(directory = file.path("..","data","InauguralSpeeches",fsep = .Platform$file.sep),
               pattern = "*.txt",
               mode = "text")
```
## Step 2.1: create VCorpus object
```{r}
speech.corpus = VCorpus(ds)
control_list <- list(removePunctuation = TRUE, stopwords = stopwords("english"), tolower = TRUE)
speech.tdm = TermDocumentMatrix(speech.corpus, control = control_list)
speech.tfidf = weightTfIdf(speech.tdf,normalize = TRUE)
```
## Step 2.2: 
```{r}
tf <- as.matrix(speech.tdm) # term frequnecy
```
## Step 2.3: most common words in corpus
```{r}
wordcloud(tf$term, tf$docs$`sum(count)`,
          scale=c(5,0.5),
          max.words=100,
          min.freq=1,
          random.order=FALSE,
          rot.per=0.3,
          use.r.layout=T,
          random.color=FALSE,
          colors=brewer.pal(9,"Blues"))
```