#' Add Lua scripting capability to the UI of a Shiny app
#'
#' @param rmd Logical; this must be set to \code{TRUE} if you are using \code{shinyLua}
#' in an interactive R Markdown document rather than a Shiny app.
#' @import shiny
#' @export
useLuaVM <- function(rmd = FALSE){

  # use the fengari-web.js library included in this package
  addResourcePath("lib", system.file("lib", package = "shinyLua"))

  # don't put the script/library inside HTML head if using with R Markdown
  if(isTRUE(rmd)){
    tags$script(src = "fengari-web.js")
  } else{
    tags$head(tags$script(src = "lib/fengari-web.js"))
  }
}
