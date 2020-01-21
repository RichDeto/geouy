context("Testing which_uy")
library(dplyr);library(sf)
test_that("crs parameter working", {
  a <- load_geouy("Peajes")
  b <- which_uy(a,"Departamentos")
  a1 <- sf::st_crs(b)
  expect_equal(a1[1], structure(list(epsg = 32721L), .Names = "epsg"))
  expect_is(b, "sf")
})