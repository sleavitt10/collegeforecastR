# TODO: read the dataframe into dat

# The following code extracts the data relating to any vector of universities from a 
# dataframe and uses it to plot the evolution of attendance cost and average student debt
# over time.
# If you execute it on you computer, you can clearly see that the average debt goes up as the
# price goes up.

library(ggplot2)
library(readr)
library(grid)

current_uni <- subset(dat, dat$uni.name %in% c("Princeton University", "Harvard University"))

# The correlation between average debt and attendance cost is positive and significant (r = 0.303)
class(current_uni$avg.debt) <- "numeric"
cor.test(current_uni$total.attendCost, current_uni$avg.debt)

ggplot(data = current_uni,
       aes(x = Year, y = total.attendCost)) +
  ggtitle(label = "Evolution of Attendance Cost and Student Debt over Time") +
  geom_point(aes(color = uni.name, size = avg.debt), pch = 13) +
  scale_y_continuous(name = "Price of attendance") +
  theme(axis.title.x = element_text(face = "italic", hjust = 0.7), 
        axis.title.y = element_text(face = "italic")) 

# correlation display if only one university in input vector
if ((length(unique(current_uni$uni.name))) == 1) {
  grid.text(sprintf("Cor(Attendance price, Student Debt) = %f", 
                    cor(current_uni$total.attendCost, current_uni$avg.debt)),
            x = .01, y = .03,
            just = "left",
            draw = TRUE)
}
