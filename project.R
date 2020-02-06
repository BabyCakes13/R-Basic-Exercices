# install.packages("RCurl")
# install.packages("dplyr")
# install.packages("ggplot2")
# install.packages("e1071")
# install.packages("caret")
library(RCurl)
library(dplyr)
library(magrittr)
library(ggplot2)
library(caret)
library(randomForest)
library(e1071)

data <- getURL('https://archive.ics.uci.edu/ml/machine-learning-databases
               /breast-cancer-wisconsin/wdbc.data')
names <- c('id_number', 'diagnosis', 'radius_mean', 
           'texture_mean', 'perimeter_mean', 'area_mean', 
           'smoothness_mean', 'compactness_mean', 
           'concavity_mean','concave_points_mean', 
           'symmetry_mean', 'fractal_dimension_mean',
           'radius_se', 'texture_se', 'perimeter_se', 
           'area_se', 'smoothness_se', 'compactness_se', 
           'concavity_se', 'concave_points_se', 
           'symmetry_se', 'fractal_dimension_se', 
           'radius_worst', 'texture_worst', 
           'perimeter_worst', 'area_worst', 
           'smoothness_worst', 'compactness_worst', 
           'concavity_worst', 'concave_points_worst', 
           'symmetry_worst', 'fractal_dimension_worst')
breast_cancer <- read.table(textConnection(data), sep = ',', col.names = names)

head(breast_cancer)
dim(breast_cancer)
str(breast_cancer)

get_MB_pie(breast_cancer)


get_MB_pie <- function(data_set) {
  # Display a pie chart representing the number of patients which had either benign or malignant cancer.
  values <- get_MB(breast_cancer)
  values_percent <- round(100*values/sum(values), 1)
  
  labels <- c("Malignant", "Benign")
  pie(values, labels = values_percent, main = "Number of malignant vs benign types of cancer.", col = rainbow(length(values)))
  legend("topright", labels,
         fill = rainbow(length(values)))
}

get_MB <- function(data_set) {
  # Count and group how many patients had malignant or benign types of cancer.
  data_set %>% 
    count(diagnosis) %>%
    group_by(diagnosis) %>%
    assign(x="results", value=., pos=1)
  return(results$n)
}

generate_random_train_index <- function(random) {
  # Function which generates the train index for creating the two train and test partitions.
  set.seed(random)
  train_index <- createDataPartition(breast_cancer$diagnosis, 
                                     p = .8, 
                                     list = FALSE, 
                                     times = 1)
}

train_index <- generate_random_train_index(1234)
training_set <- breast_cancer[ train_index, ]
test_set <- breast_cancer[ -train_index, ]

dim(training_set)
summary(training_set)
dim(test_set)
summary(test_set)

generate_random_partitions(42)

custom_random_forest <- list(type = "Classification", library = "randomForest", loop = NULL)
custom_random_forest$parameters <- data.frame(parameter = c("mtry", "ntree", "nodesize"), 
                                              class = rep("numeric", 3), 
                                              label = c("mtry", "ntree", "nodesize"))
custom_random_forest$grid <- function(x, y, len = NULL, search = "grid") {}
custom_random_forest$fit <- function(x, y, wts, param, lev, last, weights, classProbs, ...) {
  randomForest(x, y, mtry = param$mtry, ntree=param$ntree, nodesize=param$nodesize, ...)
}
custom_random_forest$predict <- function(modelFit, newdata, preProc = NULL, submodels = NULL)
  predict(modelFit, newdata)
custom_random_forest$prob <- function(modelFit, newdata, preProc = NULL, submodels = NULL)
  predict(modelFit, newdata, type = "prob")
custom_random_forest$sort <- function(x) x[order(x[,1]),]
custom_random_forest$levels <- function(x) x$classes

fitControl <- trainControl(
  method = "repeatedcv",
  number = 3, 
  ## repeated ten times
  repeats = 10)

grid <- expand.grid(.mtry=c(floor(sqrt(ncol(training_set))), (ncol(training_set) - 1), floor(log(ncol(training_set)))), 
                    .ntree = c(100, 300, 500, 1000),
                    .nodesize =c(1:4))

set.seed(1234)
fit_rf <- train(as.factor(diagnosis) ~ ., 
                data = training_set, 
                method = custom_random_forest, 
                metric = "Accuracy", 
                tuneGrid= grid,
                trControl = fitControl)
fit_rf$finalModel

importance <- get_attribute_importance(fit_rf)

get_attribute_importance <- function(fit) {
  # Function which calculates the importance of the variables regards to accuracy of the result.
  attribute_importance <- varImp(fit_rf, scale = FALSE)
  attribute_scores <- data.frame(attribute_importance$importance)
  attribute_scores <- data.frame(names = row.names(attribute_scores), var_imp_scores = attribute_scores$B)
  return(attribute_scores)
}

barplot(importance$var_imp_scores)
text(importance$var_imp_scores, labels=importance$names, srt=90,  xpd=TRUE)