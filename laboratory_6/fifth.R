"""
Use the lattice function bwplot() to display, for each combination of
site and sex in the data frame possum (DAAG package), the
distribution of ages. Show the different sites on the same panel, with
different panels for different sexes.
"""
library(lattice)

fifth_main <- function() {
  # Main caller of the fifth exercice.
  bwplot(age ~ site | sex, data=DAAG::possum)
}

fifth_main()