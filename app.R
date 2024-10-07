
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


# Application -----
server <- function(input, output, session) {
  
  
  output$vic_rents <- renderHighchart({
    highcharts_vic_lga_rents(
      lgas = req(input$vic_lgas),
      growth = input$rents_explorer_growth
    )
  })
  
  
  output$gccsa_rents <- renderHighchart({
    highcharts_vic_gccsa()
  })
  
  
  output$gccsa_rents_gr <- renderHighchart({
    highcharts_vic_gccsa_gr()
  })
  
  output$vacancy <- renderHighchart({
    highcharts_vacancy(
      regions = req(input$areas)
    )
  })
  
  output$maps_rents <- renderLeaflet({
    m <- mapview_vic_lga()
    m@map
  })
  
  
}



# Run the application ----- 
shinyApp(ui = ui, server = server)
 