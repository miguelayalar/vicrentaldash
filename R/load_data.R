
library(readxl)
library(lubridate)
library(dplyr)
library(stringr)
library(tidyverse)
library(readr)
library(readabs)


load_data <- function(file, path = "data/") {
  
  if(is.null(path)){stop("you need to specify database path")}
  
  dbs <- read_csv(file, show_col_types = FALSE)
  
}



data_list <- function(){
  
  dbs_files <- list.files(path = "data/", full.names = TRUE)
  
  dbs_names <- c(
    "rental" = dbs_files[1],
    "vacancy" = dbs_files[2]
  )
  
  map(dbs_names, .f = load_data)
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

