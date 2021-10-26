## Data Visualization and Sentiment Analysis ##

col_bar <- brewer.pal(10, "Set3")

# Create Function to Turn Reddit Comments into Sentiment Score Plot
DFtoSentimentScoresPlot <- function(the_df, the_name) {
  comments <- iconv(the_df$comment, to = 'utf-8-mac')
  
  the_title <- cat('Sentiment Scores for ', the_name, ' Comments')
  
  sentiments <- get_nrc_sentiment(comments)
  barplot(colSums(sentiments),
          main = the_title,
          las = 2,
          col = col_bar,
          ylab = 'Count',
          col.main = "black")
}

DFtoSentimentScoresPlot(conspiracy_comments, "Conspiracy")

# Transform the dataframe of comments to a corpus object

DFtoCorpus <- function(the_df) {
  the_corpus <- corpus(the_df,
                       text_field = "comment",
                       docid_field = "comment_id",
                       meta = list(),
                       unique_docnames = TRUE)
  return(the_corpus)
}

# Function to Clean the Comments in the DataFrame and transform to Document Feature Matrix 
# Function stems words, converts to lowercase, removes punctuation, removes urls, removes numbers,
#   removes stopwords, and removes custom stopwords which would overfit the model
#   that are specific to the topics of the original post (e.g. epstein, trebek, art)
CorpustoCleanDFM <- function(the_corpus) {
  
  the_dfm <- dfm(the_corpus,
                 stem = TRUE,
                 tolower = TRUE,
                 remove_punct = TRUE,
                 remove_url = TRUE,
                 remove_numbers = TRUE,
                 remove = stopwords("english"))
  the_dfm <- dfm_remove(the_dfm, c("jeffrey", "epstein", "suicide", "alex", "trebek", "ghislane", "maxwell", "jeopardy", "art", "launder", "kobe", "bryant", "basketball", "la", "laker", "helicopter", "pockets", "pants", "trousers", "purse", "fashion", "george", "bush", "wuhan", "facial", "biden", "blizzard","strike", "Japan", "walkout", "derek","chauvin", "floyd"))
  #Correct for sparsity
  the_dfm <- dfm_trim(the_dfm, sparsity = 0.998)
  
  #the_dfm <- as.matrix(the_dfm)
  return(the_dfm)
}

#Plot sentiment scores of Conspiracy Comments
DFtoSentimentScoresPlot(all_comments, "Conspiracy")

#Plot sentiment scores of News Comments 
DFtoSentimentScoresPlot(news_comments, "News")

#create corpus of all comments using function
master_corpus <- DFtoCorpus(all_comments_df)

#create document feature matrix from function 
master_dfm <- CorpustoCleanDFM(master_corpus)

#preview first few rows of the master DFM
#head(master_dfm)

#create corpus of conspiracy-only comments
conspiracy_corpus <- DFtoCorpus(conspiracy_comments_df)

#create dfm of conspiracy-only comments from corpus
conspiracy_dfm <- DFtoCleanDFM(conspiracy_comments_df)

#create corpus of news-only comments
new_corpus <- DFtoCorpus(news_comments_df)

#create dfm of news-only comments from corpus
news_dfm <- DFtoCleanDFM(news_comments_df)

### Obtain Average Sentiment ### 
# Comparing Different Conspiracies # 

df_conspiracy_data = conspiracy_comments_df
#df_master_data = df_master_data %>% rename(texts = "texts(master_corpus)")

# convert to character
df_conspiracy_data[] <- lapply(df_conspiracy_data, as.character)

# sentiment scores
df_conspiracy_data$sentiment_score = get_sentiment(df_conspiracy_data$comment)

conspiracy_scores <- tapply(X = df_conspiracy_data$sentiment_score, INDEX = df_conspiracy_data$conspiracy, FUN = mean)


#CLI readability score
cli_conspiracy <- textstat_readability(df_conspiracy_data$comment, measure = 'Coleman.Liau')
df_conspiracy_data$cli_conspiracy <- cli_conspiracy$Coleman.Liau

conspiracy_cli <- tapply(X = df_conspiracy_data$cli_conspiracy, INDEX = df_conspiracy_data$conspiracy, FUN = mean)
#Comparing Conspiracy Comments VS News Comments

df_master_data <- all_comments_df
#df_master_data = df_master_data %>% rename(texts = "texts(master_corpus)")

# convert to character
df_master_data[] <- lapply(df_master_data, as.character)

# sentiment scores
df_master_data$sentiment_score = get_sentiment(df_master_data$comment)

#CLI readability
cli = textstat_readability(df_master_data$comment, measure = 'Coleman.Liau')
df_master_data$cli = cli$Coleman.Liau

tapply(X = df_master_data$sentiment_score, INDEX = df_master_data$category, FUN = mean)
