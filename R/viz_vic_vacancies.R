

# Vacancy rates in Melbourne
highcharts_vacancy <- function(
    data = datalist$vacancy,
    regions = c("Melbourne","Melbourne City")
) {
  
  df <- data %>% 
    tidyr::pivot_longer(cols = 2:11, names_to = "area", values_to = "value") %>% 
    # dplyr::mutate(
    #   date = as.Date(paste0(substr(Dates,6,9),"-",substr(Dates,3,4),"-01"))
    # ) %>% 
    #dplyr::select(-Dates) %>% 
    tidyr::drop_na() %>% 
    dplyr::filter(
      .data$area %in% regions 
    )
  
  
  title <- "Greater Melbourne vacancy rates"
  caption <- "Source: SQM"
  
  
  
  # Make highchart
  highcharter::highchart(type = "stock") %>%
    highcharter::hc_add_series(
      df, 
      "line",
      hcaes(y = value, x = Dates, group = area)
    ) %>%
    highcharter::hc_plotOptions(series = list(label = list(enabled = TRUE))) %>%
    highcharter::hc_yAxis(
      labels = list(format = "{text}%")
    ) %>% 
    highcharter::hc_exporting(enabled = TRUE) %>%
    highcharter::hc_title(text = title) %>%
    highcharter::hc_subtitle(text = "Residential vacancy rates") %>%
    highcharter::hc_caption(text = caption)  %>%
    thm_highcharts() %>%
    highcharter::hc_rangeSelector(
      inputEnabled = T,
      floating = FALSE,
      buttonPosition = list(align = "left"),
      selected = 1,
      buttons = list(
        list(
          type  = 'all',
          text  =  'All',
          title =  'View all'
        ),
        list(
          type  = 'year',
          count = 5,
          text  = '5y',
          title = 'View five years'
        ),
        list(
          type  = 'year',
          count = 3,
          text  = '3y',
          title = 'View three years years'
        ),
        list(
          type  = 'ytd',
          text  = 'YTD',
          title = 'View year to date'
        )
      )
    ) %>%
    highcharter::hc_navigator(series = list(label = list(enabled = FALSE))) %>%
    highcharter::hc_tooltip(
      dateTimeLabelFormats = list(day = "%b %Y"),
      valueSuffix = "%"
    ) %>%
    hc_navigator(enabled = FALSE) %>%
    hc_scrollbar(enabled = FALSE)
  
}

