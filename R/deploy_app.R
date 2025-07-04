

deploy_app <- function(...) {
  
  # Define global variables available to UI and server
  datalist$rental %>%
    dplyr::filter(!lga %in% c(
      "Group Total",
      "Greater Melbourne",
      "Regional Victoria",
      "Victoria"
    )) %>%
    dplyr::distinct(lga)  %>%
    dplyr::pull(lga) %>%
    assign("lgas", ., envir = .GlobalEnv)
  
  datalist$rental %>%
    dplyr::distinct(region)  %>%
    dplyr::pull(region) %>%
    assign("regions", ., envir = .GlobalEnv)
  
  datalist$vacancy %>% dplyr::select(-1) %>% names() %>%
    assign("areas", ., envir = .GlobalEnv)
  
  ui <- ui()
  #server <- server()
  
  # Run the application -----
  shiny::shinyApp(ui = ui, server = server, ...)
  
}
