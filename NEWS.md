# log history of geouy package development

-------------------------------------------------------
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
  * Incorporate Viridis colors to plot_geouy()
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
