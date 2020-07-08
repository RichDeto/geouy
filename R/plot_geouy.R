#' A function to set ggplot2 theme in our suggested format
#'
#' This function allows you to set ggplot2 theme in our suggested format.
#' @param x An sf object like load_geouy() results
#' @param col Variable of "x" to plot (character)
#' @param viri_opt A character string indicating the colormap option to use. Four options are available: "magma" (or "A"), "inferno" (or "B"), "plasma" (or "C"), "viridis" (or "D", the default option) and "cividis" (or "E")
#' @param ... All parameters allowed from ggplot2 themes.
#' @keywords ggplot2 sf maps
#' @import ggplot2 ggthemes
#' @return ggplot object of a choropleth map with x geometries and col values.
#' @export
#' @examples
#' \donttest{
#' secc <- load_geouy("Secciones")
#' plot_geouy(x = secc, col = "AREA")
#' }

plot_geouy <- function(x, col, viri_opt = "plasma", ...){
  try(if (!methods::is(x, "sf")) stop("The object you want to process is not class sf"))
  try(if (!col %in% names(x)) stop(glue::glue("The name of the variable you will plot is not in the object {x}")))
 ggplot2::ggplot(data = x) +
    geom_sf(data = x, aes_string(fill = col))  +
    viridis::scale_fill_viridis(name = col, option = "D", discrete = is.numeric(x[,col] %>% sf::st_set_geometry(NULL))) +
    xlab("Longitud") + ylab("Latitud") +
    labs(title = glue::glue("Mapa de variable: {tolower(col)}"), caption = "Elaborado con geouy de @RichDeto") +
    theme_light() +
    theme(plot.title = element_text(face = "bold", hjust = 0.5, size = 17),
          plot.caption = element_text(color = "gray40", face = "italic", size = 10),
          axis.title.x = element_text(color = "gray40", size = 12, face = "bold"),
          axis.title.y = element_text(color = "gray40", size = 12, face = "bold")) +
    ggsn::north(x, location = "bottomleft", symbol = 3) +
    ggsn::scalebar(x, dist = 50, dist_unit = "km", transform = F, model = "WGS84")
}
