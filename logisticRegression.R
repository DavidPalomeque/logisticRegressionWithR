# LOGISTIC REGRESSION ALGORITHM WITH R

library(tidyverse)

# import dataset
ds <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
sum(is.na(ds)) # checking if there are null values

# PROBLEM :
# we need to predict with logistic linear regression 
# if student will be admited or not

# split data into train & test data
sample_size <- floor(0.75 * nrow(ds))
set.seed(123)
split <- sample(seq_len(nrow(ds)), size = sample_size)
train_ds <- ds[split, ]
test_ds <- ds[-split, ]

# model
model1 <- glm(admit ~ gre + gpa + rank , train_ds , family = "binomial")
# predict
predict(model1 , test_ds , type="response")
