"The beaver1 and beaver2 datasets contain body temperatures of two
beavers. Add a column named id to the beaver1 dataset, where the value
is always 1. Similarly, add an id column to beaver2, with value 2. Vertically
concatenate the two data frames and find the subset where either beaver is
active."

initialise_data <- function() {
  print("Initialise beaver 1 and beaver 2.")
  # Initialises the two beaver data sets to be worked with.
  beaver_1 <<- data.frame(beaver1)
  beaver_2 <<- data.frame(beaver2)
}

add_id_columns <- function(beaver_set, id) {
  message = paste("Adding a new id column for the beaver", id, sep = " ")
  print(message)
  
  beaver_set[['id']] = id
  print(beaver_set)
  return(beaver_set)
}

vertically_concatenate_beavers <- function() {
  # Use rbind to vertically concatenate the two beaver sets.
  print("Vertically concatenating thet two beaver sets.")
  
  both_beavers <- rbind(beaver_1, beaver_2)
  print(both_beavers)
  return(both_beavers)
}

find_active_beavers <- function(two_beavers) {
  # Create a set based on whether the active variable is one or not.
  print("Finding the active beavers.")
  
  active_beavers <- subset(two_beavers, activ == 1)
  print(active_beavers)
  return(active_beavers)
}

initialise_data()
beaver_1      <- add_id_columns(beaver_1, 1)
beaver_2      <- add_id_columns(beaver_2, 2)
two_beavers   <- vertically_concatenate_beavers()
active_beavers<-find_active_beavers(two_beavers = two_beavers)