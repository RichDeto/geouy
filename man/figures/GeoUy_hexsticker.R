library(hexSticker) # https://github.com/GuangchuangYu/hexSticker
library(ggplot2)
library(sf)
library(geouy)


# add special text font
library(sysfonts)
font_add_google(name = "Roboto", family = "Roboto")

library(extrafont)
font_import()
loadfonts(device = "win")

# Download shape files
d <- load_geouy("Departamentos", crs = 4326)
s <- load_geouy("Secciones", crs = 4326)

# Simplify geometry
d_s <- st_simplify(d, preserveTopology = TRUE, dTolerance = .1)
s_s <- st_simplify(s, preserveTopology = TRUE, dTolerance = .01)

plot(d_s['depto'])
plot(d['depto'])

plot(s_s['CODSEC'])
plot(s['CODSEC'])

as.numeric(object.size(d_s)) / as.numeric(  object.size(d))
as.numeric(object.size(s_s)) / as.numeric(  object.size(s))


### Black and light blue logo ---------------

### .png
plot_a <-
        ggplot() +
        # geom_sf(data = d_s, fill = NA, size = .3, color = "#5796c905") +
        geom_sf(data = s_s, fill = NA, size = .2, color = "#4dc0d1") +
        theme_void() +
        theme(panel.grid.major = element_line(colour = "transparent")) +
        #  theme(legend.position = "none") +
        annotate("text", x = -54.7, y = -30.8, label = "geouy", color = "#4dc0d1",
                 size = 25, family = "Roboto", fontface = "bold", angle = -35) # (.png  size = 25)(.svg  size = 6)



sticker(plot_a, package = "",
        s_x = 1.03, s_y = 1, s_width = 1.5, s_height = 1.5, # ggplot image size and position
        h_fill = "black", h_color = "black", # hexagon
        filename = "./man/figures/geouy_logo_a.png", dpi = 400)  # output name and resolution


### .svg
plot_y_svg <-
        ggplot() +
        # geom_sf(data = d_s, fill = NA, size = .08, color = "#5796c905") +
        geom_sf(data = s_s, fill = NA, size = .35, color = "#4dc0d1") +
        theme_void() +
        theme(panel.grid.major = element_line(colour = "transparent")) +
        #  theme(legend.position = "none") +
        annotate("text", x = -54.7, y = -30.8, label = "geouy", color = "#4dc0d1",
                 size = 6, family = "Roboto", fontface = "bold", angle = -35) # (.png  size = 25)(.svg  size = 6)



sticker(plot_y_svg, package = "",
        s_x = 1.03, s_y = 1, s_width = 1.5, s_height = 1.5, # ggplot image size and position
        h_fill = "black", h_color = "black", # hexagon
        url = "https://github.com/RichDeto/geouy", u_color = "#4dc0d1",
        spotlight = T, l_height = 17,
        filename = "./man/figures/geouy_logo_a.svg")  # output name and resolution


