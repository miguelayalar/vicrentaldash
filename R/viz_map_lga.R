
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
    
  df$Median <- paste("$", df$value, sep = "")
  
  mapviewOptions(basemaps = c("CartoDB.Positron"),
                 verbose = TRUE)
  df
  mapview(df,
          zcol = "value",
          popup = leafpop::popupTable(df,
                                      zcol = c("lga","Median")
                                      ),
          legend = TRUE,
          alpha.regions = 0.4,
          layer.name = c("Median weekly rents")
          )
    
}


  # mapview(mapview_vic_lga(),
  #         zcol = "value",
  #         popup = leafpop::popupTable(mapview_vic_lga(),
  #                                     zcol = c("lga","Median")
  #         ),
  #         legend = TRUE,
  #         alpha.regions = 0.4,
  #         layer.name = c("Median weekly rents")
  # )
