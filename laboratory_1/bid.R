"The data frame socsupport (DAAG) has data from a survey on social
and other kinds of support, for a group of university students. It includes
Beck Depression Inventory (BDI) scores. The following are two alternative
plots of BDI against age:
plot(BDI∼ age, data=socsupport)
plot(BDI ∼ unclass(age), data=socsupport)
For examination of cases where the score seems very high, which plot is more
useful? Explain. Why is it necessary to be cautious in making anything of
the plots for students in the three oldest age categories (25-30, 31-40, 40+)?"

bdi_data <- data.frame(socsupport)
x <- bdi_data[,2]
y <- unclass(bdi_data[,2])

print(bdi_data)

plot(x, bdi_data$BDI)
plot(y, bdi_data$BDI)

"
The differente of the two plots is how the data is displayed, and how much information about it is displayed.
As the data is organised in categories of ages (x-y, where x, y represent the ages), the unclassed plot provides a box whisker plotting, which contains the quartiles, mean, highest and lowest observation and the outliers as well, as points. 
The second one unclasses the elements and rather than having a pair of (x-y), the ages are represented as levels, based on how many categories there are (in this case, 5). So the plot is formed of points.
I believe the first unclassed plot proves more useful than the other because:
- the outliers are highlighted and are more easy to be seen. Since the plot includes minimum and maximum values based on the quartiles, abnormal high scores pop out and are displayed;
- other information such as the mean prove as useful since it provides a more detailed view of the information, rather than the unclassed plot which is only seen as points (even overlapping points).
- the unclassed plotting of the data set does not show as much information as the box whisker one and in my opinion, its only advantage being that you can visually see the number of observations in cases when there are too little.
So I believe that for observing high scores the box whisker plot proves more useful than the unclassed one.
As for making something of the last three upper classes, I believe that we should be careful because the number of observations in the data set of the last three categories is very low, so we don't really have much information to strongly make a statement for the BDI scores of those categories. 
As the test is taken by te subjects on themselves (answering questions not always sincere or exagerating the answer) makes credibility of the subject not extremly high, and also having a low number of subjects increases the chance of false information. 
The strength of the extracted infromation in how credible and accurate it is is proportional to the number of observations studied, and since the first two categories have a much higher number of items than the last three, the last one sould be threatet with caution.
"