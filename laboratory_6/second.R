"""
Compare the covariance of ”Petal.Length” and ”Sepal.Length” for
the species ”virginica” to the one of the same variables for the species
”setosa”; also compare it to the covariance of the variables
”Petal.Width” and ”Sepal.Width”.
"""
# install.packages("MASS") if necessary
library(MASS)

build_length_sets <- function() {
  cat(" Building the iris petal and sepal length variables for the virginica and setosa species.\n")
  virginica_length <- subset(iris, Species=='virginica')
  virginica_length_covariance <- cov(virginica_length$Petal.Length,virginica_length$Sepal.Length)
  
  setosa_length <- subset(iris, Species=='setosa')
  setosa_length_covariance <- cov(setosa_length$Petal.Length,setosa_length$Sepal.Length)
  
  iris_length <- (list(virginica_length_covariance=virginica_length_covariance, setosa_length_covariance=setosa_length_covariance))
  print(iris_length)
}

build_width_sets <- function() {
  cat(" Building the iris petal and sepal width variables for the virginica and setosa species.\n")
  virginica_width <- subset(iris, Species=='virginica')
  virginica_width_covariance <- cov(virginica_width$Petal.Width,virginica_width$Sepal.Width)
  
  setosa_width <- subset(iris, Species=='setosa')
  setosa_width_covariance <- cov(setosa_width$Petal.Width,setosa_width$Sepal.Width)
  iris_width <- (list(virginica_width_covariance=virginica_width_covariance, setosa_width_covariance=setosa_width_covariance))
  print(iris_width)
}

compare_results <- function(virginica_covariance, setosa_covariance) {
  
}

second_main <- function() {
  build_length_sets()
  build_width_sets()
}

second_main()