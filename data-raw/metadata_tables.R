library(magrittr); library(dplyr); library(tibble); library(usethis)

metadata_tables <- tibble::tribble(
  ~tabla, ~formato, ~url,

"Departamentos",	"dbf",	"https://ine.gub.uy/documents/10181/18006/Tabla+de+Departamentos/ea589aff-9d59-46d3-b2b8-4f8453304226",
"Localidades 2004",	"dbf",	"https://ine.gub.uy/documents/10181/18006/Tabla+Localidades+2004/e04efafe-5d01-4497-a2af-12c9441e6b63",
"Localidades 2011",	"dbf",	"https://ine.gub.uy/documents/10181/18006/tabla+localidades+censales+2011.xls/655d0e02-f451-4eaf-bef0-949fdc4898f3")

saveRDS(metadata_tables,"data-raw/metadata_tables.Rds")
usethis::use_data(metadata_tables, overwrite = TRUE)
