
# load libraries ----
library(shiny)
library(shinydashboard)
library(highcharter)


# load resources ----
source("R/ui.R")
source("R/badges.R")
source("R/load_data.R")
source("R/theme.R")
source("R/page_rents.R")
source("R/page_vacancy.R")
source("R/viz_vic_rents.R")
source("R/viz_vic_vacancies.R")


# Application -----
server <- function(input, output, session) {
  
  
  output$vic_rents <- renderHighchart({
    highcharts_vic_lga_rents(
      lgas = req(input$vic_lgas),
      growth = input$rents_explorer_growth
    )
  })
  
  output$vacancy <- renderHighchart({
    highcharts_vacancy(
      regions = req(input$areas)
    )
  })
  
}



# Run the application ----- 
shinyApp(ui = ui, server = server)
 