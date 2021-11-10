#' A function to reverse geocoding from coordinates (EPSG 4326) using IDE_uy
#' @family service
#' @param x Dataframe with unless 2 variables: lat = latitud in EPSG:4326 & longitud in EPSG:4326.
#' @param details Logical value, default FALSE for X and Y variables only, if TRUE keep all variables of the service. 
#' @keywords reverse geocoding IDE_uy
#' @importFrom  rjson fromJSON
#' @return The DafaFrame x with the direction variables append (address, nomVia, tip_via, portalNumber, letra, 
#' postalCode, localidad, departamento, manzana, solar and km)
#' @export
#' @details https://direcciones.ide.uy/swagger-ui.html#/Geocode
#' @examples
#'\donttest{
#' # x <- data.frame(cbind(lat = -34.77882, lon = -56.06476))
#' # reverse_ide_uy(x)
#'}

reverse_ide_uy <- function(x, details = F) {
  stopifnot(is.data.frame(x))
  stopifnot(is.numeric(x$lat), "lat" %in% colnames(x), length(x$lat) >= 1)
  stopifnot(is.numeric(x$lon), "lon" %in% colnames(x))
  if (!curl::has_internet()) stop("No internet access detected. Please check your connection.")
  x <- x %>% dplyr::mutate(lat = stringr::str_trim(lat),
                           lon = stringr::str_trim(lon)) %>% 
    dplyr::filter(nchar(lat) > 0 & nchar(lon) > 0)
  for (i in 1:nrow(x)) {
    p <- glue::glue("https://direcciones.ide.uy/api/v1/geocode/reverse?latitud={x[i,'lat']}&limit=1&longitud={x[i,'lon']}") %>% 
      stringr::str_replace_all(" ", "%20") 
    p <- suppressWarnings(fromJSON(paste(readLines(p), collapse=""))[[1]])
    x[i, "address"] <- ifelse(is.null(p$address), NA, p$address)
    x[i, "nomVia"] <- ifelse(is.null(p$nomVia), NA, p$nomVia)  
    x[i, "tip_via"] <- ifelse(is.null(p$tip_via), NA, p$tip_via)       
    x[i,"portalNumber"] <- ifelse(is.null(p$portalNumber), NA, p$portalNumber)  
    x[i,"letra"] <- ifelse(is.null(p$letra), NA, p$letra)        
    x[i,"postalCode"] <- ifelse(is.null(p$postalCode), NA, p$postalCode)       
    x[i,"localidad"] <- ifelse(is.null(p$localidad), NA, p$localidad)       
    x[i,"departamento"] <- ifelse(is.null(p$departamento), NA, p$departamento)  
    x[i,"manzana"] <- ifelse(is.null(p$manzana), NA, p$manzana)        
    x[i,"solar"] <- ifelse(is.null(p$solar), NA, p$solar)              
    x[i,"km"] <- ifelse(is.null(p$km), NA,p$km)             
                         
    if (details == T) {
      x[i, "type"] <- ifelse(is.null(p$type), NA, p$type)
      x[i, "id_ide"] <- ifelse(is.null(p$id), NA, p$id)
      x[i, "idCalle"] <- ifelse(is.null(p$idCalle), NA, p$idCalle) 
      x[i, "idLocalidad"] <- ifelse(is.null(p$idLocalidad), NA, p$idLocalidad)
      x[i, "idDepartamento"] <- ifelse(is.null(p$idDepartamento), NA, p$idDepartamento)
      x[i, "inmueble"] <- ifelse(is.null(p$inmueble), NA, p$inmueble)       
      x[i, "idCalleEsq"] <- ifelse(is.null(p$idCalleEsq), NA, p$idCalleEsq)
      x[i, "state"] <- ifelse(is.null(p$state), NA, p$state)      
      x[i, "stateMsg"] <- ifelse(is.null(p$stateMsg), NA, p$stateMsg)
      x[i, "source"] <- ifelse(is.null(p$source), NA, p$source)   
    }
    p <- NULL
    if (nrow(x) > 10){
      Sys.sleep(10)
    }
  }
  return(x)
}
