"""
Another algorithm for finding a zero of a function is called the
bisection algorithm. This algorithm starts with two values x1 and x2
for which f (x1) and f (x2) have opposite signs. If f (x) is a continuous
function, then we know a root must lie somewhere between these two
values. We find it by evaluating f (x) at the midpoint, and selecting
whichever half of the interval still brackets the root. We then start
over, and repeat the calculation until the interval is short enough to
give us our answer to the required precision. (a) Use a function to
implement the bisection algorithm to find a root to 6 decimal place
accuracy of f (x) = x^3 + 2x2 − 7, given that the root is known to lie
between 0 and 2. (b) Why do you think that your bisection algorithm
is guaranteed to converge for any continuous function which takes
opposite-signed values at 0 and 2, and calculate how many loops it
will take.
"""

fancy_function <- function(x) {
  # function to have the roots found
  x^3 + 2*x^2 - 7
}

bisection <- function(f, a, b, n = 1000, tol = 1e-7) {
  # chosen 1e-7 after some research
  
  # check if the signs are satisfactory
  if (!(f(a) < 0) && (f(b) > 0)) {
    stop('Different signs for f(a) and f(b).')
  } else if ((f(a) > 0) && (f(b) < 0)) {
    stop('Different signs for f(a) and f(b).')
  }

  # keep the number of iterations for further display
  iterations = 0
  # iterate n times maximum, so we don't run into an inifinite loop
  for (i in 1:n) {
    iterations = iterations + 1
    midpoint <- (a + b)/ 2 # Calculate midpoint
    
    # if f(midpoint)==0 or the midpoint is below the tolerance, return the root
    if ((f(midpoint) == 0) || ((b - a) / 2) < tol) {
      cat("Root: ", midpoint, "after", iterations, "iterations.\n")
      return(midpoint)
    }
    
    # if the root is not found, we need to chose whether a or b will take the value of the midpoint, 
    # by checking the sign of f(a) and f(c)
    ifelse(sign(f(midpoint)) == sign(f(a)), a <- midpoint, b <- midpoint)
  }
  
  # if the root has not been found after the maximum number of iterations, print this.
  print('Too many iterations')
}

# CONCLUSION
# I believe that there will certanliy be a root between 0 and 2 because the functions f(0) and f(2) change their signs; if they change their signs,
# that means that somewhere inbetween those values the function hits 0 on the axis for some value, which is the root. Therefore, if the function
# for which we search the root is convergent, and its values have different signs for two given parameters (0 and 2 in this case), we know for sure that there
# is a parameter for which the value of the function is 0, and therefore root (since the signs cannot be changed without reaching 0 on an axis). 
# In this case, it took 25 iterations to find the root. We allowed maximu 1000.

bisection(fancy_function, 0, 2)