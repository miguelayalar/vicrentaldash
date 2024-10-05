
library(highcharter)
library(zoo)


# Annual growth of Victoria's imports and exports of goods & services
highcharts_vic_lga_rents_flat <- function(data = data_list(),
                                     lgas = c("Kingston", "Knox", "Maroondah"),
                                     growth = TRUE
) {
  
  df <- data$rental %>%
    dplyr::filter(!lga %in% c("Group Total", "Greater Melbourne", "Regional Victoria", "Victoria")) %>%
    dplyr::filter(
      series == "Median",
      dwelling_type == "2br House",
      .data$lga %in% lgas 
    ) %>%
    dplyr::mutate(
      group = paste(.data$region, .data$lga, sep = " - ")
    )
  
  
  # 
  # growth data
  if (growth) {
    df <- df %>%
      dplyr::group_by(.data$group) %>%
      dplyr::arrange(.data$date) %>%
      dplyr::mutate(
        value = 100 * ((value
                        / dplyr::lag(value,4)) - 1)
      ) %>%
      dplyr::filter(!is.na(value)) %>%
      ungroup()
  }
  
  
  title <- "Victorian Rents"
  caption <- "Source: Department of Families, Fairness and Housing."
  
  
  
  # Make highchart
  highchart(type = "stock") %>%
    hc_add_series(
      df, 
      "line",
      hcaes(y = round(value), x = date, group = group)
    ) %>%
    highcharter::hc_plotOptions(series = list(label = list(enabled = TRUE))) %>%
    highcharter::hc_yAxis(
      labels = if(growth == TRUE){
        list(format = "{text}%")
      } else {
        list(format = "${text}")
      }
    ) %>% 
    highcharter::hc_exporting(enabled = TRUE) %>%
    highcharter::hc_title(text = title) %>%
    highcharter::hc_subtitle(text = "Median Weekly Rent") %>%
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
      valuePrefix = if(growth == TRUE){
        ""
      } else {
        "$"
      },
      valueSuffix = if(growth == TRUE){
        "%"
      } else {
        ""
      }
    ) %>%
    hc_navigator(enabled = FALSE) %>%
    hc_scrollbar(enabled = FALSE)
  
}


highcharts_vic_lga_rents_flat(growth = FALSE)
