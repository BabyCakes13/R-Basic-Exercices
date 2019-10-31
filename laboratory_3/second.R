"""
Generate 1000 integers ranging from 1 to 10 that are uniformly
distributed. Use the table() function to check whether the observed
frequencies for each value are close to what you expect.
"""

check_frequencies <- function() {
  # use runif with round to generate uniformly distributed integers rather than real numbers
  frequencies <- table(round(runif(1000, min=1, max=10), 0))
  
  cat("Frequencies for 1000 random integers, uniformly distributed, from 1 to 10:")
  print(frequencies)
  cat("The frequencies of all numbers with exception of 1 and 10 are very close. For 1 and 10, there is approximately 50 or more difference rather than the rest.\n")
}

check_frequencies()