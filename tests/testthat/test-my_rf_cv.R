set.seed(302)

test_that("my_rf_cv works", {
  expect_equal(my_rf_cv(5), 33306.514)
  expect_equal(my_rf_cv(10), 33205.57)
})
