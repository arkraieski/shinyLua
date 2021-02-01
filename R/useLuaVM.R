#' Embed the Lua VM in the UI of a Shiny app
#'
#' @description This is a setup function that must be called from a Shiny app's UI to
#' add the Lua implementation required for other \code{shinyLua} functions to work.
#'
#' @param rmd Logical; this must be set to \code{TRUE} if you are using \code{shinyLua}
#' in an interactive R Markdown document rather than a Shiny app.
#'
#' @details
#' This function adds 'fengari-web.js', a JavaScript port of the Lua VM, to an app's <head> tag
#' and resource path along with other startup scripts and dependencies. Any scripts in the UI
#' of type \code{"application/lua"} will run in this embedded Lua VM. \code{shinyLua} provides a
#' convenience function, \code{\link{luaScript}}, for inserting Lua scripts into a Shiny UI.
#'
#' @import shiny
#' @export
useLuaVM <- function(rmd = FALSE){

  # use the fengari-web.js library included in this package
  addResourcePath("lib", system.file("lib", package = "shinyLua"))

  # don't put the script/library inside HTML head if using with R Markdown
  if(isTRUE(rmd)){
    paste(tags$script(src = "lib/fengari-web.js"),
          luaScript(src = "lib/init.lua"), sep = "\n")
  } else{
    tags$head(tags$script(src = "lib/fengari-web.js"),
              luaScript(src = "lib/init.lua"))
  }
}
