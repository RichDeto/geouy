#' load_geouy
#'
#' This function allows you to take a object "sf" from MIDES server.
#' @param capa Define the geometries to download: may be: "Dpto", "Secc", "Zone", etc. View(metadta) for details.
#' @param fuente Define the provider of the geometries
#' @param crs Define the Coordinate Reference Systems you want the output, default 32721
#' @keywords IDE MIDES INE
#' @importFrom magrittr %>%
#' @importFrom sf st_read st_transform
#' @export
#' @examples
#' secc <- load_geouy(capa = "Secciones", fuente = "INECenso")

load_geouy <- function(capa, fuente, crs = 32721){
st_read(paste0("https://mapas.mides.gub.uy/geoserver/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=",
                                    fuente, ":", capa), crs = 32721) %>%
                                     st_transform(crs)
}
