context("Testing utils")
library(dplyr);library(sf)
testthat::test_that("crs parameter working", {
  
  testthat::skip_on_cran()
  
  a <- load_geouy("Peajes")
  testthat::expect_error(is.uy4326(a))
  testthat::expect_equal(is.uy32721(a), "Your object have 100% of matches with Ururguay CRS 32721")
  b <- load_geouy("Peajes", 4326)
  testthat::expect_error(is.uy32721(b))
  testthat::expect_equal(is.uy4326(b), "Your object have 100% of matches with Ururguay CRS 4326")
  c <- load_geouy("Peajes", 5381)
  testthat::expect_error(is.uy5382(c))
  testthat::expect_equal(is.uy5381(c), "Your object have 100% of matches with Ururguay CRS 5381")
  d <- load_geouy("Peajes", 5382)
  testthat::expect_error(is.uy5381(d))
  testthat::expect_equal(is.uy5382(d), "Your object have 100% of matches with Ururguay CRS 5382")
})

testthat::test_that("crs parameter working", {
  
  testthat::skip_on_cran()
  
  a <- data.frame(x = c(-56.14449, -56.13936), y = c(-34.805237, -34.806787))
  testthat::expect_error(is.uy4326(a))
  testthat::expect_error(is.uy5381(a))
  testthat::expect_error(is.uy5382(a))
  testthat::expect_error(is.uy32721(a))
})
