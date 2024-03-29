#' This function allows you to add a geom variable with a code variable of "zona", "barrio", "localidad", "segmentos", "secciones" or "departamentos".
#' @family service
#' @param data data.frame
#' @param unit spatial unit of data, may be: "Departamentos", "Secciones", "Secc MVD 2004", "Segmentos", "Segm MVD 2004", "Segm URB INT 2004", "Zonas", "Zonas MVD 2004", "Zonas URB INT 2004", "Localidades pg", "Municipios" o "Barrios".
#' @param variable Variable name of unit code (without duplicates)
#' @param crs Coordinates Refence Sistem, usually in region 32721 or 4326 (default 32721)
#' @importFrom glue glue
#' @importFrom rlang .data
#' @importFrom dplyr left_join select rename mutate
#' @return data.frame
#' @details
#' Disclaimer: This script is not an official INE product.
#' Aviso: El script no es un producto oficial de INE.
#' @export
#' @examples
#' \donttest{
#' pobre_x_dpto <- as.data.frame(cbind(nomdpto = c("ARTIGAS", "DURAZNO", "FLORIDA", "LAVALLEJA"),
#'                Pobreza = c(0.26, 0.27, 0.07, 0.10)))
#' pobre_x_dpto_geo <- add_geom(data = pobre_x_dpto, unit = "Deptos", variable = "nomdpto")
#' }

add_geom <- function(data, unit, variable, crs = 32721){
  
  # checks ---
  assertthat::assert_that(is.data.frame(data))
  assertthat::assert_that(unit  %in% c("Departamentos", "Deptos", "Secciones", "Secc MVD 2004", "Segmentos", "Segm MVD 2004", "Segm URB INT 2004", "Zonas",
                                       "Zonas MVD 2004", "Zonas URB INT 2004", "Localidades pg", "Municipios", "Barrios"),
                          msg =  glue::glue("Sorry... :( \n {unit} is not a valid value"))
  assertthat::assert_that(variable  %in% names(data), msg =  glue::glue("Sorry... :( \n {variable} is not in data"))
  assertthat::assert_that(sum(duplicated(data[,variable])) == 0, msg =  glue::glue("Sorry... :( \n {variable} in data have duplicated values"))
  
  g <- geouy::load_geouy(unit, crs)
  md <- geouy::metadata
  
  if (is.character(data[[variable]])) {
    name <- as.character(md[md$capa == unit, "name"])
    g2 <- g %>% dplyr::select(all_of(name)) %>%
      dplyr::rename("link" = name) %>% 
      dplyr::mutate(link = as.character(link))
    data <- dplyr::left_join(g2, data, by = c("link" = variable))
  } else {
    cod <- as.character(md[md$capa == unit, "cod"])
    g2 <- g %>% dplyr::select(all_of(cod)) %>%
      dplyr::rename("link" = cod) %>% 
      dplyr::mutate(link = as.numeric(link))
    data <- dplyr::left_join(g2, data %>% 
                               mutate(link = as.numeric(!!!rlang::syms(variable))), by = "link")
  }
  return(data)
}
