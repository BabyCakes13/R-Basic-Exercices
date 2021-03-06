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
  print("Initialising the ais data.")
  
  ais_data <<- data.frame(ais)
}

determine_column_missing_values <- function(data) {
  print("Displaying information about the set.")
  # Print information about the set.
  str(data)
  
  print("Displaying all columns which have inexistend values in them.")
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

create_sports_table <- function(data) {
  print("Create the table which holds the number of males and females for each sport.")
  # Create new data frame to hold the extracted information.
  sport_data <- initialise_empty_table()
  # Find all sports in the ais data frame.
  unique_sports <- unique(data['sport'])
  
  # For each sport, create a subset table containing all appearences.
  for(i in 1:nrow(unique_sports)) {
    sport_name <- unique_sports[i, "sport"]
    sport_subset <- subset(data, sport == sport_name)
    
    # Count the number of females and males attending that sport.
    females <- sum(sport_subset$sex=='f')
    males <- sum(sport_subset$sex=='m')

    # Add a new row to the sport table containing its name and the number of female and male players.
    row <- list(toString(sport_name), females, males)
    sport_data <- rbind(sport_data, row, stringsAsFactors=FALSE)
  }
  # Change the names of the columns of the new sport table.
  colnames(sport_data) <- c("sport", "females", "males")
  print(sport_data)
  return(sport_data)
}

initialise_empty_table <- function() {
  print("Initialise empty table.")
  # Initialise an empty table to hold the sports table.
  df <- data.frame(sport=character(),
                  female=numeric(), 
                  male=numeric(), 
                  stringsAsFactors=FALSE) 
  return(df)
}

find_imbalanced_sports <- function(data, balance_factor) {
  print(paste("Finding inbalanced sports by a factor of", balance_factor, sep = " "))
  
  # Iterate through every sport and find an imbalance in both males and females.
  for(i in 1:nrow(data)) {
    sport_name <- data[i, "sport"]
    females <- data[i, "females"]
    males <- data[i, "males"]

    if (females >= balance_factor*males) {
      print(paste("Women to power!", sport_name, ":", females, "-", males, "ratio:", sep = " "))
    } else if(males >= balance_factor*females) {
      print(paste("Men to power!", sport_name, ":", females, "-", males, sep = " "))
    }
  }
}

initialise_data()
determine_column_missing_values(data = ais_data)
sports_data <- create_sports_table(data = ais_data)
find_imbalanced_sports(data = sports_data, balance_factor = 2)