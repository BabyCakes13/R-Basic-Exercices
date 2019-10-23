"
Let fn denote the nth Fibonacci number. (a) Construct a sequence of
ratios of the form fn+1/fn, n = 1, 2, . . . , 30. Does the sequence appear to
be converging? (b) Compute the golden ratio (1 + √5)/2. Is the 
sequence converging to this ratio? (Optional) Can you mathematically prove this?
"

fibonacci <- function(n) {
  # Function which calculates the n-th term in the Fibonacci sequence.
  if(n <= 1) {
    return(n)
  } else if (n==2) {
    return(1)
  } else {
    return(fibonacci(n-1) + fibonacci(n-2))
  }
}

fibonacci_rations <- function(start, end) {
  # Function which calculates the fibonacci rations between n and n+1,
  # where n is in the interval [start, end].
  # The results are stored in an ratios array, which will be plotted
  # to highlight the convergence to 1.618934 in a graphical way.
  # We therefore have the visual proof that when n is high enough, 
  # the ratio between n+1 and n is convergent to the golden ratio.
  
  cat("Starting to calculate the ratios of fibonacci numbers between ", start, " and ", end, "\n")
  
  golden_ratio = (1+sqrt(5))/2
  cat("The golden ratio is ", golden_ratio, "\n")
  
  ratios <- c()
  for(n in start:end-1) {
    result <- fibonacci(n+1)/fibonacci(n)
    cat(n, ":", n+1, ":", result, "\n")
    ratios <- append(ratios, result)
  }
  plot(ratios, type="l", col="orange", xlab="n", ylab="ratio", )
  
  print("We can see visually that the series is converging to the golden ratio when n increases, while at low n values, their ratio is oscilating around 1.618034.")
}

fibonacci_rations(2, 30)