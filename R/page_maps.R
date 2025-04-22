

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
      
      shinydashboard::box(
        width = 8,
        column(
        12,
        shiny::div(
          class = "box",
          style = "padding:15px;",
          fluidRow(
            column(
              12,
              shinycssloaders::withSpinner(
                leaflet::leafletOutput("maps_rent", height = "600px"),
                type = 1,
                color = "#000000"
              )
            )
          )
        )
      )
    ),
    
    
    # Chart option selectors
    shinydashboard::box(
      title = "Explorer options",
      width = 4,
      collapsible = TRUE,
      shinyWidgets::multiInput( #widget for the area selection
        inputId = "areas",
        label = "Select type",
        choices = sort(areas),
        selected = c("Melbourne", "Melbourne City"),
        width = "100%",
        options = list(
          non_selected_header = "All regions:",
          selected_header = "Selected regions:"
        )
      ) %>% 
        fluidRow()
      
    ) %>%
      tagAppendAttributes(
        style = "background:var(--twilight);",
        .cssSelector = ".box"
      ) %>%
      tagAppendAttributes(
        style = "padding:15px;",
        .cssSelector = ".box-body"
      ) %>%
      tagAppendAttributes(
        style = "font-size:20px;font-weight:bold;",
        .cssSelector = ".box-header h3"
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
                leaflet::leafletOutput("maps_rent_flats", height = "600px"),
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

