#' Add CSS
#'
#' This function adds the shared CSS files by creating a resource path to
#' the package and linking to the CSS stylesheet in the HTML head.
#'
#'
#' @export

use_css <- function(){
  
  # Add the CSS resource path
  shiny::addResourcePath("vicrental_css", system.file("www", package = "vicrentaldash"))
  
  # List all style files
  style_files <- paste0(
    "vicrental_css/",
    list.files(system.file("www", package = "vicrentaldash"))
  )
  
}
