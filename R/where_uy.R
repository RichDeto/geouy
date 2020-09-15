#' This function return an 'sf' object with the geometry of the consult id or group of ids, of an administrative units in Uruguay.
#' @family service
#' @param c Define the geometries to consult: may be: "Departamentos", "Secciones", "Zonas", etc. View(metadata) for details.
#' @param d A vector who determines the variables to be consult, with two options: "cod" or "name". Default "cod".
#' @param e A vector who determines the ids or names to identify.
#' @param crs Define the Coordinate Reference Systems you want the output, default 32721
#' @keywords IDE MIDES INE
#' @return sf object with the geometries of the d ids
#' @export
#' @examples
#'\donttest{
#' x <- where_uy(c = "Localidades pg", d = "cod", e = c(1120, 2220))
#'}

where_uy <- function(c = "Localidades pg", d = "cod", e, crs = 32721) {
  if (is.character(e) & d %in% "cod") {
    e <- as.numeric(e)
    if (is.na(e)) stop(glue::glue("The elements in {e} are all character, and for being {d} may be numeric"))
  }
  if (is.numeric(e) & d %in% "name") stop(glue::glue("The elements in {e} are numeric, and for being {d} may be character"))  
  md <- geouy::metadata 
  try(if (sum(!c %in% md$capa) > 0) stop("The name of the geometry you will load is not correct. Verify in the metadata file"))
  md <- md[md$capa %in% c,]
  a <- ifelse(d %in% "cod", md$cod, md$name)
  try(if(is.na(a)) stop(glue::glue("The layer {c} have not still a variable {d}, Please make an issue to suggest changes.")))
  y <- geouy::load_geouy(c, crs = crs) %>% dplyr::filter(dplyr::pull(., a) %in% e)
  if(nrow(y) == 0) stop("Sorry, your consult has not matches, verify ids")
  if(nrow(y) < length(e)) warning(glue::glue("Your consult has less matches than elements in {e}, verify filter"))
  return(y)
}
