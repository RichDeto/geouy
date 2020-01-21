#' This function allows to add to an "sf" object its spatial coincidence with one or more administrative units in Uruguay, generating the corresponding variables.
#' @param x An sf object with the same crs as the homonym parameter
#' @param c Define the geometries to download: may be: "Departamentos", "Secciones", "Zonas", etc. View(metadata) for details.
#' @param d Determines the variables to be added, with three options: "cod", "name", or "both". Default "both".
#' @keywords IDE MIDES INE
#' @importFrom sf st_read st_transform st_join st_crs
#' @importFrom dplyr filter %>% select
#' @importFrom methods is
#' @export
#' @examples
#'\dontrun{
#' x <- which_uy(x, c = "Localidades_pg")
#'}

which_uy <- function(x, c = c("Localidades_pg", "Departamentos"), d = c("cod", "name")){
  md <- geouy::metadata 
  try(if (!is(x, "sf")) stop("The object you want to process is not class sf"))
  try(if (sum(!c %in% md$capa) > 0) stop("The name of the geometry you will load is not correct. Verify in the metadata file"))
  crs = st_crs(x)
  md <- md[md$capa %in% c,]
  for (i in c) {
    y <- geouy::load_geouy(i, crs = crs)
    md2 <- md %>% 
      filter(capa == i) %>% 
      select(d)
    y2 <- y %>% select(as.character(md2))
    for (j in 1:length(d)) {
      names(y2)[j] <- paste0(d[j], "_", i)
    }
    x <- st_join(x, y2)
  }
  return(x)
}
