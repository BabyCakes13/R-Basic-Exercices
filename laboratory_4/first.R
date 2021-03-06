"""
Simulate 1000 realizations of a standard normal random variable Z,
and use your simulated sample to estimate
a) P(Z > 2.5);
b) P(0 < Z < 1.645);
c) P(1.2 < Z < 1.45);
d) P(−1.2 < Z < 1.3).
"""

simulate_snrv <- function(times) {
  # Function which simulates *times* standard normal random realizations of the variable Z.
  # It extracts the actual mean and variance for the set.
  simulated_snrv <- rnorm(times, 0, 1)
  mean_snrv <- mean(simulated_snrv)
  variance_snrv <- var(simulated_snrv)
  
  snrv <- (list(mean=mean_snrv, variance=variance_snrv, simulated=simulated_snrv))
  return(snrv)
}

estimate_snrv_one_bound <- function(snrv, lower) {
  # Function which estimates the lower bounded Z realizations, comparing the actual result to the theoretical one.
  actual <- pnorm(lower, snrv$mean, snrv$variance, lower.tail=FALSE)
  theoretical <- pnorm(lower, 0, 1, lower.tail=FALSE)
  
  cat("\nThe actual value of the bounded standard normal random variable Z by", lower, "is", actual, ".\n")
  cat("The theoretical value of the bounded standard normal random variable Z by", lower, "is", theoretical, ".\n")
}

estimate_snrv_two_bounds <- function(snrv, lower, upper) {
  # Function which estimates the lower and upper bounded Z realizations, comparing the actual result to the theoretical one.
  lower_actual <- pnorm(lower, snrv$mean, snrv$variance, lower.tail=FALSE)
  lower_theoretical <- pnorm(lower, 0, 1, lower.tail=FALSE)
  
  upper_actual <- pnorm(upper, snrv$mean, snrv$variance, lower.tail=TRUE)
  upper_theoretical <- pnorm(upper, 0, 1, lower.tail=TRUE)
  
  actual <- upper_actual - lower_actual
  theoretical = upper_theoretical - lower_theoretical
  
  cat("\nThe actual value of the double bounded standard normal random variable Z by",lower,"and",upper, "is",actual,".\n")
  cat("The theoretical value of the double bounded standard normal random variable Z by",lower,"and",upper,"is", theoretical,".\n")
}

first_main <- function() {
  # Main caller of the first problem.
  snrv <- simulate_snrv(1000)
  estimate_snrv_one_bound(snrv, 2.5)
  estimate_snrv_two_bounds(snrv, 0, 1.645)
  estimate_snrv_two_bounds(snrv, 1.2, 1.45)
  estimate_snrv_two_bounds(snrv, -1.2, 1.3)
}

first_main()