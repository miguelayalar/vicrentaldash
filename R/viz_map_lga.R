


# level chart ----
mapview_vic_lga <- function(data = datalist$map_rents,
                            dw_type = "All Properties"
) {
  
  df <- data %>%
    filter(dwelling_type==dw_type) %>% 
    select(lga, series, value, dwelling_type)
  
  
  pal <- colorBin("viridis", domain = df$value)
  
  leaflet() %>%
    addTiles() %>%
    setView(lng = 144.5, lat = -37.5, zoom = 7) %>%
    addPolygons(
      data = df,
      color = ~pal(value),     # Border color
      weight = 1,          # Border weight
      opacity = .5,         # Border opacity
      fillOpacity = 0.4,   # Fill opacity
      label = paste0("<strong>LGA: <strong>", df$lga, "<br><strong>Median weekly rent:<strong> $", df$value) %>%
        lapply(htmltools::HTML)
    ) %>% 
    leaflet::addLegend(data = df,
              position = "bottomright",
              pal = pal, 
              values = ~value,
              title = "Median Price",
              labFormat = labelFormat(prefix = "$"),
              opacity = 1) %>% 
    addProviderTiles(providers$CartoDB.Positron)
  
    
}


