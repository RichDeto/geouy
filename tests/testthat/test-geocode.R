context("Testing geocode")

test_that("connection to IDE server working to geocoding", {
  skip_if_offline()
  skip_on_cran() # "IDEuy response time takes too long for testing times"
  
  x <- data.frame(cbind(dpto = "Montevideo", loc = "Montevideo", dir = "Av. 18 de julio 1453"), stringsAsFactors = F)
  x1 <- geocode_ide_uy(x)
  testthat::expect_is(x1, "data.frame")
  testthat::expect_equal(ncol(x1), 5)
  x2 <- geocode_ide_uy(x, details = T)
  testthat::expect_is(x2, "data.frame")
  testthat::expect_equal(ncol(x2), 7)
  # testthat::expect_equal(x1[4], structure(list(x = -56.184901), .Names = "x", row.names = c(NA, -1L), class = "data.frame"))
  # testthat::expect_equal(x1[4], structure(list(x = NA_real_), row.names = c(NA, -1L), class = "data.frame"))
  # testthat::expect_equal(x1[5], structure(list(y = -34.905193), .Names = "y", row.names = c(NA, -1L), class = "data.frame"))
  # testthat::expect_equal(x1[5], structure(list(x = NA_real_), row.names = c(NA, -1L), class = "data.frame"))
})

test_that("connection to IDE server working to reverse geocoding", {
  skip_if_offline()
  skip_on_cran() # "IDEuy response time takes too long for testing times"
  
  x <- data.frame(cbind(lat = -34.77882, lon = -56.06476))
  x1 <- reverse_ide_uy(x)
  
  testthat::expect_is(x1, "data.frame")
  testthat::expect_equal(ncol(x1), 13)
  x2 <- reverse_ide_uy(x, details = T)
  testthat::expect_is(x2, "data.frame")
  testthat::expect_equal(ncol(x2), 23)
 })
