#' @name plot_geouy
#' @title plot_geouy
#' @description This function allows you to set ggplot2 theme in our suggested format.
#' @param x An sf object like load_geouy() results
#' @param col Variable of "x" to plot (character)
#' @param viri_opt A character string indicating the colormap option to use. Four options are available: "magma" (or "A"), "inferno" (or "B"), "plasma" (or "C"), "viridis" (or "D", the default option) and "cividis" (or "E")
#' @param l If NULL none label added, if "\%" porcentage with 1 decimal labels, if "n" the value is the label, if "c" put other variable in other_lab. Default NULL
#' @param other_lab If l is "c" put here the variable name for the labels.
#' @param ... All parameters allowed from ggplot2 themes.
#' 
#' @keywords ggplot2 sf maps
#' @import ggplot2 ggthemes
#' @return ggplot object of a choropleth map with x geometries and col values.
#' @export
#' 
#' @examples
#' \donttest{
#' secc <- load_geouy("Secciones")
#' plot_geouy(x = secc, col = "AREA")
#' }
#' 

plot_geouy <- function(x, col, viri_opt = "plasma", l = NULL, other_lab = NULL, ...){
  try(if (!methods::is(x, "sf")) stop("The object you want to process is not class sf"))
  assertthat::assert_that(col %in% names(x), msg = glue::glue("Sorry... :( \n The name of the variable you will plot is not in the object {x}"))
  if (!is.null(l)) assertthat::assert_that(l %in% c("%", "n", "c"), msg = "Sorry... :( \n l parameter is not a valid value, please review!.")
  if (!is.null(other_lab) && l %in% "c") assertthat::assert_that(other_lab %in% names(x), msg = glue::glue("Sorry... :( \n The name of the variable you will plot is not in the object {x}"))
  
  theme_set(theme_bw())
  mapa <- ggplot2::ggplot(data = x) +
    ggplot2::geom_sf(data = x, aes_string(fill = col))  +
    viridis::scale_fill_viridis(name = col, option = "D", 
                                discrete = is.numeric(x[,col] %>% sf::st_set_geometry(NULL))) + 
    ggplot2::xlab(NULL) + ggplot2::ylab(NULL) +
    labs(title = glue::glue("Mapa de variable: {tolower(col)}")) +
    theme_light() +
    theme(panel.grid.major = element_line(colour = "transparent"),
          axis.text = element_text(size = 8),
          legend.text = element_text(size = 7),
          legend.title = element_text(size = 7),
          axis.title = element_text(size = 7),
          plot.title = element_text(size = 9), 
          plot.subtitle = element_text(size = 8), 
          plot.caption = element_text(size = 8, hjust = -0.001),
          legend.key.size = unit(0.4, "cm")) + coord_sf(datum = NA)  +
    ggspatial::annotation_scale(location = "tr", width_hint = 0.4) +
    ggspatial::annotation_north_arrow(location = "tr", which_north = "true", 
                                      pad_x = unit(0.095, "in"), pad_y = unit(0.25, "in"),
                                      style = ggspatial::north_arrow_fancy_orienteering)
  
  if(!is.null(l) && l %in% "%"){
    ll <- x %>% dplyr::mutate(label = .data[[col]] %>% as.numeric(.) %>% round(1) %>% paste0("%"))   
    mapa + geom_sf_text(data = ll, aes(label = label), 
                        colour = "white", size = 3, hjust = 0.5) 
  }
  if(!is.null(l) && l %in% "n"){
    mapa + geom_sf_text(aes(label = .data[[col]]), 
                     colour = "white", size = 3, hjust = 0.5) 
  }
  if(!is.null(l) && l %in% "c"){
    mapa + geom_sf_text(aes(label = .data[[other_lab]]), 
                        colour = "white", size = 3, hjust = 0.5) 
  }
  return(mapa)
}
