library(ggplot2)
library(ggExtra)
data <- data.frame(cond = rep(c("condition1", "conditon 2"), each=10), my_x=1:100 + rnorm(100, sd=9), my_y= 1:100 + rnorm(100, sd=16))

# Getting a scatter plot with Linear regression line
ggplot(data, aes(x=my_x, y=my_y)) +
  geom_smooth(method = lm, color="red", se=TRUE)

# Getting a simple scatter plot

ggplot(data, aes(x=my_x, y=my_y)) +
  geom_point(shape=1)

# Getting marginal plots

p <- ggplot(data, aes(x=my_x, y=my_y)) +
  geom_point() +
  theme(legend.position = "none")
ggMarginal(p, type = "density")

