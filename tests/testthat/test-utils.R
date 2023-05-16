context("Testing utils")

testthat::test_that("crs parameter working", {
  skip_if_offline()

  a <- load_geouy("Peajes")
  testthat::expect_equal(is.uy4326(a), "The object you want to process is not at CRS 4326")
  testthat::expect_equal(is.uy32721(a), "Your object have 100% of matches with Ururguay CRS 32721")
  b <- load_geouy("Peajes", 4326)
  testthat::expect_equal(is.uy32721(b), "The object you want to process is not at CRS 32721")
  testthat::expect_equal(is.uy4326(b), "Your object have 100% of matches with Ururguay CRS 4326")
  c <- load_geouy("Peajes", 5381)
  testthat::expect_equal(is.uy5382(c), "The object you want to process is not at CRS 5382")
  testthat::expect_equal(is.uy5381(c), "Your object have 100% of matches with Ururguay CRS 5381")
  d <- load_geouy("Peajes", 5382)
  testthat::expect_equal(is.uy5381(d), "The object you want to process is not at CRS 5381")
  testthat::expect_equal(is.uy5382(d), "Your object have 100% of matches with Ururguay CRS 5382")
})

testthat::test_that("crs parameter working", {

  a <- data.frame(x = c(-56.14449, -56.13936), y = c(-34.805237, -34.806787))
  testthat::expect_error(is.uy4326(a))
  testthat::expect_error(is.uy5381(a))
  testthat::expect_error(is.uy5382(a))
  testthat::expect_error(is.uy32721(a))
})
