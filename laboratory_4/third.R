"""
Use the data set ”iris” to compute:
a) mean, median, mode for ”Petal.Length”
b) range, variance, standard deviation, IQR for ”Sepal.Length” for the
species ”setosa”
c) kurtosis, skewness for ”Petal.Width”; is the distribution symmetric and
mesokurtic?
"""

mean_median_mode<- function() {
  # Function which finds the mean, median and mode of a data set.
  petal_length <- iris$Petal.Length
  
  mean <- mean(petal_length)
  median <- median(petal_length)
  mode <- get_mode(petal_length)
  
  cat("\nThe mean of Petal.length is:", mean,".\n")
  cat("The median of Petal.length is:", median,".\n")
  cat("The mode of Petal.length is:", mode,".\n")
}

range_variance_std_IQR <- function() {
  # Function which calculates the range, variance, standard deviation, IQR for the given set.
  setosa <- subset(iris,subset=Species=='setosa')
  sepal_length <- setosa$Sepal.Length
  
  range <- range(sepal_length)
  variance <- var(sepal_length)
  standard_deviation <- sd(sepal_length)
  iqr <- IQR(sepal_length)
  
  cat("\nThe range of the Sepal.Length is:", range, ".\n")
  cat("The variance of the Sepal.Length is:", variance, ".\n")
  cat("The standard deviation of the Sepal.Length is:", standard_deviation, ".\n")
  cat("The IQR of the Sepal.Length is:", iqr, ".\n")
}

kurtosis_skewness <- function() {
  library(moments)
  petal_width <- iris$Petal.Width
  
  kurtosis <- kurtosis(petal_width)
  skewness <- skewness(petal_width)
  
  cat("\nThe range of the Sepal.Length is:", range, ".\n")
}

third_main <- function() {
  summary(iris)
  mean_median_mode()
  range_variance_std_IQR()
}