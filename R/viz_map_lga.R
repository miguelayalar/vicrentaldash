
#' @import leaflet


# level chart ----
leaflet_vic_lga <- function(data = datalist$map_rents,
                            dw_type = "All Properties",
                            date_chosen = "2025-03-01"
) {
  
  df <- data %>%
    dplyr::filter(dwelling_type == dw_type,
                  date ==  date_chosen) %>% 
    dplyr::select(lga, series, value, dwelling_type)
  
  
  pal <- colorBin("viridis", domain = df$value)
  
  labs <- sprintf(
    "<strong>LGA:</strong> %s<br/><strong>Median weekly rent:</strong> $%g",
    df$lga, df$value) %>% 
    lapply(htmltools::HTML)
  
  leaflet() %>%
    addTiles() %>%
    setView(lng = 144.9, lat = -37.8, zoom = 9) %>%
    addPolygons(
      data = df,
      color = ~pal(value),     # Border color
      weight = 1,          # Border weight
      opacity = .5,         # Border opacity
      fillOpacity = 0.4,   # Fill opacity
      highlightOptions = highlightOptions(
        weight = 3,
        color = "black",
        bringToFront = TRUE
        ),
      label = labs,
      labelOptions = labelOptions(
        style = list("font-weight" = "normal", padding = "3px 8px"),
        textsize = "15px",
        direction = "auto")
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


