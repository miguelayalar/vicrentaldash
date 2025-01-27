
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

datalist <- data_list()


usethis::use_data(datalist,
                  internal = TRUE, 
                  overwrite = TRUE,
                  version = 3
)
