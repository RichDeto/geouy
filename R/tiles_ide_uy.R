#' This function allows to Download .jpg or .tif files from the IDEuy tiles repository, according to a 'sf' object bbox.
#' @param x An 'sf' object with the same crs as the homonym parameter
#' @param format Format of the archives to download (avaiable: "jpg" and "tif") Default "jpg"
#' @param folder Folder where are the files or be download
#' @param urban If format is "tif", and urban default FALSE take orthophotos of national flight with 32cm per pixel, if TRUE take urban flight with 10cm per pixel (avaible only Montevideo at the moment)
#' @keywords IDE orthophotos Uruguay
#' @return raster::stack object with th cropped tif corresponding to x bbox
#' @importFrom sf st_join st_crs st_bbox st_transform
#' @importFrom dplyr filter %>% distinct
#' @importFrom methods is as
#' @importFrom stringr str_sub str_pad
#' @importFrom raster brick crop extent crs mosaic
#' @importFrom glue glue
#' @importFrom sp SpatialPolygons
#' @importFrom utils download.file
#' @importFrom rlang .data
#' @importFrom fs dir_ls
#' @import rgdal
#' @export
#' @examples
#'\donttest{
#' x_tiles <- tiles_ide_uy(x)
#'}

tiles_ide_uy <- function(x, format = "jpg", folder = tempdir(), urban = FALSE){
  # checks ----
  if (!is(x, "sf")) stop(glue::glue("The object {x} you want to process is not class sf"))
  if (!is.character(folder) | length(folder) != 1) stop("You must enter a valid directory...")
  if (!format %in% c("jpg", "tif")) stop("The format you want to download is not avaiable")
  # warnings ----
  if (length(fs::dir_ls(folder, regexp = glue::glue("\\.{format}$"))) != 0) {
    message(glue::glue("There are other .{format} files in the folder that will be read..."))
  }
  # download ----
  start_time <- Sys.time()
  try(dir.create(folder))
  crs = sf::st_crs(x) 
  bb = x %>% sf::st_transform(5382) %>% 
      sf::st_bbox() %>% as.vector() %>% 
      raster::extent() %>% as('SpatialPolygons')
  raster::crs(bb) <- "+proj=longlat +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +no_defs"
  if (urban == FALSE) {
    x2 <- geouy::load_geouy("Grilla ortofotos nacional", crs = 5381) %>% 
      sf::st_join(x %>% sf::st_transform(5381), left = F) %>% 
      dplyr::distinct(.data$nombre, .keep_all = TRUE)
    if (nrow(x2) == 0) stop(glue::glue("The geometry you have in {x} is not in Uruguay. Verify in the metadata file"))
  } else {
    x2 <- geouy::load_geouy("Grilla ortofotos urbana", crs = 5381) %>% 
      filter(.data$localidad == "Montevideo") %>% 
      sf::st_join(x %>% sf::st_transform(5381), left = F) %>% 
      mutate(nombre = as.character(.data$nombre)) %>% 
      dplyr::distinct(.data$nombre, .keep_all = TRUE)
    if (nrow(x2) == 0) stop(glue::glue("The geometry you have in {x} is not in Montevideo. Verify in the metadata file"))
  }
  
  # Para formato jpg ----
  if (format == "jpg") {
    if (urban == FALSE) {
      a <- glue::glue("https://visualizador.ide.uy/descargas/CN_Remesa_{stringr::str_pad(x2$remesa, 2, pad = '0')}/02_Ortoimagenes/03_RGB_8bits/{as.character(x2$nombre)}_RGB_8_Remesa_{stringr::str_pad(x2$remesa, 2, pad = '0')}")
    } else {
      a <- glue::glue("https://visualizador.ide.uy/descargas/CU_Remesa_{stringr::str_pad(x2$remesa, 2, pad = '0')}/02_Ortoimagenes/01_Ciudad_MVD/03_RGB_8bits/{as.character(x2$nombre)}_RGB_8_Remesa_{stringr::str_pad(x2$remesa, 2, pad = '0')}_MVD")
    }
    for (i in 1:length(a)) {
      if (!file.exists(a[i])) {
        message(glue::glue("Trying to download..."))
        try(utils::download.file(glue::glue("{a[i]}{c('.jpg','.jgw')}"), 
                                 glue::glue("{folder}//{basename(a[i])}{c('.jpg','.jgw')}"), 
                                 mode = "wb", method = "libcurl"))
      } 
    }
    # read brick
    ar <- fs::dir_ls(folder,  regexp = "\\.jpg$")
    ar <- ar[file.info(ar)$mtime > start_time]
  } 
  # Para formato tif ----
  if (format == "tif") {
    if (urban == FALSE) {
      a <- glue::glue("https://visualizador.ide.uy/descargas/CN_Remesa_{stringr::str_pad(x2$remesa, 2, pad = '0')}/02_Ortoimagenes/02_RGBI_8bits/{as.character(x2$nombre)}_RGBI_8_Remesa_{stringr::str_pad(x2$remesa, 2, pad = '0')}.tif")
    } else {
      a <- glue::glue("https://visualizador.ide.uy/descargas/CU_Remesa_{stringr::str_pad(x2$remesa, 2, pad = '0')}/02_Ortoimagenes/01_Ciudad_MVD/02_RGBI_8bits/{as.character(x2$nombre)}_RGBI_8_Remesa_{stringr::str_pad(x2$remesa, 2, pad = '0')}_MVD.tif")
    }
    for (i in 1:length(a)) {
      if (!file.exists(a[i])) {
        message(glue::glue("Trying to download..."))
        try(utils::download.file(a[i], glue::glue("{folder}//{basename(a[i])}"), mode = "wb", method = "libcurl"))
      } 
    }
    # read brick ----
    ar <- fs::dir_ls(folder, regexp = "\\.tif$")
    ar <- ar[file.info(ar)$mtime > start_time]
  } 
  # Return ----
  if (length(ar) == 1) {
    a3 <- raster::brick(ar)
    raster::crs(a3) <- "+proj=utm +zone=21 +south +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs"
    a3 <- a3 %>% raster::crop(bb) %>% 
      raster::projectRaster(crs = crs$proj4string)
  } else {
    rast.list <- list()
    for (i in 1:length(ar)) { rast.list[i] <- raster::brick(ar[i]) }
    # And then use do.call on the list of raster objects
    rast.list$fun <- mean
    a3 <- do.call(raster::mosaic, rast.list)
  }
  # raster::plotRGB(a3)
  return(a3)
}
