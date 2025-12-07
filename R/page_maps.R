

page_maps_rentsUI <- function(...) {
  
  shiny::fluidPage(
    
    # Overview - LGA rents
    "Houses by LGA" %>%
      h2() %>% 
      div(class = "inner") %>%
      div(class = "small-box") %>% 
      column(12, .) %>%
      fluidRow(),
    
    shiny::fluidRow(
      
      # # Chart option selectors
      shinydashboard::box(
        
        title = "Options",
        width = 12,
        collapsible = TRUE,
        
        # Choice selector widget
        shiny::column(
          6,
          shiny::div(
            class = ".box",
            style = "background-color: #FFFFFF; border-radius: 1rem;margin:1px;padding:15px;",
            
            shinyWidgets::slimSelectInput(
              #this name needs to match with server input name
              inputId = "house_type",
              status = "secondary",
              label = "Select number of bedrooms",
              choices = c(
                "2 Bedrooms" = "2br House",
                "3 Bedrooms" = "3br House",
                "4 Bedrooms" = "4br House"
              ),
              selected = "2br House",
              search = FALSE
            )
          )
        ), 
        # Slider widget
        shiny::column(
            6,
            shiny::div(
              class = ".box",
              style = "background-color: #FFFFFF; border-radius: 1rem;margin:1px;padding:15px;",
            #    
            # Slide to select a quarter
            shinyWidgets::sliderTextInput(
              inputId = "house_quarter",
              label = "Select a quarter",
              choices = seq(from = as.Date("2018-03-01"), to = as.Date("2025-06-01"), by = "3 months"),
              selected = c("2025-06-01"),
              grid = TRUE
              )
            )
            )
        ) %>% 
        htmltools::tagAppendAttributes(
          style = "background:var(--grey);",
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
      
        # column(
        # 12,
        shiny::div(
          class = ".box",
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
      # )
    ),

    
    "Flats and Units by LGA" %>%
      h2() %>% 
      div(class = "inner") %>%
      div(class = "small-box") %>% 
      column(12, .) %>%
      fluidRow(),
    shiny::fluidRow(
      
      # # Chart option selectors
      shinydashboard::box(
        
        title = "Options",
        width = 12,
        collapsible = TRUE,
        
        # Choice selector widget
        shiny::column(
          6,
          shiny::div(
            class = ".box",
            style = "background-color: #FFFFFF; border-radius: 1rem;margin:1px;padding:15px;",
            
            shinyWidgets::slimSelectInput(
              #this name needs to match with server input name
              inputId = "flat_type",
              status = "secondary",
              label = "Select number of bedrooms",
              choices = c(
                "1 Bedroom" = "1br flat",
                "2 Bedrooms" = "2br Flat",
                "3 Bedrooms" = "3br Flat"
              ),
              selected = "2br Flat",
              search = FALSE
            )
          )
        ), 
        # Slider widget
        shiny::column(
          6,
          shiny::div(
            class = ".box",
            style = "background-color: #FFFFFF; border-radius: 1rem;margin:1px;padding:15px;",
            #    
            # Slide to select a quarter
            shinyWidgets::sliderTextInput(
              inputId = "flat_quarter",
              label = "Select a quarter",
              choices = seq(from = as.Date("2018-03-01"), to = as.Date("2025-06-01"), by = "3 months"),
              selected = c("2025-06-01"),
              grid = TRUE
            )
          )
        )
        ) %>% 
        tagAppendAttributes(
          style = "background:var(--grey);",
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
          class = ".box",
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

