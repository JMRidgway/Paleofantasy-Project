library(dplyr)

#Obtaining citations by citation group number and vice-versa

citation_list <- read.csv("citation_list.csv", header = TRUE) #reads the data of citation_list, which contains citation data

data_interest <- c(1,2,3) #input citation numbers or APA citations of interest 

#By citation group number
data_interest2 <- filter(citation_list, associated_group_num %in% data_interest) #filters database to only include entered values
data_interest2

#By APA citation 
data_interest2 <- filter(citation_list, associated_group_num %in% data_interest) #filters database to only include entered values
data_interest2

write.csv(data_interest2, file = "citation_request.csv") #saves the desired citations as a csv file 
