"""
Plot a histogram of the ”earconch” measurements for the ”possum”
data in DAAG. The distribution should appear bimodal (two peaks).
This is a simple indication of clustering, possibly due to sex
differences. Obtain side-by-side boxplots of the male and female
earconch measurements. How do these measurement distributions
differ? Can you predict what the corresponding histograms would
look like? Plot them to check your answer. Use functions from the
ggplot2 package.
"""

plot_histograms <- function() {
  # Function to plot the earconch and possum measurements.
  par(mfrow=c(1, 2), mar=c(3.6, 3.6, 1.6, 0.6))
  hist(DAAG::possum$earconch, main="")
  boxplot(earconch~sex, data=DAAG::possum, boxwex=0.3, horizontal=TRUE)
  par(mfrow=c(1, 1))
}

sixth_main <- function() {
  # Main caller of the sixth exercice.
  plot_histograms()
}

sixth_main()