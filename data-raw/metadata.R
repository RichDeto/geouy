library(magrittr); library(dplyr); library(tibble); library(usethis)

metadata <- tibble::tribble(
  ~capa, ~productor, ~repositor, ~crs, ~formato, ~anio, ~url, ~cod, ~name, ~enc,
  #--|--|----
  "Uruguay", "INE", "MIDES", 32721, "wfs", 2011, "https://mapas.mides.gub.uy:443/geoserver/INECenso2004/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=INECenso2004:ine_pais_corregido", "gml_id", NA, "UTF-8",
  "Areas administrativas", "SGM", "SGM", 4326, "wfs", 2011, "polnbda_ury", NA, NA, "UTF-8",
  "Dptos", "DINAMA", "MVOTMA", 4326, "wfs", 2020, "https://www.ambiente.gub.uy/geoserver/u19600217/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=u19600217:c004","gid", "nombre", "UTF-8",
  "Limites departamentales", "IGM", "IGM", 4326, "wfs", 2011, "WFS:https://srvgis.igm.gub.uy/arcgis/services/LimiteDepartamental_wfs_250000/MapServer/WFSServer", "GLOBALID", "DEPTO", "UTF-8",
  "Departamentos", "IDE", "MIDES", 32721, "wfs", 2011, "https://mapas.mides.gub.uy/geoserver/IDE/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=IDE:departamentos&outputFormat=GML2", "uruguay_", "nombre", "UTF-8",
  "Deptos", "INE", "IDE", 32721, "zip", 2011, "https://mapas.ide.uy/geoserver-vectorial/INE_NO_SEGURO/wfs?service=WFS&request=GetFeature&version=1.0.0&outputFormat=shape-zip&typeName=ine_depto", "depto", "nombre", "UTF-8",
  # "Secc", "INE", "MIDES", 32721, "zip", 2011, "https://mapas.ide.uy/geoserver-vectorial/INE_NO_SEGURO/wfs?service=WFS&request=GetFeature&version=1.0.0&outputFormat=shape-zip&typeName=ine_seccen", "codsec","seccion", "UTF-8",
  "Secciones", "INE", "MIDES", 32721, "wfs", 2011, "https://mapas.mides.gub.uy:443/geoserver/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=INECenso:Secciones", "CODSEC","SECCION", "UTF-8",
  # "Segm", "INE", "IDE", 32721, "zip", 2011, "https://mapas.ide.uy/geoserver-vectorial/INE_NO_SEGURO/wfs?service=WFS&request=GetFeature&version=1.0.0&outputFormat=shape-zip&typeName=ine_seg_11", "codseg","segmento", "UTF-8",
  "Segmentos", "INE", "MIDES", 32721, "wfs", 2011, "https://mapas.mides.gub.uy/geoserver/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=INECenso:Segmentos", "CODSEG","SEGMENTO", "UTF-8",
  # "Zona", "INE", "IDE", 32721, "zip", 2011, "https://mapas.ide.uy/geoserver-vectorial/INE_NO_SEGURO/wfs?service=WFS&request=GetFeature&version=1.0.0&outputFormat=shape-zip&typeName=zonas11", "codcomp","zona", "UTF-8",
  "Zonas", "INE", "MIDES", 32721, "wfs", 2011, "https://mapas.mides.gub.uy/geoserver/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=INECenso:Zonas", "CODCOMP","ZONA", "UTF-8",
  "Secc MVD 2004", "INE", "MIDES", 32721, "wfs", 2004, "https://mapas.mides.gub.uy/geoserver/INECenso2004/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=INECenso2004:mvdsecc04", "CODSEC","SECCION", "UTF-8",
  "Segm MVD 2004", "INE", "MIDES", 32721, "wfs", 2004, "https://mapas.mides.gub.uy/geoserver/INECenso2004/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=INECenso2004:mvdseg04", "CODSEG","SEGMENTO", "UTF-8",
  "Zonas MVD 2004", "INE", "MIDES", 32721, "wfs", 2004, "https://mapas.mides.gub.uy/geoserver/INECenso2004/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=INECenso2004:zonas04mvd", "CODCOMP","ZONA", "UTF-8",
  "Segmentos URB INT 2004", "INE", "MIDES", 32721, "wfs", 2004, "https://mapas.mides.gub.uy/geoserver/INECenso2004/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=INECenso2004:seg04_int", "CODSEG","SEGMENTO", "UTF-8",
  "Zonas URB INT 2004", "INE", "MIDES", 32721, "wfs", 2004, "https://mapas.mides.gub.uy/geoserver/INECenso2004/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=INECenso2004:zonas04_int", "CODCOMP","ZONA", "UTF-8",
  "Localidades pg", "INE", "MIDES", 32721, "wfs", 2011, "https://mapas.mides.gub.uy:443/geoserver/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=INECenso:Localidades_pg", "CODLOC","NOMBLOC", "UTF-8",
  "Localidades pt", "INE", "MIDES", 32721, "wfs", 2011, "https://mapas.mides.gub.uy:443/geoserver/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=INECenso2004:Localidades_pt", "CODLOC","NOMBLOC", "UTF-8",
  "DeptoHog11", "INE", "IDE", 32721, "zip", 2011, "https://mapas.ide.uy/geoserver-vectorial/INE_NO_SEGURO/wfs?service=WFS&request=GetFeature&version=1.0.0&outputFormat=shape-zip&typeName=depto_hog11", "depto", "nombre", "WINDOWS-1252", 
  "DeptoPob11", "INE", "IDE", 32721, "zip", 2011, "https://mapas.ide.uy/geoserver-vectorial/INE_NO_SEGURO/wfs?service=WFS&request=GetFeature&version=1.0.0&outputFormat=shape-zip&typeName=depto_pob11", "depto", "nombre", "WINDOWS-1252",
  "DeptoPobHom11", "INE", "IDE", 32721, "zip", 2011, "https://mapas.ide.uy/geoserver-vectorial/INE_NO_SEGURO/wfs?service=WFS&request=GetFeature&version=1.0.0&outputFormat=shape-zip&typeName=depto_pob_hom", "depto", "nombre", "WINDOWS-1252",   
  "DeptoPobMuj11", "INE", "IDE", 32721, "zip", 2011, "https://mapas.ide.uy/geoserver-vectorial/INE_NO_SEGURO/wfs?service=WFS&request=GetFeature&version=1.0.0&outputFormat=shape-zip&typeName=depto_pob_muj", "depto", "nombre", "WINDOWS-1252", 
  "DeptoViv11", "INE", "IDE", 32721, "zip", 2011, "https://mapas.ide.uy/geoserver-vectorial/INE_NO_SEGURO/wfs?service=WFS&request=GetFeature&version=1.0.0&outputFormat=shape-zip&typeName=depto_viv11", "depto", "nombre", "WINDOWS-1252",
  "LocHog11", "INE", "IDE", 32721, "zip", 2011, "https://mapas.ide.uy/geoserver-vectorial/INE_NO_SEGURO/wfs?service=WFS&request=GetFeature&version=1.0.0&outputFormat=shape-zip&typeName=loc_hog11", "codloc", "nombloc", "WINDOWS-1252",
  "LocPob11", "INE", "IDE", 32721, "zip", 2011, "https://mapas.ide.uy/geoserver-vectorial/INE_NO_SEGURO/wfs?service=WFS&request=GetFeature&version=1.0.0&outputFormat=shape-zip&typeName=loc_pob11", "codloc", "nombloc",  "WINDOWS-1252",
  "LocPobHom11", "INE", "IDE", 32721, "zip", 2011, "https://mapas.ide.uy/geoserver-vectorial/INE_NO_SEGURO/wfs?service=WFS&request=GetFeature&version=1.0.0&outputFormat=shape-zip&typeName=loc_pob_hom", "codloc", "nombloc", "WINDOWS-1252",  
  "LocPobMuj11", "INE", "IDE", 32721, "zip", 2011, "https://mapas.ide.uy/geoserver-vectorial/INE_NO_SEGURO/wfs?service=WFS&request=GetFeature&version=1.0.0&outputFormat=shape-zip&typeName=loc_pob_muj", "codloc", "nombloc", "WINDOWS-1252",  
  "LocViv11", "INE", "IDE", 32721, "zip", 2011, "https://mapas.ide.uy/geoserver-vectorial/INE_NO_SEGURO/wfs?service=WFS&request=GetFeature&version=1.0.0&outputFormat=shape-zip&typeName=loc_viv11", "codloc", "nombloc", "WINDOWS-1252",  
  "SeccHog11", "INE", "IDE", 32721, "zip", 2011, "https://mapas.ide.uy/geoserver-vectorial/INE_NO_SEGURO/wfs?service=WFS&request=GetFeature&version=1.0.0&outputFormat=shape-zip&typeName=secc_hog11", "codsecc", NA, "WINDOWS-1252", 
  "SeccPob11", "INE", "IDE", 32721, "zip", 2011, "https://mapas.ide.uy/geoserver-vectorial/INE_NO_SEGURO/wfs?service=WFS&request=GetFeature&version=1.0.0&outputFormat=shape-zip&typeName=secc_pob11", "codsecc", NA, "WINDOWS-1252",  
  "SeccPobHom11", "INE", "IDE", 32721, "zip", 2011, "https://mapas.ide.uy/geoserver-vectorial/INE_NO_SEGURO/wfs?service=WFS&request=GetFeature&version=1.0.0&outputFormat=shape-zip&typeName=secc_pob_hom", "codsecc", NA, "WINDOWS-1252",  
  "SeccPobMuj11", "INE", "IDE", 32721, "zip", 2011, "https://mapas.ide.uy/geoserver-vectorial/INE_NO_SEGURO/wfs?service=WFS&request=GetFeature&version=1.0.0&outputFormat=shape-zip&typeName=secc_pob_muj", "codsecc", NA, "WINDOWS-1252",  
  "SeccViv11", "INE", "IDE", 32721, "zip", 2011, "https://mapas.ide.uy/geoserver-vectorial/INE_NO_SEGURO/wfs?service=WFS&request=GetFeature&version=1.0.0&outputFormat=shape-zip&typeName=secc_viv11", "codsecc", NA, "WINDOWS-1252",  
  "SegHog11", "INE", "IDE", 32721, "zip", 2011, "https://mapas.ide.uy/geoserver-vectorial/INE_NO_SEGURO/wfs?service=WFS&request=GetFeature&version=1.0.0&outputFormat=shape-zip&typeName=seg_hog11", "codseg", NA, "WINDOWS-1252",  
  "SegPob11", "INE", "IDE", 32721, "zip", 2011, "https://mapas.ide.uy/geoserver-vectorial/INE_NO_SEGURO/wfs?service=WFS&request=GetFeature&version=1.0.0&outputFormat=shape-zip&typeName=seg_pob11", "codseg", NA, "WINDOWS-1252",   
  "SegPobHom11", "INE", "IDE", 32721, "zip", 2011, "https://mapas.ide.uy/geoserver-vectorial/INE_NO_SEGURO/wfs?service=WFS&request=GetFeature&version=1.0.0&outputFormat=shape-zip&typeName=seg_pob_hom", "codseg", NA, "WINDOWS-1252",   
  "SegPobMuj11", "INE", "IDE", 32721, "zip", 2011, "https://mapas.ide.uy/geoserver-vectorial/INE_NO_SEGURO/wfs?service=WFS&request=GetFeature&version=1.0.0&outputFormat=shape-zip&typeName=seg_pob_muj", "codseg", NA, "WINDOWS-1252",   
  "SegViv11", "INE", "IDE", 32721, "zip", 2011, "https://mapas.ide.uy/geoserver-vectorial/INE_NO_SEGURO/wfs?service=WFS&request=GetFeature&version=1.0.0&outputFormat=shape-zip&typeName=seg_viv11", "codseg", NA, "WINDOWS-1252",  
  "ZonHog11", "INE", "IDE", 32721, "zip", 2011, "https://mapas.ide.uy/geoserver-vectorial/INE_NO_SEGURO/wfs?service=WFS&request=GetFeature&version=1.0.0&outputFormat=shape-zip&typeName=zon_hog11", "codcomp", NA, "WINDOWS-1252", 
  "ZonPob11", "INE", "IDE", 32721, "zip", 2011, "https://mapas.ide.uy/geoserver-vectorial/INE_NO_SEGURO/wfs?service=WFS&request=GetFeature&version=1.0.0&outputFormat=shape-zip&typeName=zon_pob11", "codcomp", NA, "WINDOWS-1252",  
  "ZonPobHom11", "INE", "IDE", 32721, "zip", 2011, "https://mapas.ide.uy/geoserver-vectorial/INE_NO_SEGURO/wfs?service=WFS&request=GetFeature&version=1.0.0&outputFormat=shape-zip&typeName=zon_pob_hom", "codcomp", NA, "WINDOWS-1252", 
  "ZonPobMuj11", "INE", "IDE", 32721, "zip", 2011, "https://mapas.ide.uy/geoserver-vectorial/INE_NO_SEGURO/wfs?service=WFS&request=GetFeature&version=1.0.0&outputFormat=shape-zip&typeName=zon_pob_muj", "codcomp", NA, "WINDOWS-1252",  
  "ZonViv11", "INE", "IDE", 32721, "zip", 2011, "https://mapas.ide.uy/geoserver-vectorial/INE_NO_SEGURO/wfs?service=WFS&request=GetFeature&version=1.0.0&outputFormat=shape-zip&typeName=zon_viv11", "codcomp", NA,  "WINDOWS-1252", 
  # FALTAN AGREGAR LOS DATOS DE POBACIÓN DEL 63,75,85,96 Y 04: https://mapas.ide.uy/geoserver-vectorial/ows?service=wfs&version=1.0.0&request=GetCapabilities
  # c("Area urbanizada pg", "IGM", "IGM", 4326, "wfs", 2011, "WFS:https://srvgis.igm.gub.uy/arcgis/services/AreaUrbanizada_wfs_20000/MapServer/WFSServer"),
  # c("Area urbanizada pt", "IGM", "IGM", 4326, "wfs", 2011, # "WFS:https://srvgis.igm.gub.uy/arcgis/services/AreaUrbanizadaP_wfs_10000/MapServer/WFSServer"),
  "Centros poblados pg", "SGM", "SGM", 4326, "wfs", 2011, "builtupa", "gml_id", "nam", "UTF-8",
  "Centros poblados pt", "SGM", "SGM", 4326, "wfs", 2011, "builtupp", "gml_id", "nam", "UTF-8",
  "Municipios", "IGM", "IGM", 4326, "wfs", 2011, "WFS:https://srvgis.igm.gub.uy/arcgis/services/LimitesMunicipales_wfs_250000/MapServer/WFSServer", "OBJECTID_1", "NOMBRE", "UTF-8",
  "Municipios10", "DINOT-IM-IC", "MVOTMA", 32721, "zip", 2010, "https://sit.mvotma.gub.uy/shp/Municipios2010.zip", "OBJECTID", "MUNICIPIO", "UTF-8",
  "Municipios15", "DINOT-IM-IC", "MVOTMA", 32721, "zip", 2015, "https://sit.mvotma.gub.uy/shp/Municipios2015.zip", "OBJECTID", "MUNICIPIO", "UTF-8",
  "CCZ", "IM", "MIDES", 32721, "wfs", 2011, "https://mapas.mides.gub.uy/geoserver/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=IDE:ZonasComunales", "GID","ZONA_LEGAL", "UTF-8",
  "Asentamientos irregulares", "PMB", "MIDES", 32721, "wfs", 2014, "https://mapas.mides.gub.uy:443/geoserver/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=IDE:ai_pmb_2014", "cod_ast", "nom_ast", "UTF-8",
  # "Barrio", "INE", "IDE", 32721, "zip", 1985, "https://mapas.ide.uy/geoserver-vectorial/INE_NO_SEGURO/wfs?service=WFS&request=GetFeature&version=1.0.0&outputFormat=shape-zip&typeName=ine_barrios_mvd_nbi85", "nrobarrio", "nombbarr", "UTF-8",
  "Barrios", "INE", "MIDES", 32721, "wfs", 1985, "https://mapas.mides.gub.uy/geoserver/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=IDE:barrios_ine_uy", "nrobarrio", "nombbarr", "UTF-8",
  "Balnearios", "MTOP", "MTOP", 4326, "wfs", 2017, "https://geoservicios.mtop.gub.uy/geoserver/mb_planos/v_balnearios/ows?service=WFS&request=GetFeature&typeName=v_balnearios", "id", "balneario", "UTF-8",
  "Cursos de agua navegables y flotables", "MTOP", "MTOP", 32721, "wfs", 2019, "https://geoservicios.mtop.gub.uy/geoserver/rec_hidrograficos/cursos_nav_flot/ows?service=WFS&request=GetFeature&typeName=cursos_nav_flot", "gml_id", "nombre", "UTF-8",
  "Lagunas publicas", "MTOP", "MTOP", 32721, "wfs", 2019, "https://geoservicios.mtop.gub.uy/geoserver/rec_hidrograficos/lagunas_publicas/ows?service=WFS&request=GetFeature&typeName=lagunas_publicas", "gml_id", "nam", "UTF-8",
  "Rutas", "IDE", "MIDES", 32721, "wfs", 2017, "https://mapas.mides.gub.uy/geoserver/IDE/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=IDE:Carreteras%20Uruguay&maxFeatures=50&outputFormat=application%2Fjson", "numero", "nombre", "UTF-8",
  "Calles", "IDE - UTE - IM", "MIDES", 32721, "wfs", 2017, "https://mapas.mides.gub.uy/geoserver/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=IDE:EjesUruguayUTE,IDE:EjesMontevideoIM", "id", "nombre", "UTF-8",
  "Peajes", "MTOP", "MTOP", 4326, "wfs", 2019, "https://geoservicios.mtop.gub.uy/geoserver/inf_tte_ttelog_terrestre/peajes/ows?service=WFS&request=GetFeature&typeName=peajes", "gml_id", "nombre", "UTF-8",
  "Instituciones deportivas", "IDE", "MIDES", 32721, "wfs", 2015, "https://mapas.mides.gub.uy/geoserver/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=IDE:inst_deportivas_2015", "gml_id", "nombre", "UTF-8",
  "Colegios privados N0a3", "CEIP", "MIDES", 32721, "zip", 2020,"https://mapas.mides.gub.uy/2shp/out/colegiosprivadosconniveles0a3.zip", NA, NA, "UTF-8",
  "Educación en Primera Infancia e Inicial", "CEIP", "MIDES", 32721, "zip", 2020, "https://mapas.mides.gub.uy/2shp/out/educacionenprimerainfanciaeinicial.zip", NA, NA, "UTF-8",
  "Jardines de infantes", "CEIP", "MIDES", 32721, "zip a", 2020, "https://mapas.mides.gub.uy/2shp/out/jardinesdeinfantes.zip",  NA, NA, "UTF-8",
  "Escuelas", "CEIP", "MIDES", 32721, "zip", 2020, "https://mapas.mides.gub.uy/2shp/out/escuelas.zip", NA, NA, "UTF-8",
  "Escuelas con N3", "CEIP", "MIDES", 32721, "zip", 2020, "https://mapas.mides.gub.uy/2shp/out/escuelaspublicascomunesconnivel3.zip", NA, NA, "UTF-8",
  "Educacion especial", "CEIP", "MIDES", 32721, "zip a", 2020, "https://mapas.mides.gub.uy/2shp/out/educacionespecial.zip", NA, NA, "UTF-8",
  "Educacion secundaria", "CEIP", "MIDES", 32721, "zip a", 2020, "https://mapas.mides.gub.uy/2shp/out/liceos.zip", NA, NA, "UTF-8",
  "UTU", "ANEP", "MIDES", 32721, "zip", 2020, "https://mapas.mides.gub.uy/2shp/out/utu.zip", NA, NA, "UTF-8",
  "Postes Kilometros", "MTOP", "MTOP", 32721, "wfs", 2019, "https://geoservicios.mtop.gub.uy/geoserver/inf_tte_ttelog_terrestre/postes_km/ows?service=WFS&request=GetFeature&typeName=postes_km", NA, NA, "UTF-8",
  "Grilla ortofotos urbana", "IDE", "IDE", 5381, "wfs", 2019, "https://mapas.ide.uy/geoserver-raster/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=ortofotos:grilla_urbana", "gml_id","nombre", "UTF-8",
  "Grilla ortofotos nacional", "IDE", "IDE", 5381, "wfs", 2019, "https://mapas.ide.uy/geoserver-raster/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=ortofotos:grilla_nacional", "gml_id","nombre", "UTF-8",
  "Ambientes acuaticos", "FREPLATA", "MVOTMA", 4326, "zip", 2009, "https://www.ambiente.gub.uy/geoserver/u19600217/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=u19600217:c094&outputFormat=SHAPE-ZIP", "gid", "area", "UTF-8",
  "Areas protegidas", "DINAMA", "MVOTMA", 4326, "zip", 2015, "https://www.ambiente.gub.uy/geoserver/u19600217/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=u19600217:c397&outputFormat=SHAPE-ZIP", NA, NA, "UTF-8",
  "Baniados", "DINAMA", "MVOTMA", 4326, "zip", NA, "https://www.ambiente.gub.uy/geoserver/u19600217/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=u19600217:c438&outputFormat=SHAPE-ZIP", NA, NA, "UTF-8",
  "Batimetria", "DINAMA", "MVOTMA", 4326, "zip", 2020, "https://www.ambiente.gub.uy/geoserver/u19600217/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=u19600217:c305&outputFormat=SHAPE-ZIP", NA, NA, "UTF-8",
  "Secciones catastrales", "DNC", "MVOTMA", 4326, "zip", 2013, "https://www.ambiente.gub.uy/geoserver/u19600217/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=u19600217:c102&outputFormat=SHAPE-ZIP", NA, NA, "UTF-8",
  "Padrones rurales", "DNC", "MVOTMA", 4326, "zip", 2014, "https://www.ambiente.gub.uy/geoservicios/shapes_pesadas/PaisRural_06_17.zip", "PADRON", NA, "UTF-8",
  "Padrones urbanos", "DNC", "MVOTMA", 4326, "zip", 2014, "https://www.ambiente.gub.uy/geoservicios/shapes_pesadas/PaisUrbano_06_17.zip", "PADRON", NA, "UTF-8",
  "Secciones policiales", "MI", "MVOTMA", 4326, "zip", 2017, "https://www.ambiente.gub.uy/geoserver/u19600217/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=u19600217:c377&outputFormat=SHAPE-ZIP", NA, NA, "UTF-8",
  "Playas", "DINAMA", "MVOTMA", 4326, "zip", 2007, "https://www.ambiente.gub.uy/geoserver/u19600217/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=u19600217:c388&outputFormat=SHAPE-ZIP", NA, NA, "UTF-8",
  "CONEAT", "RENARE", "RENARE", 32721, "wfs", NA, "WFS:http://web.renare.gub.uy/arcgis/services/CONEAT/IndicesConeat/MapServer/WFSServer", "OBJECTID", "gml_id", "UTF-8",
  "Cuencas hidro N1", "DINAGUA", "MVOTMA", 4326, "zip", 2020, "https://www.ambiente.gub.uy/geoserver/u19600217/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=u19600217:c097&outputFormat=SHAPE-ZIP", NA, NA, "UTF-8",
  "Cuencas hidro N2", "DINAGUA", "MVOTMA", 4326, "zip", 2020, "https://www.ambiente.gub.uy/geoserver/u19600217/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=u19600217:c098&outputFormat=SHAPE-ZIP", NA, NA, "UTF-8",
  "Cuencas hidro N3", "DINAGUA", "MVOTMA", 4326, "zip", 2020, "https://www.ambiente.gub.uy/geoserver/u19600217/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=u19600217:c099&outputFormat=SHAPE-ZIP", NA, NA, "UTF-8",
  "Cuencas hidro N4", "DINAGUA", "MVOTMA", 4326, "zip", 2020, "https://www.ambiente.gub.uy/geoserver/u19600217/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=u19600217:c261&outputFormat=SHAPE-ZIP", NA, NA, "UTF-8",
  "Cuencas hidro N5", "DINAGUA", "MVOTMA", 4326, "zip", 2020, "https://www.ambiente.gub.uy/geoserver/u19600217/ows?service=WFS&version=1.0.0&request=GetFeature&typeName=u19600217:c262&outputFormat=SHAPE-ZIP", NA, NA, "UTF-8",
  "Cobertura suelo 2000", "DINAGUA", "MVOTMA", 4326, "zip", 2000, "https://www.ambiente.gub.uy/geoservicios/shapes_pesadas/c349.zip", NA, NA, "UTF-8",
  "Cobertura suelo 2008", "DINAGUA", "MVOTMA", 4326, "zip", 2008, "https://www.ambiente.gub.uy/geoservicios/shapes_pesadas/c350.zip", NA, NA, "UTF-8",
  "Cobertura suelo 2011", "DINAGUA", "MVOTMA", 4326, "zip", 2011, "https://www.ambiente.gub.uy/geoservicios/shapes_pesadas/c351.zip", NA, NA, "UTF-8",
  "Cobertura suelo 2015", "DINAGUA", "MVOTMA", 4326, "zip", 2015, "https://www.ambiente.gub.uy/geoservicios/shapes_pesadas/cobertura_2015_4326.zip", NA, NA, "UTF-8"
) %>% as.data.frame()

