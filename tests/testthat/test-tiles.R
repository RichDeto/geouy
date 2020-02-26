context("Testing tiles")

test_that("connection to IDE server working", {
  
  skip_on_cran() # "IDEuy response time takes too long for testing times"
  skip_on_appveyor()
  skip_on_travis()
  
  x <- sf::st_as_sf(data.frame(x = c(-56.14449, -56.13936), y = c(-34.805237, -34.806787)), coords = c("x","y"), crs = 4326)
  x_tiles <- tiles_ide_uy(x)
  testthat::expect_is(x_tiles, "RasterBrick")
})