"""
Mortgage interest rates can sometimes depend on whether the
mortgage term is open or closed. Use the formula R = Pi/(1−(1+i)^(−n) to
create a function to calculate a monthly mortgage payment R where i
is an interest rate (compounded monthly), P is the original principal,
and n is the length of the term (in months). The function should take
n, P, and open as arguments. If open is rqual to TRUE, then take i =
0.005; otherwise, take i = 0.004.
"""

montly_mortgage_payment <- function(P, n, open) {
  # Function which calculates the monthly morgage payment.
  if(open == TRUE) {
    i = 0.005
  } else {
    i = 0.004
  }
  # use the '^' method of powering up so that we don't get scientific notation of the result.
  result <- P*i/(1-`^`(i+1,-n))
  cat("The mortgage payment for", n, "months, with original principal", P, "and the interest rate", i, "is:", result, "\n")
  return(result)
}

montly_mortgage_payment(3000, 5, TRUE)
montly_mortgage_payment(3000, 5, FALSE)