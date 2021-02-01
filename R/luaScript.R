#' Add a Lua script to a Shiny UI or R Markdown Document
#'
#' @description Generates the html to embed a client-side Lua script in a Shiny UI or an R Markdown
#' webpage. Lua code can be passed in with a string or with a separate Lua file in the app's www directory
#'
#' @param lua Character string containing lua code. Do not set a value for this argument if using Lua from a separate source file.
#' @param src Relative path to a Lua source file in the Shiny app's 'www' directory.
#' @details \code{\link{useLuaVM}} must be run in the Shiny app's UI for this function to work.
#'
#' To add a Lua script to a shiny UI without this function, use \code{tags$script()} with
#' \code{type = "application/lua"}
#' @export
#'
luaScript <- function(lua = NULL, src = NULL){
  if(is.null(lua) && is.null(src)) stop("You must set either 'lua' or 'src'")
  if(!is.null(lua) && !is.null(src)) stop("You cannot use both 'lua' and 'src'. Please use just one of these arguments to specify the Lua script to be run.")

  if(!is.null(lua)){ # for inline lua code
    if(!is.character(lua) || length(lua) != 1) stop("Argument 'lua' must be a character string.")
    tags$script(lua, type = "application/lua")

  }else{ # for a lua script in www directory
    if(!is.character(src) || length(src) != 1) stop("Argument 'lua' must be a character string.")
    tags$script(src = src, type = "application/lua")
  }
}
