#' A function to set ggplot2 theme in our suggested format
#'
#' This function allows you to set ggplot2 theme in our suggested format.
#' @param x An sf object like load_geouy() results
#' @param a Variable of "x" to plot (character)
#' @param ... All parameters allowed from ggplot2 themes.
#' @keywords ggplot2 sf maps
#' @export
#' @import ggplot2 ggthemes
#' @importFrom dplyr enquo 
#' @importFrom  ggsn north scalebar
#' @examples
#'\dontrun{
#' plot_geouy(load_geouy("Secciones"),"AREA")
#'}

plot_geouy <- function(x, a, ...){
  a <- enquo(a)
  ggplot(x) +
    geom_sf(aes(fill = !! a)) + theme(base_size = 16, base_family = "",
                             axis.line = element_blank(),
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
