library(tidyverse)

makeWS_PTQ <- function(WS, WSnum, RG, TG){
P <- read_csv("data/Precip_all_gages.csv") %>%
  filter(rainGage == RG) %>%
  select(DATE, Precip)

Temp <- read_csv("data/temp_all_sites.csv") %>%
  filter(STA == TG) %>%
  select(-Flag, -STA) %>%
  rename(DATE = date,
         Tmax = MAX,
         Tmin = MIN, 
         Tave = AVE)
  
Q <- read_csv("data/discharge_all_watersheds.csv") %>%
  filter(WS == WSnum) %>%
  select(-WS, -Flag)
  
PTQ <- inner_join(P, Temp, by = "DATE") %>%
       inner_join(Q, by = "DATE")

write_csv(PTQ, paste0("data/",WS, "_PTQ.csv"))
}

makeWS_PTQ(WS  = "WS3", 
           WSnum = 3,
           RG = "RG4",
           TG = "STA1")
