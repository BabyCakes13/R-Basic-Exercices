"For the data frame ais (DAAG package), (a) use the function str() to
get information on each of the columns and determine whether any of the
columns hold missing values; (b) make a table that shows the numbers of
males and females for each different sport. In which sports is there a large
imbalance (e.g., by a factor of more than 2:1) in the numbers of the two
sexes?"

initialise_data <- function() {
  # Install the DAAG package in order to access the ais data set.
  # install.packages('DAAG')
  library('DAAG')
  ais_data <<- data.frame(ais)
  ais_data
}

determine_column_missing_values <- function(data) {
  # Print information about the set.
  str(data)
  # Count the number of missing values for each column name and add them to a 
  # character vector which will keep the name of each such column. If the 
  broken_columns = names(which(colSums(is.na(data)) > 0))
  
  if(length(broken_columns) == 0) {
    print("All columns have all values.")
  } else {
    print("Columns with broken values: ")
    print(broken_columns)
  }
}

create_males_females_table <- function(data) {
  
}

find_imbalanced_sports <- functions(data) {
  
}

initialise_data()
determine_column_missing_values(ais_data)