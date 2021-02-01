-- js object exposes all JavaScript objects and functions to Lua
js = require "js"

-- javascript functions from Shiny can be called as methods of this shiny object
shiny = js.global.Shiny
