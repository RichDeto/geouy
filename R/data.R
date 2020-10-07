#' Metadata of geoservices for Uruguay
#'
#' A dataset containing the urls and other attributes of geoservices 
#' for Uruguay.
#' @family data
#' @format A data frame with 59 rows and 9 variables:
#' \describe{
#'   \item{capa}{name of the geoservice}
#'   \item{productor}{name of the institution produced the data}
#'   \item{repositor}{name of the institution that serves the data}
#'   \item{crs}{Coordinate Reference Systems of data}
#'   \item{formato}{name of the institution producing the data}
#'   \item{anio}{year of data production}
#'   \item{url}{url of the service}
#'   \item{cod}{name of the variable that contains the cod value of the geometries}
#'   \item{name}{name of the variable that contains the name of the geometries}
#' }
"metadata"

#' Metadata of WMS for Uruguay
#'
#' A dataset containing the urls and other attributes of geoservices 
#' for Uruguay.
#' @family data
#' @format A data frame with 7 rows and 3 variables:
#' \describe{
#'   \item{capa}{name of the geoservice}
#'   \item{formato}{name of the institution producing the data}
#'   \item{url}{url of the service}
#' }
"metadata_wms"

#' INE "Localidades Agregadas"
#'
#' A dataset containing the cods, names and others attributes of urban locations 
#' for Uruguay.
#' @family data
#' @format A data frame with 615 rows and 8 variables:
#' \describe{
#'   \item{depto}{name of the "Departamento"}
#'   \item{nomloc}{name of the "Localidad"}
#'   \item{codloc}{code of the "Localidad"}
#'   \item{pob2011}{Population by "Censo 2011"}
#'   \item{dens2011km}{Population density by "Censo 2011" (population/km)}
#'   \item{Nom_loc_agr_13}{name of the "Localidades agrupadas" (2013)}
#'   \item{Loc_agr_13}{code of the "Localidades agrupadas" (2013)}
#'   \item{cat_loc_agr}{Tipical categories of "Localidades"}
#' }
"loc_agr_ine"