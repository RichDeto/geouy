## Resubmission
* Add loc_agr_ine dataset of "Localidades agragadas" of INE.
* Add a geouy.R to discribe the package and set globals variables
* replace ggsn with ggspatial to improve north and scale aesthetics in plot_geouy 
* remove lat and long axis in plot_goeuy
* Add a param labels in plot_geouy for labels posiblity, if "%" porcentage with 1 decimal labels, if "n" the value is the label, if "c" put other variable in other_lab

## Resubmission
This is a resubmission. In this version:

* Add to testthat files 'skip_on...()' functions for a faster evaluation.

## Resubmission
This is a resubmission. In this version:
  
* Remove directed quotation marks in the DESCRIPTION file, except in the Description line for previus recomendations.
* Add \value to .Rd files

## Resubmission
This is a resubmission. In this version I have:

* omit the redundant part "Toolbox for" in your title.
* web reference for the data source/used API in Description 
* write package names, software names and API names in single quotes.
* replace \dontrun{} by \donttest{} in Rd-files 
* New function `which_uy()` which allows to add to an "sf" object its spatial coincidence with one or more administrative units in Uruguay, generating the corresponding variables.
* Added in metadata the links to "Departamentos" and "Barrios" of the INE, renaming "Departamentos" from IGM to "Limites departamentales"
* Change readLines for xml2::read_html in geocode_ide_uy()
* Incorporate Viridis colors to plot_geouy()
* Added testthat function to all functions  

## Resubmission
This is a resubmission. In this version I have:

* Converted the DESCRIPTION title to title case.
* More clearly identified the roles in the DESCRIPTION
* Put the cran-comments.md in .Rbuildignore
* And add \dontrun{} to the examples for the elapsed time notes
* Verified that the errors in ubuntu and fedora correspond to external libraries of the sf package, documented in DESCRIPTION in the SystemRequirements section, in addition to what was already included in the README file

## Test enviroments
* Ubuntu Linux 18.04, R-release
* Windows 7 Professional (x64), R 3.4.3
* Rhub
  * Ubuntu Linux 16.04 LTS, R-release, GCC
  * Fedora Linux, R-devel, clang, gfortran
* win-builder (devel)

## R CMD check results

0 ERRORs | 0 WARNINGs | 0 NOTES.
