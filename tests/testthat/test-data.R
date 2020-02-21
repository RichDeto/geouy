context("Testing metadata")

test_that("structure it´s OK", {
  
  skip_on_cran()
  
  x <- geouy::metadata
  expect_equal(ncol(x), 9)
  expect_is(x$capa, "character")
  expect_is(x$productor, "character")
  expect_is(x$repositor, "character")
  expect_is(x$crs, "numeric")
  expect_is(x$formato, "character")
  expect_is(x$anio, "numeric")
  expect_is(x$url, "character")
})

test_that("crs are normal", {
  
  skip_on_cran()
  
  x <- geouy::metadata
  expect_equal(length(unique(x$crs)), 2)
})