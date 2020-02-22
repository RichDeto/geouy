context("Testing tiles")

test_that("connection to IDE server working", {
  
  skip_on_cran() # "IDEuy response time takes too long for testing times"
  skip_on_appveyor()
  
  x1 <- sf::st_as_sf(data.frame(x = -55.184901, y = -34.905193), coords = c("x","y"), crs = 4326)
  x_tiles <- tiles_ide_uy(x1)
  expect_is(x_tiles, "stack")
})