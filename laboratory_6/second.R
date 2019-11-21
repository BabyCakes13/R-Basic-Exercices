"""
Compare the covariance of ”Petal.Length” and ”Sepal.Length” for
the species ”virginica” to the one of the same variables for the species
”setosa”; also compare it to the covariance of the variables
”Petal.Width” and ”Sepal.Width”.
"""
# install.packages("MASS") if necessary
library(MASS)

build_length_sets <- function() {
  # Function to build the virginica and setosa covariances based on Petal and Sepal lengths.
  cat(" Building the iris petal and sepal length variables for the virginica and setosa species.\n")
  virginica_length <- subset(iris, Species=='virginica')
  virginica_length_covariance <- cov(virginica_length$Petal.Length,virginica_length$Sepal.Length)
  
  setosa_length <- subset(iris, Species=='setosa')
  setosa_length_covariance <- cov(setosa_length$Petal.Length,setosa_length$Sepal.Length)
  
  iris_length <- (list(virginica=virginica_length_covariance, setosa=setosa_length_covariance))
  return(iris_length)
}

build_width_sets <- function() {
  # Function to build the virginica and setosa covariances based on Petal and Sepal widths.
  cat(" Building the iris petal and sepal width variables for the virginica and setosa species.\n")
  virginica_width <- subset(iris, Species=='virginica')
  virginica_width_covariance <- cov(virginica_width$Petal.Width,virginica_width$Sepal.Width)
  
  setosa_width <- subset(iris, Species=='setosa')
  setosa_width_covariance <- cov(setosa_width$Petal.Width,setosa_width$Sepal.Width)
  
  iris_width <- (list("virginica"=virginica_width_covariance, "setosa"=setosa_width_covariance))
  return(iris_width)
}

compare_results <- function(virginica_covariance, setosa_covariance, type) {
  # Function which compares the virginica and setosa covariances.
  cat("\n Comparing differences of covariance for virginica and setosa subsets of the iris data frame, based on", type, ".")
  if(virginica_covariance > setosa_covariance){
    cat("\n The virginica covariance (", virginica_covariance, ") is larger than the setosa covariance (", setosa_covariance, ")\n")
  }else if (cov_virginica<cov_setosa){
    cat("\n The virginica covariance (", virginica_covariance, ") is smaller than the setosa covariance (", setosa_covariance, ")\n")
  }else{
    cat("\n The virginica covariance (", virginica_covariance, ") is equal to the setosa covariance (", setosa_covariance, ")\n")
  }
}

second_main <- function() {
  # Main caller of the second exercice.
  iris_length <- build_length_sets()
  compare_results(iris_length$virginica, iris_length$setosa, "Petal.Length and Sepal.Length")
}

third_main <- function() {
  # Main caller of the third exercice.
  iris_width <- build_width_sets()
  compare_results(iris_width$virginica, iris_width$setosa, "Petal.Width and Sepal.Width")
}

second_main()
third_main()