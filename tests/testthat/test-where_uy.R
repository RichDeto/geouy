test_that("multiplication works", {
  expect_equal(nrow(where_uy(c = "Localidades pg", d = "cod", e = 2220)), 1)
  expect_warning(where_uy(c = "Localidades pg", d = "cod", e = c(1220, 2220)))
  expect_warning(expect_error(where_uy(c = "Localidades pg", d = "cod", e = "c")))
  expect_error(where_uy(c = "Localidades pg", d = "name", e = 1))
  expect_equal(nrow(where_uy(c = "Peajes", d = "name", e = "Pando")), 1)
  expect_error(where_uy(c = "Localidades pg", d = "cod", e = 1220))
})