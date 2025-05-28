#' Use javascript functions
#'
#' Vicrentaldash package includes a few javascript functions to supplement the
#' available shiny functions. This function will import and declare them.
#'
#' @return A `script` tag to be placed in the `ui` function, `ui.R` file.
#' @export


use_js <- function(){
  
  # Add the CSS resource path
  shiny::addResourcePath("vicrental_js", system.file("www", package = "vicrentaldash"))
  
  # List all style files
  style_files <- paste0(
    "vicrental_js/",
    list.files(system.file("www", package = "vicrentaldash"))
  )
  
}

