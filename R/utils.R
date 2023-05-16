#' This function test if an 'sf' object match with Uruguay at crs = 4326.
#' @family crs
#' @param x An 'sf' object with the same crs as the homonym parameter
#' @keywords CRS sf Uruguay
#' @return logical value based in crs parameter of the sf object
#' @export
#' @examples
#'\donttest{
#' is.uy4326(load_geouy("Peajes"))
#'}

is.uy4326 <- function(x){
  md <- geouy::metadata 
  if (!methods::is(x, "sf")) stop("The object you want to process is not class sf")
  y <- geouy::load_geouy("Uruguay", crs = 4326)
  if (sf::st_crs(x) != sf::st_crs(y)) {
    return("The object you want to process is not at CRS 4326")
  } else {
  y$geometry <- NULL
  x1 <- sf::st_join(x, y, left = F)
  x2 <- (nrow(x1) / nrow(x)) * 100
  return(ifelse(x2 == 0, "Your object have not any geometry in Uruguay... Try 5381, 5382 or 32721",
                glue::glue("Your object have {x2}% of matches with Ururguay CRS 4326")))
  }
}

#' This function test if an 'sf' object match with Uruguay at crs = 32721.
#' @family crs
#' @param x An 'sf' object with the same crs as the homonym parameter
#' @keywords CRS sf Uruguay
#' @return logical value based in crs parameter of the sf object
#' @export
#' @examples
#'\donttest{
#' is.uy32721(load_geouy("Uruguay"))
#'}

is.uy32721 <- function(x){
  md <- geouy::metadata 
  if (!methods::is(x, "sf")) stop("The object you want to process is not class sf")
  y <- geouy::load_geouy("Uruguay", crs = 32721)
  if (sf::st_crs(x) != sf::st_crs(y)){
    return("The object you want to process is not at CRS 32721")
  } else {
    y$geometry <- NULL
    x1 <- sf::st_join(x, y, left = F)
    x2 <- (nrow(x1) / nrow(x)) * 100
    return(ifelse(x2 == 0, "Your object have not any geometry in Uruguay... Try 4326, 5381 or 5382",
                  glue::glue("Your object have {x2}% of matches with Ururguay CRS 32721")))
  }
}

#' This function test if an 'sf' object match with Uruguay at crs = 5381.
#' @family crs
#' @param x An 'sf' object with the same crs as the homonym parameter
#' @keywords CRS sf Uruguay
#' @return logical value based in crs parameter of the sf object
#' @export
#' @examples
#'\donttest{
#' is.uy5381(load_geouy("CCZ"))
#'}

is.uy5381 <- function(x){
  md <- geouy::metadata 
  if (!methods::is(x, "sf")) stop("The object you want to process is not class sf")
  y <- geouy::load_geouy("Uruguay", crs = 5381)
  if (sf::st_crs(x) != sf::st_crs(y)) {
    return("The object you want to process is not at CRS 5381")
  } else {
  y$geometry <- NULL
  x1 <- sf::st_join(x, y, left = F)
  x2 <- (nrow(x1) / nrow(x)) * 100
  return(ifelse(x2 == 0, "Your object have not any geometry in Uruguay... Try 4326, 5382 or 32721",
                glue::glue("Your object have {x2}% of matches with Ururguay CRS 5381")))
  }
}

#' This function test if an 'sf' object match with Uruguay at crs = 5382.
#' @param x An 'sf' object with the same crs as the homonym parameter
#' @family crs
#' @keywords CRS sf Uruguay
#' @return logical value based in crs parameter of the sf object
#' @export
#' @examples
#'\donttest{
#' is.uy5382(load_geouy("Uruguay"))
#'}

is.uy5382 <- function(x){
  md <- geouy::metadata 
  if (!methods::is(x, "sf")) stop("The object you want to process is not class sf")
  y <- geouy::load_geouy("Uruguay", crs = 5382)
  if (sf::st_crs(x) != sf::st_crs(y)) {
    return("The object you want to process is not at CRS 5382")
  } else {
  y$geometry <- NULL
  x1 <- sf::st_join(x, y, left = F)
  x2 <- (nrow(x1) / nrow(x)) * 100
  return(ifelse(x2 == 0, "Your object have not any geometry in Uruguay... Try 4326, 5381 or 32721",
                glue::glue("Your object have {x2}% of matches with Ururguay CRS 5382")))
  }
}

#' Pipe operator
#'
#' See \code{magrittr::\link[magrittr]{\%>\%}} for details.
#'
#' @name %>%
#' @rdname pipe
#' @keywords internal
#' @export
#' @importFrom magrittr %>%
#' @usage lhs \%>\% rhs
NULL