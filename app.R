
# load libraries ----
library(shiny)
library(shinydashboard)
library(highcharter)
library(leaflet)
library(mapview)
library(sf)
library(leafpop)


# load resources ----
source("R/ui.R")
source("R/badges.R")
source("R/load_data.R")
source("R/theme.R")
source("R/page_rents.R")
source("R/page_vacancy.R")
source("R/page_gccsa_rents.R")
source("R/page_maps.R")
source("R/viz_vic_rents.R")
source("R/viz_vic_vacancies.R")
source("R/viz_gccsa_rents.R")
source("R/viz_map_lga.R")



# Run the application ----- 
shinyApp(ui = ui, server = server)
 