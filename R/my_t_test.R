#' t-Test Function
#'
#' This function performs a one sample t-test.
#'
#' @param x Numeric vector of data to be tested.
#' @param alternative Character string specifying the alternative hypothesis,
#'   must be "two.sided", "less", or "greater".
#' @param mu Numeric input indicating the null hypothesis value of the mean.
#' @keywords inference
#'
#' @return A list with the numeric test statistic, degree of freedom,
#'   \code{alternative}, and the numeric p-value.
#'
#' @examples
#' my_t.test(1:10, alternative = "two.sided", mu = 5)
#' my_t.test(c(0, 0.5, -0.5, 0.2, 0), alternative = "less", mu = 0)
#'
#' @export
my_t.test <- function(x, alternative, mu) {
  df <- length(x) - 1
  std_err <- sd(x) / sqrt(length(x))
  test_stat <- (mean(x) - mu) / std_err
  abs_test_stat <- abs(test_stat)
  up_area <- pt(abs_test_stat, df, lower.tail = FALSE)

  if (alternative == "two.sided") {
    p_val <- up_area * 2
  } else if (alternative == "less") {
    p_val <- 1 - up_area
  } else if (alternative == "greater") {
    p_val <- up_area
  } else {
    stop("alternative should be 'two.sided', 'less', or 'greater'")
  }

  result <- list("test_stat" = test_stat,
                 "df" = df,
                 "alternative" = alternative,
                 "p_val" = p_val)
  return(result)
}
