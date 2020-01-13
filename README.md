# geouy <img align="right" src="man/figures/geouy_logo_a.png" alt="logo" width="160"> <img align="right" src="man/figures/geouy_logo_b.png" alt="logo" width="160">


**geouy** is an R package that allows users to easily access official spatial data sets of Uruguay. The package includes a wide range of geospatial datasets as *simple features* (`sf`), available at various geographic scales and for various years with harmonized attributes and projection (see detailed list below).

## Installation

```R, ECHO=F
# From CRAN
  install.packages("geouy")
  library(geouy)
```
```R
# or use the development version with latest features
  utils::remove.packages('geouy')
  devtools::install_github("RichDeto/geouy")
  library(geouy)
```
obs. If you use **Linux**, you need to install a couple dependencies before installing the libraries `sf` and `geouy`. [More info here](https://github.com/r-spatial/sf#linux).



## Basic Usage

The syntax of all `geouy` functions operate one the same logic so it becomes intuitive to download any data set using a single line of code. Like this:


## Available datasets:


| Capa | Productor | Repositor | Anio | Formato |
|-----|-----|-----|-----|-----|
|`"Departamentos"`| `"IDE"` | MIDES | 2011 | wfs |
|`"Secciones"`| `"INE Censo"` | MIDES | 2011 | wfs |
|`"Segmentos"`| `"INE Censo"` | MIDES | 2011 | wfs |
|`"Zonas"`| `"INE Censo"` | MIDES | 2011 | wfs |
|`"Localidades_pg"`| `"INE Censo"` | MIDES | 2011 | wfs |
|`"Asentamientos irregulares"`| `"PMB"` | MIDES | 2014 | wfs |
|`"Balnearios"`| `"MTOP"` | MTOP |  2017 | wfs |
|`"Cursos de agua navegables y flotables"` | `"MTOP"` | MTOP | 2019 | wfs |
|`"Lagunas públicas"` | `"MTOP"` | MTOP | 2019 |  wfs |
|`"Rutas"` | `"IDE"` | MIDES | 2017 | wfs |
|`"Calles"` | `"IDE - UTE - IM"` | MIDES | 2017 | wfs |
|`"Peajes"` | `"MTOP"` | MTOP | 2019 | wfs |
|`"Postes Kilometros"` |`"MTOP"` | MTOP | 2019 | wfs |
 

### Other functions:


| Function | Action|
|-----|-----|
|`geocode_ide_uy`| Allows geocoding directions using IDE_uy  |
|`plot_geouy`| Plot a varible of your sf object with north and scale with a simple theme | 
| ... | ... | ... | 

## History

This package arises from the conjugation of own ideas with an eye on the region. It started as a part of the package where I work with @calcita at [ech](https://github.com/calcita/ech), and some geospatial service packages in the region mainly: 
[geobr](https://github.com/ipeaGIT/geobr) and 
[chilemapas](https://github.com/pachamaltese/chilemapas)

This walk on the shoulders of giants, allows this package focused on this small country (my beautiful Uruguay), to have its own particularities although it tries to fit especially to `geobr` in its structure and with a view to complementing `ech`.
