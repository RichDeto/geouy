#' This function allows to Download .jpg or .tif files from the IDEuy tiles repository, according to a 'sf' object bbox.
#' @param x An 'sf' object with the same crs as the homonym parameter
#' @param format Format of the archives to download (avaiable: "jpg" and "tif") Default "jpg"
#' @param folder Folder where are the files or be download
#' @param urban If format is "tif", and urban default FALSE take orthophotos of national flight with 32cm per pixel, if TRUE take urban flight with 10cm per pixel (avaible only Montevideo at the moment)
#' @keywords IDE orthophotos Uruguay
#' @return A object of class raster::RasterBrick with the cropped .jpg or .tif corresponding to x bbox
#' @importFrom sf st_join st_crs st_bbox st_transform
#' @importFrom dplyr filter %>% distinct
#' @importFrom methods is as
#' @importFrom stringr str_sub str_pad
#' @importFrom raster brick extent crop crs
#' @importFrom glue glue
#' @importFrom sp SpatialPolygons
#' @importFrom utils download.file
#' @importFrom rlang .data
#' @importFrom fs dir_ls
#' @import rgdal
#' @export
#' @examples
#'\donttest{
#' hom <- data.frame(x = c(-56.14449, -56.14267), y = c(-34.805237, -34.80653))
#' hom2 <- sf::st_as_sf(hom, coords = c("x","y"), crs = 4326)
#' x_tiles <- tiles_ide_uy(x = hom2, format = "jpg", urban = TRUE)
#'}

tiles_ide_uy <- function(x, format = "jpg", folder = tempdir(), urban = FALSE){
  # checks ----
  if (!is(x, "sf")) stop(glue::glue("The object {x} you want to process is not class sf"))
  if (!is.character(folder) | length(folder) != 1) stop("You must enter a valid directory...")
  if (!format %in% c("jpg", "tif")) stop("The format you want to download is not avaiable")

  # download ----
  start_time <- Sys.time()
  try(dir.create(folder))
  crs_x = sf::st_crs(x) 
  bb = x %>% sf::st_transform(5382) %>% 
      sf::st_bbox() %>% as.vector() %>% 
      raster::extent() %>% as('SpatialPolygons')
  if (urban == FALSE) {
    x2 <- geouy::load_geouy("Grilla ortofotos nacional", crs = crs_x) %>% 
      sf::st_join(x, left = F) %>% dplyr::distinct(.data$nombre, .keep_all = TRUE)
    if (nrow(x2) == 0) stop(glue::glue("The geometry you have in {x} is not in Uruguay. Verify in the metadata file"))
  } else {
    x2 <- geouy::load_geouy("Grilla ortofotos urbana", crs = crs_x) %>% 
      filter(.data$localidad == "Montevideo") %>% 
      sf::st_join(x, left = F) %>% mutate(nombre = as.character(.data$nombre)) %>% 
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
    # bb = x %>% sf::st_transform(5382) %>% sf::st_bbox() %>% as.vector() %>% 
    #   terra::ext()
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
    # # Return ---- #' @importFrom terra ext rast crop aggregate crs
    # if (length(ar) == 1) {
    #   a3 <- terra::rast(ar) 
    #   a3 <- terra::crop(a3, bb)
    # } else {
    #   rast.list <- list()
    #   for (i in 1:length(ar)) { rast.list[i] <- terra::rast(ar[i]) }
    #   rast.list$fun <- mean
    #   a3 <- do.call(terra::aggregate(), rast.list)
    # }
  }
  # Return ----
  if (length(ar) == 1) {
    a3 <- raster::brick(ar)
    raster::crs(a3) <- "+proj=utm +zone=21 +south +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs"
    a3 <- raster::crop(a3, bb)
  } else {
    rast.list <- list()
    for (i in 1:length(ar)) { rast.list[i] <- raster::brick(ar[i]) }
    rast.list$fun <- mean
    a3 <- do.call(raster::mosaic, rast.list)
  }
  # terra::plotRGB(a3)
  return(a3)
}
