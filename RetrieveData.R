#### Retrieving Reddit Data for the Chosen Conspiracy Theories ####
# ~ Save Reddit Data to .csv files for cleaning ~ #

epstein_url <- "https://www.reddit.com/r/conspiracy/comments/dophtr/reminder_80_days_ago_a_billionaire_pedophile/"
epstein <- reddit_content(epstein_url)
epsteindata <- data.frame(epstein)
head(epstein)
dim(epsteindata)

pockets_url <- "https://www.reddit.com/r/conspiracy/comments/ji5unc/i_heard_a_great_conspiracy_and_i_promised_to_put/"
pockets <- reddit_content(pockets_url)
pocketsdata <- data.frame(pockets)
write.csv(pocketsdata, "pockets.csv", row.names = FALSE)
dim(pockets)

tenYr_url <- "https://www.reddit.com/r/conspiracy/comments/mxjajh/10_year_challenge_plot/"
tenYr <- reddit_content(tenYr_url)
tenYrData <- data.frame(tenYr)
write.csv(tenYrData, "tenYr.csv", row.names = FALSE)
dim(tenYr)

covid_url <- "https://www.reddit.com/r/conspiracy/comments/nfszjq/the_idea_that_covid19_may_have_leaked_from_a_lab/"
covid <- reddit_content(covid_url)
covidData <- data.frame(covid)
write.csv(covidData, "covid.csv", row.names = FALSE)
dim(covid)

MAML_url <- "https://www.reddit.com/r/conspiracy/comments/ea78ed/90_of_modern_art_is_just_tax_evasion/"
MAML <- reddit_content(MAML_url)
MAMLData <- data.frame(MAML)
write.csv(MAMLData, "MAML.csv", row.names = FALSE)
dim(MAML)

WTC_URL <- "https://www.reddit.com/r/conspiracy/comments/5r0glz/911_wtc_towers_had_power_turned_off_for_36_hours/"
WTC <- reddit_content(WTC_URL)
WTCData <- data.frame(WTC)
write.csv(WTCData, "WTC.csv", row.names = FALSE)
dim(WTC)

### Retrieving Reddit Data for the Top News Stories ###
# ~ Save Reddit Data to .csv files for cleaning ~ #

biden_url <- "https://www.reddit.com/r/news/comments/jptqj9/joe_biden_elected_president_of_the_united_states/"
biden <- reddit_content(biden_url)
bidenData <- data.frame(biden)
write.csv(bidenData, "biden.csv", row.names = FALSE)

guilty_url <- "https://www.reddit.com/r/news/comments/mv0fzt/chauvin_found_guilty_of_murder_manslaughter_in/"
guilty <- reddit_content(guilty_url)
guiltyData <- data.frame(guilty)
write.csv(guiltyData, "guilty.csv", row.names = FALSE)

trumpCovid_url <- "https://www.reddit.com/r/news/comments/j3oj21/president_donald_trump_says_he_has_tested/"
trumpCovid <- reddit_content(trumpCovid_url)
trumpCovidData <- data.frame(trumpCovid)
write.csv(trumpCovidData, "trumpCovid.csv", row.names = FALSE)

blizzard_url <- "https://www.reddit.com/r/news/comments/dfn3yi/blizzard_employees_staged_a_walkout_after_the/"
blizzard <- reddit_content(blizzard_url)
blizzardData <- data.frame(blizzard)
write.csv(blizzardData, "blizzard.csv", row.names = FALSE)

kobe_url <- "https://www.reddit.com/r/news/comments/eubjfc/kobe_bryant_killed_in_helicopter_crash_in/"
kobe <- reddit_content(kobe_url)
kobeData <- data.frame(kobe)
write.csv(kobeData, "kobe.csv", row.names = FALSE)

trebek_url <- "https://www.reddit.com/r/news/comments/jqfm3b/jeopardy_host_alex_trebek_dies_at_80_due_to/"
trebek <- reddit_content(trebek_url)
trebekData <- data.frame(trebek)
write.csv(trebekData, "trebek.csv", row.names = FALSE)

## In Excel, merge new .csv files into one and add classifier column for 1 = News
## and 2 = conspiracy
## save this master dataset of all comments as .csv file

## Import new master datasets of all comments, all conspiracy comments and all news comments ##

all_comments <- read.csv(file.choose(), header = T)
all_comments_df <- data.frame(all_comments)

conspiracy_comments <- read.csv(file.choose(), header = T)
conspiracy_comments_df <- data.frame(conspiracy_comments)

news_comments <- read.csv(file.choose(), header = T)
news_comments_df <- data.frame(news_comments)
