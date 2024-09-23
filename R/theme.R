# Highchart theme

thm_highcharts <- function(hc){
  
  highcharter::hc_add_theme(
    hc,
    highcharter::hc_theme(
      
      
      chart = list(
        backgroundColor = NULL,
        style = list(
          fontFamily = "VIC-Regular",
          `font-size` = "14px",
          color = "#000000"
        )
      ),
      title = list(
        align = "left",
        # x = 75,
        style = list(
          color = "#000000",
          fontFamily = "VIC-Regular",
          `font-weight` =  "bold",
          `font-size` = "22px",
          `background-color` = "#000000"
        )
      ),
      subtitle = list(
        align = "left",
        # x = 75,
        style = list(
          color = "#000000",
          fontFamily = "VIC-Regular",
          `font-size` = "16px"
        )
      ),
      xAxis = list(
        labels = list(
          style = list(
            color = "#000000",
            `font-weight` =  "bold",
            `font-size` = "12px"
          )
        ),
        title = list(style = list(color = "#000000", `font-weight` =  "bold")),
        lineWidth = 3,
        lineColor = "#000000",
        tickPosition = "inside",
        tickColor = "#000000",
        tickWidth = 3,
        tickLength = 7
      ),
      yAxis = list(
        labels = list(
          style = list(
            color = "#000000",
            `font-weight` =  "bold",
            `font-size` = "12px"
          )
        ),
        title = list(style = list(color = "#000000", `font-weight` =  "bold")),
        minorGridLineWidth = 0,
        lineWidth = 3,
        lineColor = "#000000",
        gridLineColor = "transparent",
        opposite = FALSE
      ),
      navigator = list(
        enabled = FALSE
      ),
      scrollbar = list(
        enabled = FALSE
      ),
      caption = list(
        
        style = list(
          color = "#000000"
        )
      ),
      rangeSelector = list(
        labelStyle = list(color = "#000000"),
        floating = TRUE,
        buttonPosition = list(
          align = "right",
          x = -10,
          y = 10
        )
      ),
      series = list(
        line = list(lineWidth = 4),
        spline = list(lineWidth = 4)
      ),
      exporting = list(enabled = TRUE)
    )
  )
  
}

