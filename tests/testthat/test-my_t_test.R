set.seed(302)
x <- rnorm(10, mean = 0, sd = 1)

test_that("my_t.test works", {
  expect_equal(my_t.test(x, alternative = "greater", mu = 0)$test_stat,
               0.9847168)
  expect_equal(my_t.test(x, alternative = "two.sided", mu = 0)$df, 9)
  expect_equal(my_t.test(x, alternative = "greater", mu = 0)$p_val, 0.175246834)
  expect_match(my_t.test(x, alternative = "less", mu = 0)$alternative, "less")
})

test_that("incorrect input throws error", {
  expect_error(my_t.test(x, alternative = "great", mu = 0))
  expect_error(my_t.test(x, alternative = 8, mu = 0))
  expect_error(my_t.test(x, alternative = 8, mu = "string"))
})
