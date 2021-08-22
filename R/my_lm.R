#' Linear Model Function
#'
#' This function fits a linear model.
#'
#' @param formula A formula class object.
#' @param data Input data frame.
#' @keywords inference
#'
#' @return A table containing the estimate, standard error, t value,
#'   and Pr(>|t|).
#'
#' @examples
#' my_lm(formula = mpg ~ hp + wt, data = mtcars)
#' my_lm(formula = mpg ~ hp * wt, data = mtcars)
#'
#' @importFrom stats model.frame model.matrix model.response predict pt sd
#'   na.omit
#'
#' @export
my_lm <- function(formula, data) {
  mdl_mat <- model.matrix(formula, data)
  mdl_frame <- model.frame(formula, data)
  mdl_res <- model.response(mdl_frame)
  trans_mat <- t(mdl_mat)
  estimate <- solve(trans_mat %*% mdl_mat) %*% trans_mat %*% mdl_res
  df <- nrow(mdl_mat) - ncol(mdl_mat)
  sigma_sqr <- sum((mdl_res - (mdl_mat %*% estimate))^2 / df)
  std_err <- sqrt(diag((sigma_sqr * solve(trans_mat %*% mdl_mat))))
  test_stat <- estimate / std_err
  upper_area <- pt(abs(test_stat), df, lower.tail = FALSE)
  total_area <- upper_area * 2
  result_mat <- cbind(estimate, std_err, test_stat, total_area)
  colnames(result_mat) <- c("Estimate", "Std. Error", "t value", "Pr(>|t|)")
  return(result_mat)
}
