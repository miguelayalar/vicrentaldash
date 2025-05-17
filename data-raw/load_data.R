datalist <- readr::read_rds("data/datalist.rds")


usethis::use_data(datalist,
                  internal = TRUE, 
                  overwrite = TRUE,
                  version = 3
)
