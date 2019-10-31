"""
Estimate the mean and variance of a Poisson random variable whose
mean is 7.2 by simulating 10000 Poisson pseudorandom numbers.
Compare with the theoretical values.
"""

generate_P <- function(times, mean, variance) {
  # Function which generates the poisson random variable based on given times, mean and variance, returning it.
  P <- rpois(times, lambda = variance)
  return(P)
}

calculate_P <- function(P) {
  # Function which calculates the expected value and variance of a given distribution, returning a list of them.
  actual_mean <- round(mean(P), 1)
  actual_variance <- round(var(P), 1)
  
  functions <- list(actual_mean = actual_mean, actual_variance = actual_variance)
  return(functions)
}

compare_mean_variance <- function(theoretical_mean, actual_mean, theoretical_variance, actual_variance) {
  # Function which compares the theoretical and actual means and variances.
  if (theoretical_mean == actual_mean) {
    cat("The theoretical mean and the actual one of the Poission random variable are equal: (", theoretical_mean, ",", actual_mean, ")\n")
  } else {
    cat("The theoretical mean and the actual one of the Poission random variable are different: (", theoretical_mean, ",", actual_mean, ")\n")
  }
  
  if (theoretical_variance == actual_variance) {
    cat("The theoretical variance and the actual one of the Poission random variable are equal: (", theoretical_variance, ",", actual_variance, ")\n")
  } else {
    cat("The theoretical variance and the actual one of the Poission random variable are different: (", theoretical_variance, ",", actual_variance, ")\n")
  }
  
}

fifth_main <- function() {
  # main caller for the fifth problem
  theoretical_mean <- 7.2
  theoretical_variance <- theoretical_mean
  
  P <- generate_P(10000, theoretical_mean, theoretical_variance)
  functions <- calculate_P(P)
  compare_mean_variance(theoretical_mean = theoretical_mean,
                        actual_mean = functions$actual_mean,
                        theoretical_variance = theoretical_variance,
                        actual_variance = functions$actual_variance)
}

fifth_main()