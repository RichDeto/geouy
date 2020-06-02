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
    geom_sf(aes(fill = {{ col }})) +
    viridis::scale_fill_viridis(name = col, option = "D", discrete = is.numeric(x[col])) +
    xlab("Longitud") + ylab("Latitud") +
    labs(title = glue::glue ("Mapa de {col} por {x}"), caption = "Elaborado con geouy de @RichDeto") +
    theme(axis.line = element_blank(),
          axis.text.x = element_blank(),
          axis.text.y = element_blank(),
          axis.ticks = element_blank(),
          axis.title.x = element_blank(),
          axis.title.y = element_blank(),
          legend.text = element_text(size = 11),
          legend.title = element_text(size = 12),
          panel.background = element_blank(),
          panel.border = element_rect(colour = "gray", fill = NA, size = 0.5),
          legend.justification = c(1,1), legend.position = c(1,1)) +
    ggsn::north(x, location = "bottomleft", symbol = 3) +
    ggsn::scalebar(x, dist = 50, dist_unit = "km", transform = T, model = "WGS84")
}


# @importFrom glue glue
# @importFrom ggsn north scalebar