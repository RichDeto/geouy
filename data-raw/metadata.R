library(magrittr); library(dplyr); library(tibble); library(usethis)

metadata <- tibble::tribble(
  ~capa, ~productor, ~repositor, ~crs, ~formato, ~anio, ~url, ~cod, ~name,
  #--|--|----
  "Uruguay", "INE", "MIDES", 32721, "wfs", 2011, "https://mapas.mides.gub.uy:443/geoserver/INECenso2004/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=INECenso2004:ine_pais_corregido", "gml_id", NA,
  "Areas administrativas", "SGM", "SGM", 4326, "wfs", 2011, "polnbda_ury", NA, NA,
  "Limites departamentales", "IGM", "IGM", 4326, "wfs", 2011, "WFS:https://srvgis.igm.gub.uy/arcgis/services/LimiteDepartamental_wfs_250000/MapServer/WFSServer", "GLOBALID", "DEPTO",
  "Departamentos", "IDE", "MIDES", 32721, "wfs", 2011, "https://mapas.mides.gub.uy/geoserver/IDE/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=IDE:departamentos", "uruguay_", "nombre",
  "Secciones", "INE", "MIDES", 32721, "wfs", 2011, "https://mapas.mides.gub.uy:443/geoserver/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=INECenso:Secciones", "CODSEC","SECCION",
  "Segmentos", "INE", "MIDES", 32721, "wfs", 2011, "https://mapas.mides.gub.uy/geoserver/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=INECenso:Segmentos", "CODSEG","SEGMENTO",
  "Zonas", "INE", "MIDES", 32721, "wfs", 2011, "https://mapas.mides.gub.uy/geoserver/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=INECenso:Zonas", "CODCOMP","ZONA",
  "Secc MVD 2004", "INE", "MIDES", 32721, "wfs", 2004, "https://mapas.mides.gub.uy/geoserver/INECenso2004/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=INECenso2004:mvdsecc04", "CODSEC","SECCION",
  "Segm MVD 2004", "INE", "MIDES", 32721, "wfs", 2004, "https://mapas.mides.gub.uy/geoserver/INECenso2004/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=INECenso2004:mvdseg04", "CODSEG","SEGMENTO",
  "Zonas MVD 2004", "INE", "MIDES", 32721, "wfs", 2004, "https://mapas.mides.gub.uy/geoserver/INECenso2004/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=INECenso2004:zonas04mvd", "CODCOMP","ZONA",
  "Segmentos URB INT 2004", "INE", "MIDES", 32721, "wfs", 2004, "https://mapas.mides.gub.uy/geoserver/INECenso2004/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=INECenso2004:seg04_int", "CODSEG","SEGMENTO",
  "Zonas URB INT 2004", "INE", "MIDES", 32721, "wfs", 2004, "https://mapas.mides.gub.uy/geoserver/INECenso2004/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=INECenso2004:zonas04_int", "CODCOMP","ZONA",
  "Localidades pg", "INE", "MIDES", 32721, "wfs", 2011, "https://mapas.mides.gub.uy:443/geoserver/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=INECenso:Localidades_pg", "CODLOC","NOMBLOC",
  "Localidades pt", "INE", "MIDES", 32721, "wfs", 2011, "https://mapas.mides.gub.uy:443/geoserver/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=INECenso2004:Localidades_pt", "CODLOC","NOMBLOC",
  # c("Area urbanizada pg", "IGM", "IGM", 4326, "wfs", 2011, "WFS:https://srvgis.igm.gub.uy/arcgis/services/AreaUrbanizada_wfs_20000/MapServer/WFSServer"),
  # c("Area urbanizada pt", "IGM", "IGM", 4326, "wfs", 2011, # "WFS:https://srvgis.igm.gub.uy/arcgis/services/AreaUrbanizadaP_wfs_10000/MapServer/WFSServer"),
  "Centros poblados pg", "SGM", "SGM", 4326, "wfs", 2011, "builtupa", "gml_id", "nam",
  "Centros poblados pt", "SGM", "SGM", 4326, "wfs", 2011, "builtupp", "gml_id", "nam",
  "Municipios", "IGM", "IGM", 4326, "wfs", 2011, "WFS:https://srvgis.igm.gub.uy/arcgis/services/LimitesMunicipales_wfs_250000/MapServer/WFSServer", "OBJECTID_1", "NOMBRE",
  "Asentamientos irregulares", "PMB", "MIDES", 32721, "wfs", 2014, "https://mapas.mides.gub.uy:443/geoserver/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=IDE:ai_pmb_2014", "cod_ast", "nom_ast",
  "Barrios", "INE", "MIDES", 32721, "wfs", 2011, "https://mapas.mides.gub.uy/geoserver/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=IDE:barrios_ine_uy", "nrobarrio", "nombbarr",
  "Balnearios", "MTOP", "MTOP", 4326, "wfs", 2017, "https://geoservicios.mtop.gub.uy/geoserver/mb_planos/v_balnearios/ows?service=WFS&request=GetFeature&typeName=v_balnearios", "id", "balneario",
  "Cursos de agua navegables y flotables", "MTOP", "MTOP", 32721, "wfs", 2019, "https://geoservicios.mtop.gub.uy/geoserver/rec_hidrograficos/cursos_nav_flot/ows?service=WFS&request=GetFeature&typeName=cursos_nav_flot", "gml_id", "nombre",
  "Lagunas publicas", "MTOP", "MTOP", 32721, "wfs", 2019, "https://geoservicios.mtop.gub.uy/geoserver/rec_hidrograficos/lagunas_publicas/ows?service=WFS&request=GetFeature&typeName=lagunas_publicas", "gml_id", "nam",
  "Rutas", "IDE", "MIDES", 32721, "wfs", 2017, "https://testmapas.mides.gub.uy/geoserver/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=IDE:Carreteras%20Uruguay", "numero", "nombre",
  "Calles", "IDE - UTE - IM", "MIDES", 32721, "wfs", 2017, "https://mapas.mides.gub.uy/geoserver/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=IDE:EjesUruguayUTE,IDE:EjesMontevideoIM", "id", "nombre",
  "Peajes", "MTOP", "MTOP", 4326, "wfs", 2019, "https://geoservicios.mtop.gub.uy/geoserver/inf_tte_ttelog_terrestre/peajes/ows?service=WFS&request=GetFeature&typeName=peajes", "gml_id", "nombre",
  "Instituciones deportivas", "IDE", "MIDES", 32721, "wfs", 2015, "https://mapas.mides.gub.uy/geoserver/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=IDE:inst_deportivas_2015", "gml_id", "nombre",
  "Colegios privados N0a3", "CEIP", "MIDES", 32721, "zip", 2020,"https://mapas.mides.gub.uy/2shp/out/colegiosprivadosconniveles0a3.zip", NA, NA,
  "Educación en Primera Infancia e Inicial", "CEIP", "MIDES", 32721, "zip", 2020, "https://mapas.mides.gub.uy/2shp/out/educacionenprimerainfanciaeinicial.zip", NA, NA, 
  "Jardines de infantes", "CEIP", "MIDES", 32721, "zip a", 2020, "https://mapas.mides.gub.uy/2shp/out/jardinesdeinfantes.zip",  NA, NA,
  "Escuelas", "CEIP", "MIDES", 32721, "zip", 2020, "https://mapas.mides.gub.uy/2shp/out/escuelas.zip", NA, NA, 
  "Escuelas con N3", "CEIP", "MIDES", 32721, "zip", 2020, "https://mapas.mides.gub.uy/2shp/out/escuelaspublicascomunesconnivel3.zip", NA, NA,
  "Educacion especial", "CEIP", "MIDES", 32721, "zip a", 2020, "https://mapas.mides.gub.uy/2shp/out/educacionespecial.zip", NA, NA,
  "Educacion secundaria", "CEIP", "MIDES", 32721, "zip a", 2020, "https://mapas.mides.gub.uy/2shp/out/liceos.zip", NA, NA,
  "UTU", "ANEP", "MIDES", 32721, "zip", 2020, "https://mapas.mides.gub.uy/2shp/out/utu.zip", NA, NA,
  "Postes Kilometros", "MTOP", "MTOP", 32721, "wfs", 2019, "https://geoservicios.mtop.gub.uy/geoserver/inf_tte_ttelog_terrestre/postes_km/ows?service=WFS&request=GetFeature&typeName=postes_km", NA, NA,
  "Grilla ortofotos urbana", "IDE", "IDE", 5381, "wfs", 2019, "https://mapas.ide.uy/geoserver-raster/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=ortofotos:grilla_urbana", "gml_id","nombre",
  "Grilla ortofotos nacional", "IDE", "IDE", 5381, "wfs", 2019, "https://mapas.ide.uy/geoserver-raster/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=ortofotos:grilla_nacional", "gml_id","nombre",
  "Ambientes acuaticos", "FREPLATA", "MVOTMA", 4326, "zip", 2009, "https://www.dinama.gub.uy/geoserver/u19600217/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=u19600217:c094&outputFormat=SHAPE-ZIP", "gid", "area",
  "Areas protegidas", "DINAMA", "MVOTMA", 4326, "zip", 2015, "https://www.dinama.gub.uy/geoserver/u19600217/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=u19600217:c397&outputFormat=SHAPE-ZIP", NA, NA,
  "Baniados", "DINAMA", "MVOTMA", 4326, "zip", NA, "https://www.dinama.gub.uy/geoserver/u19600217/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=u19600217:c438&outputFormat=SHAPE-ZIP", NA, NA,
  "Batimetria", "DINAMA", "MVOTMA", 4326, "zip", 2020, "https://www.dinama.gub.uy/geoserver/u19600217/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=u19600217:c305&outputFormat=SHAPE-ZIP", NA, NA,
  "Secciones catastrales", "DNC", "MVOTMA", 4326, "zip", 2013, "https://www.dinama.gub.uy/geoserver/u19600217/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=u19600217:c102&outputFormat=SHAPE-ZIP", NA, NA,
  "Padrones rurales", "DNC", "MVOTMA", 4326, "zip", 2014, "https://www.dinama.gub.uy/geoservicios/shapes_pesadas/PaisRural_06_17.zip", NA, NA,  
  "Padrones urbanos", "DNC", "MVOTMA", 4326, "zip", 2014, "https://www.dinama.gub.uy/geoservicios/shapes_pesadas/PaisUrbano_06_17.zip", NA, NA, 
  "Secciones policiales", "MI", "MVOTMA", 4326, "zip", 2017, "https://www.dinama.gub.uy/geoserver/u19600217/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=u19600217:c377&outputFormat=SHAPE-ZIP", NA, NA,
  "Playas", "DINAMA", "MVOTMA", 4326, "zip", 2007, "https://www.dinama.gub.uy/geoserver/u19600217/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=u19600217:c388&outputFormat=SHAPE-ZIP", NA, NA,
  "Cuencas hidro N1", "DINAGUA", "MVOTMA", 4326, "zip", 2020, "https://www.dinama.gub.uy/geoserver/u19600217/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=u19600217:c097&outputFormat=SHAPE-ZIP", NA, NA,
  "Cuencas hidro N2", "DINAGUA", "MVOTMA", 4326, "zip", 2020, "https://www.dinama.gub.uy/geoserver/u19600217/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=u19600217:c098&outputFormat=SHAPE-ZIP", NA, NA,
  "Cuencas hidro N3", "DINAGUA", "MVOTMA", 4326, "zip", 2020, "https://www.dinama.gub.uy/geoserver/u19600217/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=u19600217:c099&outputFormat=SHAPE-ZIP", NA, NA,
  "Cuencas hidro N4", "DINAGUA", "MVOTMA", 4326, "zip", 2020, "https://www.dinama.gub.uy/geoserver/u19600217/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=u19600217:c261&outputFormat=SHAPE-ZIP", NA, NA,
  "Cuencas hidro N5", "DINAGUA", "MVOTMA", 4326, "zip", 2020, "https://www.dinama.gub.uy/geoserver/u19600217/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=u19600217:c262&outputFormat=SHAPE-ZIP", NA, NA,
  "Cobertura suelo 2000", "DINAGUA", "MVOTMA", 4326, "zip", 2000, "https://www.dinama.gub.uy/geoservicios/shapes_pesadas/c349.zip", NA, NA,
  "Cobertura suelo 2008", "DINAGUA", "MVOTMA", 4326, "zip", 2008, "https://www.dinama.gub.uy/geoservicios/shapes_pesadas/c350.zip", NA, NA,
  "Cobertura suelo 2011", "DINAGUA", "MVOTMA", 4326, "zip", 2011, "https://www.dinama.gub.uy/geoservicios/shapes_pesadas/c351.zip", NA, NA,
  "Cobertura suelo 2015", "DINAGUA", "MVOTMA", 4326, "zip", 2015, "https://www.dinama.gub.uy/geoservicios/shapes_pesadas/cobertura_2015_4326.zip", NA, NA
)

saveRDS(metadata,"data-raw/metadata.Rds")
usethis::use_data(metadata, overwrite = TRUE)


# ine_vec2011 <- "http://www.ine.gub.uy/c/document_library/get_file?uuid=d67a62b1-912b-4c24-82f6-332fa4343a24&groupId=10181"
# ine_vec2004 <- "http://www.ine.gub.uy/c/document_library/get_file?uuid=6f41de7b-95ca-4287-b697-8e4b66513464&groupId=10181"
# tabla_dpto <- "http://www.ine.gub.uy/c/document_library/get_file?uuid=ea589aff-9d59-46d3-b2b8-4f8453304226&groupId=10181"
# tabla_loc2004 <- "http://www.ine.gub.uy/c/document_library/get_file?uuid=e04efafe-5d01-4497-a2af-12c9441e6b63&groupId=10181"
# tabla_loc2011 <- RODBC::odbcConnectDbase(download.file("http://www.ine.gub.uy/c/document_library/get_file?uuid=655d0e02-f451-4eaf-bef0-949fdc4898f3&groupId=10181", destfile = "temp.dbf"))