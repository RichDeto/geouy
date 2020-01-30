context("Testing which_uy")
library(dplyr);library(sf)
test_that("crs parameter working", {
  a <- load_geouy("Peajes")
  b <- which_uy(a,"Departamentos")
  c <- which_uy(b,"Secciones", d = c("full"))
  a1 <- sf::st_crs(b)
  expect_equal(a1[1], structure(list(epsg = 32721L), .Names = "epsg"))
  expect_is(b, "sf")
  expect_equal(names(c), c("gml_id", "nombre", "operador", "depto", "cod_Departamentos", 
                           "name_Departamentos", "full_Secciones", "AREA", "PERIMETER", 
                           "DEPTO", "SECCION", "CODSEC", "NOMBDEPTO", "CDEPTO_ISO", "geom"))
})