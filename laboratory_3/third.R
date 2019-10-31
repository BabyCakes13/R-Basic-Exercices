"""
Write an R function which simulates 500 light bulbs, each of which
has probability 0.99 of working. Using simulation, estimate the
expected value and variance of the random variable X, which is 1 if
the light bulb works and 0 if the light bulb does not work. What are
the theoretical values?
"""

generate_X <- function(times, probability) {
  # Function which simulates 500 light bulbs, with 0.99 probability of working.
  # The variable is converted to 0, 1 rather than TRUE and FALSE
  generated_LB_probabilities <- runif(times, min=0, max=1)
  # convert: TRUE -> 1; FALSE -> 0, for Bernouli distribution.
  X <- 1*(generated_LB_probabilities < probability)
  
  return(X);
}

X_functions <- function(X) {
  # Function which calculates the expected value and variance of the random variable X
  mean_X <- mean(X)
  variance_X <- var(X)
  
  functions <- list(mean=mean_X, variance=variance_X)
  return(functions)
}


third_main <- function() {
  # main caller of the thrid problem
  X <- generate_X(500, 0.99)
  estimates <- X_functions(X)
  
  cat("The random variable X representing the light bulb:\n")
  print(table(X))
  cat("The expected value of the random variable X is:", estimates$mean, ".\n")
  cat("The variance of the random variable X is:", estimates$variance, ".\n")
}

third_main()
