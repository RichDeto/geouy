context("Testing load_geouy")

test_that("connections working", {
  expect_is(load_geouy("Secciones"), "sf")
  expect_is(load_geouy("Rutas"), "sf")
  expect_is(load_geouy("Centros poblados pg"), "sf")
})

test_that("crs parameter working", {
  a <- load_geouy("Secciones", crs = 4326)
  a1 <- sf::st_crs(a)
  expect_equal(a1[1], structure(list(epsg = 4326L), .Names = "epsg"))
  a <- load_geouy("Secciones", crs = 32721)
  a1 <- sf::st_crs(a)
  expect_equal(a1[1], structure(list(epsg = 32721L), .Names = "epsg"))
})