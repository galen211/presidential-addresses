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