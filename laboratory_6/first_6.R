"""
Consider the data set ”infert” from the package ”datasets” and use
the functions xtabs() and CrossTable() (in the ”gmodels” package) to
determine two crosstabs:
a) for the variables ”education” and ”spontaneous”;
b) for the variables ”education”, ”induced” and ”spontaneous”.
c) add the marginal frequencies to both crosstabs.
"""
# install.packages("gmodels") Only if necessary
library(gmodels)

two_variables <- function(data_frame) {
  # Function which determines the cross tabs for education and spontaneous variables of the infert dataframe.
  # It also adds the marginal frequencies to the crosstabs.
  cat("\nDeterminating cross tabs for education and spontaneous.\n")
  crossed <-xtabs(~infert_dataframe$education + infert_dataframe$spontaneous)
  CrossTable(infert_dataframe$education, infert_dataframe$spontaneous, prop.chisq = FALSE, prop.r = FALSE, prop.c = FALSE, prop.t = FALSE)
  
  cat("\nAdding marginal frequencies to the crosstab.\n")
  addmargins(crossed)
  margin.table(crossed, 1)
  margin.table(crossed, 2)
  prop.table(crossed)
  prop.table(crossed, 1)
  prop.table(crossed, 2)
}

three_variables <- function(data_frame) {
  # Function which determines the cross tabs for education, spontaneous and induced variables of the infert dataframe.
  # It also adds the marginal frequencies to the crosstabs.
  cat("\nDeterminating cross tabs for education, spontaneous and induced.\n")
  crossed <- xtabs(~data_frame$education + data_frame$spontaneous  + data_frame$induced)
  CrossTable(data_frame$education, data_frame$spontaneous, data_frame$induced, prop.chisq = FALSE, prop.r = FALSE, prop.c = FALSE, prop.t = FALSE)
  
  cat("\nAdding marginal frequencies to the crosstab.\n")
  addmargins(crossed)
  margin.table(crossed, 1)
  margin.table(crossed, 2)
  prop.table(crossed)
  prop.table(crossed, 1)
  prop.table(crossed, 2)
}

first_main <- function() {
  # main caller for the first exercice
  infert_dataframe <- data.frame(infert)
  two_crossed <- two_variables(infert_dataframe)
  three_chrosed <- three_variables(infert_dataframe)
}

first_main()