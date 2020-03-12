#' This function allows to take oficial uruguayan geometries, as object "sf", from various servers.
#' @param c Define the geometries to download: may be: "Departamentos", "Secciones", "Zonas", etc. View(metadata) for details.
#' @param crs Define the Coordinate Reference Systems you want the output, default 32721
#' @param folder Folder where are the files download if formato == "zip" in metadata. Default tempdir()
#' @keywords IDE MIDES INE
#' @return sf object with the requested geometries 
#' @importFrom sf st_read st_transform
#' @importFrom dplyr filter %>%
#' @importFrom glue glue
#' @importFrom fs dir_ls
#' @export
#' @examples
#'\donttest{
#' secc <- load_geouy(c = "Secciones")
#'}

load_geouy <- function(c, crs = 32721, folder = tempdir()){
  x <- geouy::metadata 
  try(if (!c %in% x$capa) stop("The name of the geometry you will load is not correct. Verify in the metadata file"))
  x <- x[x$capa == c,]
  if (x$repositor %in% "SGM") {
    a <- st_read("WFS:http://geoservicios.sgm.gub.uy/wfsPCN1000.cgi?",x$url, crs = x$crs)
  } else if (x$formato == "zip") {
    if (!is.character(folder) | length(folder) != 1) {
      stop(glue::glue("You must enter a valid directory..."))
    }
    # warnings ----
    if (length(fs::dir_ls(folder, regexp = "\\.zip$")) != 0) {
      warning(glue::glue("There are other .zip files in the folder that will be read..."))
    }
    # download ----
    try(dir.create(normalizePath(folder,"/")))
    f = glue::glue("{folder}/{x$capa}.zip")
    if (!file.exists(f)) {
      message(glue::glue("Intentando descargar {x$capa}..."))
      try(utils::download.file(x$url, f, mode = "wb", method = "libcurl"))
    } else {
      message(glue::glue("{f} ya existe, se omite la descarga"))
    }
    try(archive_extract(archive.path = f, dest.path = folder))
    
    archivo <- fs::dir_ls(folder, regexp = "\\.shp$")
    archivo <- archivo[which.max(file.info(archivo)$mtime)]
    a <- sf::st_read(archivo, crs = x$crs) 
  } else {
    a <- sf::st_read(x$url, crs = x$crs) 
  }
  a <- a %>% sf::st_transform(crs)
  return(a)
}
