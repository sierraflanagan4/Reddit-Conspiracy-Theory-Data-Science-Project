# RedditConspiracyDataScience
This Code Extracts Data From Reddit Comments using the RedditExtractoR package and applies sentiment analysis to categorize comments as news  or conspiracy

## All Packages Needed for Code: 

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

## RetrieveData.R

This file uses URLs from the top conspiracy posts from R/Conspiracy and the top news posts from R/News as of April 2021 to retrieve raw comment data on these posts from Reddit. These comments are saved in individual .files. It is necessarty to combine these individual .csv files into a master dataset to continue with the analysis using his code. The masterdataset has also been included in the 'AllComments.csv' file in this repository.

## AllComments.csv

This file contains the comments for both the conspiracy and news posts and has consolidated them all into one .csv file which includes a classifier variable. For the classifier variable, 1 = news and 2 = conspiracy.

## DataVisualizationAndSentimentAnalysis.R

In this file, the comments are converted from a .csv file into a corpus object, which is then converted to a Document Feature Matrix. During the process, the text data is also cleaned to allow for further sentiment analysis. This cleaning includes stemming, converting all characters to lowercase, removing punctuation, removing numbers, removing urls, removing english stopwords, and removing a custom list of stopwords which is unique to the topics of the original reddit posts. 

Also in this file, the Document Feature matrix is used to vizualize the different sentiment scores of the Conspiracy comments and News comments separately, as well as comparing the Coleman-Liau readability index for the two. 

## Machine Learning
