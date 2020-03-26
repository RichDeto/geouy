context("Testing load_geouy")

test_that("connections working", {
  
  skip_on_cran()
  
  testthat::expect_is(load_geouy("Secciones"), "sf")
  testthat::expect_is(load_geouy("Playas"), "sf")
  testthat::expect_is(load_geouy("Centros poblados pg"), "sf")
})

test_that("crs parameter working", {
  
  testthat::expect_error(load_geouy("Playas", folder = 1))
  testthat::expect_error(load_geouy("Playas", folder = c("c://", "E://")))
  
  a <- load_geouy("Secciones", crs = 4326)
  a1 <- sf::st_crs(a)
  testthat::expect_equal(a1[1], list(input = "EPSG:4326"))
  a <- load_geouy("Secciones", crs = 32721)
  a1 <- sf::st_crs(a)
  testthat::expect_equal(a1[1], list(input = "EPSG:32721"))
  })