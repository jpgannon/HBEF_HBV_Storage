# Package ID: knb-lter-hbr.2.12 Cataloging System:https://pasta.edirepository.org.
# Data set title: Hubbard Brook Experimental Forest: Daily Streamflow by Watershed, 1956 - present.
# Data set creator:    - USDA Forest Service, Northern Research Station 
# Contact:    -  Hubbard Brook Ecosystem Study  - hbr-im@lternet.edu
# Stylesheet for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@Virginia.edu 
#
#install package tidyverse if not already installed
if(!require(tidyverse)){ install.packages("tidyverse") }  
library("tidyverse") 
infile1 <- trimws("https://pasta.lternet.edu/package/data/eml/knb-lter-hbr/2/12/167e20d3c06e3f882361d5aabe0c6627") 
infile1 <-sub("^https","http",infile1)
# This creates a tibble named: dt1 
dt1 <-read_delim(infile1  
                 ,delim=","   
                 ,skip=1 
                 , col_names=c( 
                   "DATE",   
                   "WS",   
                   "Streamflow",   
                   "Flag"   ), 
                 col_types=list( 
                   col_date("%Y-%m-%d"),   
                   col_character(), 
                   col_number() , 
                   col_number() ), 
                 na=c(" ",".","NA","")  )


# Convert Missing Values to NA for individual vectors 
dt1$Flag <- ifelse((trimws(as.character(dt1$Flag))==trimws("NA")),NA,dt1$Flag)               
suppressWarnings(dt1$Flag <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$Flag))==as.character(as.numeric("NA"))),NA,dt1$Flag))


# Observed issues when reading the data. An empty list is good!
problems(dt1) 
# Here is the structure of the input data tibble: 
glimpse(dt1) 
# And some statistical summaries of the data 
summary(dt1) 
# Get more details on character variables

summary(as.factor(dt1$WS))

write_csv(dt1, "data/discharge_all_watersheds.csv")

####
####
#PRECIP

# Package ID: knb-lter-hbr.13.18 Cataloging System:https://pasta.edirepository.org.
# Data set title: Hubbard Brook Experimental Forest: Daily Precipitation Rain Gage Measurements, 1956 - present.
# Data set creator:    - USDA Forest Service, Northern Research Station 
# Contact:    -  Hubbard Brook Ecosystem Study  - hbr-im@lternet.edu
# Stylesheet for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@Virginia.edu 
#
#install package tidyverse if not already installed
 
infile1 <- trimws("https://pasta.lternet.edu/package/data/eml/knb-lter-hbr/13/18/0387dde36ad18772f53a551fa3a2083d") 
infile1 <-sub("^https","http",infile1)
# This creates a tibble named: dt1 
dt1 <-read_delim(infile1  
                 ,delim=","   
                 ,skip=1 
                 , col_names=c( 
                   "DATE",   
                   "rainGage",   
                   "Precip"   ), 
                 col_types=list( 
                   col_date("%Y-%m-%d"),   
                   col_character(), 
                   col_number() ), 
                 na=c(" ",".","NA","")  )


# Observed issues when reading the data. An empty list is good!
problems(dt1) 
# Here is the structure of the input data tibble: 
glimpse(dt1) 
# And some statistical summaries of the data 
summary(dt1) 
# Get more details on character variables

summary(as.factor(dt1$rainGage)) 
infile2 <- trimws("https://pasta.lternet.edu/package/data/eml/knb-lter-hbr/13/18/9e5a9c4a00e226655823a64c50a69c36") 
infile2 <-sub("^https","http",infile2)
# This creates a tibble named: dt2 
dt2 <-read_delim(infile2  
                 ,delim=","   
                 ,skip=1 
                 , col_names=c( 
                   "rainGage",   
                   "longitude",   
                   "latitude",   
                   "elevation",   
                   "watershed",   
                   "begin.date",   
                   "ongoing"   ), 
                 col_types=list( 
                   col_character(), 
                   col_number() , 
                   col_number() , 
                   col_number() ,  
                   col_character(),  
                   col_date("%Y-%m-%d"),   
                   col_character()), 
                 na=c(" ",".","NA","")  )


# Observed issues when reading the data. An empty list is good!
problems(dt2) 
# Here is the structure of the input data tibble: 
glimpse(dt2) 
# And some statistical summaries of the data 
summary(dt2) 
# Get more details on character variables

summary(as.factor(dt2$rainGage)) 
summary(as.factor(dt2$watershed)) 
summary(as.factor(dt2$ongoing))

write_csv(dt1, "data/Precip_all_gages.csv")
write_csv(dt2, "data/raingage_info.csv")

###
###
#TEMP

# Package ID: knb-lter-hbr.59.11 Cataloging System:https://pasta.edirepository.org.
# Data set title: Hubbard Brook Experimental Forest: Daily Temperature Record, 1955 - present.
# Data set creator:    - USDA Forest Service, Northern Research Station 
# Contact:    -  Hubbard Brook Ecosystem Study  - hbr-im@lternet.edu
# Stylesheet for metadata conversion into program: John H. Porter, Univ. Virginia, jporter@Virginia.edu 
#
#install package tidyverse if not already installed

infile1 <- trimws("https://pasta.lternet.edu/package/data/eml/knb-lter-hbr/59/11/9723086870f14b48409869f6c06d6aa8") 
infile1 <-sub("^https","http",infile1)
# This creates a tibble named: dt1 
dt1 <-read_delim(infile1  
                 ,delim=","   
                 ,skip=1 
                 , col_names=c( 
                   "date",   
                   "STA",   
                   "MAX",   
                   "MIN",   
                   "AVE",   
                   "Flag"   ), 
                 col_types=list( 
                   col_date("%Y-%m-%d"),   
                   col_character(), 
                   col_number() , 
                   col_number() , 
                   col_number() ,  
                   col_character()), 
                 na=c(" ",".","NA","")  )


# Convert Missing Values to NA for individual vectors 
dt1$MAX <- ifelse((trimws(as.character(dt1$MAX))==trimws("NA")),NA,dt1$MAX)               
suppressWarnings(dt1$MAX <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$MAX))==as.character(as.numeric("NA"))),NA,dt1$MAX))
dt1$MIN <- ifelse((trimws(as.character(dt1$MIN))==trimws("NA")),NA,dt1$MIN)               
suppressWarnings(dt1$MIN <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$MIN))==as.character(as.numeric("NA"))),NA,dt1$MIN))
dt1$AVE <- ifelse((trimws(as.character(dt1$AVE))==trimws("NA")),NA,dt1$AVE)               
suppressWarnings(dt1$AVE <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$AVE))==as.character(as.numeric("NA"))),NA,dt1$AVE))
dt1$Flag <- ifelse((trimws(as.character(dt1$Flag))==trimws("NA")),NA,dt1$Flag)               
suppressWarnings(dt1$Flag <- ifelse(!is.na(as.numeric("NA")) & (trimws(as.character(dt1$Flag))==as.character(as.numeric("NA"))),NA,dt1$Flag))


# Observed issues when reading the data. An empty list is good!
problems(dt1) 
# Here is the structure of the input data tibble: 
glimpse(dt1) 
# And some statistical summaries of the data 
summary(dt1) 
# Get more details on character variables

summary(as.factor(dt1$STA)) 
summary(as.factor(dt1$Flag))


write_csv(dt1, "data/temp_all_sites.csv")




