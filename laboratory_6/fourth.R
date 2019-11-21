"""
Construct the scatterplot matrix for the continuous variables of the
data set ”ais” in the ”DAAG” package. Are there any linear
relationships between the variables?
"""

construct_scatterplot <- function() {
  dataframe_ais <- within(DAAG::ais, rm(ferr, sport, sex))
  pairs(dataframe_ais[,1:length(dataframe_ais)], pch = 20)
  
  cat("\n It can be noticed that there are linear relationships between the variables if we look at the plot. 
 For some variables, the scatter plot clearly reaselbles a line-like spread.\n")
}

fourth_main <- function() {
  construct_scatterplot()
}

fourth_main()

