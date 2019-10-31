"""
Generate 1000 integers ranging from 1 to 10 that are uniformly
distributed. Use the table() function to check whether the observed
frequencies for each value are close to what you expect.
"""

check_frequencies <- function() {
  # use runif with round to generate uniformly distributed integers rather than real numbers
  frequencies_sample <- table(round(runif(1000, min=1, max=10), 0))
  frequencies_round <- table(sample(1:10, 1000, TRUE))
  
  
  cat("Frequencies for 1000 random integers, uniformly distributed, from 1 to 10 (USING SAMPLE):")
  print(frequencies_sample)
  cat("Frequencies for 1000 random integers, uniformly distributed, from 1 to 10 (USING ROUND):")
  print(frequencies_round)
  
  cat("In case of round, the frequencies of all numbers with exception of 1 and 10 are very close. For 1 and 10, there is approximately 50 or more difference rather than the rest.\n")
  cat("In case of sample, the frequencies of all numbers seem evenly distributed, and there is no big discrepancy between 1, 10 and the rest of the numbers.\n")
}

check_frequencies()