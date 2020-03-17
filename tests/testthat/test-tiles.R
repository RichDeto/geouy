context("Testing tiles")

test_that("test errors", {
  x0 <- data.frame(x = c(-56.14449, -56.13936), y = c(-34.805237, -34.806787))
  testthat::expect_error(tiles_ide_uy(x0)) 
  x <- sf::st_as_sf(x0, coords = c("x","y"), crs = 4326)
  testthat::expect_error(tiles_ide_uy(x, folder = 1))
  testthat::expect_error(tiles_ide_uy(x, folder = c("c://", "E://")))
  testthat::expect_error(tiles_ide_uy(x, format = "gtif"))
  x <- sf::st_as_sf(data.frame(x = c(--58.89550, -58.892143), y = c(-34.562668, -34.564435)), coords = c("x","y"), crs = 4326)
  testthat::expect_error(tiles_ide_uy(x, urban = TRUE))
  testthat::expect_error(tiles_ide_uy(x, urban = FALSE))
})

test_that("connection to IDE server for tif", {
  
  skip_on_cran() # "IDEuy response time takes too long for testing times"
  skip_on_appveyor()

  x <- sf::st_as_sf(data.frame(x = c(-56.14449, -56.14267), y = c(-34.805237, -34.80653)), coords = c("x","y"), crs = 4326)
  x_tiles <- tiles_ide_uy(x, format = "tif", urban = TRUE)
  testthat::expect_is(x_tiles, "RasterBrick")
})

test_that("connection to IDE server for jpg", {
  
  skip_on_cran() # "IDEuy response time takes too long for testing times"
  skip_on_appveyor()
  
  x <- sf::st_as_sf(data.frame(x = c(-56.14449, -56.14267), y = c(-34.805237, -34.80653)), coords = c("x","y"), crs = 4326)
  x_tiles <- tiles_ide_uy(x, format = "jpg", urban = TRUE)
  testthat::expect_is(x_tiles, "RasterBrick")
})
