context("Testing geocode")

test_that("connection to IDE server working", {
  x <- data.frame(cbind(dpto = "Montevideo",
                        loc = "Montevideo",
                        dir = "Av. 18 de julio 1453"),
                  stringsAsFactors = F)
  x1 <- geocode_ide_uy(x)
  expect_equal(x1[4], structure(list(x = -56.184901), .Names = "x", row.names = c(NA, -1L), class = "data.frame"))
  expect_equal(x1[5], structure(list(y = -34.905193), .Names = "y", row.names = c(NA, -1L), class = "data.frame"))
})
