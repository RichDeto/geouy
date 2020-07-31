context("Testing plot_geouy")

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
})

test_that("Plot uses correct data", {
  skip_if_offline()
  
  secc <- load_geouy("Secciones")
  p <- plot_geouy(secc, col = "AREA")
  testthat::expect_equal(secc, p$data)
})
