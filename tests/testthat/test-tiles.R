context("Testing tiles")

test_that("connection to IDE server working", {
  
  skip_on_cran() # "IDEuy response time takes too long for testing times"
  skip_on_appveyor()
  skip_on_travis()
  
  x <- data.frame(cbind(dpto = "Montevideo",
                        loc = "Montevideo",
                        dir = "Av. 18 de julio 1453"),
                  stringsAsFactors = F)
  x1 <- sf::st_as_sf(geouy::geocode_ide_uy(x), coords = c("x","y"))
  x_tiles <- geouy::tiles_ide_uy(x1)
  expect_is(x_tiles, "stack")
})