for (i in names(metadata)) {
  if (is.character(metadata[,i])) {
    metadata[,i] <- iconv(metadata[,i], "latin1", "UTF-8")
  }
}

saveRDS(metadata,"data-raw/metadata.Rds")
usethis::use_data(metadata, overwrite = TRUE)


# ine_vec2011 <- "http://www.ine.gub.uy/c/document_library/get_file?uuid=d67a62b1-912b-4c24-82f6-332fa4343a24&groupId=10181"
# ine_vec2004 <- "http://www.ine.gub.uy/c/document_library/get_file?uuid=6f41de7b-95ca-4287-b697-8e4b66513464&groupId=10181"
# tabla_dpto <- "http://www.ine.gub.uy/c/document_library/get_file?uuid=ea589aff-9d59-46d3-b2b8-4f8453304226&groupId=10181"
# tabla_loc2004 <- "http://www.ine.gub.uy/c/document_library/get_file?uuid=e04efafe-5d01-4497-a2af-12c9441e6b63&groupId=10181"
# tabla_loc2011 <- RODBC::odbcConnectDbase(download.file("http://www.ine.gub.uy/c/document_library/get_file?uuid=655d0e02-f451-4eaf-bef0-949fdc4898f3&groupId=10181", destfile = "temp.dbf"))