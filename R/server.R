
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
  
  output$maps_rent <- renderLeaflet({
    mapview_vic_lga()
  })
  
  
}

