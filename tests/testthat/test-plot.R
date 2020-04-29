context("Testing plot_geouy")

test_that("output is a ggplot", {
  secc <- load_geouy("Secciones")
  aaa <- plot_geouy(x = secc, col = "AREA")  
  expect_is(aaa, "ggplot")
})

test_that("Plot uses correct data", {
  secc <- load_geouy("Secciones")
  p <- plot_geouy(secc, col = "AREA")
  testthat::expect_equal(secc, p$data)
})
