library(ggmap)
library(devtools)
library(nominatim)
library(tidyverse)

project_unique_location <- unique(main_fossil$site_name) #makes a list of all the unique locations for adding lat/lon info for map

write.csv(project_unique_location, file = "location_data.csv") #saves a file to fill in the lat long info OR do below
location_data2 <- read.csv("location_data.csv", header = TRUE)

register_google(key = "") #register google API key to get location info for above
location_data <- mutate_geocode(location_data2, x) #alternate faster way to automatically get lat/lon info through google maps API - costs money
write.csv(location_data, file = "location_data.csv") #saves the file with lat/lon info

main_fossil_location <- left_join(main_fossil, location_data2) #merge the location data and main_fossil by site_name to add lat/lon info
write.csv(main_fossil_location, file = "main_fossil.csv") #saves the main database 





