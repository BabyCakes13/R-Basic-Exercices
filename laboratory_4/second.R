"""
A χ^2
random variable on n degrees of freedom has the same
distribution as the sum of n independent standard normal random
variables. Simulate a χ^2 random variable on eight degrees of freedom,
and estimate its mean and variance. (Compare with the theoretical
values: 8, 16.)
"""

simulate_rvndf <- function(times, freedom_degrees) {
  # Function which simulates the random variable on *freedom_degrees*.
  simulated_rvndf <- rchisq(times, freedom_degrees)
  return(simulated_rvndf)
}

compare_estimates <- function(actual, theoretical, estimate) {
  # Function which compares the actual and theoretical values of an estimate.
  cat("\nComparing: actual:", actual, "and theoretical:", theoretical, estimate)
  if(actual == theoretical){
    cat(" \nThe actual and theoretical",estimate,"are equal.\n")
  }else if (actual > theoretical){
    cat(" \nThe actual",estimate,"is greater than the theoretical one\n")
  }else{
    cat(" \nThe actual",estimate,"is smaller than the theoretical one.\n")
  }
}

estimate_rvndf <- function(rvndf, theoretical_mean, theoretical_variance) {
  # Function which calculates the actual mean and variance for the simulated variable, comparing them.
  actual_mean <- mean(rvndf)
  actual_variance <- var(rvndf)

  compare_estimates(actual_mean, theoretical_mean, "mean")
  compare_estimates(actual_variance, theoretical_variance, "variance")
}

second_main <- function() {
  rnvdf <- simulate_rvndf(5000, 8)
  estimate_rvndf(rnvdf, 8, 16)
}

second_main()