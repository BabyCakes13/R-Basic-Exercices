"""
The goal of this exercise is for you to use artificial data to see what
the advantages of factors are over numeric and character vectors.
(a) Use the sample() function to construct a vector called dieRolls
which simulates the results of 1000000 tosses of a six-sided die.
(b) Convert dieRolls to a factor called dieRollsFactor. Change the
levels of the factor using the code levels(dieRollsFactor)←c(”One”, ”Two”, ”Three”, ”Four”, ”Five”,
”Six”)
(c) Create a character version of the vector using
dieRollsChar← as.character(dieRollsFactor)
(d) Apply the table() function to each of dieRolls, dieRollsFactor, and
dieRollsChar, and compare the results as well as how the information
in each of the data sets is displayed.
(e) Run the code
system.time(table(dieRolls))
system.time(table(dieRollsFactor))
system.time(table(dieRollsChar))
"""

prepare_die_rolls <- function() {
  # Method which experiments with different data structures over an artificial die data set,
  # highlighting the difference between vector, factor an character types.
  
  # create the three data sets: vector, factor and character
  dieRolls <- sample(1:6, 1000000, replace=TRUE)
  dieRollsFactor <- factor(dieRolls)
  levels(dieRollsFactor) <- c("One", "Two", "Three", "Four", "Five", "Six")
  dieRollsChar <- as.character(dieRollsFactor)
  
  # use the table function to group unique values in the data sets
  vector_rolls <- table(dieRolls)
  factor_rolls <- table(dieRollsFactor)
  character_rolls <- table(dieRollsChar)
  
  # print the results of the table, as well use a data frame to show the actual values for the measured frequencies
  cat("Vector structured die rolls table.", vector_rolls, "\n")
  print("Vector structured die rolls data frame to display the actual die value")
  print(data.frame(vector_rolls))
  
  cat("Factor structured die rolls table.", factor_rolls, "\n")
  print("Factor structured die rolls data frame to display the actual die value")
  print(data.frame(factor_rolls))
  
  cat("Character structured die rolls table.", character_rolls, "\n")
  print("Character structured die rolls data frame to display the actual die value")
  print(data.frame(character_rolls))
  
  cat("As a consclusion to the experiment, we can observe that in the first two cases, vector and factor displaythe die were ordered ascendently, by the numerical value. 
  The factor structure is based on the numerical order as well, so we get the results, based on 1, 2, 3, 4, 5, 6 (one, two, three, four, five). 
  On the other hand, the character notation forced an ASCII ordering of the die, therefore
  the order of display is based on the alphabetical order (five, four, one, six, three, two. The difference between the vector, factor and character
  ordering lies in how comparing the elements is treated - based on numbers or based on character ASCII codes.\n")
  
  # analyse the time taken by each type of table creation
  cat("Running system.time on vector table creation.\n")
  print(system.time(table(dieRolls)))
  cat("Running system.time on factor table creation.\n")
  print(system.time(table(dieRollsFactor)))
  cat("Running system.time on character table creation.\n")
  print(system.time(table(dieRollsChar)))
  
  cat("After calling the system.time function in order to analyse the time elapsed for each table creation, we come to conclusion that the most time optimal table creation is the factor one,
  while the slowest build is the vector case. 
  Therefore, we can see that by working with factors instead of pure vectors, in this case there is big increase
  in the performance.\n")
  
  # analyse the memory taken by each data structure, after dumping them into files
  dump("dieRolls","dieRolls.R")
  dump("dieRollsFactor","dieRollsFactor")
  dump("dieRollsChar","dieRollsChar.R")
  
  cat("After analysing the memory taken by each data structure, we observe that the vector and factor rolls take 3.9MB of memory, while the character takes 7.5MB.
      We can therefore conclude that the files which take the equal smallest amount of memory are the vector and factor structures, while the largest is the character one.")
}

prepare_die_rolls()
