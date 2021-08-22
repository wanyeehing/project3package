#' Random Forest Cross-Validation Function
#'
#' This function performs random forest cross validation.
#'
#' @param k Numeric input representing numbers of folds.
#'
#' @return Numeric indicating the cross-validation error.
#'
#' @examples
#' my_rf_cv(5)
#' my_rf_cv(10)
#'
#' @export
my_rf_cv <- function(k) {
  clean <- na.omit(palmerpenguins::penguins)
  fold <- sample(rep(1:k, length = nrow(clean)))
  mses <- c()

  for (i in 1:k) {
    train <- clean[fold != i, ]
    model <- randomForest::randomForest(body_mass_g ~ bill_length_mm +
                                        bill_depth_mm + flipper_length_mm,
                                        data = clean, ntree = 100)
    pred <- predict(model, clean[, -1])
    mses[i] <- sum((pred - clean$body_mass_g)^2 / nrow(clean))
  }

  ave_mse <- mean(mses)
  return(ave_mse)
}
