
library(readxl)
library(lubridate)
library(dplyr)
library(stringr)
library(tidyverse)
library(readr)
library(readabs)
library(sf)


data_list <- function(file, path = "data/") {
  
  dbs <- read_rds(paste0(path, "datalist.rds"))
  
  return(dbs)
  
}



data_list()$rental %>% 
  filter(!lga %in% c("Group Total", "Greater Melbourne", "Regional Victoria", "Victoria")) %>% 
  dplyr::distinct(lga)  %>%
  dplyr::pull(lga) %>%
  assign("lgas", ., envir = .GlobalEnv)

data_list()$rental %>% 
  dplyr::distinct(region)  %>%
  dplyr::pull(region) %>%
  assign("regions", ., envir = .GlobalEnv)

data_list()$vacancy %>% select(-1) %>% names() %>% 
  assign("areas", ., envir = .GlobalEnv)

