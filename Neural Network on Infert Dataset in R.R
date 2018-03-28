

# tutorial here: https://www.youtube.com/watch?v=lTMqXSSjCvk


library(neuralnet)
library(dplyr)


# Usually you have 2 hidden layers, and you could have number of nodes in the hidden layer
# Activation function by default is logistic, but can be set to others
# see ?neuralnet for more info about the parameters you can set



infert
head(infert)
colnames(infert)
sapply(infert, class)
dim(infert)

set.seed(1000)
nn = neuralnet(case~age + parity + induced + spontaneous, data = infert, hidden = 2, err.fct = "ce", linear.output = FALSE)
plot(nn)

# type nn$ and view each of the elements contained within nn

# These are our predictions for what each of the 248 cases are (e.g. row 197 is 0.148
# meaning it predicts there's a 14.8% probability that observation 197 is 1, so it's most likely 0)
nn$net.result[[1]] # percentages
nn$net.result[[1]][[197]] 


# compare actuals with percentage predictions

infert$case %>% cbind(. , nn$net.result[[1]])


# compare actuals with binary predictions
binary_predictions <- ifelse(nn$net.result[[1]] >= 0.5, 1, 0)

# what percentage of the time is the model correct?
mean(infert$case == binary_predictions)
# it's correct 76.6% of the time


# Making predictions for new data





