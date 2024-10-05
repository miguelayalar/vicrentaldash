

page_gccsa_rentsUI <- function(...) {
  
  shiny::fluidPage(
    
    # Overview - LGA rents
    "Overview" %>%
      h2() %>% 
      div(class = "inner") %>%
      div(class = "small-box") %>% 
      column(12, .) %>%
      fluidRow(),
    
    
    shiny::fluidRow(
      
      # shinydashboard::box(
      #   width = 8,
        column(
          6,
          shiny::div(
            class = "box",
            style = "padding:15px;",
            fluidRow(
              column(
                12,
                shinycssloaders::withSpinner(
                  highchartOutput("gccsa_rents", height = "600px"),
                  type = 8,
                  color = "#000000"
                )
              )
            )
          )
        ),
        column(
          6,
          shiny::div(
            class = "box",
            style = "padding:15px;",
            fluidRow(
              column(
                12,
                shinycssloaders::withSpinner(
                  highchartOutput("gccsa_rents_gr", height = "600px"),
                  type = 8,
                  color = "#000000"
                )
              )
            )
          )
        )
      #)
    )
  )
}


