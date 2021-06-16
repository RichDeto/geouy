uy_deptos_grid <- data.frame(
  name = c("Artigas", "Rivera", "Salto", "Paysandu", "Tacuarembo", "Cerro Largo", "Durazno", "Rio Negro", "Treinta y Tres", "Flores", "Florida", "Lavalleja", "Soriano", "Rocha", "Canelones", "Colonia", "Maldonado", "San Jose", "Montevideo"),
  code = c(2, 13, 15, 11, 18, 4, 6, 12, 19, 7, 8, 9, 17, 14, 3, 5, 10, 16, 1),
  row = c(1, 2, 2, 3, 3, 4, 4, 4, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 7),
  col = c(2, 3, 2, 2, 3, 4, 3, 2, 5, 2, 3, 4, 1, 5, 3, 1, 4, 2, 3),
  stringsAsFactors = FALSE
)

usethis::use_data(uy_deptos_grid, overwrite = TRUE)
