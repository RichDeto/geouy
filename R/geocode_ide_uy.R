#' A function to geocoding directions using IDE_uy
#' @param x Dataframe with unless 3 variables: dpto = corresponding to the department, loc = city / location, dir = to the address.
#' @keywords geocoding IDE_uy
#' @return The DafaFrame x with the coordinates variables append (x and y)
#' @importFrom dplyr mutate filter %>%
#' @importFrom stringr str_sub str_locate str_trim str_replace_all
#' @importFrom xml2 read_html
#' @importFrom glue glue
#' @export
#' @examples
#'\donttest{
#' # x1 <- cbind(dpto="Montevideo",loc="Montevideo",dir="Av. 18 de julio 1453")
#' # x2 <- data.frame(x1, stringsAsFactors = F)
#' # geocode_ide_uy(x2)
#'}

geocode_ide_uy <- function(x) {
  stopifnot(is.data.frame(x))
  stopifnot(is.character(x$dpto), "dpto" %in% colnames(x), length(x$dpto) >= 1)
  stopifnot(is.character(x$loc), "loc" %in% colnames(x))
  stopifnot(is.character(x$dir), "dir" %in% colnames(x))
  x <- x %>% mutate(dir = stringr::str_trim(dir)) %>% filter(nchar(dir) > 0)
  for (i in 1:nrow(x)) {
    p <- glue::glue("http://servicios.ide.gub.uy/servicios/BusquedaDireccion?departamento={x[i,'dpto']}&localidad={x[i,'loc']}&calle={x[i,'dir']}") %>% 
      str_replace_all(" ", "%20") %>% 
      xml2::read_html(encoding = "UTF-8", options = c("NOBLANKS", "NOERROR"), n = 256) %>% 
      suppressWarnings()
    x[i,"x"] <- suppressWarnings(as.numeric(stringr::str_sub(p, stringr::str_locate(p, "puntoX\":")[2] + 1, stringr::str_locate(p, "puntoX\":")[2] + 10)))
    x[i,"y"] <- suppressWarnings(as.numeric(stringr::str_sub(p, stringr::str_locate(p, "puntoY\":")[2] + 1, stringr::str_locate(p, "puntoY\":")[2] + 10)))
    p <- NULL
  }
  return(x)
}