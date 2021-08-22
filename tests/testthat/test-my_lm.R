test_that("my_lm works", {
  expect_equal(my_lm(mpg ~ hp + wt, data = mtcars)[1, 1], 37.22727012)
  expect_equal(my_lm(mpg ~ hp + wt, data = mtcars)[2, 2], 0.0090297097)
  expect_equal(my_lm(mpg ~ hp + wt, data = mtcars)[3, 3], -6.1286952)
  expect_equal(my_lm(mpg ~ hp + wt, data = mtcars)[2, 4], 1.45122853e-03)
})

test_that("incorrect input throws error", {
  expect_error(my_lm("string", data = mtcars))
  expect_error(my_lm(mpg ~ hp + wt, data = "string"))
})
