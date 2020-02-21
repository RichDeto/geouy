#' This function allows to Download .tif files from the IDEuy orthophotos repository, according to a 'sf' object bbox.
#' @param x An 'sf' object with the same crs as the homonym parameter
#' @keywords IDE orthophotos Uruguay
#' @return raster::stack object with th cropped tif corresponding to x bbox
#' @importFrom sf st_join st_crs st_bbox
#' @importFrom dplyr filter %>%
#' @importFrom methods is
#' @importFrom stringr str_sub str_pad
#' @importFrom raster stack crop
#' @export
#' @examples
#'\donttest{
#' x_tiles <- tiles_ide_uy(x)
#'}

tiles_ide_uy <- function(x){
  try(if (!is(x, "sf")) stop("The object you want to process is not class sf"))
  crs = sf::st_crs(x)
  bb = sf::st_bbox(x) 
  y <- geouy::load_geouy("Grilla ortofotos nacional", crs = crs)
  y$geometry <- NULL
  x2 <- sf::st_join(x, y) 
  a <- raster::stack(paste0("https://visualizador.ide.uy/descargas/CN_Remesa_",
                            stringr::str_pad(x2$remesa, 2, pad = "0"),
                            "/02_Ortoimagenes/02_RGBI_8bits/", 
                            as.character(x2$nombre) ,"_RGBI_8_Remesa_",
                            stringr::str_pad(x2$remesa, 2, pad = "0"),".tif")) %>% 
    raster::crop(bb)
  return(a)
}