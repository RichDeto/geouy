#' This function allows to add to an 'sf' object its spatial coincidence with one or more administrative units in Uruguay, generating the corresponding variables.
#' @family service
#' @param x An 'sf' object with the same crs as the homonym parameter
#' @param c Define the geometries to download: may be: "Departamentos", "Secciones", "Zonas", etc. View(metadata) for details.
#' @param d A vector who determines the variables to be added, with three options: "cod", "name", or "full". Default c("cod", "name").
#' @keywords IDE MIDES INE
#' @return sf object with the x geometries, with d variables requested from c added
#' @export
#' @examples
#'\donttest{
#' x <- load_geouy("Peajes")
#' x1 <- which_uy(x, c = "Deptos")
#'}

which_uy <- function(x, c = c("Localidades pg", "Departamentos"), d = c("cod", "name")){
  md <- geouy::metadata 
  try(if (!methods::is(x, "sf")) stop("The object you want to process is not class sf"))
  try(if (sum(!c %in% md$capa) > 0) stop("The name of the geometry you will load is not correct. Verify in the metadata file"))
  crs = sf::st_crs(x)
  md <- md[md$capa %in% c,]
  for (i in c) {
    y <- geouy::load_geouy(i, crs = crs)
    if (!any("full" %in% d)) {
      md2 <- md %>% 
      dplyr::filter(.data$capa == i) %>% 
      dplyr::select(tidyselect::all_of(d))
      y2 <- y %>% dplyr::select(as.character(md2))
    }  else {
      md2 <- md %>% 
        dplyr::filter(.data$capa == i)
      y2 <- y 
    }
    for (j in 1:length(d)) {
      names(y2)[j] <- paste0(d[j], "_", i)
    }
    # y2$geometry <- NULL
    x <- sf::st_join(x, y2)
  }
  return(x)
}
