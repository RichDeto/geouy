metadata <- data.frame(id = 1,
                       fuente = "MIDES",
                       capa = "Secciones",
                       url = "https://mapas.mides.gub.uy:443/geoserver/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=INECenso:Secciones",
                       formato = "wfs")
rbind(metadata,
      c(2,"MIDES","Localidades_pg","https://mapas.mides.gub.uy:443/geoserver/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=INECenso:Localidades_pg")
      c(3,"MIDES","ai_pmb_2014","https://mapas.mides.gub.uy:443/geoserver/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=IDE:ai_pmb_2014"

)


# ine_vec2011 <- "http://www.ine.gub.uy/c/document_library/get_file?uuid=d67a62b1-912b-4c24-82f6-332fa4343a24&groupId=10181"
# ine_vec2004 <- "http://www.ine.gub.uy/c/document_library/get_file?uuid=6f41de7b-95ca-4287-b697-8e4b66513464&groupId=10181"
# tabla_dpto <- "http://www.ine.gub.uy/c/document_library/get_file?uuid=ea589aff-9d59-46d3-b2b8-4f8453304226&groupId=10181"
# tabla_loc2004 <- "http://www.ine.gub.uy/c/document_library/get_file?uuid=e04efafe-5d01-4497-a2af-12c9441e6b63&groupId=10181"
# tabla_loc2011 <- RODBC::odbcConnectDbase(download.file("http://www.ine.gub.uy/c/document_library/get_file?uuid=655d0e02-f451-4eaf-bef0-949fdc4898f3&groupId=10181", destfile = "temp.dbf"))
# foreign::read.dbf(download.file("http://www.ine.gub.uy/c/document_library/get_file?uuid=655d0e02-f451-4eaf-bef0-949fdc4898f3&groupId=10181", destfile = "temp.dbf"))
#
# library(gdalUtils)
# library(rgdal)
# dsn_im <- "http://geoweb.montevideo.gub.uy/geoserver/ide/ows"
# dsn_sgm <- "http://www.igm.gub.uy/arcgis/services/LimiteDepartamental_wfs_250000/MapServer/WFSServer?"
# dsn_mvotma <- "WFS:http://sit.mvotma.gub.uy/ArcGIS/services/OGC/OGC_cobertura/MapServer/WFSServer?"
# ogrinfo(dsn, so = TRUE)
# ogr2ogr(dsn, # the input source,
#         "OGC_OGC_cobertura:Cobertura_del_Suelo_2015.gpkg",
#         "OGC_OGC_cobertura:Cobertura_del_Suelo_2015" # the layer from the input
# )



