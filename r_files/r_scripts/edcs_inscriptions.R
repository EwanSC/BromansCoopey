# military epigraphy in EDCS accroding to its classifcations
# Ewan Coopey
# created 7/06/23
# last edit: 7/06/23
# see what percentage of tituli sepulcrales are military according to EDCS
# sql: ## testing out using https://dept.stat.lsa.umich.edu/~jerrick/courses/stat701/notes/sql.html


## get packages
library(sqldf)
library(dplyr)
library(ggplot2)
library(ggrepel)
library(sf)

load_clean_epig_data_30_150 <- function(datascrape) {
  library(rjson)
  library(tibble)
  library(data.table)
  library(dplyr)
  library(tidyverse)
  json_filename <- datascrape
  json_data <- fromJSON(file= json_filename)
  json_epig_data <- json_data$data
  epig_data <- data.table::rbindlist(json_epig_data, fill = TRUE) 
  firstcent_epig_data <- epig_data %>%
    filter(`dating_from` %in% (-30:117), `dating_to` %in% (-29:150)) %>%
    arrange("dating to", "dating from")
  clean_firstcent_epig_data <- firstcent_epig_data %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Burnum',
                                               'Ivosevci / Burnum',
                                               'Karlovac / Karlstadt / Burnum',
                                               'Kistanje / Burnum','Knin / Burnum',
                                               'Mokro Polje / Burnum',
                                               'Puljane / Pugliane / Burnum',
                                               'Strmca / Stermizza / Burnum'),
                                  'Burnum', place)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Gardun / Tilurium',
                                               'Trilj / Tilurium',
                                               'Vojnic Sinjski / Tilurium'),
                                  'Tilurium', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Kastel Sucurac / Salona',
                                               'Manastirine / Salona',
                                               'Pazdigrad / Pazdigrada / Salona',
                                               'Solin / Salona',
                                               'Vrlika / Vrlica / Salona',
                                               'Dugopolje / Salona'),
                                  'Salona', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Asseria',
                                               'Benkovac / Asseria',
                                               'Podgrade / Asseria'),
                                  'Asseria', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Beli / Caisole / Crexa',
                                               'Cres / Crexa'),
                                  'Crexa', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Biograd na Moru / Zaravecchia / Nedinum',
                                               'Nadin / Nedinum',
                                               'Skabrnja / Nedinum'),
                                  'Nedinum', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Bastasi / Municipium Salvium',
                                               'Bosansko Grahovo / Municipium Salvium',
                                               'Glamoc / Municipium Salvium',
                                               'Glavica / Municipium Salvium','Podgradina / Municipium Salvium'),
                                  'Municipium Salvium', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Gornji Muc / Andetrium'),
                                  'Andetrium', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Bigeste',
                                               'Hardomilje / Bigeste',
                                               'Humac / Bigeste',
                                               'Ljubuski / Mlade / Bigeste',
                                               'Veljaci / Bigeste'),
                                  'Bigeste', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Bihac / Raetinium',
                                               'Golubic / Raetinium',
                                               'Pritoka / Raetinium',
                                               'Ribic / Raetinium',
                                               'Jezerine, Golubic'),
                                  'Raetinium', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Brac, Otok / Brattia',
                                               'Skrip / Brattia'),
                                  'Brattia', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Bribir / Bribirska Glavica / Varvaria',
                                               'Lastve, Bribir'),
                                  'Varvaria', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Budva / Buthoe'),
                                  'Buthoe', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Cacak / Malvesiatium',
                                               'Rudo / Municipium Malvesatium'),
                                  'Municipium Malvesatium', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Caska / Cissa'),
                                  'Cissa', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Cavtat / Epidaurum'),
                                  'Epidaurum', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Citluk / Aequum'),
                                  'Aequum', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Danilo Gornje / Rider',
                                               'Sibenik / Rider',
                                               'Grusine, Sibenik'),
                                  'Rider', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Dol / Pharia',
                                               'Hvar / Lesina / Pharia'),
                                  'Pharia', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Donje Biljane / Iader',
                                               'Galovac / Iader',
                                               'Zadar / Iader'),
                                  'Iader', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Dubrava / Diluntum',
                                               'Stolac / Rotimlja / Megjina / Diluntum'),
                                  'Diluntum', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Duklja / Duklje / Rusevine / Doclea'),
                                  'Doclea', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Gradina / Domavium'),
                                  'Domavium', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Janjina / Peljesac / Sabbioncello / Narona',
                                               'Metkovic / Narona',
                                               'Vid / Narona'),
                                  'Narona', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Kapitul - Knin'),
                                  'Kapitul', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Karin Gornji / Corinium'),
                                  'Corinium', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Klis / Clissa'),
                                  'Cliss', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Kljake / Municipium Magnum',
                                               'Ruzic / Balijna Glavica / Municipium Magnum'),
                                  'Municipium Magnum', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Kolovrat / Municipium Splonistarum',
                                               'Prijepolje / Municipium Splonistarum'),
                                  'Municipium Splonistarum', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Koplik / Cinna'),
                                  'Cinna', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Korcula / Nigra Corcyra'),
                                  'Corcyra Nigra', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Kornat, Otok'),
                                  'Kornat', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Kotor / Acruvium'),
                                  'Acruvium', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Krk, Otok / Curictae'),
                                  'Curictae', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Krklic, Pakostane'),
                                  'Pakostane', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Krug, Jesenice'),
                                  'Jesenice', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Labin / Alvona'),
                                  'Alvona', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Lastovo / Lagosta / Ladesta'),
                                  'Lastovo', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Lezhe / Lest / Lissus'),
                                  'Lissus', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Listani / Lastani'),
                                  'Listani', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Livno / Bariduum / Delminium',
                                               'Prisoje / Delminium',
                                               'Suhaca / Delminium',
                                               'Tomislavgrad / Duvno / Zupanjac / Delminium'),
                                  'Delminium', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Mali Losinj / Apsorus'),
                                  'Apsorus', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Medvida / Medvigge / Hadra / Sidrona'),
                                  'Sidrona', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Niksic / Mons Nigia / Anderva'),
                                  'Anderva', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Nin / Aenona'),
                                  'Aenona', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Obrovac / Clambetae'),
                                  'Clambetae', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Omis / Almissa / Oneum / Onaeum'),
                                  'Oneum', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Omisalj / Fulfinum'),
                                  'Fulfinum', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Osor / Opsorus'),
                                  'Opsorus', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Ostrovica / Alveria'),
                                  'Alveria', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Perast / Risinium',
                                               'Risan / Risano / Risinium'),
                                  'Risinium', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Plomin / Flanona'),
                                  'Flanona', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Podstrana / Pituntium'),
                                  'Pituntium', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Rab, Otok / Arba'),
                                  'Arba', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Ruduse / Rudusa'),
                                  'Rudusa', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Runovici / Runovic / Novae'),
                                  'Novae', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Seget Donji / Tragurium',
                                               'Trogir / Tragurium'),
                                  'Tragurium', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Senj / Segna / Zengg / Senia'),
                                  'Senia', `cleaned_place`))%>%
    mutate(`cleaned_place`=ifelse(place %in% c('Shkoder / Shkodra / Skutari / Scodra'),
                                  'Scodra', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Sinj / Osinium'),
                                  'Osinium', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Skradin / Scardona'),
                                  'Scardona', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Solta, Otok / Solentia'),
                                  'Solentia', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Split / Spalatum'),
                                  'Spalatum', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Stari Grad / Argyruntum'),
                                  'Argyruntum', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Stobrec / Epetino / Epetium'),
                                  'Epetium', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Sveti Juraj / Lopsica'),
                                  'Lopsica', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Tepljuh / Promona'),
                                  'Promona', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Tivat / Teodo'),
                                  'Teodo', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Trsat / Tersatto / Tarsatica'),
                                  'Tarsatica', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Vele Srakane / Canidole Grande'),
                                  'Vele Srakane', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Veli Bijac / Bijaci / Bijaca / Siculi'),
                                  'Siculi', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Velika Kopanica / Kopjenica'),
                                  'Kopjenica', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Vis / Issa'),
                                  'Issa', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Vitalj, Otocac / Arupium'),
                                  'Arupium', `cleaned_place`)) %>%
    mutate(`cleaned_place`=ifelse(place %in% c('Zaostrog / Zastrogh'),
                                  'Zaostrog', `cleaned_place`))
  clean_firstcent_data <- clean_firstcent_epig_data %>%
    group_by(`cleaned_place`)
  return(clean_firstcent_data)
}


