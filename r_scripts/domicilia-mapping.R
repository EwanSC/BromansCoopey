# making a scatter plot with data from Bromans Dataset
# source data: https://doi.org/10.6078/M7X34VK8
# Author: Ewan Coopey
# Creation: 05/06/2023
# Last Edit: 05/06/2023
# CC BY SA 4.0

# First, load packages (import if first time using install.packages).
# If you have issues downloading "rnaturalearthhires" follow guide here: https://stackoverflow.com/questions/66294044/rnaturalearthhires-package-installation-error
library(tibble)
library(data.table)
library(dplyr)
library(sqldf)
library(ggplot2)
library(ggrepel)
library(sf)
library("svglite")
library("rnaturalearthdata")
library("rnaturalearth")
library("rnaturalearthhires")

# lets make a map
# first bring world geo data from rnatural earth
world <- ne_countries(scale = "large", returnclass = "sf")
class(world)

# lets load a roman provinces shapefile (c.69 CE)
roman_69_provinces <- st_read(
  "shape_files/roman_empire_ad_69_provinces.shp")

roman_roads <- st_read(
  "shape_files/Roman_roads.shp")

Epigraphy <- read.csv('publication_files/Servicemen-places-Pleiades-links.csv')

str(Epigraphy)


allmonumentsplace <- na.omit(Epigraphy %>%
                               select(Town,Lat,Lon) %>%
                               group_by(Town) %>%
                               count(Town,Lat,Lon) %>%
                               arrange(desc(n))) 

(allmonumentsll <- st_as_sf(allmonumentsplace, coords = c('Lon', 'Lat'), remove = FALSE,
                            crs = 4326, agr = "constant"))

## plotting
ggplot() + 
  geom_sf(data = world, color = "darkgrey", fill = "lightgrey") + 
  geom_sf(data = roman_69_provinces, colour = 'black') +
  geom_sf(data = roman_roads, colour = "darkgrey") +
  geom_sf(data = allmonumentsll, colour = '#cd2026') +
  labs(size = 'Domicilia') +
  ggtitle("Origins of Legio VII Legionaries in Dalmatia", subtitle = "Recorded Domicilia ('City of Origin') in the CIRSL Dataset") +
  coord_sf(default_crs = st_crs(4326), xlim = c(3,36), ylim = c(32,47)) +
  theme_void()
