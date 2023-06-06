# making a scatter plot with data from Bromans Dataset
# source data: https://doi.org/10.6078/M7X34VK8
# Author: Ewan Coopey
# Creation: 29/06/2022
# Last Edit: 06/07/2022
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

# lets load a roman provinces and roads shapefile (c.69 CE)
roman_69_provinces <- st_read(
  "shape_files/roman_empire_ad_69_provinces.shp")


roman_roads <- st_read(
  "shape_files/Roman_roads.shp")

Epigraphy <- read.csv('analysis/all_monument_with_location.csv')

str(Epigraphy)

allmonumentsplace <- na.omit(Epigraphy %>%
                               select(Ancient_Site,LAT,LONG) %>%
                               group_by(Ancient_Site) %>%
                               count(Ancient_Site,LAT,LONG) %>%
                               arrange(desc(n))) 

(allmonumentsll <- st_as_sf(allmonumentsplace, coords = c('LONG', 'LAT'), remove = FALSE,
                            crs = 4326, agr = "constant"))

## plotting
ggplot() + 
  geom_sf(data = world, color = "darkgrey", fill = "lightgrey") + 
  geom_sf(data = roman_69_provinces, colour = 'black') +
  geom_sf(data = roman_roads, colour = "darkgrey") +
  geom_sf(data = allmonumentsll, aes(size = n), alpha=0.6, colour = '#cd2026') + 
  labs(size = 'Inscribed Monuments') +
  ggtitle("Monuments of Legio VII in Dataset", subtitle = "Epigraphic Distribution") +
  coord_sf(default_crs = st_crs(4326), xlim = c(15.237922, 37.5053445), ylim = c(32.492331, 44.73291)) +
  theme(text = element_text(family = "Helvetica"))

ggsave("media/all_monuments.png", dpi = 300)
ggsave("media/all_monuments.pdf", dpi = 300)
ggsave("media/all_monuments.tiff", dpi = 300)

# now only dalmatia

Epigraphy_Dal <- sqldf("Select * from Epigraphy
                  WHERE Roman_Province
                    IS 'Dalmatia'")

Epigraphy_Dal_place <- na.omit(Epigraphy_Dal %>%
                               select(Ancient_Site,LAT,LONG) %>%
                               group_by(Ancient_Site) %>%
                               count(Ancient_Site,LAT,LONG) %>%
                               arrange(desc(n))) 

(Epigraphy_Dal_ll <- st_as_sf(Epigraphy_Dal_place, coords = c('LONG', 'LAT'), remove = FALSE,
                            crs = 4326, agr = "constant"))

## plotting Dal
ggplot() + 
  geom_sf(data = world, color = "darkgrey", fill = "lightgrey") + 
  geom_sf(data = roman_69_provinces, colour = 'black') +
  geom_sf(data = roman_roads, colour = "darkgrey") +
  geom_sf(data = Epigraphy_Dal_ll, aes(size = n), alpha=0.6, colour = '#cd2026') + 
  labs(size = 'Inscribed Monuments') +
  ggtitle("Inscribed monuments of Legio VII in Roman Dalmatia", subtitle = "Geographic Distribution") +
  coord_sf(default_crs = st_crs(4326), xlim = c(14, 20), ylim = c(42, 45.5)) +
  theme_void()

ggsave("media/dalmatian_monuments.png", dpi = 300)
ggsave("media/dalmatian_monuments.pdf", dpi = 300)
ggsave("media/dalmatian_monuments.tiff", dpi = 300)

#Plotting only funerary material
Funerary_Epigraphy_Dal <- sqldf("Select * from Epigraphy
                  WHERE Roman_Province
                    IS 'Dalmatia'
                  AND Mention_Legio_VII
                    IS 'yes'
                  AND MonumentType
                    IS 'stela'
                  OR MonumentType
                    IS 'titulus'
                  OR MonumentType
                    IS 'sacral monument'
                  OR MonumentType
                    IS 'sacral altar'
                 OR MonumentType
                    IS 'funerary inscription'
                 OR MonumentType
                    IS 'altar'")

Funerary_Epigraphy_Dal_Count <- Funerary_Epigraphy_Dal %>% group_by(MonumentType) %>% 
  summarise(total_count=n(),
            .groups = 'drop')

Funerary_Epigraphy_Dal_Place <- na.omit(Funerary_Epigraphy_Dal %>%
                                 select(Ancient_Site,LAT,LONG) %>%
                                 group_by(Ancient_Site) %>%
                                 count(Ancient_Site,LAT,LONG) %>%
                                 arrange(desc(n))) 

(Funerary_Epigraphy_Dal_ll <- st_as_sf(Funerary_Epigraphy_Dal_Place, coords = c('LONG', 'LAT'), remove = FALSE,
                              crs = 4326, agr = "constant"))



ggplot() + 
  geom_sf(data = world, color = "darkgrey", fill = "lightgrey") + 
  geom_sf(data = roman_69_provinces, colour = 'black') +
  geom_sf(data = roman_roads, colour = "darkgrey") +
  geom_sf(data = Funerary_Epigraphy_Dal_ll, aes(size = n), alpha=0.6, colour = '#cd2026') + 
  labs(size = 'Inscribed Monuments') +
  ggtitle("Inscribed funerary monuments of Legio VII in Roman Dalmatia", subtitle = "Geographic Distribution") +
  coord_sf(default_crs = st_crs(4326), xlim = c(14, 20), ylim = c(42, 45.5)) +
  theme_void()

ggsave("media/dalmatian_funerary_monuments.png", dpi = 300)
ggsave("media/dalmatian_funerary_monuments.pdf", dpi = 300)
ggsave("media/dalmatian_funerary_monuments.tiff", dpi = 300)
