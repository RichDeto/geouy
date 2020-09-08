library(magrittr); library(dplyr); library(tibble); library(usethis)

metadata_wms <- tibble::tribble(
  ~capa, ~formato, ~url,

"Ortofotos",	"WMS",	"https://mapas.ide.uy/geoservicios/WMS/WMS_Uruguay_IDEuy_Ortofotos",
"Ortofotos",	"WMTS",	"https://mapas.ide.uy/geoservicios/WMTS/WMTS_Uruguay_IDEuy_Ortofotos",
"MDE",	"WMS",	"https://mapas.ide.uy/geoservicios/WMS/WMS_Uruguay_IDEuy_MDE",
"MDE",	"WMTS",	"https://mapas.ide.uy/geoservicios/WMTS/WMTS_Uruguay_IDEuy_MDE",
"Hidrografia Nacional",	"WMS",	"https://mapas.ide.uy/geoservicios/WMS/WMS_Uruguay_IDEuy_Hidrografia_Nacional",
"Hidrografia Urbana",	"WMS",	"https://mapas.ide.uy/geoservicios/WMS/WMS_Uruguay_IDEuy_Hidrografia_Urbana",
"Areas Urbanizadas Nacional",	"WMS",	"https://mapas.ide.uy/geoservicios/WMS/WMS_Uruguay_IDEuy_Areas_Urbanizadas_Nacional")


saveRDS(metadata_wms,"data-raw/metadata_wms.Rds")
usethis::use_data(metadata_wms, overwrite = TRUE)
