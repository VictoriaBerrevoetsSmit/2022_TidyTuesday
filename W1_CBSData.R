## 
library(tidyverse)
library(sf)

#Someone like me
W1_Someonelikeme <- read.csv("~/Library/Mobile Documents/com~apple~CloudDocs/2022_TidyTuesday/W1_Someonelikeme.csv", sep=";")

#Municipalities CBS
municipalities <- st_read("https://geodata.nationaalgeoregister.nl/cbsgebiedsindelingen/wfs?request=GetFeature&service=WFS&version=2.0.0&typeName=cbs_gemeente_2017_gegeneraliseerd&outputFormat=json")

municipalities %>%  
  left_join(W1_Someonelikeme, by = c(statcode = "RegioS"))  %>% 
  filter(Gediplomeerden_1 > 1) %>% 
  ggplot() + 
  geom_sf(aes(fill = Gediplomeerden_1), size = .05) + 
  theme_void() + 
  theme(legend.title = element_blank()) + 
  ggtitle(
        label = "Celebrating my graduation", 
        subtitle = "Dutch women age 24-25 who graduated with masters' degree in 2019-2020")
