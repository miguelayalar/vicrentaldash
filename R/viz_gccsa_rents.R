

# level chart ----
highcharts_vic_gccsa <- function(data = datalist$rental
                                ) {
  
  df <- data %>%
    dplyr::filter(lga %in% c("Greater Melbourne", "Regional Victoria")) %>%
    dplyr::filter(
      series == "Median",
      dwelling_type == "All Properties"
    )
  
  title <- "Median Weekly Rent"
  caption <- "Source: Department of Families, Fairness and Housing."
  
  
  
  # Make highchart
  highchart(type = "stock") %>%
    hc_add_series(
      df, 
      "line",
      hcaes(y = round(value), x = date, group = lga)
    ) %>%
    highcharter::hc_plotOptions(series = list(label = list(enabled = TRUE))) %>%
    highcharter::hc_yAxis(
      labels = list(format = "${text}")
      ) %>%
    highcharter::hc_exporting(enabled = TRUE) %>%
    highcharter::hc_title(text = title) %>%
    highcharter::hc_subtitle(text = "") %>%
    highcharter::hc_caption(text = caption)  %>%
    thm_highcharts() %>%
    highcharter::hc_rangeSelector(
      inputEnabled = FALSE,
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
          count = 10,
          text  = '10y',
          title = 'View ten years'
        ),
        list(
          type  = 'year',
          count = 5,
          text  = '5y',
          title = 'View five years'
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
      valuePrefix = "$"
    ) %>%
    hc_navigator(enabled = FALSE) %>%
    hc_scrollbar(enabled = FALSE)
  
}




# growth chart ----
highcharts_vic_gccsa_gr <- function(data = datalist$rental
                                    ) {
  
  df <- data %>%
    dplyr::filter(lga %in% c("Greater Melbourne", "Regional Victoria")) %>%
    dplyr::filter(
      series == "Median",
      dwelling_type == "All Properties"
    )
  
  df <- df %>%
    dplyr::group_by(.data$lga) %>%
    dplyr::arrange(.data$date) %>%
    dplyr::mutate(
      value = 100 * ((value / dplyr::lag(value,4)) - 1)
    ) %>%
    dplyr::filter(!is.na(value)) %>%
    dplyr::ungroup()
  
  title <- "Annual Growth"
  caption <- "Source: Department of Families, Fairness and Housing."
  
  
  
  # Make highchart
  highchart(type = "stock") %>%
    hc_add_series(
      df, 
      "line",
      hcaes(y = round(value), x = date, group = lga)
    ) %>%
    highcharter::hc_plotOptions(series = list(label = list(enabled = TRUE))) %>%
    highcharter::hc_yAxis(
      labels = list(format = "{text}%")
    ) %>%
    highcharter::hc_exporting(enabled = TRUE) %>%
    highcharter::hc_title(text = title) %>%
    highcharter::hc_subtitle(text = "") %>%
    highcharter::hc_caption(text = caption)  %>%
    thm_highcharts() %>%
    highcharter::hc_rangeSelector(
      inputEnabled = FALSE,
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
          count = 10,
          text  = '10y',
          title = 'View ten years'
        ),
        list(
          type  = 'year',
          count = 5,
          text  = '5y',
          title = 'View five years'
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