## deploy function to get and clean df:

clean_dated_data <- load_clean_epig_data_30_150("r_files/data/2022-08-29-EDCS_via_Lat_Epig-prov_Dalmatia-10140.json")

# now analyse:
## 'all military' by using 'where like' clause and wildcard
# see here for more: https://www.w3schools.com/sql/sql_wildcards.asp#:~:text=SQL%20Wildcards,-%E2%9D%AE%20Previous%20Next&text=A%20wildcard%20character%20is%20used,specified%20pattern%20in%20a%20column.
## filtering to 'military' by inscription terms and place and then plotting using ggplot

EDCS_tituli <- sqldf("Select * from clean_dated_data
                  WHERE status 
                    LIKE '%tituli sepulcrales%'")
count(EDCS_tituli)


EDCS_military <- sqldf("Select * from clean_dated_data
                  WHERE inscription_interpretive_cleaning 
                    LIKE '%legio%'
                  OR inscription_interpretive_cleaning 
                    LIKE '%cohor%'
                  OR inscription_interpretive_cleaning 
                    LIKE '%ala%'
                  OR inscription_interpretive_cleaning 
                    LIKE '%alae%'
                  OR inscription_interpretive_cleaning 
                    LIKE '%milit%'
                  OR inscription_interpretive_cleaning 
                    LIKE '%eques%'
                  OR inscription_interpretive_cleaning 
                    LIKE '%equit%'
                  OR inscription_interpretive_cleaning 
                    LIKE '%duplicari%'
                  OR inscription_interpretive_cleaning 
                    LIKE '%veteran%'
                  or inscription_interpretive_cleaning
                    LIKE '%centuri%'
                  or inscription_interpretive_cleaning
                    LIKE '%immun%'
                  or inscription_interpretive_cleaning
                    LIKE '%miles%'
                  or inscription_interpretive_cleaning
                    LIKE '%beneficiar%'
                  or inscription_interpretive_cleaning
                    LIKE '%tesserari%'
                  or inscription_interpretive_cleaning
                    LIKE '%signifer%'
                  or inscription_interpretive_cleaning
                    LIKE '%aquilifer%'
                  or inscription_interpretive_cleaning
                    LIKE '%imaginifer%'
                  or inscription_interpretive_cleaning
                    LIKE '%corniculari%'
                  or inscription_interpretive_cleaning
                    LIKE '%principalis%'
                  or inscription_interpretive_cleaning
                    LIKE '%primus pilus%'
                  or inscription_interpretive_cleaning
                    LIKE '%primo pilo%'
                  or inscription_interpretive_cleaning
                    LIKE '%primi pili%'
                  or inscription_interpretive_cleaning
                    LIKE '%praefectus castrorum%'
                  or inscription_interpretive_cleaning
                    LIKE '%optio %'
                  or inscription_interpretive_cleaning
                    LIKE '%option%'
                  AND status
                    LIKE '%milites%'
                  AND status 
                    LIKE '%tituli sepulcrales%'")

count(EDCS_tituli)
count(EDCS_military)

