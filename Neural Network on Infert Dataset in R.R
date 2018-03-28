

# tutorial here: https://www.youtube.com/watch?v=lTMqXSSjCvk


library(neuralnet)


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

# These are our predictions for what each of the 248 cases are (e.g. row 197 is 0.148
# meaning it predicts there's a 14.8% probability that observation 197 is 1, so it's most likely 0)
nn$net.result[[1]]
nn$net.result[[1]][[197]]



# Making predictions for new data





