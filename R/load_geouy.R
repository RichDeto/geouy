#' load_geouy
#'
#' This function allows you to take a object "sf" from MIDES server.
#' @param c Define the geometries to download: may be: "Departamentos", "Secciones", "Zonas", etc. View(metadta) for details.
#' @param crs Define the Coordinate Reference Systems you want the output, default 32721
#' @keywords IDE MIDES INE
#' @importFrom magrittr %>%
#' @importFrom sf st_read st_transform
#' @importFrom dplyr filter
#' @export
#' @examples
#' secc <- load_geouy(c = "Secciones")

load_geouy <- function(c, crs = 32721){
        x <- geouy::metadata %>%
                filter(capa == c)
        st_read(x$url[1], crs = x$crs[1]) %>%
                st_transform(crs)
}
