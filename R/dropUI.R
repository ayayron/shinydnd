#'dropUI
#'
#'@param id The div id of the element
#'@param style The css styling
#'@param class The css class style
#'@param vertical Make the drop element allow multiple drag elements vertically arranged
#'@param nrow If vertical is TRUE, then you can set the number of rows to be used in the vertical selection. Height is fixed at 20px.
#'@return div element with nested elements if vertical is true
#'@import htmltools
#'@export

dropUI = function(id, style = NULL, class = "dropelement", vertical = FALSE, nrow = 1) {
  if (vertical == TRUE) {
    divlist = list(htmltools::tags$div(style = "height:20px"))
    divlist = rep(divlist, nrow)
    dropUI = htmltools::tags$div(id = id, class = class, style = style, divlist)
    htmltools::attachDependencies(dropUI, shinyDNDDep)
  } else {
    dropUI = htmltools::tags$div(id = id, class = class, style = style)
    htmltools::attachDependencies(dropUI, shinyDNDDep)
  }
}
