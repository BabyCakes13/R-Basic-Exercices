"""
Construct the histogram of the variable ”Petal.Length” in ”iris”, then
change the bins in an appropriate manner. Add the density function
to the graph. Construct the boxplot of a variable of your choice with
respect to each species.
"""

generate_histogram <- function() {
  # Function which generates the histogram of Petal.Length, adding the density.
  petal_length <- iris$Petal.Length
  
  dev.new()
  hist(petal_length, prob=TRUE, breaks=4)
  lines(density(petal_length, na.rm= TRUE), col="blue", lwd=2)
}

generate_boxplot <- function() {
  # Function which generates the box plot for Petal.Length.
  dev.new()
  boxplot(Petal.Length ~ Species, iris)
}

fourth_main <- function() {
  generate_histogram()
  generate_boxplot()
}

fourth_main()