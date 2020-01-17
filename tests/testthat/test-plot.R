context("Testing plot_geouy")

test_that("output is a ggplot", {
  secc <- load_geouy("Secciones")
  aaa <- plot_geouy(x = secc, a = "AREA")  
  expect_is(aaa, "ggplot")
})

test_that("Plot uses correct data", {
  secc <- load_geouy("Secciones")
  p <- plot_geouy(secc)
  expect_that(secc, equals(p$data))
})
