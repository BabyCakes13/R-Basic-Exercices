"R ships with several built-in datasets, including the iris data collected
by Anderson and analyzed by Fisher in the 1930s. What are the variables
in the data set and of what type? Create a new data frame that consists
of the numeric columns of the iris dataset, and calculate the means of its
columns."

display_iris_information <- function() {
  print("Displaying the data type and variable of the iris data set.")
  "Use <<- to create a global variable from inside the function,
  so it can be accessed without passing it as a parameter."
  iris_data <<- data.frame(iris)
  # Displays various information about the data frame, including the type and variables of the set.
  str(iris_data)
}

create_numeric_iris <- function() {
  print("Creating the numeric only data set based on the numeric values of iris.")
  numeric_iris <<- iris_data[sapply(iris_data, is.numeric)]
  numeric_iris
}

calculate_column_mean_fancy <- function(){
  print("Calculating the mean of each column of the numeric data frame by looping through column names.")
  # Iterate over the column names and access their variables for mean calculation.
  for(name in names(numeric_iris)) {
    print(mean(numeric_iris[[name]]))
  }
}

calculate_column_mean_smart <- function() {
  print("Calculating the mean of each column of the numeric data frame using a designed already implemented function to do so.")
  colMeans(numeric_iris)
  
}

display_iris_information()
create_numeric_iris()
calculate_column_mean_fancy()
calculate_column_mean_smart()