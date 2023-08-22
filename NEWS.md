# log history of geouy package development

-------------------------------------------------------

## geouy v0.2.8 (2023-08-22)

* update geouy.R for changes in roxygen2
* debug warning in add_geom.R

## geouy v0.2.7 (2023-05-16)

* Debug testing errors
* update plot_geouy for deprecated ggplot2::aes_string 
* update which_uy for changes in tidyselect 0.1.1

## geouy v0.2.6 (2022-10-04)

* Add Municipios 2010 and 2015, and Territorial Offices of MIDES to metadata 
* Update geocode_ide_uy() because server of IDEuy change
* Add a reverse_ide_uy() function for reverse geocoding 
* Change geoservice of "Departamentos"
* Change code variable name of "Municipios"
* Update URLs 

## geouy v0.2.5 (2021-08-12)

* Add demographic links from IDEuy
* Add an encoding variable to metadata.
* Implementation of encoding definition to load_geouy()
* Add a uy_deptos_grid and a mvd_barrios_grid as geofacet grid dataset 
* Improve citacion year and version

## geouy v0.2.4 (2021-05-02)

* plot_goeuy % bug fixed
* tutorial
* Add wfs for CONEAT of RENARE
* Update links of INE wfs, connecting to "Geoportal del Instituto Nacional de Estadística" made by IDE-Uy
* Update links of DINAMA wfs, because institutional changes make a change in server name
* Add metadata_tables for tables with geocodings
* Add to metadata cod variables for Padrones
* Add verification of internet access

## geouy v0.2.3 (2020-09-15)

* Add C++11 system requirement for sf update.
* Add CCZ datasets to metadata.
* Add a where_uy() to get an sf object by a name or id consult. 
* Add a add_geom() to add a geom variable to a data.frame by a link variable.
* Improve plot_geouy() fixing bugs, and made compatible with ech:: library.


## geouy v0.2.2 (2020-07-31)

* Add loc_agr_ine dataset of "Localidades agragadas" of INE.
* Add a geouy.R to discribe the package and set globals variables
* replace ggsn with ggspatial to improve north and scale aesthetics in plot_geouy 
* remove lat and long axis in plot_goeuy
* Add a param labels in plot_geouy for labels posiblity, if "%" porcentage with 1 decimal labels, if "n" the value is the label, if "c" put other variable in other_lab

## geouy v0.2.1 (2020-06-09)
 
* Add educational layers to load_geouy(): "Colegios privados N0a3", "Educación en Primera Infancia e Inicial",  "Jardines de infantes", "Escuelas",   "Escuelas con N3", "Educacion especial", "Educacion secundaria" y "UTU".
* Add tryCatch for download.file() in load_geouy() to diferents zip files.

## geouy v0.2.0 (2020-05-07)

* Verify compatibility with 1.0
* Change the use of to RCurl::getURL at geocode_ide_uy()
* Try change tiles_ide_uy() from raster to terra, but at the crop step the ptr slot is lost.
* Improvement of plot_geouy
* Remove tiles_ide_uy() function, because IDEuy change require methods


## geouy v0.1.9 (2020-03-20)

* Update test with CRS structure for sf 0.9 version
* Limits in geocode_geouy(), you must be part of uruguayan public organism and  fill this (forms)[https://www.gub.uy/agencia-gobierno-electronico-sociedad-informacion-conocimiento/comunicacion/publicaciones/formularios-alta-consumo-servicios-pdi] if your organism is not yet vinculated.


## geouy v0.1.8 (2020-03-17)

* Add to 'tiles_ide_uy()' function options to download .jpg in addition to .tif
* Add more testthat for 'tiles_ide_uy()' function
* Add zip format to 'load_goeuy()'
* Add MVOTMA datasets to metadata, i.e.: Ambientes acuaticos, Areas protegidas, Batimetria, Secciones catastrales, Padrones rurales y urbanos, Secciones policiales, Playas and Cuencas hidrograficas in its 5 nivels.
* Add to tiles_ide_uy the posibility for Montevideo tiles with urban = TRUE give orthophotos with 10cm per pixel 
* Solved bug with raster::mosaic for combination of multiple tiles to cover a bbox.
* Add a complementary function for 5382 crs evaluation

## geouy v0.1.7 (2020-02-26)

* Add layers for IDEuy orthophotos grids at 'load_geouy()' 
* Add a 'tiles_ide_uy()' function and it's testthat dile
* Add a complementary function for 5381 crs evaluation
* Change all 'paste()' with 'glue()'
* Add to testthat files 'skip_on...()' functions for a faster evaluation.

## geouy v0.1.6 (2020-02-09)

* Add \value to .Rd files
* Add all variables option to which_uy function
* Complementary functions for the evaluation of typical Uruguayan CRS codes (4326 and 32721)

## geouy v0.1.5 (2020-01-24)

* omit the redundant part "Toolbox for" in your title.
* web reference for the data source/used API in Description 
* write package names, software names and API names in single quotes.
* replace \dontrun{} by \donttest{} in Rd-files 
* Added in metadata the links to "Secc MVD 2004", "Segm MVD 2004", "Segm URB INT 2004", "Zonas MVD 2004", "Zonas URB INT 2004", "Localidades pt", "Instituciones deportivas"

## geouy v0.1.4 (2020-01-22)

 * New function `which_uy()` which allows to add to an "sf" object its spatial coincidence with one or more administrative units in Uruguay, generating the corresponding variables.
 * Added in metadata the links to "Departamentos" and "Barrios" of the INE, renaming "Departamentos" from IGM to "Limites departamentales"
 * testthat for the new function.

## geouy v0.1.3 (2020-01-17)

  * Change readLines for xml2::read_html in geocode_ide_uy()
  * Incorporate Viridis colors to 'plot_geouy()'
  * Added testthat function to all functions   


## geouy v0.1.1 (2020-01-15)

  * After first release of it to CRAN R, details were corrected in the package documentation
  * Was added checks in Travis (linux and mac), Appveyor and Codecov 
  * Generated a DOI in Zenodo 


## geouy v0.1.0 (2019-12-30)

Launch of **geouy** v0.1.0 on [GitHUb](https://github.com/RichDeto/geouy) with the following data sets:    
  * Localidades_pg    
  * Secciones    
  * Asentamientos irregulares    
  * Balnearios    
  * Departamentos    
  * Areas administrativas
  * Segmentos
  * Zonas
  * Centros poblados pg
  * Centros poblados pt
  * Cursos de agua
  * Lagunas
  * Rutas
  * Calles
  * Peajes
  * Postes kilometros
  
  
And the following functions:  
  * `load_geouy()`    
  * `geocode_ide_uy()`    
  * `plot_geouy()`
