#' This function allows you to take a object "sf" from MIDES server.
#' @param c Define the geometries to download: may be: "Departamentos", "Secciones", "Zonas", etc. View(metadata) for details.
#' @param crs Define the Coordinate Reference Systems you want the output, default 32721
#' @keywords IDE MIDES INE
#' @importFrom sf st_read st_transform
#' @importFrom dplyr filter %>%
#' @export
#' @examples
#'\dontrun{
#' secc <- load_geouy(c = "Secciones")
#'}

load_geouy <- function(c, crs = 32721){
  x <- geouy::metadata 
  try(if (!c %in% x$capa) stop("The name of the geometry you will load is not correct. Verify in the metadata file"))
  x <- x[x$capa == c,]
  if (x$repositor %in% "SGM") {
    a <- st_read("WFS:http://geoservicios.sgm.gub.uy/wfsPCN1000.cgi?",x$url, crs = x$crs)
  } else {
    a <- st_read(x$url, crs = x$crs) 
  }
  a <- a %>% st_transform(crs)
  return(a)
}
