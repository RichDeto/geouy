context("Testing load_geouy")

test_that("connections working", {
  
  skip_on_cran()
  
  testthat::expect_is(load_geouy("Secciones"), "sf")
  testthat::expect_is(load_geouy("Areas protegidas"), "sf")
  testthat::expect_is(load_geouy("Centros poblados pg"), "sf")
})

test_that("crs parameter working", {
  a <- load_geouy("Secciones", crs = 4326)
  a1 <- sf::st_crs(a)
  testthat::expect_equal(a1[1], structure(list(epsg = 4326L), .Names = "epsg"))
  a <- load_geouy("Secciones", crs = 32721)
  a1 <- sf::st_crs(a)
  testthat::expect_equal(a1[1], structure(list(epsg = 32721L), .Names = "epsg"))
})