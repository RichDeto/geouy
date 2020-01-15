# geouy <img align="right" src="man/figures/geouy_logo_a.png" alt="logo" width="160"> <img align="right" src="man/figures/geouy_logo_b.png" alt="logo" width="160">

**geouy** is an R package that allows users to easily access official spatial data sets of Uruguay. The package includes a wide range of geospatial datasets as *simple features* (`sf`), available at various geographic scales and for various years with harmonized attributes and projection (see detailed list below).

## Installation

```R
# Use the development version with latest features
  utils::remove.packages('geouy')
  devtools::install_github("RichDeto/geouy")
  library(geouy)
```
obs. If you use **Linux**, you need to install a couple dependencies before installing the libraries `sf` and `geouy`. [More info here](https://github.com/r-spatial/sf#linux).


## Basic Usage

The syntax of all `geouy` functions operate one the same logic so it becomes intuitive to download any data set using a single line of code. Like this:

```R
secc <- load_geouy("Secciones")
```

## Available datasets:


| Layer | Productor | Server | Year | Format |
|-----|-----|-----|-----|-----|
|`"Areas administrativas"`| `"SGM"` | SGM | 2011 | wfs |
|`"Departamentos"`| `"IGM"` | IGM | 2011 | wfs |
|`"Secciones"`| `"INE Censo"` | MIDES | 2011 | wfs |
|`"Segmentos"`| `"INE Censo"` | MIDES | 2011 | wfs |
|`"Zonas"`| `"INE Censo"` | MIDES | 2011 | wfs |
|`"Localidades_pg"`| `"INE Censo"` | MIDES | 2011 | wfs |
|`"Centros poblados pg"`| `"SGM"` | SGM | 2011 | wfs |
|`"Centros poblados pt"`| `"SGM"` | SGM | 2011 | wfs |
|`"Municipios"`| `"IGM"` | IGM | 2011 | wfs |
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
|`plot_geouy`| Plot a variable of your sf object with north and scale, set on a simple theme | 
| ... | ... | ... | 

## History

This package arises from the conjugation of own ideas with an eye on the region. It started as a part of the package where I work with @calcita at [ech](https://github.com/calcita/ech), and some geospatial service packages in the region mainly: 
[geobr](https://github.com/ipeaGIT/geobr) and 
[chilemapas](https://github.com/pachamaltese/chilemapas)

This walk on the shoulders of giants, allows this package focused on this small country (my beautiful Uruguay), to have its own particularities although it tries to fit especially to [geobr](https://github.com/ipeaGIT/geobr) in its structure and with a view to complementing [ech](https://github.com/calcita/ech).

## Community contributions [es](https://github.com/RichDeto/geouy/issues/1)

This package intends to incorporate any function of general requirements that use the geographic data of Uruguay as a base. All contributions in this regard are welcome.

If you work with geographic data of Uruguay and want to add your function or data, we recommend that you read the following tips on how to collaborate:

### To add your function:

    - Fork of this repository
    - Add your function as an `.R` file in the `R/` folder with the same name as the function
    - Document it with `roxygen2` clarifying its functionality, parameters and an example of use. To see how it is documented to review another function in the same directory
    - Remember at the end of the documentation you must add a # '@export
    - Check that the types and values of your function parameters are fine (for example, you can look at `data-raw/metadata.R`
    - Add the dependencies in the `DESCRIPTION` file 
    - Check the package with devtools::check()
    - If everything works fine, then make a pull request

### To add geographic data to the `load_geouy()` function:

    - Fork of this repository
    - Identify the corresponding WFS service URL
    - Add a record to the `metadata` file in the `data-raw/` directory, with the corresponding data.
    - Also include this record in the corresponding table of the `README.md` file, with the corresponding format.
    - If everything works fine, then make a pull request
