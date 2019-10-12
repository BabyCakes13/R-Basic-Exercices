"The orings data frame gives data on the damage that had occurred in
US space shuttle launches prior to the disastrous Challenger launch of 28
January 1986. The observations in rows 1, 2, 4, 11, 13, and 18 were included
in the pre-launch charts used in deciding whether to proceed with the launch,
while remaining rows were omitted. Create a new data frame by extracting
these rows from orings, and plot total incidents against temperature for this
new data frame. Obtain a similar plot for the full data set."

set_up_data_sets <- function() {
  # Install package faraway which contains the oring data frame, if it doesn't exist.
  # install.packages('faraway')
  library(faraway)
  
  # Create a new partial data frame which contains only some rows from the original orings.
  orings_data <- data.frame(orings)
  partial_orings_data <- orings_data[c(1, 2, 4, 11, 13, 18),]
}

plotting <- function(data_frame, data_message, plot_message, plot_title) {
  # Function to plot the data from a data frame.
  print(data_message)
  print(data_frame)
  print(plot_message)
  plot(data_frame$temp, data_frame$damage, main=plot_title, ylab="Incidents", xlab="Temperature", type="b", col="red")
  # Set a timer between plot display so each call can have enough view time to be seen.
  Sys.sleep(3)
}

set_up_data_sets()
plotting(partial_orings_data,
         "The new data set obtained from columns 1, 2, 4, 11, 13 and 18 of the oring data set.",
         "Plotting incidents/total damage over the temperature for the small derived set.",
         "Incidents over temperature in partial orings.")
plotting(orings_data,
         "The full oring data set.",
         "Plotting incidents/total damage over the temperature for the full oring data set.",
         "Incidents over temperature in full orings.")