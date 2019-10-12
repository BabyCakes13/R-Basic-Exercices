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
