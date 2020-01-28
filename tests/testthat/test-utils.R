context("Testing which_uy")
library(dplyr);library(sf)
test_that("crs parameter working", {
  a <- load_geouy("Peajes")
  testthat::expect_error(is.uy4326(a))
  testthat::expect_equal(is.uy32721(a), "Your object have 100% of matches with Ururguay CRS 32721" )
  b <- load_geouy("Peajes", 4326)
  testthat::expect_equal(is.uy4326(b), "Your object have 100% of matches with Ururguay CRS 4326" )
})