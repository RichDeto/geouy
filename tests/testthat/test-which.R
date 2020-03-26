context("Testing which_uy")
library(dplyr);library(sf)
test_that("crs parameter working", {
  
  skip_on_cran()
  
  a <- load_geouy("Peajes")
  b <- which_uy(a,"Departamentos")
  c <- which_uy(b,"Secciones", d = c("full"))
  a1 <- sf::st_crs(b)
  testthat::expect_equal(a1[1], list(input = "EPSG:32721"))
  testthat::expect_is(b, "sf")
  testthat::expect_equal(names(c), c("gml_id", "nombre", "operador", "depto", "cod_Departamentos", 
                           "name_Departamentos", "full_Secciones", "AREA", "PERIMETER", 
                           "DEPTO", "SECCION", "CODSEC", "NOMBDEPTO", "CDEPTO_ISO", "geom"))
})