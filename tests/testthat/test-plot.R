context("Testing plot_geouy")
library(ech)
test_that("output is a ggplot", {
  skip_if_offline()
  
  secc <- load_geouy("Secciones")
  aaa <- plot_geouy(x = secc, col = "AREA")  
  testthat::expect_is(aaa, "ggplot")
  aaa <- plot_geouy(x = secc, col = "AREA", l = "%")  
  testthat::expect_is(aaa, "ggplot")
  aaa <- plot_geouy(x = secc, col = "AREA", l = "n")  
  testthat::expect_is(aaa, "ggplot")
  aaa <- plot_geouy(x = secc, col = "AREA", l = "c", other_lab = "CODSEC")  
  testthat::expect_is(aaa, "ggplot")
  expect_error(plot_geouy(x = secc, col = "AREA", l = "c", other_lab = "zapallitos"))
  
  pobre_x_dpto <- ech::get_estimation_mean(data = ech::toy_ech_2018, variable = "pobre06",
                                           by.x = "nomdpto", level = "h", name = "Pobreza") %>%
    dplyr::filter(pobre06 == "Pobre")
  pobre_x_dpto_geo <- ech::add_geom(data = pobre_x_dpto, unit = "Departamentos", variable = "nomdpto")
  aaa <- plot_geouy(x = pobre_x_dpto_geo, col = "Pobreza", l = "%")
  testthat::expect_is(aaa, "ggplot")
})

test_that("Plot uses correct data", {
  skip_if_offline()
  
  secc <- load_geouy("Secciones")
  p <- plot_geouy(secc, col = "AREA")
  testthat::expect_equal(secc, p$data)
})
