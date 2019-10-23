"""
A twin prime is a pair of primes (x, y), such that y = x + 2.
Construct a list of all twin primes less than 1000.
"""

check_prime <- function(x) {
  # Function which, given a number, checks whether it is a prime or not.
  if(x == 2) {
    return(TRUE)
  } else if (any(x %% 2:(x-1) == 0)) {
    return(FALSE)
  } else {
    return(TRUE)
  }
}
twin_primes <- function(n) {
  # Function which finds the twin primes below a given number n.
  print("Started finding the twin primes.")
  if (n < 5) stop("Input value of n should be at least 5. There are no pairs below 5.")
  
  all_numbers <- 1:n
  # cut out the ones which are not primes
  prime_numbers <- all_numbers[sapply(all_numbers, check_prime)]
  # find the ones which have a difference of 2
  pairs <- which(diff(prime_numbers)==2)
  pairs <- sort(c(pairs, pairs+1))
  
  print("The twin primes are: ")
  matrix(prime_numbers[pairs], ncol=2, byrow=TRUE)
}

twin_primes(1000)