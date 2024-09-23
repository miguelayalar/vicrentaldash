

badge_rental <- function(...){
  
  d <- data_list()$rent
  
  m <- d %>% pull(date) %>% max() %>% lubridate::month(label = TRUE, abbr = FALSE)
  y <- d %>% pull(date) %>% max() %>% lubridate::year()
  
  
  tags$button(
    onclick = "window.open('https://www.dffh.vic.gov.au/publications/rental-report', 'mywindow');",
    class = "sourceBadge",
    style = "cursor: pointer;",
    role = "button",
    div(
      style = "display: table-cell;",
      "Updated"
    ),
    div(
      style = "display: table-cell;",
      format(paste0(m," ",y)) %>% 
        stringr::str_replace_all("[:blank:]", "&nbsp;") %>% 
        HTML(),
      br(),
      span(style = "font-size:8px", "Quarterly")
    )
  )
  
}