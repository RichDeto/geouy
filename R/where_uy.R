#' This function return an 'sf' object with the geometry of the consult id or group of ids, of an administrative units in Uruguay.
#' @family service
#' @param c Define the geometries to consult: may be: "Departamentos", "Secciones", "Zonas", etc. View(metadata) for details.
#' @param d A vector who determines the ids to identify.
#' @param crs Define the Coordinate Reference Systems you want the output, default 32721
#' @keywords IDE MIDES INE
#' @return sf object with the geometries of the d ids
#' @export
#' @examples
#'\donttest{
#' x <- where_uy(c = "Localidades pg", d = c(1220, 2220))
#'}

where_uy <- function(c = "Localidades pg", d, crs = 32721) {
  md <- geouy::metadata 
  try(if (sum(!c %in% md$capa) > 0) stop("The name of the geometry you will load is not correct. Verify in the metadata file"))
  md <- md[md$capa %in% c,]
  a <- md$cod
  y <- geouy::load_geouy(c, crs = crs) %>% dplyr::filter(dplyr::pull(., a) %in% d)
}
