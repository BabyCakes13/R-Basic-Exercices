"""
Generate 1000 integers ranging from 1 to 10 that are uniformly
distributed. Use the table() function to check whether the observed
frequencies for each value are close to what you expect.
"""

generate_random_integers <- function(min, max, n) {
  # Function which generates n random integers between min and max, displaying the appearances of each type in a table.
  generated <- sample(min:max, n, replace = TRUE)
  table(generated) 
}

generate_random_integers(1, 10, 1000)