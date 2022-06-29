# making a scatter plot with data from Bromans Dataset
# source data: https://doi.org/10.6078/M7X34VK8
# Author: Ewan Coopey
# Creation: 29/06/2022
# Last Edit: 29/06/2022

library(tibble)
library(data.table)
library(dplyr)
library(sqldf)
library(ggplot2)
library(ggrepel)
library(sf)
library("rnaturalearthdata")
library("rnaturalearth")


Epigraphy <- read.csv('analysis/all_monument_with_location.csv')

str(Epigraphy)


allaltars <- sqldf ("Select * From Epigraphy
                      Where MonumentType = 'altar'")

allaltarsplace <- na.omit(allaltars %>%
                                select(Ancient_Site,LAT,LONG) %>%
                                group_by(Ancient_Site) %>%
                                count(Ancient_Site,LAT,LONG) %>%
                                arrange(desc(n))) 

(allaltars_ll <- st_as_sf(allaltarsplace, coords = c('LONG', 'LAT'), remove = FALSE,
                                   crs = 4326, agr = "constant"))

## plotting

ggplot() + 
  geom_sf(data = allaltars_ll, aes(size = n), alpha=0.6, colour = '#cd2026') +
  labs(size = 'Altars') +
  ggtitle("Altars of Legio VII Soldiers in Dalmatia") +
  coord_sf(default_crs = st_crs(4326), xlim = c(13, 21), ylim = c(41.5, 46))

# now stela

allstela <- sqldf ("Select * From Epigraphy
                      Where MonumentType = 'stela'")

allstelaplace <- na.omit(allstela %>%
                            select(Ancient_Site,LAT,LONG) %>%
                            group_by(Ancient_Site) %>%
                            count(Ancient_Site,LAT,LONG) %>%
                            arrange(desc(n))) 

(allstela_ll <- st_as_sf(allstelaplace, coords = c('LONG', 'LAT'), remove = FALSE,
                          crs = 4326, agr = "constant"))

## plotting

ggplot() + 
  geom_sf(data = allstela_ll, aes(size = n), alpha=0.6, colour = '#cd2026') +
  labs(size = 'Stelae') +
  ggtitle("Stelae of Legio VII Soldiers in Dalmatia") +
  coord_sf(default_crs = st_crs(4326), xlim = c(13, 21), ylim = c(41.5, 46))

## now compare distribution between CPF and non CPF