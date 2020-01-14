#' A function to set ggplot2 theme in our suggested format
#'
#' This function allows you to set ggplot2 theme in our suggested format.
#' @param x An sf object like load_geouy() results
#' @param a Variable of "x" to plot
#' @param ... All parameters aviables from ggplot2 themes.
#' @keywords ggplot2 sf maps
#' @export
#' @import ggplot2 ggthemes 
#' @importFrom  ggsn north scalebar
#' @examples
#' plot_geouy

plot_geouy <- function(x, a, ...){
  # stopifnot(is.sf(x))
  # stopifnot(a %in% colnames(x))
  ggplot(x) +
    geom_sf(aes(fill = a)) + theme(base_size = 16, base_family = "",
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

# Ver de mejorar con https://flovv.github.io/unicorn_ggplot_theme/
# theme_ech <- function(base_size = 12, font = NA){
#
#   txt <- element_text(size = base_size + 2, colour = "black", face = "plain")
#   bold_txt <- element_text(size = base_size + 2, colour = "black", face = "bold")
#
#   theme_classic(base_size = base_size, base_family = font) +
#     theme(
#       ###### clean up!
#       legend.key = element_blank(),
#       strip.background = element_blank(),
#       ########### text basics
#       text = txt,
#       plot.title = txt,
#
#       axis.title = txt,
#       axis.text = txt,
#
#       legend.title = bold_txt,
#       legend.text = txt ) +
#
#     ############## AXIS lines
#     theme(
#
#       axis.line.y = element_line(colour = "pink", size = 1, linetype = "dashed"),
#       axis.line.x = element_line(colour = "pink", size = 1.2, linetype = "dashed"),
#       #### remove Tick marks
#       axis.ticks=element_blank(),
#
#       ### legend  top and no title!
#       legend.position = "top",
#       legend.title = element_blank(),
#       legend.key = element_rect(fill = "lightskyblue1", color = "lightskyblue1"),
#       legend.background = element_rect(fill = "lightskyblue1", color = "pink", size = 0.5, linetype = "longdash"),
#
#       ## background
#       plot.background = element_rect(fill = "lightskyblue1",colour = "pink",size = 0.5, linetype = "longdash")
#     )
# }



