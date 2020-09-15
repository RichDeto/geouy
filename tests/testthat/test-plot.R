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
  expect_error(plot_geouy(x = secc, col = "AREA", l = "c", other_lab = "zapallitos"))
  
  pobre_x_dpto <- structure(list(nomdpto = c("ARTIGAS", "DURAZNO", "FLORIDA", "LAVALLEJA", "MONTEVIDEO", "PAYSANDU", "SALTO"), 
                                 pobre06 = structure(c(2L, 2L, 2L, 2L, 2L, 2L, 2L), .Label = c("No pobre", "Pobre"), class = "factor"), 
                                 Pobreza = c(0.260606060606061, 0.272321428571429, 0.0732394366197183, 0.102941176470588, 
                                             0.0604369319087865, 0.158753709198813,  0.0578947368421053), 
                                 Pobreza_low = c(0.00872869058521952, -0.042928893532206, -0.0285853469112693, -0.0946580157678766, 
                                                 0.0240723543052465, -0.00765653985953355, -0.0520862449504485), 
                                 Pobreza_upp = c(0.512483430626902, 0.587571750675063, 0.175064220150706, 0.300540368709053, 
                                                 0.0968015095123264, 0.32516395825716, 0.167875718634659)), 
                            row.names = c(NA, -7L), 
                            groups = structure(list(nomdpto = c("ARTIGAS", "DURAZNO", "FLORIDA", 
                                                                "LAVALLEJA", "MONTEVIDEO", "PAYSANDU", "SALTO"), 
                                                    .rows = structure(list( 1L, 2L, 3L, 4L, 5L, 6L, 7L), 
                                                                      ptype = integer(0), 
                                                                      class = c("vctrs_list_of","vctrs_vctr", "list"))), 
                                               row.names = c(NA, -7L), class = c("tbl_df", "tbl", "data.frame"), 
                                               .drop = TRUE), class = c("grouped_df", "tbl_df", "tbl", "data.frame"))
  pobre_x_dpto_geo <- add_geom(data = pobre_x_dpto, unit = "Departamentos", variable = "nomdpto")
  aaa <- plot_geouy(x = pobre_x_dpto_geo, col = "Pobreza", l = "%")
  testthat::expect_is(aaa, "ggplot")
})

test_that("Plot uses correct data", {
  skip_if_offline()
  
  secc <- load_geouy("Secciones")
  p <- plot_geouy(secc, col = "AREA")
  testthat::expect_equal(secc, p$data)
})
