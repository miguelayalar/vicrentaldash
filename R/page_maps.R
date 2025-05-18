

page_maps_rentsUI <- function(...) {
  
  shiny::fluidPage(
    
    # Overview - LGA rents
    "Median Weekly Rents by LGA" %>%
      h2() %>% 
      div(class = "inner") %>%
      div(class = "small-box") %>% 
      column(12, .) %>%
      fluidRow(),
    
    shiny::fluidRow(
      
      # # Chart option selectors
      shinydashboard::box(
        
        title = "Explorer options",
        width = 12,
        collapsible = TRUE,
        
        shiny::fluidRow(
          style = "background-color: #FFFFFF; border-radius: 1rem;margin:1px;padding:10px;",
          shiny::column(
            12,
            
            # choice selector
            shinyWidgets::radioGroupButtons(
              "house_type",
              #this name needs to match with server input name
              status = "secondary",
              label = "Select number of bedrooms",
              choiceNames = c("2 Bedrooms", "3 Bedrooms", "4 Bedrooms"),
              choiceValues = c("2br House", "3br House", "4br House"),
              selected = "2br House",
              justified = T
            )
          )
      )) %>% 
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
    # map chart
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
                leaflet::leafletOutput("maps_rent_house", height = "600px"),
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
      
      # # Chart option selectors
      shinydashboard::box(
        
        title = "Explorer options",
        width = 12,
        collapsible = TRUE,
        
        shiny::fluidRow(
          style = "background-color: #FFFFFF; border-radius: 1rem;margin:1px;padding:10px;",
          shiny::column(
            12,
            
            # choice selector
            shinyWidgets::radioGroupButtons(
              "flat_type",
              #this name needs to match with server input name
              status = "secondary",
              label = "Select number of bedrooms",
              choiceNames = c("1 Bedroom", "2 Bedrooms", "3 Bedrooms"),
              choiceValues = c("1br flat", "2br Flat", "3br Flat"),
              selected = "2br Flat",
              justified = T
            )
          )
        )) %>% 
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
    
    
    # map chart
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

