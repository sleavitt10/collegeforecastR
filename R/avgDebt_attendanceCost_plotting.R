#' Evolution of grants / financial aid over time
#'
#'The following code extracts the data relating to any vector of universities from a
#'dataframe and uses it to plot the evolution of attendance cost and average student debt
#'over time.
#'If you execute it on you computer, you can clearly see that the average debt goes up as the
#'price goes up.
#'
#' @param uni.name type in name of university
#'
#' @return None
#'
#' @examples
#' costvdebt(uni.names = "University of Southern California")
#' costvdebt(uni.names = c("University of Southern California", "Princeton University"))
#'
#' @export


costvdebt <- function(uni.names) {

  library(ggplot2)
  library(readr)

  dat <- read_csv("college_data_cleaned.csv")
  current_uni <- subset(dat, dat$uni.name %in% (uni.names))

  if ((length(unique(current_uni$uni.name))) < 2) {
    cat("Cor(Attendance price, Student Debt) = ")
    cat(cor(current_uni$total.attendCost, current_uni$avg.debt))
  }

  ggplot(data = current_uni,
         aes(x = Year, y = total.attendCost)) +
    ggtitle(label = "Evolution of Attendance Cost and Student Debt over Time") +
    geom_point(aes(color = uni.name, size = avg.debt), pch = 13) +
    scale_y_continuous(name = "Price of attendance") +
    theme(axis.title.x = element_text(face = "italic", hjust = 0.7),
          axis.title.y = element_text(face = "italic"))
}


install.packages(c("devtools", "roxygen2", "testthat", "knitr"))
