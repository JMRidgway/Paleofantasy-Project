library(tidyverse)
library(janitor)
library(ggmap)

map_create_main_fossil <- read.csv("main_fossil.csv", header = TRUE)

#count up the number of fossils per site (e.g., "n = 22" means there are 22 fossils at those lat/long coords)
sites <- map_create_main_fossil %>% 
  group_by(lat,lon) %>%
  distinct(name) %>% 
  tally() %>% 
  ungroup() %>% 
  filter(!is.na(lat)) %>% 
  mutate(lat = as.numeric(lat),
         lon = as.numeric(lon),
         n = as.numeric(n))


world <- map_data("world") #get layer for the world map

#make world map with samples shown)

( map_fossil <- ggplot() + 
    geom_polygon(data = world, aes(x = long, y = lat, group = group), fill = "grey60") + 
    coord_quickmap() +
    geom_point(data = sites, aes(x = lon, y = lat, size = n),                               
               shape = 21, fill = "lightskyblue3") + 
    theme_void() +
    labs(size = "Number of\nfossils") +
    scale_size_continuous(breaks = c(1, 5, 10, 15)) +
    theme(panel.background = element_rect(fill = "white"))) 

ggsave(map_fossil, file = "map_fossils.jpg", dpi = 600, width = 8, height = 4) #save the map as a jpg 