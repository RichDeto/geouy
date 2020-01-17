test_that("connections working", {
  expect_is(load_geouy("Secciones"), "sf")
  expect_is(load_geouy("Rutas"), "sf")
  expect_is(load_geouy("Peajes"), "sf")
  expect_false(is.na(sf::st_crs(load_geouy("Secciones", crs = 4326))))
  # expect_equal(round(geocode_ide_uy(data.frame(cbind(dpto="Montevideo",
  #                                                    loc="Montevideo",
  #                                                    dir="Av. 18 de julio 1453"), 
  #                                              stringsAsFactors = F))[4], 0), -56)
})