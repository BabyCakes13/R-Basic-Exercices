"""
Generate two vectors of 10000 values each having the uniform
distribution (0, 1). Assign these vectors to U1 and U2, respectively.
Since the values in U1 and U2 are approximately independent, we can
view them as independent random variables.
a Estimate E[U1 + U2]. Compare with the true value, and compare with
an estimate of E[U1] + E[U2].
b Estimate Var(U1 + U2) and Var(U1) + Var(U2). Are they equal?
Should the true values be equal?
c Estimate P(U1 + U2 ≤ 1.5).
"""
compare_means <- function(U1, U2) {
  # E(U1 + U2)
  first_mean <- mean(U1 + U2)
  # E(U1) + E(U2)
  second_mean <- mean(U1) + mean(U2)
  cat("\n E(U1 + U2):", first_mean, "\n", "E(U1) + E(U2):", second_mean, "\n", "uniform distributon: (0,1)\n")
  
  if (first_mean > 1) {
    cat(" The estimate", first_mean, "is larger than the true value.\n")
  } else {
    cat(" The estimate", first_mean, "is smaller than the true value.\n")
  }
  
  if(first_mean == second_mean) {
    cat(" The estimate of E[U1+U2] and E[U1]+E[U2] are equal.\n")
  } else if (first_mean > second_mean) {
    cat(" The estimate of E[U1+U2] is larger than E[U1]+E[U2].\n")
  } else {
    cat(" The estimate of E[U1+U2] is smaller than E[U1]+E[U2].\n")
  }
  
}

compare_variances <- function(U1, U2) {
  #Var(U1 + U2)
  first_variance <- var(U1 + U2)
  #Var(U1) + Var(U2)
  second_variance <- var(U1) + var(U2)
  cat(" \n Var(U1 + U2):", first_variance, "\n", "Var(U1) + Var(U2):", second_variance, "\n", "uniform distributon: (0,1)\n")
  
  if(first_variance == second_variance){
    cat(" The estimate of Var[U1+U2] and Var[U1]+Var[U2] are equal.\n")
  }else if (first_variance > second_variance){
    cat(" The estimate of Var[U1+U2] is larger than Var[U1]+Var[U2].\n")
  }else{
    cat(" The estimate of Var[U1+U2] is smaller than Var[U1]+Var[U2].\n")
  }
}

compare_probabilities <- function(U1, U2) {
  # TODO
}

first_main <- function() {
  U1 <- runif(10000, min=0, max=1);  
  U2 <- runif(10000, min=0, max=1);
  compare_means(U1, U2)
  compare_variances(U1, U2)
  compare_probabilities(U1, U2)
}

first_main()