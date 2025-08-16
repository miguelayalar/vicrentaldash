
#' @import shiny

# UI for application ----
ui <- function() {
  
  custom_header <- dashboardHeader()
  custom_header$children[[2]] <- NULL
  custom_header <- custom_header %>%
    tagAppendChildren(
      .cssSelector = ".navbar-custom-menu",
      fluidRow(
        div(class = "col", span(HTML("Victorian Rents</br>Dashboard"), class = "badgeDescript")),
        div(class = "col", badge_rental())
      )
    )
  
  use_css()
  use_js()
  
  dashboardPage(
    title = "Victorian Housing Dashboard",
    header = custom_header,
    sidebar = dashboardSidebar(
      sidebarMenu(id = 'tabs',
                                  menuItem("Overview", tabName = "gccsa_rents", selected = TRUE), #%>% 
                                  menuItem("Houses", startExpanded = FALSE,
                                                           menuSubItem("All properties", tabName = "vic_rents")
                                                           ), 
                                  menuItem("Vacancies", tabName = "vacancy"),
                                  menuItem("Maps", tabName = "maps_rent")
                                    #menuItem("FAQ & sources", tabName = "methodology"),
                                    #menuItem("Disclaimer", tabName = "disclaimer") %>%
                                    # shiny::tagAppendAttributes(
                                    #   style = "display:none;"
                                    # )
      ),
      width = "250px"
    ),
    body = dashboardBody(
      shiny::tags$head( #adding stylng using css
        # Bootstrap 5 for xl columns
        shiny::tags$link(
          href = "https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css",
          rel = "stylesheet",
          integrity = "sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC",
          crossorigin = "anonymous"
        ),
        # Gloabl vic css
        shiny::tags$link(href = "vicrental_css/globalvic.css?id=1", rel = "stylesheet"),
        
        # Resize highcharts on sidebar collapse
        shiny::tags$script(src = "vicrental_js/sidebar_chart_resize.JS?id=1")
      ),
      shiny::tags$script("$('html').attr(\"lang\", \"en\")"),
      shiny::tags$script("$('section.content').attr(\"role\", \"main\")"),
      tabItems(
        tabItem("vic_rents", page_rentsUI()),
        tabItem("vacancy", page_vacancyUI()),
        tabItem("gccsa_rents", page_gccsa_rentsUI()),
        tabItem("maps_rent", page_maps_rentsUI())
        #tabItem("disclaimer", page_disclaimerUI())
      )
    )
  )
}


