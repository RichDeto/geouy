#' \code{geouy} package
#'
#' The toolbox have functions to load and process geographic information for Uruguay.
#'
#' See the README on
#' \href{https://github.com/RichDeto/geouy/blob/master/README.md}{Github}
#'
#' @docType package
#' @name geouy
#' @aliases geouy-package
NULL

## quiets concerns of R CMD check re: the .'s that appear in pipelines
if (getRversion() >= "2.15.1") utils::globalVariables(
  c(".", "label", "link", "localidad", "lat", "lon", "all_of")
  )
