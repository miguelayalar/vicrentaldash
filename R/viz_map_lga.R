
library(leaflet)
library(mapview)
library(sf)
library(leafpop)


# level chart ----
mapview_vic_lga <- function(data = data_list()
) {
  
  df <- data$map_rents %>%
    filter(dwelling_type=="All Properties") %>% 
    select(lga, series, value, dwelling_type)
  
  
  pal <- colorBin("viridis", domain = df$value)
  
  leaflet() %>%
    addTiles() %>%
    setView(lng = 144.5, lat = -37.5, zoom = 7) %>%
    addPolygons(
      data = df,
      color = ~pal(value),     # Border color
      weight = 1,          # Border weight
      opacity = .3,         # Border opacity
      fillOpacity = 0.4,   # Fill opacity
      label = paste0("<strong>LGA: <strong>", df$lga, "<br><strong>Median weekly rent:<strong> $", df$value) %>%
        lapply(htmltools::HTML)
    ) %>% 
    addLegend(data = df,
              position = "bottomright",
              pal = pal, 
              values = ~value,
              title = "Median",
              labFormat = labelFormat(prefix = "$"),
              opacity = 1) %>% 
    addProviderTiles(providers$CartoDB.Positron)
  
    
}

mapview_vic_lga()
