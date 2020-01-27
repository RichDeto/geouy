#' This function test if an 'sf' object match with Uruguay at crs = 4326.
#' @param x An 'sf' object with the same crs as the homonym parameter
#' @keywords CRS sf Uruguay
#' @importFrom sf st_join st_crs
#' @export
#' @examples
#'\donttest{
#' is.uy4326(load_geouy("Peajes"))
#'}

is.uy4326 <- function(x){
  md <- geouy::metadata 
  try(if (!is(x, "sf")) stop("The object you want to process is not class sf"))
  y <- geouy::load_geouy("Uruguay", crs = 4326)
  try(if (st_crs(x) != st_crs(y)) stop("The object you want to process is not at CRS 4326"))
  y$geometry <- NULL
  x1 <- sf::st_join(x, y, left = F)
  x2 <- (nrow(x1) / nrow(x)) * 100
  return(ifelse(x2 == 0, "Your object have not any geometry in Uruguay... Try 32721",
                paste0("Your object have ", x2, "% of matches with Ururguay CRS 4326")))
}

#' This function test if an 'sf' object match with Uruguay at crs = 32721.
#' @param x An 'sf' object with the same crs as the homonym parameter
#' @keywords CRS sf Uruguay
#' @importFrom sf st_join st_crs
#' @export
#' @examples
#'\donttest{
#' is.uy32721(load_geouy("Peajes"))
#'}

is.uy32721 <- function(x){
  md <- geouy::metadata 
  try(if (!is(x, "sf")) stop("The object you want to process is not class sf"))
  y <- geouy::load_geouy("Uruguay", crs = 32721)
  try(if (st_crs(x) != st_crs(y)) stop("The object you want to process is not at CRS 32721"))
  y$geometry <- NULL
  x1 <- sf::st_join(x, y, left = F)
  x2 <- (nrow(x1) / nrow(x)) * 100
  return(ifelse(x2 == 0, "Your object have not any geometry in Uruguay... Try 4326",
                paste0("Your object have ", x2, "% of matches with Ururguay CRS 32721")))
}
