#'dropUI
#'
#'@param id The div id of the element
#'@param style The css styling
#'@param class The css class style
#'@param vertical Make the drop element allow multiple drag elements vertically arranged
#'@return div element with nested elements if vertical is true
#'@import htmltools
#'@export

dropUI = function(id, style = NULL, class = "dropelement", vertical = FALSE) {
  ns = NS(id)
  if (vertical == TRUE) {
    divlist = list(htmltools::tags$div(style = "height:20px"),
                   htmltools::tags$div(style = "height:20px"),
                   htmltools::tags$div(style = "height:20px")
                   )
    dropUI = htmltools::tags$div(id = id, class = class, style = style, divlist)
    htmltools::attachDependencies(dropUI, shinyDNDDep)
  } else {
    dropUI = htmltools::tags$div(id = id, class = class, style = style)
    htmltools::attachDependencies(dropUI, shinyDNDDep)
  }
}
