###### SUPERVISED MACHINE LEARNING ######

# Build Multiple Different Classifiers to Categorize Reddit comments as
# belonging to news or belonging to conspiracy theories

#Create random string of 2886 numbers from 1 to 4810 
# this represents 60% of the data since there are 4810 data points in total
set.seed(375)
id_train <- sample(1:4810, 2886, replace = FALSE)

#master_data <- convert(master_dfm, to = "data.frame")

#write.csv(master_data, "master_data.csv")

### ~ OUTSIDE OF R ADD IN CATEGORY VARIABLE IN EXCEL#

#master_data <- read.csv(file.choose(), header = T)
#master_data <- data.frame(master_data)
library(caret)

id_vals <- 1:4810
master_dfm$comment_id <- id_vals

training_dfm <- dfm_subset(master_dfm, comment_id %in% id_train)
testing_dfm <- dfm_subset(master_dfm,!comment_id %in% id_train)

### NAIVE BAYES ##
nb_model <- textmodel_nb(training_dfm, y = docvars(training_dfm, "category"))
pred_nb <- predict(nb_model, newdata = testing_dfm)
pred_nb <- data.frame(pred_nb)
pred_nb$obs <- factor(ifelse(pred_nb == 1, 1, 2))

test_set <- testing_dfm$category
test_set$obs <- data.frame(test_set)
test_set$obs <- factor(ifelse(test_set$obs == 1, 1, 2))

confusionMatrix(pred_nb$obs, test_set$obs)

twoClassSummary(test_set, lev = levels(pred_nb$pred_nb))

### SUPPORT VECTOR MACHINE ##
svm_model <- textmodel_svm(training_dfm, y = docvars(training_dfm, "category"))
pred_svm <- predict(svm_model, newdata = testing_dfm)
pred_svm <- data.frame(pred_svm)
pred_svm$obs <- factor(ifelse(pred_svm == 1, 1, 2))

confusionMatrix(pred_svm$obs, test_set$obs)

### KNN Classification ### 
library(e1071)
library(caTools)
library(class)

training_df <- convert(training_dfm, to = "data.frame")
training_df$category <- docvars(training_dfm)$category

testing_df <- convert(testing_dfm, to = "data.frame")
testing_df$category <- docvars(testing_dfm)$category

#Scale the Data
train_scale <- scale(training_df[, 2:1408])
train_scale <- data.frame(train_scale) 
test_scale <- scale(testing_df[, 2:1408])
test_scale <- data.frame(test_scale)

classify_knn <- knn(train = train_scale,
                    test = test_scale,
                    cl = training_df$category,
                    k = 25)

confusionMatrix(factor(testing_df$category), factor(classify_knn))
