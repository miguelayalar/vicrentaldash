

page_maps_rentsUI <- function(...) {
  
  shiny::fluidPage(
    
    # Overview - LGA rents
    "Median Weekly Rents by LGA - Houses" %>%
      h2() %>% 
      div(class = "inner") %>%
      div(class = "small-box") %>% 
      column(12, .) %>%
      fluidRow(),
    
    
    shiny::fluidRow(
      
      column(
        12,
        shiny::div(
          class = "box",
          style = "padding:15px;",
          fluidRow(
            column(
              12,
              shinycssloaders::withSpinner(
                leafletOutput("maps_rent", height = "600px"),
                type = 1,
                color = "#000000"
              )
            )
          )
        )
      )
    ),
    
    "Median Weekly Rents by LGA - Flats/Units" %>%
      h2() %>% 
      div(class = "inner") %>%
      div(class = "small-box") %>% 
      column(12, .) %>%
      fluidRow(),
    
    
    shiny::fluidRow(
      
      column(
        12,
        shiny::div(
          class = "box",
          style = "padding:15px;",
          fluidRow(
            column(
              12,
              shinycssloaders::withSpinner(
                leafletOutput("maps_rent_flats", height = "600px"),
                type = 1,
                color = "#000000"
              )
            )
          )
        )
      )
    )
    
  )
}

