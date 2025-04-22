
#' @import shiny

# UI for application ----
ui <- function() {
  
  custom_header <- shinydashboard::dashboardHeader()
  custom_header$children[[2]] <- NULL
  custom_header <- custom_header %>%
    tagAppendChildren(
      .cssSelector = ".navbar-custom-menu",
      fluidRow(
        div(class = "col", span(HTML("Victorian Rents</br>Dashboard"), class = "badgeDescript")),
        div(class = "col", badge_rental())
      )
    )
  
  
  shinydashboard::dashboardPage(
    title = "Victorian Housing Dashboard",
    header = custom_header,
    sidebar = shinydashboard::dashboardSidebar(
      shinydashboard::sidebarMenu(id = 'tabs',
                                  shinydashboard::menuItem("Overview", tabName = "gccsa_rents", selected = TRUE), #%>% 
                                  shinydashboard::menuItem("Houses", startExpanded = FALSE,
                                                           shinydashboard::menuSubItem("All properties", tabName = "vic_rents")
                                                           ), 
                                  shinydashboard::menuItem("Vacancies", tabName = "vacancy"),
                                  shinydashboard::menuItem("Maps", tabName = "maps_rent")
                                    #shinydashboard::menuItem("FAQ & sources", tabName = "methodology"),
                                    #shinydashboard::menuItem("Disclaimer", tabName = "disclaimer") %>%
                                    # shiny::tagAppendAttributes(
                                    #   style = "display:none;"
                                    # )
      ),
      width = "250px"
    ),
    body = shinydashboard::dashboardBody(
      tags$head( #adding stylng using css
        # Bootstrap 5 for xl columns
        tags$link(
          href = "https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css",
          rel = "stylesheet",
          integrity = "sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC",
          crossorigin = "anonymous"
        ),
        # Gloabl vic css
        tags$link(href = "globalvic.css", rel = "stylesheet"),
        # Launchpad links (client side execution)
        #shiny::tags$script("$(document).ready(function(){$('a.launchpadLink').click(function(){$('.sidebar-menu a[data-value=\"launchpad\"]').trigger('click');})});"),
        #shiny::tags$script("$(document).ready(function(){$('a.rentsLink').click(function(){$('.sidebar-menu a[data-value=\"vic_rents\"]').trigger('click');})});"),
        #shiny::tags$script("$(document).ready(function(){$('a.bopLink').click(function(){$('.sidebar-menu a[data-value=\"bop\"]').trigger('click');})});"),
        #shiny::tags$script("$(document).ready(function(){$('a.servicesLink').click(function(){$('.sidebar-menu a[data-value=\"services\"]').trigger('click');})});"),
        #shiny::tags$script("$(document).ready(function(){$('a.methodologyLink').click(function(){$('.sidebar-menu a[data-value=\"methodology\"]').trigger('click');})});"),
        #shiny::tags$script("$(document).ready(function(){$('a.disclaimerLink').click(function(){$('.sidebar-menu a[data-value=\"disclaimer\"]').trigger('click');})});"),
        # Resize highcharts on sidebar collapse
        shiny::tags$script(src = "sidebar_chart_resize.JS")
      ),
      shiny::tags$script("$('html').attr(\"lang\", \"en\")"),
      shiny::tags$script("$('section.content').attr(\"role\", \"main\")"),
      shinydashboard::tabItems(
        shinydashboard::tabItem("vic_rents", page_rentsUI()),
        shinydashboard::tabItem("vacancy", page_vacancyUI()),
        shinydashboard::tabItem("gccsa_rents", page_gccsa_rentsUI()),
        shinydashboard::tabItem("maps_rent", page_maps_rentsUI())
        #shinydashboard::tabItem("disclaimer", page_disclaimerUI())
      )
    )
  )
}


