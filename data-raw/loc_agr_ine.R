aglomerados_INE <- read.csv2("C:/Users/Usuario/Desktop/R/data/aglomerados_INE.csv")

aglomerados_INE$Nom_loc_agr_13 <- aglomerados_INE$Nom_loc_agr_13 %>%
  stringr::str_replace_all("µ", "A") %>%
  stringr::str_replace_all("¢", "o") %>%
  stringr::str_replace_all("‚", "e") %>%
  stringr::str_replace_all("£", "u") %>%
  stringr::str_replace_all("¡", "i") %>%
  toupper()

loc <- read.csv("C:/Users/Usuario/Desktop/R/data/Localidades_Censales_2011.csv", stringsAsFactors = F) 
names(loc) <- c("depto", "nomloc", "codloc", "pob2011", "dens2011km")
loc$nomloc <- loc$nomloc %>% stringr::str_replace_all("Ã‘", "Ñ")

loc_agr <- left_join(loc, aglomerados_INE, by = "codloc")
loc_agr[is.na(loc_agr$Nom_loc_agr_13),"Nom_loc_agr_13"] <- loc_agr[is.na(loc_agr$Nom_loc_agr_13), "nomloc"]
loc_agr[is.na(loc_agr$Loc_agr_13),"Loc_agr_13"] <- loc_agr[is.na(loc_agr$Loc_agr_13), "codloc"]

loc_agr <- loc_agr %>% mutate(cat_loc_agr = case_when(Loc_agr_13 %in% c(1010, 30020) ~ "Montevideo y area metropolitana",
                                                        pob2011 < 5000 ~ "Localidades con menos de 5000 hab.",
                                                        stringr::str_detect(Nom_loc_agr_13, "MENORES A 5.000")  ~ "Localidades con menos de 5000 hab.",
                                                        pob2011 >= 5000 ~ "Localidades con 5000 hab. o más",
                                                        stringr::str_detect(Nom_loc_agr_13, "ENTRE 5.000 Y 20.000")  ~ "Localidades con 5000 hab. o más"))

# loc_agr %>% group_by(cat_loc_agr) %>% 
#   summarise(pob2011_loc_agr = sum(pob2011),
#             mean_dens2011km_loc_agr = mean(dens2011km))
