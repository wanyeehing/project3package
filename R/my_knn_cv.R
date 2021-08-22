#' k-Nearest Neighbors Cross-Validation Function
#'
#' This function performs k-nearest neighbors cross-validation.
#'
#' @param train Input data frame to be trained.
#' @param cl Vector of true class value of the training data.
#' @param k_nn Numeric input representing number of neighbors.
#' @param k_cv Numeric input representing number of folds.
#' @keywords prediction
#'
#' @return A list with a vector of the predicted class and cross-validation
#'   misclassification error.
#'
#' @examples
#' train <- rbind(iris3[, , 1], iris3[, , 2], iris3[, , 3])
#' cl <- factor(c(rep("s", 50), rep("c", 50), rep("v", 50)))
#' my_knn_cv(train, cl, k_nn = 1, k_cv = 5)
#' my_knn_cv(train, cl, k_nn = 5, k_cv = 5)
#'
#' @export
my_knn_cv <- function(train, cl, k_nn, k_cv) {
  fold <- sample(rep(1:k_cv, length = nrow(train)))
  mis_rate <- c()

  for (i in 1:k_cv) {
    knn_trn <- train[fold != i, ]
    knn_tst <- train[fold == i, ]
    knn_cl <- cl[fold != i]
    knn_result <- class::knn(train = knn_trn, test = knn_tst, cl = knn_cl, k = k_nn)
    mis_rate[i] <- mean(cl[fold == i] != knn_result)
  }

  class <- class::knn(train = train, test = train, cl = cl, k = k_nn)
  cv_err <- mean(mis_rate)
  result <- list("class" = class, "cv_err" = cv_err)
  return(result)
}
