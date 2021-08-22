library(class)
train <- rbind(iris3[, , 1], iris3[, , 2], iris3[, , 3])
cl <- factor(c(rep("s", 50), rep("c", 50), rep("v", 50)))

test_that("my_knn_cv works", {
  expect_type(my_knn_cv(train, cl, k_nn = 1, k_cv = 5)$class, "integer")
  expect_type(my_knn_cv(train, cl, k_nn = 1, k_cv = 5)$cv_err, "double")
})

test_that("incorrect input throws error", {
  expect_error(my_knn_cv(train, cl, k_nn = "string", k_cv = 5))
})
