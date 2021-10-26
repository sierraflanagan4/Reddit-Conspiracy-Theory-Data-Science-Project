# RedditConspiracyDataScience
This Code Extracts Data From Reddit Comments using the RedditExtractoR package and applies sentiment analysis to categorize comments as news  or conspiracy

# All Packages Needed for Code: 

# Analyzing Conspiracy Theories
#install.packages("RedditExtractoR")
#install.packages("syuzhet")
#install.packages("tm")
#install.packages("wordcloud")
#install.packages("wordcloud2")
#install.packages("lubridate")
#install.packages("scales")
library(reshape2)
library(dplyr)
library(scales)
library(ggplot2)
library(lubridate)
library(tm)
library(wordcloud2)
library(RedditExtractoR)
library(syuzhet)
library(wordcloud)
library(caret)
library(RColorBrewer)
library(RTextTools)
library(stringi)
library(quanteda)
library(quanteda.textmodels)
library(plyr)
